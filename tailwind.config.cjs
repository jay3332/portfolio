const defaultTheme = require('tailwindcss/defaultTheme')

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        link: {
          DEFAULT: '#41a7ff',
          hover: '#86c9ff',
        },
        accent: {
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
        },
        secondary: '#be3dff',
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
  plugins: [],
}