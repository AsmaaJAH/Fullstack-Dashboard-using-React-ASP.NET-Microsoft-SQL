import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { variables } from '../components/Variables';
import '../Styles/SingleAnnouncement.css';
import {Announcement} from '../Models/Announcement';


const SingleAnnouncement: React.FC = () => {
    const { id } = useParams<{ id: string }>();
    const [announcement, setAnnouncement] = useState<Announcement | null>(null);

    useEffect(() => {
        const fetchAnnouncement = async () => {
            try {
                const response = await fetch(`${variables.API_URL}Announcement/${id}`);
                const data = await response.json();
                if (data.Table && data.Table.length > 0) {
                    setAnnouncement(data.Table[0]);
                } else {
                    setAnnouncement(null);
                }
            } catch (error) {
                console.error('Error fetching announcement:', error);
                setAnnouncement(null);
            }
        };

        fetchAnnouncement();
    }, [id]);

    if (!announcement) {
        return (
            <div className="d-flex justify-content-center align-items-center vh-100">
                <div className="spinner-border" role="status">
                    <span className="visually-hidden">Loading...</span>
                </div>
            </div>
        );
    }

    return (
        <div className="container py-5">
            <div className="row">
                <div className="col-lg-8 col-md-10 mx-auto">
                    {announcement.PhotoFileName && (
                        <div className="mb-4 text-center">
                            <img
                                src={`${variables.PHOTO_URL}${announcement.PhotoFileName}`}
                                alt={announcement.Title}
                                className="announcement-image"
                            />
                        </div>
                    )}
                    <div className="card shadow-lg">
                        <div className="card-body">
                            <h1 className="card-title text-center">{announcement.Title}</h1>
                            <h5 className="card-subtitle text-muted text-center mb-4">
                                {new Date(announcement.PostingDate).toLocaleDateString()}
                            </h5>
                            <p className="card-text text-left">{announcement.Content}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default SingleAnnouncement;
