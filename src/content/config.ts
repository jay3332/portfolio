import { defineCollection, z } from "astro:content";

export const collections = {
  projects: defineCollection({
    type: 'content',
    schema: z.object({
      name: z.string(),
      description: z.string(),
      url: z.string().url().optional(),
      label: z.string().optional(),
      timeline: z.string(),
      thumbnail: z.string().optional(),
      repo: z.string().regex(/\w+\/\w+/).optional(),
      skills: z.string().array(),
      org: z.string().optional(),
      readme: z.string().regex(/\w+\/\w+/).optional(),
    }),
  })
}