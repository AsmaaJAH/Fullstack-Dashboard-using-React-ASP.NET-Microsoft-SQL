
import React, { Component } from 'react';
import './Home.css';

export class Home extends Component {
    render() {
        return (
            <div className="container">
                {/* Banner Section */}
                <div className="banner text-center py-4 mb-5" style={{ backgroundColor: '#009ab5', color: 'white' }}>
                    <h1>Welcome to the IT Portal</h1>
                </div>

                {/* Slider Section */}
                <div id="carouselExampleIndicators" className="carousel slide mb-5" data-bs-ride="carousel">
                    <div className="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" className="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div className="carousel-inner">
                        <div className="carousel-item active">
                            <img src="/images/zewail.PNG" className="d-block w-100" alt="Slide 1" />
                        </div>
                        
                        <div className="carousel-item">
                            <img src="/images/IT.PNG" className="d-block w-100" alt="Slide 2" />
                        </div>
                        <div className="carousel-item">
                            <img src="/images/zewail_logo.PNG" className="d-block w-100" alt="Slide 3" />
                        </div>
                        
                    </div>
                    <button className="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span className="visually-hidden">Previous</span>
                    </button>
                    <button className="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span className="carousel-control-next-icon" aria-hidden="true"></span>
                        <span className="visually-hidden">Next</span>
                    </button>
                </div>

                {/* Services Section */}
                <div className="services">
                    <h2 className="text-center mb-4 fw-bold">IT Services</h2>
                    <div className="row text-center">
                        <div className="col-md-4">
                            <div className="service-card p-4 border shadow-sm">
                                <h4>Support Services</h4>
                                <p>Get IT support for any technical issue.</p>
                            </div>
                        </div>
                        <div className="col-md-4">
                            <div className="service-card p-4 border shadow-sm">
                                <h4>Network Services</h4>
                                <p>Manage and monitor your IT network.</p>
                            </div>
                        </div>
                        <div className="col-md-4">
                            <div className="service-card p-4 border shadow-sm">
                                <h4>Self-Service  </h4>
                                <p>Academic support & Google classroom services.</p>
                            </div>
                        </div>

                        {/* Add vertical spacing between the sections */}
                        <div className="w-100 my-2"></div>

                        <div className="col-md-4">
                            <div className="service-card p-4 border shadow-sm">
                                <h4>Light-Current Services</h4>
                                <p>Install and manage hardware solutions.</p>
                            </div>
                        </div>
                        <div className="col-md-4">
                            <div className="service-card p-4 border shadow-sm">
                                <h4>System Administration Services</h4>
                                <p>Reach the admin to monitor and manage system.</p>
                            </div>
                        </div>
                        <div className="col-md-4">
                            <div className="service-card p-4 border shadow-sm">
                                <h4>Administration Office Services</h4>
                                <p>Get in tough with your IT coordinaters.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}
