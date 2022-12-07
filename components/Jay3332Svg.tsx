import styled, {keyframes} from 'styled-components';


const Gradient = keyframes`
  from {
    background-position: top left;
  }
  50% {
    background-position: bottom right;
  }
  to {
    background-position: top left;
  }
`;
const Container = styled.div`
  width: min(20vw, 300px);
  height: min(20vw, 300px);
  animation: ${Gradient} 30s ease infinite;
  background: linear-gradient(
    to bottom right,
    #1aacff,
    #e649ff,
    #ff4e4e,
    #ffce49,
    #69ff6d,
    #23edff,
    #1aacff
  );
  background-size: 600% 600%;
  clip-path: url(#__jay3332_svg_clip);
  
  @media screen and (max-width: 768px) {
    width: min(40vw, 300px);
    height: min(40vw, 300px);
  }
`;

const OuterContainer = styled.div`
  transition: all 0.5s ease;
  
  &:hover {
    filter: brightness(125%) drop-shadow(0 0 12px var(--color-text-secondary));
    transform: rotate(8deg) scale(1.1);
  }
`;

export default function Jay3332Svg() {
  return (
    <OuterContainer>
      <Container />
      <svg xmlns="http://www.w3.org/2000/svg" width="0" height="0" preserveAspectRatio="xMidYMid meet">
        <defs>
          <clipPath id="__jay3332_svg_clip" clipPathUnits="objectBoundingBox">
            <path
              d="M 0.1018 0.6163 C 0.0987 0.6334 0.0970 0.6511 0.0970 0.6691 C 0.0970 0.8297 0.2274 0.9601 0.3881
                0.9601 C 0.5487 0.9601 0.6791 0.8297 0.6791 0.6691 C 0.6791 0.6629 0.6789 0.6568 0.6786 0.6508 L
                0.6786 0.6508 L 0.6786 0.2580 L 0.9030 0.0399 L 0.6836 0.0415 L 0.4569 0.2564 L 0.4569 0.3862 L
                0.4569 0.3862 L 0.4569 0.6691 L 0.4569 0.6691 C 0.4569 0.6692 0.4569 0.6693 0.4569 0.6694 C
                0.4569 0.7075 0.4259 0.7385 0.3878 0.7385 C 0.3496 0.7385 0.3186 0.7075 0.3186 0.6694 L 0.3186
                0.6694 C 0.3186 0.6693 0.3186 0.6692 0.3186 0.6691 L 0.3186 0.6691 L 0.3186 0.3995 L 0.1018
                0.6163 Z"
            />
          </clipPath>
        </defs>
      </svg>
    </OuterContainer>
  )
}
