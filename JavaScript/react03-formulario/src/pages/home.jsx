import { useState } from 'react';
import '../assets/home.css';

const Home = () => {
    const [theme, setTheme] = useState('light');

    const toggleTheme = () => {
        setTheme(theme === 'light-theme' ? 'dark-theme' : 'light-theme');
    };

    return (
        <div className={`home ${theme}`}>
            <header>
                <h1>Home Page</h1>
                <button onClick={toggleTheme}>
                    Switch to {theme === 'light-theme' ? 'Dark' : 'Light'} Theme
                </button>
            </header>
            <nav>
                <ul>
                    <li><a href="#home">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#services">Services</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </nav>
            <main>
                <section>
                    <h2>Welcome to the Home Page</h2>
                    <p>This is the content section.</p>
                </section>
            </main>
            <footer>
                <nav>
                    <ul>
                        <li><a href="#home">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#services">Services</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </nav>
            </footer>
        </div>
    );
};

export default Home;