import React, { Component } from 'react';
import { Link } from 'react-router-dom'; // Import Link from react-router-dom
import { variables } from './Variables.js';
import { AddButton } from './AddButton.js';
import { OptionsCell } from './OptionsCell.js';
import './Announcements.css';

export class Announcements extends Component {
    constructor(props) {
        super(props);
        this.state = {
            Announcements: [],
            modalTitle: "",
            Title: "",
            Id: 0,
            Content: "",
            PostingDate: "",
            PhotoFileName: "anonymous.PNG",
            PhotoPath: variables.PHOTO_URL,
        }
    }

    refreshList() {
        fetch(variables.API_URL + 'Announcement')
            .then(response => response.json())
            .then(data => {
                this.setState({ Announcements: data });
            });
    }

    componentDidMount() {
        this.refreshList();
    }

    addClick() {
        this.setState({
            modalTitle: "Add Announcement",
            Id: 0,
            Title: "",
            Content: "",
            PostingDate: "",
            PhotoFileName: "anonymous.PNG",
        });
    }

    render() {
        const {
            Announcements,
            PhotoPath,
        } = this.state;

        return (
            <div>
                <AddButton addClick={() => this.addClick()} />
                <h1 className="text-center mb-4">Announcements</h1>

                <div className="row">
                    {Announcements.map((post) => (
                        <div className="col-md-4 mb-4" key={post.Id}>
                            <div className="card h-100 shadow-sm">
                                {/* Image */}
                                {post.PhotoFileName === null || post.PhotoFileName === 'anonymous.PNG' ? (
                                    <img
                                        src={`https://via.placeholder.com/300x200?text=${post.Title}`}
                                        className="card-img-top"
                                        alt="Announcement"
                                    />)
                                    : (
                                        <img
                                            src={PhotoPath + post.PhotoFileName}
                                            className="card-img-top"
                                            alt="Announcement"
                                        />)}

                                {/* Card Body */}
                                <div className="card-body">
                                    <h5 className="card-title">{post.Title}</h5>
                                    <h6 className="card-subtitle mb-2 text-muted">
                                        {new Date(post.PostingDate).toLocaleDateString()}
                                    </h6>
                                    <p className="card-text">{post.Content}</p>
                                </div>
                                {/* Card Footer */}
                                <div className="d-flex justify-content-between align-items-center p-2">
                                    <OptionsCell
                                        className="options-cell-padding"
                                        question={post}
                                    />

                                    {/* Link to Single Announcement page */}
                                    <Link to={`/announcement/${post.Id}`} className="btn btn-primary">
                                        View Details
                                    </Link>
                                </div>

                            </div>
                        </div>
                    ))}
                </div>
            </div>
        );
    }
}
