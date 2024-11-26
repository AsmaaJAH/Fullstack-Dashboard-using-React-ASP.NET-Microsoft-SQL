import React, { Fragment, useState } from "react";
import axios from "axios";

function Signup() {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');

    const handleNameChange = (value) => {
        setName(value);
    };

    const handleEmailChange = (value) => {
        setEmail(value);
    };

    const handlePasswordChange = (value) => {
        setPassword(value);
    };

    const handleConfirmPassChange = (value) => {
        setConfirmPassword(value);
    };
    const handleSaveClick = () => {
        const data = {
            Name: name,
            Email: email,
            Password: password,
            isAdmin: 0,
        };
    }


    return (
        <Fragment>
            <div> Registration </div>
            <label> Name:</label>
            <input type="text" id="txtName" placeholder="Enter your name" onChange={(event) => handleNameChange(event.target.value)} /> <br />
            <label> Email:</label>
            <input type="text" id="txtEmail" placeholder="Enter your email" onChange={(event) => handleEmailChange(event.target.value)} /> <br />
            <label> Password:</label>
            <input type="text" id="txtPassword" placeholder="Enter your Password" onChange={(event) => handlePasswordChange(event.target.value)} /> <br />
            <label> Confirm Password:</label>
            <input type="text" id="txtConfirmPassword" placeholder="Re-enter your password here." onChange={(event) => handleConfirmPassChange(event.target.value)} /> <br />
            <button onClick={()=>handleSaveClick()}>Save & Register</button>

        </Fragment>
    );
}

export default Signup;