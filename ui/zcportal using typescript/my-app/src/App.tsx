import './App.css'; 
import Home from './components/Home';
import Attendance from'./components/Attendance';
import HRrequests from './components/HRrequests';
import  { OnboardingInternet } from './components/OnboardingInternet';

import FAQ  from './components/FAQ';

import Announcements  from './components/Announcements';
import SingleAnnouncement from './components/SingleAnnouncement';
import { BrowserRouter, Route, Routes, NavLink, Navigate } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <div className="App container-fluid">
        <div className="row">
          {/* Left Column Menu */}
          { (
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
                <NavLink className="nav-link" to="/attendance">Attendance Tracking</NavLink>
                <NavLink className="nav-link" to="/HRrequests">HR Requests</NavLink>
              </nav>
            </div>
          )}
          {/* Main Content Area */}
          <div className={`col-md-12 col-lg-12 content`}>
            <Routes>
              { (
                <>
                  <Route path="/" element={<Navigate to="/home" />} />
                  <Route path="/home" element={<Home />} />
                  <Route path="/announcements" element={<Announcements />} />
                  <Route path="/announcement/:id" element={<SingleAnnouncement />} />
                  <Route path="/OnboardingInternet" element={<OnboardingInternet />} />
                  <Route path="/faq" element={<FAQ />} />
                  <Route path="/attendance" element={<Attendance/>} />
                  <Route path="/HRrequests" element={< HRrequests/>} />
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

