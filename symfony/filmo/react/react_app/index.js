import React from 'react'
import ReactDOM from 'react-dom/client'
import App from "/react/jsx/App";
import { BrowserRouter } from 'react-router-dom';

ReactDOM.createRoot(document.getElementById('react-app')).render(
    <React.StrictMode>
        <BrowserRouter>
            <App />
        </BrowserRouter>
    </React.StrictMode>,
)