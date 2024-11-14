import './App.css';
import { Home } from './components/Home';
import { OnboardingInternet } from './components/OnboardingInternet';
import { FAQ } from './components/FAQ';
import { BrowserRouter, Route, Routes, NavLink } from 'react-router-dom';

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
            <h3 className="text-center ">ZC Portal</h3>
            <nav className="nav flex-column">
              <NavLink className="nav-link" to="/home">Home</NavLink>
              <NavLink className="nav-link" to="/OnboardingInternet">Onboarding internet</NavLink>
              <NavLink className="nav-link" to="/faq">FAQ</NavLink>
            </nav>
          </div>
          {/* Main Content Area */}
          <div className="col-md-9 col-lg-10 content">
            <Routes>
              <Route path='/home' element={<Home />} />
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


// import './App.css';
// import { Home } from './components/Home';
// import { Employee } from './components/Employee';
// import { Department } from './components/Department';
// import { BrowserRouter, Route, Routes, NavLink } from 'react-router-dom';

// function App() {
//   return (
//     <BrowserRouter>
//       <div className="App Container">
//         <h3 className="d-flex justify-content-center m-3">
//           React Js ZC portal Frontend Application
//         </h3>
//         <nav className="navbar navbar-expand-sm bg-light navbar-dark">
//           <ul className="navbar-nav">
//             <li className="nav-item- m-1">
//               <NavLink className="btn btn-light btn-outline-primary" to="/home">
//                 Home
//               </NavLink>
//             </li>
//             <li className="nav-item- m-1">
//               <NavLink className="btn btn-light btn-outline-primary" to="/department">
//                 Department
//               </NavLink>
//             </li>
//             <li className="nav-item- m-1">
//               <NavLink className="btn btn-light btn-outline-primary" to="/employee">
//                 Employee
//               </NavLink>
//             </li>
//           </ul>
//         </nav>
//         <Routes>
//           <Route path='/home' element={<Home />} />
//           <Route path='/department' element={<Department />} />
//           <Route path='/employee' element={<Employee />} />
//         </Routes>
//       </div>
//     </BrowserRouter>
//   );
// }

// export default App;
