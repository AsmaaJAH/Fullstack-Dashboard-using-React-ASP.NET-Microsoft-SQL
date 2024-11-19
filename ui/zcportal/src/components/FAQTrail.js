import React, { Component } from 'react';
import { variables } from './Variables.js';
import { AddButton } from './AddButton';
import { OptionsCell } from './OptionsCell';

export class FAQTrail extends Component {
    constructor(props) {
        super(props);
        this.state = {
            openIndex: null,
            InternetQuestions: [],
            FAQs: [],
            modalTitle: "",
            QuestionTitle: "",
            Id: 0,
            Answer: "",
            PostingDate: "",
            PhotoFileName: "anonymous.PNG",
            PhotoPath: variables.PHOTO_URL,
        };
    }

    toggleFAQ = (index) => {
        this.setState((prevState) => ({
            openIndex: prevState.openIndex === index ? null : index,
        }));
    };

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
            PhotoFileName: "anonymous.PNG",
        });
    }
    editClick = (question) => {
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

    deleteClick = (id) => {
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
            openIndex,
            InternetQuestions,
            FAQs,
            modalTitle,
            Id,
            QuestionTitle,
            Answer,
            PostingDate,
            PhotoPath,
            PhotoFileName,

        } = this.state;
        return (
            <div className="container my-5">
                <AddButton addClick={() => this.addClick()} />

                <h1 className="text-center mb-4">Frequently Asked Questions</h1>
                <div className="accordion" id="faqAccordion">
                    {FAQs.map((faq, index) => (
                        <div className="accordion-item mb-3" key={index}>
                            <h2 className="accordion-header">
                                <button
                                    className={`accordion-button ${openIndex === index ? "" : "collapsed"}`}
                                    type="button"
                                    onClick={() => this.toggleFAQ(index)}
                                    aria-expanded={openIndex === index}
                                >
                                    <OptionsCell
                                        question={faq}
                                        editClick={this.editClick}
                                        deleteClick={this.deleteClick}
                                    />
                                    <div style={{ width: '50px', display: 'inline-block' }}></div>

                                    <strong>{faq.QuestionTitle}</strong>
                                </button>
                            </h2>
                            <div
                                className={`accordion-collapse collapse ${openIndex === index ? "show" : ""}`}
                                aria-labelledby={`faq${index}`}
                            >
                                <div className="accordion-body">{faq.Answer}</div>
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
                                                    <option key={internetQuestion.QuestionSerialNumber} value={internetQuestion.Instructions}>
                                                        {internetQuestion.Instructions}
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
        );
    }
}
