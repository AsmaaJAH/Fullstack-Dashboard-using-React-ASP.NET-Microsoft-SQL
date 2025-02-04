import './App.css';
import Home from './Views/Home';
// import Attendance from './Views/Attendance';
// import HRrequests from './Views/HRrequests';
import { OnboardingInternet } from './Views/OnboardingInternet';
import FAQ from './Views/FAQ';
import Announcements from './Views/Announcements';
import SingleAnnouncement from './Views/SingleAnnouncement';
import { BrowserRouter, Route, Routes, NavLink, Navigate } from 'react-router-dom';
import DepartmentLandingPage from './Views/DepartmentLandingPage';
import ITServicesPage from './Views/ITServicesPage';
import ServiceDetailPage from './Views/ServiceDetailPage';

function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <div className="row">
          {/* Left Column Menu */}
          <div className="col-md-3 col-lg-2 sidebar">
            <div className="text-center mt-3">
              <img src="/logo.jpg" alt="Zewail City Logo" className="sidebar-logo" />
            </div>
            <h1 className="text-center">ZC Portal</h1>
            <nav className="nav flex-column">
              <NavLink className="nav-link" to="/home">Home</NavLink>
              <NavLink className="nav-link" to="/announcements">Announcements</NavLink>
              <NavLink className="nav-link" to="/OnboardingInternet">Services</NavLink>
              <NavLink className="nav-link" to="/faq">FAQ</NavLink>
              {/* <NavLink className="nav-link" to="/attendance">Attendance Tracking</NavLink>
              <NavLink className="nav-link" to="/HRrequests">HR Requests</NavLink> */}
            </nav>
          </div>
          {/* Main Content Area */}
          <div className="col-md-9 col-lg-10 content">
            <Routes>
              <Route path="/" element={<Navigate to="/home" />} />
              <Route path="/home" element={<Home />} />
              <Route path="/announcements" element={<Announcements />} />
              <Route path="/announcement/:id" element={<SingleAnnouncement />} />
              <Route path="/OnboardingInternet" element={<OnboardingInternet />} />
              <Route path="/faq" element={<FAQ />} />
              <Route path="/department/:department" element={<DepartmentLandingPage />} />
              <Route path="/departments/:department/services" element={<ITServicesPage />} />
              <Route path="/departments/:department/announcements" element={<Announcements/>} />
              <Route path="/departments/:department/faq" element={<FAQ />} />
              <Route path="/services/:service" element={<ServiceDetailPage />} />
              <Route path="/services/:service/OnboardingInternet" element={<OnboardingInternet />} />


              {/* <Route path="/attendance" element={<Attendance />} />
              <Route path="/HRrequests" element={<HRrequests />} /> */}
            </Routes>
          </div>
        </div>
      </div>
    </BrowserRouter>
  );
}

export default App;


