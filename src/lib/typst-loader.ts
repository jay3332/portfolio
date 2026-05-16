import { NodeCompiler } from '@myriaddreamin/typst-ts-node-compiler';
import type { NodeAddFontPaths, NodeAddFontBlobs } from '@myriaddreamin/typst-ts-node-compiler';
import { readdir } from 'node:fs/promises';
import { join } from 'node:path';

export type TypstInputs = Record<string, string>;
export type TypstInputsFn = (id: string, filePath: string) => TypstInputs;

export interface TypstLoaderOptions {
  base: string;
  inputs?: TypstInputs | TypstInputsFn;
  fontArgs?: Array<NodeAddFontPaths | NodeAddFontBlobs>;
}

export function typstLoader({ base, inputs = {}, fontArgs }: TypstLoaderOptions) {
  // Flag + cached state so we only attach one watcher listener across load() re-runs.
  let watcherInitialized = false;
  let cachedCwd: string;
  let cachedAbsBase: string;

  return {
    name: 'typst-loader',
    async load({ store, logger, parseData, watcher }: any) {
      store.clear();
      const cwd = process.cwd();
      const absBase = join(cwd, base);
      cachedCwd = cwd;
      cachedAbsBase = absBase;

      const compiler = NodeCompiler.create({ workspace: cwd, fontArgs });

      const makeCompileEntry = (c: typeof compiler) => async (relPath: string) => {
        const mainFilePath = join(absBase, relPath);
        const id = relPath.slice(0, -'.typ'.length);
        const resolvedInputs = typeof inputs === 'function'
          ? inputs(id, mainFilePath)
          : { ...inputs };

        try {
          const docRes = c.compileHtml({ mainFilePath, inputs: resolvedInputs });
          if (!docRes.result) {
            docRes.printDiagnostics();
            return;
          }
          const doc = docRes.result;

          let rawData: Record<string, unknown> = {};
          const fm = c.query(doc, { selector: '<frontmatter>' });
          if (fm?.length > 0) rawData = fm[0].value ?? {};

          const htmlRes = c.tryHtml(doc);
          if (!htmlRes.result) {
            htmlRes.printDiagnostics();
            return;
          }
          const html: string = htmlRes.result.body() ?? '';

          store.set({
            id,
            data: await parseData({ id, data: rawData }),
            filePath: join(base, relPath),
            rendered: { html },
          });
        } catch (err) {
          logger.error(`typst-loader: failed to compile ${relPath}: ${err}`);
        }
      };

      const compileEntry = makeCompileEntry(compiler);
      const entries = await readdir(absBase, { recursive: true });
      const typFiles = entries.filter((f): f is string => typeof f === 'string' && f.endsWith('.typ'));
      for (const f of typFiles) await compileEntry(f);
      compiler.evictCache(0);

      // Only attach the watcher listener once — it creates a fresh compiler
      // per change so it's always working with a live instance.
      if (watcher && !watcherInitialized) {
        watcherInitialized = true;
        watcher.add(cachedAbsBase);
        watcher.on('change', async (p: string) => {
          if (!p.startsWith(cachedAbsBase) || !p.endsWith('.typ')) return;
          const relPath = p.slice(cachedAbsBase.length + 1);
          logger.info(`typst-loader: recompiling ${relPath}`);
          const freshCompiler = NodeCompiler.create({ workspace: cachedCwd, fontArgs });
          await makeCompileEntry(freshCompiler)(relPath);
          freshCompiler.evictCache(0);
        });
      }
    },
  };
}
