import { createGlobalStyle } from "styled-components";
import type { AppProps } from "next/app";
import Head from "next/head";

const GlobalStyle = createGlobalStyle`
  :root {
    --font-sans-serif: Atkinson Hyperlegible, -apple-system, BlinkMacSystemFont, Inter, Segoe UI, Roboto, Oxygen,
    Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, sans-serif;
    --font-monospace: Menlo, Monaco, Lucida Console, Liberation Mono, DejaVu Sans Mono,
    Bitstream Vera Sans Mono, 'Courier New', monospace;

    /* Color Theme (Dark) */
    --color-bg-0: #000000;
    --color-bg-1: #1a1c1a;
    --color-bg-2: #2a2c2a;
    --color-bg-3: #3a3c3a;
    --color-bg-4: #4a4c4a;
    --color-text: #ffffff;
    --color-text-secondary: #878787;
    --color-text-tertiary: #484848;
    --color-primary: #27a8ff;
  }

  * {
    font-family: var(--font-sans-serif);
  }

  body {
    background-color: var(--color-bg-0);
    margin: 0;
  }
`;

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <>
      <GlobalStyle />
      <Head>
        <title>jay3332</title>
        <meta name="og:title" content="jay3332" />
        <meta name="og:description" content="jay3332 Portfolio" />
      </Head>
      <Component {...pageProps} />
    </>
  )
}

export default MyApp
