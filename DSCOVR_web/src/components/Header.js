import React from 'react';
import styles from './Header.module.css'; // Import the CSS module
import logoWie from './logos/wie_logo2.png';
import logoIee from './logos/ieee_cs_logo.webp';
import logoNasa from './logos/space_apps_logo.png';

const Header = () => {
    return (
        <header className={styles.header}>
            <h1>DSCOVR the Future</h1>
            <div className={styles.logoContainer}>
                <img src={logoWie} alt="WIE Logo" />
                <img src={logoIee} alt="IEEE-CS Logo" />
                <img src={logoNasa} alt="NASA Logo" />
            </div>
        </header>
    );
}

export default Header;
