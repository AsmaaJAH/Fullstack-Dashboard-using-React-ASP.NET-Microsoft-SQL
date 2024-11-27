import React, { Fragment, useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { variables } from "./Variables";
import "./Login.css";

function Login() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate(); // Initialize navigate

    const handleEmailChange = (value) => setEmail(value);
    const handlePasswordChange = (value) => setPassword(value);

    const handleSaveClick = () => {
        const data = {
            Email: email,
            Password: password,
        };

        axios.post(variables.API_URL + 'Authentication/login', data)
            .then((Result) => {
                if (Result.data === "Email and password are correct!") {
                    navigate("/"); // Navigate to the root route
                } else {
                    alert(Result.data);
                }
            })
            .catch((error) => {
                alert(error.response?.data || "An error occurred");
            });

        console.log("Submitted Data:", data);
    };

    return (
        <Fragment>
            {/* Logo Section */}
            <div className="login-logo-container">
                <img 
                    src="logo.jpg" 
                    alt="Zewail Logo" 
                    className="login-logo" 
                />
            </div>
            
            {/* Login Form Section */}
            <div className="login-container">
                <h1 className="login-header">Sign in</h1>
                
                <div className="login-formGroup">
                    <label htmlFor="loginEmail" className="login-label">
                        Email:
                    </label>
                    <input
                        type="email"
                        id="loginEmail"
                        placeholder="Enter your email"
                        onChange={(event) => handleEmailChange(event.target.value)}
                        className="login-input"
                    />
                </div>
                <div className="login-formGroup">
                    <label htmlFor="loginPassword" className="login-label">
                        Password:
                    </label>
                    <input
                        type="password"
                        id="loginPassword"
                        placeholder="Enter your password"
                        onChange={(event) => handlePasswordChange(event.target.value)}
                        className="login-input"
                    />
                </div>
                <button onClick={handleSaveClick} className="login-button">
                    Login
                </button>
            </div>
        </Fragment>
    );
}

export default Login;
