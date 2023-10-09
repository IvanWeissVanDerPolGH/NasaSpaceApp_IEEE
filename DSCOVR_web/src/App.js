import React from 'react';

// Importing global styles
import './styles.css';

// Importing components
import Header from './components/Header';
import Footer from './components/Footer';
import Introduction from './components/Introduction';
import Calendar from './components/Calendar';
import KpIndexDisplay from './components/KpIndexDisplay';


function App() {
  const currentKpIndex = 6; // This value can be fetched or updated as required

    return (
        <div className="App">
            <Header />
            <KpIndexDisplay kpIndex={currentKpIndex} />
            <div style={{ flexGrow: 1, display: 'flex', flexDirection: 'column', justifyContent: 'center' }}>
                <Calendar />
            </div>
            <Introduction />
            <Footer />
        </div>
    );
}

export default App;
