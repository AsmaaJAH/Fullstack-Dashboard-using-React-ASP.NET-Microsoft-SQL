import React, { useState, Fragment } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { variables } from "./Variables";
import "./Login.css";

function Login({ onLoginSuccess }) {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errorMessage, setErrorMessage] = useState('');
    const navigate = useNavigate();

    const handleEmailChange = (event) => setEmail(event.target.value);
    const handlePasswordChange = (event) => setPassword(event.target.value);

    const handleSaveClick = () => {
        const data = {
            Email: email,
            Password: password,
        };

        axios.post(`${variables.API_URL}Authentication/login`, data)
            .then((response) => {
                if (response.data === "Email and password are correct!") {
                    localStorage.setItem("authToken", "fakeToken"); // Save a fake token for demonstration
                    onLoginSuccess(); // Notify the parent that login succeeded
                    navigate("/"); // Redirect to the homepage
                } else {
                    setErrorMessage(response.data); // Show error message returned from API
                }
            })
            .catch((error) => {
                setErrorMessage(error.response?.data || "An error occurred during login.");
            });
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
                <h1 className="login-header">Sign In</h1>

                {/* Error Message */}
                {errorMessage && <p className="login-error">{errorMessage}</p>}

                <div className="login-formGroup">
                    <label htmlFor="loginEmail" className="login-label">
                        Email:
                    </label>
                    <input
                        type="email"
                        id="loginEmail"
                        placeholder="Enter your email"
                        value={email}
                        onChange={handleEmailChange}
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
                        value={password}
                        onChange={handlePasswordChange}
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
