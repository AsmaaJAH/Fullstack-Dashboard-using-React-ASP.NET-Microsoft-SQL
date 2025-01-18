import React from 'react';
import { useNavigate } from 'react-router-dom';
import "../Styles/ITServices.css";

const ITServicesPage: React.FC = () => {
    const navigate = useNavigate();

    const handleCardClick = (service: string) => {
        navigate(`/services/${service}`);
    };
    
    const handleSupportCardClick = (service: string) => {
        navigate(`/services/${service}/OnboardingInternet/`);
    };

    return (
        <div>
            <div className="services">
                <h2 className="text-center mb-4 fw-bold">IT Services</h2>
                <div className="row text-center">
                    <div className="col-md-4">
                        <div
                            className="service-card p-4 border shadow-sm"
                            onClick={() => handleSupportCardClick("support-services")}
                        >
                            <h4>Support Services</h4>
                            <p>Get IT support for any technical issue.</p>
                        </div>
                    </div>
                    <div className="col-md-4">
                        <div
                            className="service-card p-4 border shadow-sm"
                            onClick={() => handleCardClick("network-services")}
                        >
                            <h4>Network Services</h4>
                            <p>Manage and monitor your IT network.</p>
                        </div>
                    </div>
                    <div className="col-md-4">
                        <div
                            className="service-card p-4 border shadow-sm"
                            onClick={() => handleCardClick("self-service")}
                        >
                            <h4>Self-Service</h4>
                            <p>Academic support & Google classroom services.</p>
                        </div>
                    </div>

                    {/* Add vertical spacing between the sections */}
                    <div className="w-100 my-2"></div>

                    <div className="col-md-4">
                        <div
                            className="service-card p-4 border shadow-sm"
                            onClick={() => handleCardClick("light-current-services")}
                        >
                            <h4>Light-Current Services</h4>
                            <p>Install and manage hardware solutions.</p>
                        </div>
                    </div>
                    <div className="col-md-4">
                        <div
                            className="service-card p-4 border shadow-sm"
                            onClick={() => handleCardClick("system-administration-services")}
                        >
                            <h4>System Administration Services</h4>
                            <p>Reach the admin to monitor and manage systems.</p>
                        </div>
                    </div>
                    <div className="col-md-4">
                        <div
                            className="service-card p-4 border shadow-sm"
                            onClick={() => handleCardClick("administration-office-services")}
                        >
                            <h4>Administration Office Services</h4>
                            <p>Get in touch with your IT coordinators.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ITServicesPage;

