import styled, {keyframes} from 'styled-components';
import {createRef, useEffect, useState} from "react";

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

const _ContainerBefore = styled.div`
  width: 600px;
  height: 600px;
  transform: scale(0.5);
  clip-path: url(#__jay3332_svg_clip);
  background: var(--color-text);
`;

type ContainerProps = { offsetX: number, offsetY: number };

const ContainerBefore = styled.div.attrs<ContainerProps>(props => {
  return {
    style: {
      top: props.offsetY,
      left: props.offsetX,
    }
  }
})<ContainerProps>`
  position: absolute;
  filter: blur(128px);
`;

const Container = styled.div`
  animation: ${Gradient} 30s ease infinite;
  background: linear-gradient(to bottom right,
  #1aacff,
  #e649ff,
  #ffc67b,
  #69ff6d,
  #23edff,
  #1aacff);
  width: 600px;
  height: 600px;
  background-size: 600% 600%;
  transform: scale(0.5);
  clip-path: url(#__jay3332_svg_clip);
  transition: all 0.5s ease;

  &:hover {
    filter: brightness(125%) drop-shadow(0 0 16px var(--color-bg-0));
    transform: rotate(8deg) scale(0.55);
  }
`;

const ContainerWrapper = styled.div`
  box-sizing: border-box;
  position: absolute;
`;

const SvgContainer = styled.div`
  position: relative;
  margin: -150px;
  width: 300px;
  height: 300px;
  display: flex;
  justify-content: center;
  align-items: center;
  
  svg {
    transform: scale(0);
  }
`;

const clamp = (value: number): number => Math.max(Math.min(4, value), -4);

export default function Jay3332Svg() {
  let [offsetX, setOffsetX] = useState(0);
  let [offsetY, setOffsetY] = useState(0);
  let containerRef = createRef<HTMLDivElement>();

  useEffect(() => {
    document.addEventListener('mousemove', (event) => {
      let targetNode = containerRef.current;
      if (targetNode == null) return;

      let centerX = targetNode.clientLeft + targetNode.clientWidth / 2;
      let centerY = targetNode.clientTop + targetNode.clientHeight / 2;

      setOffsetX(clamp(event.clientX - centerX));
      setOffsetY(clamp(event.clientY - centerY));
    });
  }, [containerRef]);

  return (
    <SvgContainer>
      <ContainerWrapper>
        <ContainerBefore offsetX={offsetX} offsetY={offsetY}>
          <_ContainerBefore />
        </ContainerBefore>
        <Container ref={containerRef} />
      </ContainerWrapper>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600" width="600" height="600">
        <defs>
          <clipPath id="__jay3332_svg_clip">
            <path
              d="M 61.082 369.798 C 59.201 380.059 58.219 390.632 58.219 401.433 C 58.219 497.812 136.467 576.06 232.846
                576.06 C 329.226 576.06 407.474 497.812 407.474 401.433 C 407.474 397.75 407.36 394.094 407.135 390.468 L
                407.135 390.468 L 407.135 154.822 L 541.781 23.94 L 410.188 24.902 L 274.166 153.847 L 274.166 231.731 L
                274.166 231.731 L 274.166 401.433 L 274.166 401.433 C 274.166 401.495 274.166 401.558 274.166 401.62 C
                274.166 424.529 255.568 443.127 232.659 443.127 C 209.75 443.127 191.152 424.529 191.152 401.62 L 191.152
                401.62 C 191.152 401.558 191.152 401.495 191.152 401.433 L 191.152 401.433 L 191.152 239.729 L 61.082
                369.798 Z"
            />
          </clipPath>
        </defs>
      </svg>
    </SvgContainer>
  )
}
