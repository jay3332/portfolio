const defaultTheme = require('tailwindcss/defaultTheme')

const accent = {
  DEFAULT: '#0586ff',
  50: '#bddfff',
  100: '#a8d5ff',
  200: '#7fc1ff',
  300: '#57adff',
  400: '#2e9aff',
  500: '#0586ff',
  600: '#0069cc',
  700: '#004c94',
  800: '#002f5c',
  900: '#001224',
  950: '#000100'
}

const primary = {
  DEFAULT: '#2a669f',
  50: '#ffffff',
  100: '#fdfefe',
  200: '#cceef2',
  300: '#9cd7e5',
  400: '#6cb9d8',
  500: '#3b94cb',
  600: '#2a669f',
  700: '#234b83',
  800: '#1b3366',
  900: '#14204a',
}

const secondary = {
  DEFAULT: '#F5780B',
  50: '#FCDABB',
  100: '#FBCFA8',
  200: '#FAB981',
  300: '#F8A459',
  400: '#F78E32',
  500: '#F5780B',
  600: '#C05E08',
  700: '#8A4306',
  800: '#542903',
  900: '#1E0F01',
  950: '#030200'
}

/** @type {import('tailwindcss').Config} */
const config = {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        link: {
          DEFAULT: '#41a7ff',
          hover: '#86c9ff',
        },
        accent,
        primary,
        secondary,
        gray: {
          950: '#0a0e16',
        },
      },
      screens: {
        'mobile-xs': { max: '369px' },
        'mobile': { max: '767px' },
      },
    },
    fontFamily: {
      title: ['"Mona Sans"', "'Inter var'", ...defaultTheme.fontFamily.sans],
      sans: ["'Inter var'", ...defaultTheme.fontFamily.sans],
      mono: [
        'Menlo', 'Monaco', 'Lucida Console', 'Liberation Mono',
        'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', 'monospace',
      ],
    },
    keyframes: {
      'fade-in': {
        '0%': { opacity: 0 },
        '100%': { opacity: 1 },
      },
    },
  },
  plugins: [
    require('daisyui'),
    require('@tailwindcss/typography'),
  ],
}

config.daisyui = {
  themes: [{
    default: {
      primary: primary.DEFAULT,
      secondary: secondary.DEFAULT,
      accent: accent.DEFAULT,
      neutral: '#3a3a41',
      error: '#ee3434',
      base: {
        content: '#ffffff',
      },
      '.btn': {
        'text-transform': 'initial',
      },
    },
  }],
}

module.exports = config