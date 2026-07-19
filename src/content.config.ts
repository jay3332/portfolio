import { z } from 'astro/zod';
import { defineCollection } from "astro:content";
import { glob } from 'astro/loaders';
import { typstLoader } from './lib/typst-loader';
import { bookLoader } from './lib/book-loader';

export const projectsSchema = z.object({
  name: z.string(),
  description: z.string(),
  url: z.url().optional(),
  label: z.string().optional(),
  timeline: z.string(),
  icon: z.string().optional(),
  thumbnail: z.string().optional(),
  repo: z.string().regex(/\w+\/\w+/).optional(),
  skills: z.string().array(),
  org: z.string().optional(),
  readme: z.string().regex(/\w+\/\w+/).optional(),
  order: z.number().optional(),
  active: z.boolean(),
})

const projectsCollection = defineCollection({
  loader: glob({ pattern: "**/*", base: "./src/content/projects" }),
  schema: projectsSchema,
});

export const blogSchema = z.object({
  title: z.string(),
  date: z.coerce.date().optional(),
  tags: z.array(z.string()).default([]),
  brief: z.string().optional(),
  thumbnail: z.string().optional(),
});

const blogCollection = defineCollection({
  loader: typstLoader({
    base: 'src/content/blog',
    inputs: (id) => ({ 'x-slug': id, 'x-target': 'web' }),
    fontArgs: [{ fontPaths: ['public/fonts/ibm-plex-serif/fonts/complete', 'public/fonts/ibm-plex-math/fonts/complete'] }],
  }),
  schema: blogSchema,
});

const bookHeadingSchema = z.object({
  level: z.number(),
  text: z.string(),
  id: z.string(),
});

const bookSectionNavSchema = z.object({
  title: z.string(),
  slug: z.string(),
});

const bookChapterNavSchema = z.object({
  title: z.string(),
  description: z.string(),
  sections: z.array(bookSectionNavSchema),
});

export const bookPageSchema = z.object({
  bookTitle: z.string(),
  bookSlug: z.string(),
  bookAuthor: z.string(),
  bookDescription: z.string(),
  chapterIndex: z.number(),
  chapterTitle: z.string(),
  sectionIndex: z.number(),
  title: z.string(),
  headings: z.array(bookHeadingSchema),
  bookChapters: z.array(bookChapterNavSchema),
  bookTerm: z.string().optional(),
  bookCourse: z.string().optional(),
});

const fontArgs = [{
  fontPaths: [
    'public/fonts/ibm-plex-serif/fonts/complete',
    'public/fonts/ibm-plex-math/fonts/complete',
  ], 
}];

const bookPagesCollection = defineCollection({
  loader: bookLoader({ fontArgs }),
  schema: bookPageSchema,
});

export const collections = {
  projects: projectsCollection,
  blog: blogCollection,
  book: bookPagesCollection,
}