import './App.css';
import { Home } from './components/Home';
import { Employee } from './components/Employee';
import { Department } from './components/Department';
import { BrowserRouter, Route, Routes, NavLink } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <div className="App container-fluid">
        <div className="row">
          {/* Left Column Menu */}
          <div className="col-md-3 col-lg-2 sidebar">
            <h3 className="text-center mt-3">Zewail City Portal</h3>
            <nav className="nav flex-column">
              <NavLink className="nav-link" to="/home">Home</NavLink>
              <NavLink className="nav-link" to="/department">Department</NavLink>
              <NavLink className="nav-link" to="/employee">Employee</NavLink>
            </nav>
          </div>
          {/* Main Content Area */}
          <div className="col-md-9 col-lg-10 content">
            <Routes>
              <Route path='/home' element={<Home />} />
              <Route path='/department' element={<Department />} />
              <Route path='/employee' element={<Employee />} />
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
