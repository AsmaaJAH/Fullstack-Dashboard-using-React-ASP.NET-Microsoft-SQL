import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { fetchAnnouncementById } from '../API/SingleAnnouncementAPI';
import '../Styles/SingleAnnouncement.css';
import { Announcement } from '../Models/Announcement';
import { variables } from '../components/Variables';


const SingleAnnouncement: React.FC = () => {
    const { id } = useParams<{ id: string }>();
    const [announcement, setAnnouncement] = useState<Announcement | null>(null);

    useEffect(() => {
        const fetchAnnouncement = async () => {
            if (id) {
                const fetchedAnnouncement = await fetchAnnouncementById(id);
                setAnnouncement(fetchedAnnouncement);
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
                            {/* <p className="card-text text-left">{announcement.Content}</p> */}
                            <div
                                className="card-text text-left"
                                dangerouslySetInnerHTML={{ __html: announcement.Content }}
                            />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default SingleAnnouncement;
