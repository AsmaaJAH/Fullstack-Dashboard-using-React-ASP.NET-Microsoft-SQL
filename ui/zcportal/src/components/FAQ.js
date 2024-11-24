import React, { Component } from 'react';
import { variables } from './Variables.js';
import { AddButton } from './AddButton.js';
import { OptionsCell } from './OptionsCell.js';

export class FAQ extends Component {
    constructor(props) {
        super(props);
        this.state = {
            openIndex: null,
            FAQs: [],
            modalTitle: "",
            QuestionTitle: "",
            Id: 0,
            Answer: "",
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


    addClick() {
        this.setState({
            modalTitle: "Add FAQ",
            Id: 0,
            QuestionTitle: "",
            Answer: "",
        });
    }
    editClick = (question) => {
        this.setState({
            modalTitle: "Edit FAQ",
            Id: question.Id,
            QuestionTitle: question.QuestionTitle,
            Answer: question.Answer,
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

    render() {
        const {
            openIndex,
            FAQs,
            modalTitle,
            Id,
            QuestionTitle,
            Answer,

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
                                <button
                                    type="button"
                                    className="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                                ></button>
                            </div>
                            <div className="modal-body">
                                <div className="d-flex flex-column bd-highlight mb-3">
                                    {/* Content Section */}
                                    <div className="w-100">
                                        <div className="form-group mb-3">
                                            <span className="form-label fw-bold text-start d-block">Question Title</span>
                                            <input
                                                type="text"
                                                className="form-control"
                                                value={QuestionTitle}
                                                onChange={this.changeQuestionTitle}
                                            />
                                        </div>


                                        <div className="form-group mb-3">
                                            <span className="form-label fw-bold text-start d-block">Answer:</span>
                                            <textarea
                                                className="form-control"
                                                value={Answer}
                                                onChange={this.changeAnswer}
                                                rows="3" 
                                                placeholder="Enter your answer here..."
                                            ></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/* Button Section */}
                            {Id === 0 ? (
                                <div className="d-flex justify-content-center mb-3">
                                    <button
                                        type="button"
                                        style={{
                                            backgroundColor: variables.PRIMARY_COLOR,
                                            borderColor: variables.PRIMARY_COLOR,
                                            color: "white",
                                            fontWeight: "bold",
                                            width: "25%", 

                                        }}
                                        className="btn btn-primary"
                                        onClick={() => this.createClick()}
                                    >
                                        Create
                                    </button>
                                </div>
                            ) : null}
                            {Id !== 0 ? (
                                <div className="d-flex justify-content-center mb-3">
                                    <button
                                        type="button"
                                        style={{
                                            backgroundColor: variables.PRIMARY_COLOR,
                                            borderColor: variables.PRIMARY_COLOR,
                                            color: "white",
                                            fontWeight: "bold",
                                        }}
                                        className="btn btn-primary"
                                        onClick={() => this.updateClick()}
                                    >
                                        Update
                                    </button>
                                </div>
                            ) : null}
                        </div>
                    </div>
                </div>

            </div>
        );
    }
}
