import React, { Component } from 'react';
import { variables } from './Variables.js';

export class OnboardingInternet extends Component {
    constructor(props) {
        super(props);
        this.state = {
            InternetQuestions: [],
            modalTitle: "",
            QuestionTitle: "",
            QuestionSerialNumber: 0,

            QuestionSerialNumberFilter: "",
            QuestionTitleFilter: "",
            departmentsWithoutFilter: []
        }

    }
    FilterFn() {
        var QuestionSerialNumberFilter = this.state.QuestionSerialNumberFilter;
        var QuestionTitleFilter = this.state.QuestionTitleFilter;
        var filteredData = this.state.departmentsWithoutFilter.filter(
            function (element) {
                return element.QuestionSerialNumber.toString().toLowerCase().includes(
                    QuestionSerialNumberFilter.toString().trim().toLowerCase()
                ) && element.QuestionTitle.toString().toLowerCase().includes(
                    QuestionTitleFilter.toString().trim().toLowerCase()
                )
            }
        );
        this.setState({
            InternetQuestions: filteredData
        }
        );
    }
    sortResults(property, ascending) {
        var sortedData = this.state.departmentsWithoutFilter.sort(
            function (a, b) {
                if (ascending) {
                    return (a[property] > b[property]) ? 1 : (a[property] < b[property]) ? -1 : 0;
                } else {
                    return (b[property] > a[property]) ? 1 : (b[property] < a[property]) ? -1 : 0;
                }
            });
        this.setState({ InternetQuestions: sortedData });

    }

    changeQuestionIdFilter = (event) => {
        // eslint-disable-next-line 
        this.state.QuestionSerialNumberFilter = event.target.value;
        this.FilterFn();
    }
    changeQuestionTitleFilter = (event) => {
        // eslint-disable-next-line 
        this.state.QuestionTitleFilter = event.target.value;
        this.FilterFn();
    }

    refreshList() {
        fetch(variables.API_URL + 'OnBoardingInternet')
            .then(response => response.json())
            .then(data => {
                this.setState(
                    {
                        InternetQuestions: data,
                        departmentsWithoutFilter: data
                    }
                );
            });

    }
    componentDidMount() {
        this.refreshList();

    }
    changeQuestionTitle = (e) => {
        this.setState({
            QuestionTitle: e.target.value
        });
    }
    addClick() {
        this.setState({
            modalTitle: "Add Question",
            QuestionSerialNumber: 0,
            QuestionTitle: ""
        });
    }
    editClick(question) {
        this.setState({
            modalTitle: "Edit Question",
            QuestionSerialNumber: question.QuestionSerialNumber,
            QuestionTitle: question.QuestionTitle
        });
    }

    createClick() {
        fetch(variables.API_URL + 'OnBoardingInternet', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                QuestionTitle: this.state.QuestionTitle
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
        fetch(variables.API_URL + 'OnBoardingInternet', {
            method: 'PUT',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                QuestionSerialNumber: this.state.QuestionSerialNumber,
                QuestionTitle: this.state.QuestionTitle
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
        if (window.confirm('Are you sure you wanna delete this Department?')) {
            fetch(variables.API_URL + 'OnBoardingInternet/' + id, {
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
            InternetQuestions: InternetQuestions,
            modalTitle,
            QuestionSerialNumber: QuestionSerialNumber,
            QuestionTitle: QuestionTitle,

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
                                <div className="d-flex flex-row">
                                    <input className="form-control m-2"
                                        onChange={this.changeQuestionIdFilter}
                                        placeholder="Search by the question number" />
                                    <button type="button" className="btn btn-light"
                                        onClick={() => this.sortResults('QuestionSerialNumber', true)}>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-down-square-fill" viewBox="0 0 16 16">
                                            <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                        </svg>
                                    </button>

                                    {/*Spacer div*/}
                                    <div style={{ width: '10px', display: 'inline-block' }}></div>
                                    {/*Spacer div*/}


                                    <button type="button" className="btn btn-light"
                                        onClick={() => this.sortResults('QuestionSerialNumber', false)}>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
                                            <path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0" />
                                        </svg>
                                    </button>

                                </div>
                                Question Serial Number
                            </th>
                            <th>
                                <div className="d-flex flex-row">

                                    <input className="form-control m-2"
                                        style={{ marginLeft: '100px' }}
                                        onChange={this.changeQuestionTitleFilter}
                                        placeholder="Search by the question title" />
                                    <button type="button" className="btn btn-light"
                                        onClick={() => this.sortResults('QuestionTitle', true)}>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-down-square-fill" viewBox="0 0 16 16">
                                            <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                        </svg>
                                    </button>


                                    {/*Spacer div*/}
                                    <div style={{ width: '10px', display: 'inline-block' }}></div>
                                    {/*Spacer div*/}


                                    <button type="button" className="btn btn-light"
                                        onClick={() => this.sortResults('QuestionTitle', false)}>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
                                            <path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0" />
                                        </svg>
                                    </button>
                                </div>
                                Question Title

                            </th>
                            <th>
                                Options
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {InternetQuestions.map(question =>

                            <tr key={question.QuestionSerialNumber}>
                                <td>
                                    {question.QuestionSerialNumber}
                                </td>
                                <td>
                                    {question.QuestionTitle}
                                </td>
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
                                        onClick={() => this.deleteClick(question.QuestionSerialNumber)}
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
                                <div className="input-group mb-3">
                                    <span className="input-group-text">Question Title</span>
                                    <input type="text" className="form-control"
                                        value={QuestionTitle}
                                        onChange={this.changeQuestionTitle}
                                    />
                                </div>
                                {
                                    QuestionSerialNumber === 0 ?
                                        <button type='button'
                                            className='btn btn-primary float-start'
                                            onClick={() => this.createClick()}>
                                            Create
                                        </button>
                                        : null
                                }
                                {
                                    QuestionSerialNumber !== 0 ?
                                        <button type='button'
                                            className='btn btn-primary float-start'
                                            onClick={() => this.updateClick()}>
                                            Update
                                        </button>
                                        : null
                                }
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}   