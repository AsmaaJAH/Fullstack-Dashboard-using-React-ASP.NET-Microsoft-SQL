import React from 'react';
import { useParams } from 'react-router-dom';

const ServiceDetailPage: React.FC = () => {
    const { service } = useParams();

    return (
        <div className="service-detail">
            <h2 className="text-center mb-4 fw-bold">{service?.replace(/-/g, ' ')} Details</h2>
            <p>This page will provide detailed information about {service?.replace(/-/g, ' ')}.</p>
        </div>
    );
};

export default ServiceDetailPage;
