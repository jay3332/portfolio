import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import styled, { keyframes } from 'styled-components';

import Title from '../components/Title';

import DiscordIcon from '../assets/discord.svg';
import GitHubIcon from '../assets/github.svg';

const Container = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 100vw;
    height: 100vh;
`;

const Sine = keyframes`
    from {
        transform: translateY(-5px);
    }
    50% {
        transform: translateY(10px);
    }
    to {
        transform: translateY(-5px);
    }
`;

const Main = styled.div`
    display: flex;
    flex-direction: column;
    animation: ${Sine} 6s ease-in-out infinite;
`;

interface TextProps {
    offsetX: number;
    offsetY: number;
}

const Text = styled.div.attrs<TextProps>(props => {
    return {
        style: {
            textShadow: `${props.offsetX}px ${props.offsetY}px 32px rgba(255, 255, 255, 0.6)`,
        },
    }
})<TextProps>`
    font-size: max(72px, 14vh);
    font-weight: 600;
    transition: text-shadow: 0.5s ease;
`;

const Icons = styled.div`
    display: flex;
    padding: 24px;
    align-items: center;
    justify-content: center;
`;

const Bump = keyframes`
    from {
        transform: translateY(0px);
    }
    to {
        transform: translateY(-5px);
    }
`;

const Unbump = keyframes`
    from {
        transform: translateY(-5px);
    }
    to {
        transform: translateY(0px);
    }
`;

const Icon = styled.img`
    width: max(36px, 6vh);
    filter: brightness(100);
    opacity: 0.5;
    transition: opacity 0.5s ease;
    animation: ${Unbump} 0.3s ease-in-out;
    padding: 2px 24px;

    :hover {
        opacity: 0.75;
        transform: translateY(-5px);
        animation: ${Bump} 0.3s ease-in-out;
    }
`;

const Navigation = styled.div`
    position: absolute;
    bottom: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    
    a {
        opacity: 0.6;
        color: var(--theme-text) !important;
        font-size: 24px;
        text-decoration: none;
        transition: opacity 0.4s ease;
        position: relative;
        padding: 6px;

        :hover {
            opacity: 0.8;
        }

        :before {
            content: "";
            opacity: inherit;
            position: absolute;
            width: 100%;
            height: 3px;
            bottom: 0;
            left: 0;
            background-color: var(--theme-text);
            visibility: hidden;
            -webkit-transform: scaleX(0);
            transform: scaleX(0);
            -webkit-transition: all 0.4s ease 0.2s;
            transition: visibility 0.4s, transform 0.4s, -webkit-transform 0.4s ease 0.2s;
        }

        :hover:before {
            visibility: visible;
            -webkit-transform: scaleX(1);
            transform: scaleX(1);
        }
    }
`;

const NavigationItem = styled.div`
    display: flex;
    text-align: center;
    padding: 32px;
`;

const clamp = (value: number): number => Math.max(Math.min(8, value), -8);

function IconComponent({ icon, href }: { icon: any, href: string }) {
    return (
        <a href={href}>
            <Icon src={icon} />
        </a>
    )
}

function NavigationItemComponent({ label, href }: { label: string, href: string }) {
    return (
        <NavigationItem>
            <Link to={href}>{label}</Link>
        </NavigationItem>
    )
}

export default function Homepage() {
    let [ offsetX, setX ] = useState(0);
    let [ offsetY, setY ] = useState(0);

    return (
        <Container onMouseMove={event => {
            const x = event.clientX - innerWidth / 2;
            const y = event.clientY - innerHeight / 2;

            setX(clamp(x));
            setY(clamp(y));
        }}>
            <Title>jay3332: Homepage</Title>
            <Main>
                <Text offsetX={offsetX} offsetY={offsetY}>jay3332</Text>
                <Icons>
                    <IconComponent icon={GitHubIcon} href='https://github.com/jay3332' />
                    <IconComponent icon={DiscordIcon} href='https://discord.com/users/414556245178056706' />
                </Icons>
            </Main>
            <Navigation>
                <NavigationItemComponent label='Home' href='/' />
            </Navigation>
        </Container>
    );
}
