import React, { Fragment, useState } from "react";
import "./Signup.css"; 
//import axios from "axios";

function Signup() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  const handleNameChange = (value) => setName(value);
  const handleEmailChange = (value) => setEmail(value);
  const handlePasswordChange = (value) => setPassword(value);
  const handleConfirmPassChange = (value) => setConfirmPassword(value);

  const handleSaveClick = () => {
    const data = {
      Name: name,
      Email: email,
      Password: password,
      isAdmin: 0,
    };

    // Add Axios or API logic here
    console.log("Form submitted:", data);
  };

  return (
    <Fragment>
      <div className="container">
        <h1 className="header">Registration</h1>
        <div className="formGroup">
          <label htmlFor="txtName" className="label">
            Name:
          </label>
          <input
            type="text"
            id="txtName"
            placeholder="Enter your name"
            onChange={(event) => handleNameChange(event.target.value)}
            className="input"
          />
        </div>
        <div className="formGroup">
          <label htmlFor="txtEmail" className="label">
            Email:
          </label>
          <input
            type="email"
            id="txtEmail"
            placeholder="Enter your email"
            onChange={(event) => handleEmailChange(event.target.value)}
            className="input"
          />
        </div>
        <div className="formGroup">
          <label htmlFor="txtPassword" className="label">
            Password:
          </label>
          <input
            type="password"
            id="txtPassword"
            placeholder="Enter your password"
            onChange={(event) => handlePasswordChange(event.target.value)}
            className="input"
          />
        </div>
        <div className="formGroup">
          <label htmlFor="txtConfirmPassword" className="label">
            Confirm Password:
          </label>
          <input
            type="password"
            id="txtConfirmPassword"
            placeholder="Re-enter your password"
            onChange={(event) => handleConfirmPassChange(event.target.value)}
            className="input"
          />
        </div>
        <button onClick={handleSaveClick} className="button">
          Save & Register
        </button>
      </div>
    </Fragment>
  );
}

export default Signup;
