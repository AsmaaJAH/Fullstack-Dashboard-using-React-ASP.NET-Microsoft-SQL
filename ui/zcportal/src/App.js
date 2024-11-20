import './App.css';
import { Home } from './components/Home';
import { OnboardingInternet } from './components/OnboardingInternet';
import { FAQ } from './components/FAQ';
import { Announcements} from './components/Announcements';

import { BrowserRouter, Route, Routes, NavLink, Navigate } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <div className="App container-fluid">
        <div className="row">
          {/* Left Column Menu */}
          <div className="col-md-3 col-lg-2 sidebar">
          <div className="text-center mt-3">
              <img src="/logo.jpg" alt="Zewail City Logo" className="sidebar-logo" />
            </div>
            <h1 className="text-center ">ZC Portal</h1>
            <nav className="nav flex-column">
              <NavLink className="nav-link" to="/home">Home</NavLink>
              <NavLink className="nav-link" to="/announcements">Announcements</NavLink>
              <NavLink className="nav-link" to="/OnboardingInternet">Onboarding Internet</NavLink>
              <NavLink className="nav-link" to="/faq">FAQ</NavLink>

            </nav>
          </div>
          {/* Main Content Area */}
          <div className="col-md-9 col-lg-10 content">
            <Routes>
              <Route path="/" element={<Navigate to="/home" />} />
              <Route path='/home' element={<Home />} />
              <Route path='/announcements' element={<Announcements />} />
              <Route path='/OnboardingInternet' element={<OnboardingInternet />} />
              <Route path='/faq' element={<FAQ />} />
            </Routes>
          </div>
        </div>
      </div>
    </BrowserRouter>
  );
}

export default App;

