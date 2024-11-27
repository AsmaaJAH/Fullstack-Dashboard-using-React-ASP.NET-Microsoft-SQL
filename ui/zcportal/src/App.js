import React, { useState } from 'react';
import './App.css'; 
import { Home } from './components/Home';
import { OnboardingInternet } from './components/OnboardingInternet';
import { FAQ } from './components/FAQ';
import { Announcements } from './components/Announcements';
import { SingleAnnouncement } from './components/SingleAnnouncement';
import Login from './components/Login';
import { BrowserRouter, Route, Routes, NavLink, Navigate } from 'react-router-dom';

function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(!!localStorage.getItem('authToken'));

  const handleLoginSuccess = () => {
    setIsAuthenticated(true); // Update the state to trigger re-render
  };

  return (
    <BrowserRouter>
      <div className="App container-fluid">
        <div className="row">
          {/* Left Column Menu */}
          {isAuthenticated && (
            <div className="col-md-3 col-lg-2 sidebar">
              <div className="text-center mt-3">
                <img src="/logo.jpg" alt="Zewail City Logo" className="sidebar-logo" />
              </div>
              <h1 className="text-center">ZC Portal</h1>
              <nav className="nav flex-column">
                <NavLink className="nav-link" to="/home">Home</NavLink>
                <NavLink className="nav-link" to="/announcements">Announcements</NavLink>
                <NavLink className="nav-link" to="/OnboardingInternet">Onboarding Internet</NavLink>
                <NavLink className="nav-link" to="/faq">FAQ</NavLink>
              </nav>
            </div>
          )}
          {/* Main Content Area */}
          <div className={`col-md-${isAuthenticated ? '9' : '12'} col-lg-${isAuthenticated ? '10' : '12'} content`}>
            <Routes>
              {!isAuthenticated ? (
                <>
                  <Route
                    path="/login"
                    element={<Login onLoginSuccess={handleLoginSuccess} />}
                  />
                  <Route path="*" element={<Navigate to="/login" />} />
                </>
              ) : (
                <>
                  <Route path="/" element={<Navigate to="/home" />} />
                  <Route path="/home" element={<Home />} />
                  <Route path="/announcements" element={<Announcements />} />
                  <Route path="/announcement/:id" element={<SingleAnnouncement />} />
                  <Route path="/OnboardingInternet" element={<OnboardingInternet />} />
                  <Route path="/faq" element={<FAQ />} />
                </>
              )}
            </Routes>
          </div>
        </div>
      </div>
    </BrowserRouter>
  );
}

export default App;




