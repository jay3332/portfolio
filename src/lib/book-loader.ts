import { NodeCompiler } from '@myriaddreamin/typst-ts-node-compiler';
import type { NodeAddFontPaths, NodeAddFontBlobs } from '@myriaddreamin/typst-ts-node-compiler';
import { readdir } from 'node:fs/promises';
import { join, basename } from 'node:path';

export interface BookLoaderOptions {
  fontArgs?: Array<NodeAddFontPaths | NodeAddFontBlobs>;
}

interface SectionCfg {
  src: string;
  title: string;
}

interface ChapterCfg {
  title: string;
  description: string;
  sections: SectionCfg[];
}

interface BookCfg {
  title: string;
  description: string;
  author: string;
  term?: string;
  course?: string;
  chapters: ChapterCfg[];
}

export interface BookHeading {
  level: number;
  text: string;
  id: string;
}

export interface BookSectionNav {
  title: string;
  slug: string;
}

export interface BookChapterNav {
  title: string;
  description: string;
  sections: BookSectionNav[];
}

interface CardInfo {
  prefix: string;
  title: string | null;
  head: string;
}

function extractHeadings(html: string): BookHeading[] {
  const headings: BookHeading[] = [];
  // Match h1-h3: capture tag attributes separately from inner content
  const re = /<h([123])([^>]*)>([\s\S]*?)<\/h\1>/gi;
  let m: RegExpExecArray | null;
  while ((m = re.exec(html)) !== null) {
    const level = parseInt(m[1]);
    const attrs = m[2];
    const inner = m[3];
    // Skip the book-section-title h1 (it's the page title, not a TOC entry)
    if (attrs.includes('book-section-title') || inner.includes('book-section-title')) continue;
    // Extract id from the h tag's attributes
    const idMatch = /\bid="([^"]+)"/.exec(attrs);
    const id = idMatch?.[1] ?? '';
    // Strip HTML tags for plain text
    const text = inner.replace(/<[^>]+>/g, '').trim();
    if (text) headings.push({ level, text, id });
  }
  return headings;
}

function extractIds(html: string): string[] {
  const ids: string[] = [];
  const re = /\bid="([^"]+)"/gi;
  let m: RegExpExecArray | null;
  while ((m = re.exec(html)) !== null) {
    ids.push(m[1]);
  }
  return ids;
}

// Build a map of label id → card metadata from compiled HTML.
// Looks for <h4 class="infocard-heading" id="..."> elements with infocard-heading-prefix/infocard-heading-title spans.
function extractCardMap(html: string): Map<string, CardInfo> {
  const map = new Map<string, CardInfo>();
  const tagRe = /<h4\b([^>]*)>([\s\S]*?)<\/h4>/gi;
  let m: RegExpExecArray | null;
  while ((m = tagRe.exec(html)) !== null) {
    const attrs = m[1];
    const inner = m[2];
    if (!attrs.includes('infocard-heading')) continue;
    const idMatch = /\bid="([^"]+)"/.exec(attrs);
    if (!idMatch) continue;
    const id = idMatch[1];
    const prefixMatch = /<span[^>]*class="[^"]*infocard-heading-prefix[^"]*"[^>]*>([\s\S]*?)<\/span>/i.exec(inner);
    const titleMatch = /<span[^>]*class="[^"]*infocard-heading-title[^"]*"[^>]*>([\s\S]*?)<\/span>/i.exec(inner);
    const prefix = prefixMatch ? prefixMatch[1] : inner.replace(/<[^>]+>/g, '').trim();
    const title = titleMatch ? titleMatch[1] : null;
    const head = title
      ? `<span class="infocard-heading-prefix">${prefix}</span>: <span class="infocard-heading-title">${title}</span>`
      : `<span class="infocard-heading-prefix">${prefix}</span>`;
    map.set(id, { prefix, title, head });
  }
  return map;
}

// Count globally-numbered items by CSS class substring.
function countByClass(html: string, cls: string): number {
  return (html.match(new RegExp(cls, 'g')) ?? []).length;
}

function countGlobalItems(html: string): Record<string, number> {
  return {
    Exercise: countByClass(html, 'hanging-exercise'),
    Definition: countByClass(html, 'infocard-definition'),
    Theorem: countByClass(html, 'infocard-theorem'),
    Algorithm: countByClass(html, 'infocard-algorithm'),
    Proposition: countByClass(html, 'infocard-proposition'),
    Corollary: countByClass(html, 'infocard-corollary'),
    Resource: countByClass(html, 'infocard-resource'),
  };
}

// Remove <span id="X"></span> elements whose id already appears on an h4.infocard-heading.
function removeDuplicateSpanIds(html: string): string {
  const h4Ids = new Set<string>();
  const h4Re = /<h4\b[^>]*\bclass="[^"]*infocard-heading[^"]*"[^>]*\bid="([^"]+)"|<h4\b[^>]*\bid="([^"]+)"[^>]*\bclass="[^"]*infocard-heading[^"]*"/gi;
  let m: RegExpExecArray | null;
  while ((m = h4Re.exec(html)) !== null) h4Ids.add(m[1] ?? m[2]);
  return html.replace(/<span\s+id="([^"]+)"\s*><\/span>/gi, (match, id) =>
    h4Ids.has(id) ? '' : match,
  );
}

function fixCrossPageLinks(html: string, currentUrl: string, labelMap: Map<string, string>): string {
  return html.replace(/href="#([^"]+)"/gi, (_match, id) => {
    const targetUrl = labelMap.get(id);
    if (targetUrl && targetUrl !== currentUrl) {
      return `href="${targetUrl}#${id}"`;
    }
    return `href="#${id}"`;
  });
}

// Replace <a data-card-ref-label="..." data-card-ref-type="...">?</a> with resolved content.
function fixCardRefs(
  html: string,
  cardMap: Map<string, CardInfo>,
  labelMap: Map<string, string>,
  currentUrl: string,
): string {
  return html.replace(
    /<a\b[^>]*\bdata-card-ref-label="[^"]+"[^>]*>[\s\S]*?<\/a>/gi,
    (match) => {
      const labelM = /\bdata-card-ref-label="([^"]+)"/.exec(match);
      const typeM = /\bdata-card-ref-type="([^"]+)"/.exec(match);
      if (!labelM) return match;
      const label = labelM[1];
      const refType = typeM ? typeM[1] : 'head';
      const card = cardMap.get(label);
      if (!card) return match;
      const targetUrl = labelMap.get(label);
      const href = targetUrl && targetUrl !== currentUrl
        ? `${targetUrl}#${label}`
        : `#${label}`;
      const content = refType === 'prefix'
        ? card.prefix
        : refType === 'title'
        ? (card.title ?? card.prefix)
        : card.head;
      return `<a href="${href}">${content}</a>`;
    },
  );
}

function sectionSlugFromSrc(src: string): string {
  // "./ch1/1-vector-spaces.typ" -> "ch1/1-vector-spaces"
  return src.replace(/^\.\//, '').replace(/\.typ$/, '');
}

export function bookLoader({ fontArgs }: BookLoaderOptions = {}) {
  let watcherInitialized = false;

  return {
    name: 'book-loader',
    async load({ store, logger, parseData, watcher }: any) {
      store.clear();
      const cwd = process.cwd();
      const booksBase = join(cwd, 'src/content/books');

      const compiler = NodeCompiler.create({ workspace: cwd, fontArgs });

      let bookDirs: string[] = [];
      try {
        const entries = await readdir(booksBase, { withFileTypes: true });
        bookDirs = entries.filter(e => e.isDirectory()).map(e => join(booksBase, e.name));
      } catch (err) {
        logger.error(`book-loader: cannot read books dir: ${err}`);
        return;
      }

      for (const bookDir of bookDirs) {
        const bookSlug = basename(bookDir);
        const indexPath = join(bookDir, 'index.typ');

        // --- Get book config via metadata query ---
        let bookCfg: BookCfg | null = null;
        try {
          const docRes = compiler.compileHtml({
            mainFilePath: indexPath,
            inputs: { 'x-target': 'web', 'x-mode': 'meta' },
          });
          if (!docRes.result) { docRes.printDiagnostics(); continue; }
          const fm = compiler.query(docRes.result, { selector: '<frontmatter>' });
          if (fm?.length > 0) bookCfg = fm[0].value as BookCfg;
        } catch (err) {
          logger.error(`book-loader: failed to read ${bookSlug}/index.typ: ${err}`);
          continue;
        }
        if (!bookCfg) {
          logger.warn(`book-loader: no <frontmatter> in ${bookSlug}/index.typ`);
          continue;
        }

        // Build stable navigation structure (same for all sections of this book)
        const bookChapters: BookChapterNav[] = bookCfg.chapters.map((ch) => ({
          title: ch.title,
          description: ch.description ?? '',
          sections: (ch.sections ?? []).map((s) => ({
            title: s.title,
            slug: `${bookSlug}/${sectionSlugFromSrc(s.src)}`,
          })),
        }));

        // --- First pass: compile all sections sequentially with running counters ---
        // Running counters carry across sections for global numbering continuity.
        const runningCounters: Record<string, number> = {
          Exercise: 0, Definition: 0, Theorem: 0,
          Algorithm: 0, Proposition: 0, Corollary: 0,
          Resource: 0,
        };
        const globalLabelMap = new Map<string, string>();
        const globalCardMap = new Map<string, CardInfo>();
        const compiled: Array<{
          id: string;
          url: string;
          html: string;
          chIdx: number;
          secIdx: number;
        }> = [];

        for (let chIdx = 0; chIdx < bookCfg.chapters.length; chIdx++) {
          const chapter = bookCfg.chapters[chIdx];
          const sections = chapter.sections ?? [];
          for (let secIdx = 0; secIdx < sections.length; secIdx++) {
            const section = sections[secIdx];
            const slug = sectionSlugFromSrc(section.src);
            const entryId = `${bookSlug}/${slug}`;
            const sectionUrl = `/books/${entryId}`;
            const secPath = join(bookDir, section.src);

            try {
              const docRes = compiler.compileHtml({
                mainFilePath: secPath,
                inputs: {
                  'x-target': 'web',
                  'x-chapter': String(chIdx + 1),
                  'x-section': String(secIdx + 1),
                  'x-slug': entryId,
                  'x-exercise-start': String(runningCounters.Exercise),
                  'x-definition-start': String(runningCounters.Definition),
                  'x-theorem-start': String(runningCounters.Theorem),
                  'x-algorithm-start': String(runningCounters.Algorithm),
                  'x-proposition-start': String(runningCounters.Proposition),
                  'x-corollary-start': String(runningCounters.Corollary),
                  'x-resource-start': String(runningCounters.Resource),
                },
              });
              if (!docRes.result) { docRes.printDiagnostics(); continue; }
              const htmlRes = compiler.tryHtml(docRes.result);
              if (!htmlRes.result) { htmlRes.printDiagnostics(); continue; }
              const html = htmlRes.result.body() ?? '';

              for (const id of extractIds(html)) {
                if (!globalLabelMap.has(id)) globalLabelMap.set(id, sectionUrl);
              }
              for (const [id, card] of extractCardMap(html)) {
                globalCardMap.set(id, card);
              }

              // Accumulate item counts for next section's starting values.
              const counts = countGlobalItems(html);
              for (const key of Object.keys(runningCounters)) {
                runningCounters[key] += counts[key] ?? 0;
              }

              compiled.push({ id: entryId, url: sectionUrl, html, chIdx, secIdx });
            } catch (err) {
              logger.error(`book-loader: failed to compile ${entryId}: ${err}`);
            }
          }
        }

        // --- Second pass: fix cross-page links and card refs, extract TOC headings, store entries ---
        for (const sec of compiled) {
          const chapter = bookCfg.chapters[sec.chIdx];
          const sectionCfg = (chapter.sections ?? [])[sec.secIdx];

          let html = fixCrossPageLinks(sec.html, sec.url, globalLabelMap);
          html = fixCardRefs(html, globalCardMap, globalLabelMap, sec.url);
          html = removeDuplicateSpanIds(html);
          const headings = extractHeadings(html);

          const data = {
            bookTitle: bookCfg.title,
            bookSlug,
            bookAuthor: bookCfg.author,
            bookDescription: bookCfg.description,
            chapterIndex: sec.chIdx,
            chapterTitle: chapter.title,
            sectionIndex: sec.secIdx,
            title: sectionCfg.title,
            headings,
            bookChapters,
            bookTerm: bookCfg.term,
            bookCourse: bookCfg.course,
          };

          store.set({
            id: sec.id,
            data: await parseData({ id: sec.id, data }),
            rendered: { html },
          });
        }
      }

      compiler.evictCache(0);

      // Dev watcher: recompile affected book on any .typ change
      if (watcher && !watcherInitialized) {
        watcherInitialized = true;
        watcher.add(join(cwd, 'src/content/books'));
        watcher.on('change', async (p: string) => {
          if (!p.includes('src/content/books') || !p.endsWith('.typ')) return;
          logger.info(`book-loader: change detected in ${p}, rebuilding books`);
          // Re-trigger full load (Astro will call load() again)
        });
      }
    },
  };
}
