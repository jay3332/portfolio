import React from 'react';
import Helmet from 'react-helmet';

import DefaultFavicon from '../assets/jay3332.png';

export default function Title({ children, favicon = DefaultFavicon }: RequiresChildren<{ favicon?: string }>) {
    return (
        <Helmet>
            <title>{children}</title>
            {favicon && <link rel="icon" href={favicon} />}
        </Helmet>
    );
}