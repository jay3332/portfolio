import { defineConfig } from 'astro/config';

import mdx from "@astrojs/mdx";
import tailwind from "@astrojs/tailwind";
import sitemap from '@astrojs/sitemap';
import cloudflare from "@astrojs/cloudflare";
import icon from "astro-icon"

// https://astro.build/config
export default defineConfig({
  site: 'https://jay3332.tech',
  integrations: [tailwind({
    config: {
      path: 'tailwind.config.cjs',
      applyBaseStyles: false
    }
  }), sitemap(), mdx(), icon()],
  output: "server",
  adapter: cloudflare(),
});