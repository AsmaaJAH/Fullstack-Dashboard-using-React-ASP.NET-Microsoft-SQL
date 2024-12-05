import React from "react";
import { NavLink } from "react-router-dom";
import "./Sidebar.css";

const Sidebar = () => {
  return (
    <div className="col-md-3 col-lg-2 sidebar">
      <div className="text-center mt-3">
        <img src="/logo.jpg" alt="Zewail City Logo" className="sidebar-logo" />
      </div>
      <h1 className="text-center">ZC Portal</h1>
      <nav className="nav flex-column">
        <NavLink
          className={({ isActive }) =>
            isActive ? "nav-link active" : "nav-link main-title"
          }
          to="/home"
        >
          Home
        </NavLink>

        <div className="section">
          <p className="title">Info:</p>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/announcements"
          >
            1. Announcements
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/OnboardingInternet"
          >
            2. Onboarding Internet
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/documentation"
          >
            3. Documentations
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/faq"
          >
            4. FAQ
          </NavLink>
        </div>

        <div className="section">
          <p className="title">Services:</p>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/attendance"
          >
            1. Attendance Tracking
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/hiring"
          >
            2. Hiring requests
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/it-tickets"
          >
            3. iTop IT Tickets
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/clearance"
          >
            4. Clearance
          </NavLink>
        </div>

        <div className="section">
          <p className="title">HR requests:</p>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/vacations"
          >
            1. Vacations & leave requests
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive ? "nav-link active" : "nav-link subtitle"
            }
            to="/resignation"
          >
            2. Resignation
          </NavLink>
        </div>
      </nav>
    </div>
  );
};

export default Sidebar;


