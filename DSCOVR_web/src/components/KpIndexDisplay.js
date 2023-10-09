// KpIndexDisplay.js

import React from 'react';
import './KpIndexDisplay.module.css';

function KpIndexDisplay({ kpIndex }) {
    let kpMessage, messageClass, containerClass;

    // Determine the message, message class, and container class based on kpIndex
    if (kpIndex <= 3) {
        kpMessage = 'Quiet';
        messageClass = 'QUIET';
        containerClass = 'QUIET-container';
    } else if (kpIndex <= 6) {
        kpMessage = 'Possible storm';
        messageClass = 'Possible_storm';
        containerClass = 'Possible_storm-container';
    } else {
        kpMessage = 'Sever Storm';
        messageClass = 'Sever_Storm';
        containerClass = 'Sever_Storm-container';
    }

    return (
        <div className={`kp-container ${containerClass}`}>
            <div className="kp-header">
                <h2 className="kp-value">Current Planetary K Index</h2>
                <span className="kp-index">{kpIndex}</span>
            </div>
            <div className={`kp-message ${messageClass}`}>
                <p>{kpMessage}</p>
            </div>
        </div>
    );
}

export default KpIndexDisplay;
