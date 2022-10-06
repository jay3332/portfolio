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
  margin: 16px 0;
  text-align: center;
  font-weight: 800;
  font-size: min(10vw, 120px);
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
    animation: ${TextGradient} 30s ease infinite, ${BreathingBlur} 20s cubic-bezier(.86, .03, .16, .96) infinite;
  }

  &, &::before {
    background: linear-gradient(to right,
    #1aacff,
    #e649ff,
    #ff4e4e,
    #ffce49,
    #69ff6d,
    #23edff,
    #1aacff);
    background-size: 300% 300%;
    background-clip: text;
    -webkit-background-clip: text;
    -moz-background-clip: text;
    text-fill-color: transparent;
    -webkit-text-fill-color: transparent;
  }
  
  @media screen and (max-width: 768px) {
    font-size: min(20vw, 120px);
  }
`

const FadeIn = keyframes`
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
`;

const Banner = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  animation: ${FadeIn} 1s ease;
`;

const MoveIn = keyframes`
  from {
    opacity: 0;
    transform: translateY(200%);
    text-shadow: 0 0 0 var(--color-text);
  }
  to {
    opacity: 1;
    transform: translateY(0);
    text-shadow: 0 0 28px var(--color-text);
  }
`;

const BannerDescription = styled.p`
  text-align: center;
  font-size: 1.5em;
  margin-top: 12px;
  color: var(--color-text-secondary);
  text-shadow: 0 0 28px var(--color-text);
  animation: ${MoveIn} 2s ease;
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
        <BannerDescription>My personal portfolio and website for experiments</BannerDescription>
      </Banner>
    </Container>
  )
}
