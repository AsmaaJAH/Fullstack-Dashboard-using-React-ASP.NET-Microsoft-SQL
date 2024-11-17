import React, { Component } from 'react';
import { variables } from './Variables.js';

export class FAQ extends Component {
    constructor(props) {
        super(props);
        this.state = {
            InternetQuestions: [],
            FAQs: [],
            modalTitle: "",
            QuestionTitle: "",
            Id: 0,
            Answer: "",
            PostingDate: "",
            PhotoFileName: "anonymous.png",
            PhotoPath: variables.PHOTO_URL,
        }

    }

    refreshList() {
        fetch(variables.API_URL + 'FAQ')
            .then(response => response.json())
            .then(data => {
                this.setState(
                    {
                        FAQs: data
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
    changeQuestionTitle = (event) => {
        this.setState({
            QuestionTitle: event.target.value
        });
    }
    changeAnswer = (event) => {
        this.setState({
            Answer: event.target.value
        });
    }
    changePostingDate = (event) => {
        this.setState({
            PostingDate: event.target.value
        });
    }

    addClick() {
        this.setState({
            modalTitle: "Add FAQ",
            Id: 0,
            QuestionTitle: "",
            Answer: "",
            PostingDate: "",
            PhotoFileName: "anonymous.png",
        });
    }
    editClick(question) {
        this.setState({
            modalTitle: "Edit FAQ",
            Id: question.Id,
            QuestionTitle: question.QuestionTitle,
            Answer: question.Answer,
            PostingDate: question.PostingDate,
            PhotoFileName: question.PhotoFileName,
        });
    }

    createClick() {
        fetch(variables.API_URL + 'FAQ', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                QuestionTitle: this.state.QuestionTitle,
                Answer: this.state.Answer,
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
        fetch(variables.API_URL + 'FAQ', {
            method: 'PUT',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                Id: this.state.Id,
                QuestionTitle: this.state.QuestionTitle,
                Answer: this.state.Answer,
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

    deleteClick(id) {
        if (window.confirm('Are you sure you wanna delete this FAQ ?')) {
            fetch(variables.API_URL + 'FAQ/' + id, {
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

            fetch(variables.API_URL + 'FAQ/SaveFile', {
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
            InternetQuestions: InternetQuestions,
            FAQs: FAQs,
            modalTitle,
            Id: Id,
            QuestionTitle: QuestionTitle,
            Answer: Answer,
            PostingDate: PostingDate,
            PhotoPath,
            PhotoFileName: PhotoFileName,

        } = this.state;
        return (
            <div>

                <button type="button" className="btn  m-3 float-end"
                    style={{ backgroundColor: '#00b3d1', paddingRight: '15px', color: 'white', fontWeight: 'bold' }}
                    data-bs-toggle="modal" data-bs-target="#exampleModal"
                    onClick={() => this.addClick()}>
                    <svg xmlns="http://www.w3.org/2000/svg" width="30px" height="30px" fill="white" stroke="white"
                        strokeWidth="0.5" className="bi bi-plus" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
                    </svg>
                    add
                </button>



                <table className='table table-striped'>
                    <thead>
                        <tr>
                            <th>
                                No.
                            </th>
                            <th>
                                Question Title
                            </th>
                            <th>
                                Answer
                            </th>
                            <th>
                                FAQ Posting Date
                            </th>
                            <th>
                                Options
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {FAQs.map(question =>

                            <tr key={question.Id}>
                                <td>{question.Id}</td>
                                <td>{question.QuestionTitle}</td>
                                <td>{question.Answer}</td>
                                <td>{question.PostingDate}</td>
                                <td>
                                    <button type='button'
                                        className='btn btn-light mr-1'
                                        data-bs-toggle="modal" data-bs-target="#exampleModal"
                                        onClick={() => this.editClick(question)}>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                            <path fillRule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                        </svg>
                                    </button>
                                    {/*Spacer div*/}
                                    <div style={{ width: '10px', display: 'inline-block' }}></div>

                                    <button type='button'
                                        className='btn btn-light mr-1'
                                        onClick={() => this.deleteClick(question.Id)}
                                    >
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0" />
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                        )}
                    </tbody>
                </table>
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

                                        <div className="input-group mb-3">
                                            <span className="input-group-text">Question Title</span>
                                            <input type="text" className="form-control"
                                                value={QuestionTitle}
                                                onChange={this.changeQuestionTitle} />
                                        </div>

                                        <div className="input-group mb-3">
                                            <span className="input-group-text">Answer</span>
                                            <select className="form-select"
                                                onChange={this.changeAnswer}
                                                value={Answer}>
                                                {InternetQuestions.map(internetQuestion =>
                                                    <option key={internetQuestion.QuestionSerialNumber} value={internetQuestion.QuestionTitle}>
                                                        {internetQuestion.QuestionTitle}
                                                    </option>)}
                                            </select>
                                        </div>


                                        <div className="input-group mb-3">
                                            <span className="input-group-text">FAQ Posting Date </span>
                                            <input type="date" className="form-control"
                                                value={PostingDate}
                                                onChange={this.changePostingDate} />
                                        </div>


                                    </div>
                                    <div className="p-2 w-50 bd-highlight">
                                        <img width="250px" height="250px" src={PhotoPath + PhotoFileName} alt='personal pic' />
                                        <input className="m-2 ms-5" type="file" onChange={this.imageUpload} />
                                    </div>

                                </div>
                            </div>
                            {
                                Id === 0 ?
                                    <button type='button'
                                        className='btn btn-primary float-start w-50 mb-3 ms-3'
                                        onClick={() => this.createClick()}>
                                        Create
                                    </button>
                                    : null
                            }
                            {
                                Id !== 0 ?
                                    <button type='button'
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
   