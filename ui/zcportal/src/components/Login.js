import React, { Fragment, useState } from "react";
import axios from "axios";
import { variables } from "./Variables";

function Login() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const handleEmailChange = (value) => setEmail(value);
    const handlePasswordChange = (value) => setPassword(value);

    const handleSaveClick = () => {
        const data = {
            Email: email,
            Password: password,
        };

        axios.post(variables.API_URL + 'Authentication/login', data)
            .then((Result) => {
                alert(Result.data);
            }).catch((error) => {
                alert(error.response.data);
            });

        console.log("Submitted Data:", data);
    };

    return (
        <Fragment>
            <div className="container">
                <h1 className="header">Login</h1>
                
                <div className="formGroup">
                    <label htmlFor="loginEmail" className="label">
                        Email:
                    </label>
                    <input
                        type="email"
                        id="loginEmail"
                        placeholder="Enter your email"
                        onChange={(event) => handleEmailChange(event.target.value)}
                        className="input"
                    />
                </div>
                <div className="formGroup">
                    <label htmlFor="loginPassword" className="label">
                        Password:
                    </label>
                    <input
                        type="password"
                        id="loginPassword"
                        placeholder="Enter your password"
                        onChange={(event) => handlePasswordChange(event.target.value)}
                        className="input"
                    />
                </div>
                <button onClick={handleSaveClick} className="button">
                    Login
                </button>
            </div>
        </Fragment>
    );
}

export default Login;