import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { variables } from './Variables.js';
import { AddButton } from './AddButton.js';
import { OptionsCell } from './OptionsCell.js';
import './Announcements.css';




export class Announcements extends Component {
    constructor(props) {
        super(props);
        
        this.state = {
            InternetQuestions: [],
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
                this.setState(
                    {
                        Announcements: data
                    }
                );
            });

        fetch(variables.API_URL + 'OnBoardingInternet')
            .then(response => response.json())
            .then(data => {
                this.setState(
                    {
                        InternetQuestions: data
                    }
                );
            });

    }
    componentDidMount() {
        this.refreshList();

    }
    changeTitle = (event) => {
        this.setState({
            Title: event.target.value
        });
    }
    changeContent = (event) => {
        this.setState({
            Content: event.target.value
        });
    }
    changePostingDate = (event) => {
        this.setState({
            PostingDate: event.target.value
        });
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
    editClick = (question) => {
        this.setState({
            modalTitle: "Edit Announcement",
            Id: question.Id,
            Title: question.Title,
            Content: question.Content,
            PostingDate: question.PostingDate,
            PhotoFileName: question.PhotoFileName,
        });
    }

    createClick() {
        fetch(variables.API_URL + 'Announcement', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                Title: this.state.Title,
                Content: this.state.Content,
                PostingDate: this.state.PostingDate,
                PhotoFileName: this.state.PhotoFileName,
            })
        })
            .then(res => res.json())
            .then((result) => {
                alert(result);
                this.refreshList();
            }, (error) => {
                alert('Failed');
            })

    }
    updateClick() {
        fetch(variables.API_URL + 'Announcement', {
            method: 'PUT',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                Id: this.state.Id,
                Title: this.state.Title,
                Content: this.state.Content,
                PostingDate: this.state.PostingDate,
                PhotoFileName: this.state.PhotoFileName,
            })
        })
            .then(res => res.json())
            .then((result) => {
                alert(result);
                this.refreshList();
            }, (error) => {
                alert('Failed');
            })
    }

    deleteClick = (id) => {
        if (window.confirm('Are you sure you wanna delete this announcement?')) {
            fetch(variables.API_URL + 'Announcement/' + id, {
                method: 'DELETE',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
            })
                .then(res => res.json())
                .then((result) => {
                    alert(result);
                    this.refreshList();
                }, (error) => {
                    alert('Failed');
                })
        }
    }
    imageUpload = (event) => {
        event.preventDefault();

        if (event.target.files && event.target.files[0]) {
            const formData = new FormData();
            formData.append("file", event.target.files[0], event.target.files[0].name);

            fetch(variables.API_URL + 'Announcement/SaveFile', {
                method: 'POST',
                body: formData
            })
                .then(res => res.json())
                .then(data => {
                    this.setState({ PhotoFileName: data });
                })
                .catch(error => {
                    alert("Sorry, something went Wrong while uploading the file: " + error.message);
                });

        } else {
            alert("No file selected. Please select a file and try again.");
        }
    }
    render() {

        const {
            InternetQuestions,
            Announcements: Announcements,
            modalTitle,
            Id,
            Title: Title,
            Content: Content,
            PostingDate,
            PhotoPath,
            PhotoFileName,

        } = this.state;
        return (
            <div>
                <AddButton addClick={() => this.addClick()} />
                <h1 className="text-center mb-4">Announcements</h1>

                <div className="row">
                    {Announcements.map((post) => (
                        <div className="col-md-4 mb-4" key={post.Id}>
                            <div className="card h-100 shadow-sm">
                                <Link to={`/announcement/${post.Id}`} style={{ textDecoration: "none", color: "inherit", cursor: "pointer" }}>
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
                                        <h5 className="card-title" style={{ color: variables.PRIMARY_COLOR }}>{post.Title}</h5>
                                        <h6 className="card-subtitle mb-2 text-muted">
                                            {new Date(post.PostingDate).toLocaleDateString()}
                                        </h6>
                                        <p className="card-text">
                                            {post.Content.length > 33
                                                ? `${post.Content.slice(0, 30)}...`
                                                : post.Content}
                                        </p>
                                    </div>
                                </Link>
                                {/* Card Footer */}
                                <div className="d-flex justify-content-between align-items-center p-2">
                                    <OptionsCell
                                        className="options-cell-padding"
                                        editClick={this.editClick}
                                        deleteClick={this.deleteClick}
                                        question={post}
                                    />


                                </div>

                            </div>
                        </div>
                    ))}
                </div>

                <div className="modal fade" id="exampleModal" tabIndex="-1" aria-hidden="true">
                    <div className="modal-dialog modal-lg modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title">{modalTitle}</h5>
                                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                ></button>
                            </div>
                            <div className="modal-body">
                                <div className="d-flex flex-row bd-highlight mb-3" >
                                    <div className="p-2 w-50 bd-highlight">

                                        <div className="form-group mb-3">
                                            <span className="form-label fw-bold text-start d-block">Title:</span>
                                            <input type="text" className="form-control"
                                                value={Title}
                                                onChange={this.changeTitle} />
                                        </div>


                                        <div className="form-group mb-3">
                                            <span className="form-label fw-bold text-start d-block">Content:</span>
                                            <textarea
                                                className="form-control"
                                                value={Content}
                                                onChange={this.changeContent}
                                                rows="3" 
                                                placeholder="Enter your content here..."
                                            ></textarea>
                                        </div>


                                        <div className="form-group mb-3">
                                            <span className="form-label fw-bold text-start d-block">Posting Date: </span>
                                            <input type="date" className="form-control"
                                                value={PostingDate}
                                                onChange={this.changePostingDate} />
                                        </div>


                                    </div>
                                    <div className="p-2 w-50 bd-highlight">
                                        <img width="250px" height="250px" src={PhotoPath + PhotoFileName} alt='your pic' />
                                        <input className="m-2 ms-5" type="file" onChange={this.imageUpload} />
                                    </div>

                                </div>
                            </div>
                            {
                                Id === 0 ?
                                    <button type='button'
                                        style={{
                                            backgroundColor: variables.PRIMARY_COLOR,
                                            borderColor: variables.PRIMARY_COLOR,
                                            color: 'white',
                                            fontWeight: 'bold',
                                        }}
                                        className='btn btn-primary float-start w-50 mb-3 ms-3'
                                        onClick={() => this.createClick()}>
                                        Create
                                    </button>
                                    : null
                            }
                            {
                                Id !== 0 ?
                                    <button type='button'
                                        style={{
                                            backgroundColor: variables.PRIMARY_COLOR,
                                            borderColor: variables.PRIMARY_COLOR,
                                            color: 'white',
                                            fontWeight: 'bold',
                                        }}
                                        className='btn btn-primary float-start w-50 mb-3 ms-3'
                                        onClick={() => this.updateClick()}>
                                        Update
                                    </button>
                                    : null
                            }
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}