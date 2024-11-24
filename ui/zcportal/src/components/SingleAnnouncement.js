import React, { Component } from 'react';
import { variables } from './Variables.js';
import { useParams } from 'react-router-dom'; // Import useParams for accessing URL parameters

export function SingleAnnouncement() {
    const { id } = useParams(); // Retrieve the ID from the URL
    const [announcement, setAnnouncement] = React.useState(null);

    React.useEffect(() => {
        fetch(`${variables.API_URL}Announcement/${id}`)
            .then(response => response.json())
            .then(data => setAnnouncement(data.Table[0]));
    }, [id]);

    if (!announcement) {
        return <div>Loading...</div>;
    }

    return (
        <div className="container">
            <h1>{announcement.Title}</h1>
            <h5>{new Date(announcement.PostingDate).toLocaleDateString()}</h5>
            {announcement.PhotoFileName && (
                <img src={variables.PHOTO_URL + announcement.PhotoFileName} alt={announcement.Title} width="300" />
            )}
            <p>{announcement.Content}</p>
        </div>
    );
}
