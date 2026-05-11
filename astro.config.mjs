import { defineConfig } from 'astro/config';

import mdx from "@astrojs/mdx";
import sitemap from '@astrojs/sitemap';
import cloudflare from "@astrojs/cloudflare";
import icon from "astro-icon";
import { typst } from 'astro-typst';
import remarkMath from 'remark-math';

import 'katex';
import 'katex/contrib/mhchem';
import rehypeKatex from 'rehype-katex';

import terbiumLang from './terbium.tmLanguage.json';

const typstConfig = typst({
  options: {
    remPx: 14,
  },
  target: (id) => {
    console.debug(`Detecting ${id}`);
    if (id.endsWith('.svg.typ') || id.includes('/svg/'))
      return "svg";
    return "html";
  },
  // === Use html-text output rather than hAST ===
  htmlMode: "text", // added in v0.12.3
  // === <img src="xxx.svg"> instead of inlined <svg> ===
  // emitSvg: true,
  // emitSvgDir: ".astro/typst"
  // === Add non-system fonts here ===
  // fontArgs: [
  //   { fontPaths: ['/system/fonts', '/user/fonts'] },
  //   { fontBlobs: [customFontBuffer] }
  // ],
});

const terbiumLang = {
  ...terbiumLang,
  name: 'terbium',
  id: 'terbium',
  scopeName: 'source.terbium',
};
const mdxConfig = {
  remarkPlugins: [remarkMath],
  rehypePlugins: [rehypeKatex],
  shikiConfig: { theme: 'houston', langs: [terbiumLang] },
};

// https://astro.build/config
export default defineConfig({
  site: 'https://jay3332.tech',
  integrations: [typstConfig, sitemap(), mdx(mdxConfig), icon()],
  output: "server",
  markdown: mdxConfig,
  // adapter: cloudflare(),
});