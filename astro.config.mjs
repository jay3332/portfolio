import { defineConfig } from 'astro/config';

import mdx from "@astrojs/mdx";
import tailwind from "@astrojs/tailwind";
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
import cloudflare from "@astrojs/cloudflare";

// https://astro.build/config
export default defineConfig({
  site: 'https://jay3332.tech',
  integrations: [tailwind({
    config: {
      path: 'tailwind.config.cjs',
      applyBaseStyles: false
    }
  }), sitemap(), mdx()],
  output: "server",
  adapter: cloudflare({ mode: 'directory' })
});