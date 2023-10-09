
// Import necessary modules and styles
import React from 'react';
import ReactCalendar from 'react-calendar';
import styles from './Calendar.module.css';

// Mock data generation (same as your code)

const mockData = {
    // Generate mock data for 2023
    ...Array.from({ length: 365 }, (_, i) => {
        const date = new Date(2023, 0, 1);
        date.setDate(date.getDate() + i);
        return {
            date: date.toISOString().split('T')[0],
            planetary_K_index: Math.floor(Math.random() * 16)  // Random value between 0 and 15
        };
    }).reduce((acc, curr) => {
        acc[curr.date] = curr.planetary_K_index;
        return acc;
    }, {})
};
const Calendar = () => {
    const tileContent = ({ date, view }) => {
        if (view === 'month') {
            const value = mockData[date.toISOString().split('T')[0]];
            let kpMessage, messageClass;
    
            // Determine the message and message class based on kpIndex
            if (value >= 7) {
                kpMessage = 'Severe Storm';
                messageClass = styles.highPossible_storm;
            } else if (value >= 5) {
                kpMessage = 'Possible Storm';
                messageClass = styles.mediumPossible_storm;
            } else {
                kpMessage = 'Quiet';
                messageClass = styles.lowPossible_storm;
            }

            return (
                <p className={messageClass}>{kpMessage}</p>
            );
        }
    };
    

    return (
        <ReactCalendar 
            tileContent={tileContent}
            formatShortWeekday={(locale, date) => new Intl.DateTimeFormat(locale, { weekday: 'short' }).format(date).toUpperCase()} // Format weekday names
        />
    );
};

export default Calendar;
