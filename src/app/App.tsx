import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { createGlobalStyle } from 'styled-components';

import Title from '../components/Title';
import Homepage from '../pages/Homepage';

const GlobalStyle = createGlobalStyle`
    :root {
        --font-primary: 'Inter', serif;

        --theme-background: #1a1d1d;
        --theme-text: #ffffff;
        --theme-text-secondary: #797979;
        --theme-link: #2fbdff;
        --theme-link-hover: #6deeff;
    }

    * {
        font-family: var(--font-primary);
        color: var(--theme-text);
    }

    body {
        background: black;
        width: 100vw;
        margin: 0;
    }

    a {
        color: var(--theme-link);
        transition: color 0.3s ease;
    }

    a:hover {
        color: var(--theme-link-hover);
    }
`;

export default function App() {
    return (
        <>
            <GlobalStyle />
            <Title>jay3332</Title>
            <BrowserRouter>
                <Routes>
                    <Route path="/" element={<Homepage />}>
                        <Route index element={<Homepage />}/>
                    </Route>
                </Routes>
            </BrowserRouter>
        </>
    );
}