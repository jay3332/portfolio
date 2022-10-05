import Head from 'next/head'
import styled, { keyframes } from 'styled-components';
import Jay3332Svg from "../components/Jay3332Svg";

const TextGradient = keyframes`
  from {
    background-position: 0;
  }
  to {
    background-position: 300%;
  }
`;

const BreathingBlur = keyframes`
  from {
    filter: blur(0px);
  }
  50% {
    filter: blur(8px);
  }
  to {
    filter: blur(0px);
  }
`;

const Container = styled.div`
  display: flex;
  flex-direction: column;
  width: 100vw;
`;

// noinspection CssInvalidPropertyValue
const BannerText = styled.h1`
  padding-top: 64px;
  text-align: center;
  font-weight: 800;
  font-size: min(10vw, 180px);
  box-sizing: border-box;
  position: relative;
  animation: ${TextGradient} 30s ease infinite;

  &::before {
    content: 'jay3332';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: -1;
    padding-top: 64px;
    animation: ${TextGradient} 30s ease infinite, ${BreathingBlur} 20s cubic-bezier(.86, .03, .16, .96) infinite;
  }

  &, &::before {
    background: linear-gradient(
      to right,
      #1aacff,
      #e649ff,
      #ffc67b,
      #69ff6d,
      #23edff,
      #1aacff
    );
    background-size: 300% 300%;
    background-clip: text;
    -webkit-background-clip: text;
    -moz-background-clip: text;
    text-fill-color: transparent;
    -webkit-text-fill-color: transparent;
  }
`

const Banner = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
`;

export default function Home() {
  return (
    <Container>
      <Head>
        <title>jay3332</title>
      </Head>
      <Banner>
        <Jay3332Svg />
        <BannerText>jay3332</BannerText>
      </Banner>
    </Container>
  )
}
