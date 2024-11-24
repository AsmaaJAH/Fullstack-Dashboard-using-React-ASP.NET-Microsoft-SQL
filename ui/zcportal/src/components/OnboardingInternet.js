import React, { Component } from 'react';
import { variables } from './Variables.js';
import { AddButton } from './AddButton';
import { OptionsCell } from './OptionsCell';


export class OnboardingInternet extends Component {
    constructor(props) {
        super(props);
        this.state = {
            InternetQuestions: [],
            modalTitle: "",
            Instructions: "",
            QuestionSerialNumber: 0,
            DeviceType: "",
            QuestionSerialNumberFilter: "",
            InstructionsFilter: "",
            departmentsWithoutFilter: []
        }
    }
    FilterFn() {
        var QuestionSerialNumberFilter = this.state.QuestionSerialNumberFilter;
        var InstructionsFilter = this.state.InstructionsFilter;
        var filteredData = this.state.departmentsWithoutFilter.filter(
            function (element) {
                return element.QuestionSerialNumber.toString().toLowerCase().includes(
                    QuestionSerialNumberFilter.toString().trim().toLowerCase()
                ) && element.Instructions.toString().toLowerCase().includes(
                    InstructionsFilter.toString().trim().toLowerCase()
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
    changeInstructionsFilter = (event) => {
        // eslint-disable-next-line 
        this.state.InstructionsFilter = event.target.value;
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
    changeInstructions = (e) => {
        this.setState({
            Instructions: e.target.value
        });
    }
    changeDeviceType = (event) => {
        this.setState({
            DeviceType: event.target.value
        });
    }
    addClick() {
        this.setState({
            modalTitle: "Add Instructions",
            QuestionSerialNumber: 0,
            DeviceType: "",
            Instructions: ""
        });
    }
    editClick = (question) => {
        this.setState({
            modalTitle: "Edit Instructions",
            QuestionSerialNumber: question.QuestionSerialNumber,
            DeviceType: question.DeviceType,
            Instructions: question.Instructions
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
                Instructions: this.state.Instructions,
                DeviceType: this.state.DeviceType,
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
                Instructions: this.state.Instructions,
                DeviceType: this.state.DeviceType,

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
            Instructions: Instructions,
            DeviceType: DeviceType,


        } = this.state;
        return (
            <div>

                <AddButton addClick={() => this.addClick()} />
                <table className='table table-striped'>
                    <thead>
                        <tr>
                            <th>
                                <div className="d-flex flex-row">
                                    <input className="form-control m-2"
                                        onChange={this.changeQuestionIdFilter}
                                        placeholder="Search by serial number" />
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
                                Instruction Serial Number
                            </th>
                            <th>
                                Type
                            </th>
                            <th>
                                <div className="d-flex flex-row">

                                    <input className="form-control m-2"
                                        style={{ marginLeft: '100px' }}
                                        onChange={this.changeInstructionsFilter}
                                        placeholder="Search by the instructions title" />
                                    <button type="button" className="btn btn-light"
                                        onClick={() => this.sortResults('Instructions', true)}>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-down-square-fill" viewBox="0 0 16 16">
                                            <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                        </svg>
                                    </button>


                                    {/*Spacer div*/}
                                    <div style={{ width: '10px', display: 'inline-block' }}></div>
                                    {/*Spacer div*/}


                                    <button type="button" className="btn btn-light"
                                        onClick={() => this.sortResults('Instructions', false)}>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
                                            <path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0" />
                                        </svg>
                                    </button>
                                </div>
                                Instructions

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
                                    {question.DeviceType}
                                </td>
                                <td>
                                    {question.Instructions}
                                </td>
                                <OptionsCell
                                    question={question}
                                    editClick={this.editClick}
                                    deleteClick={this.deleteClick}
                                />
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
                                <div className="form-group mb-3">
                                            <span className="form-label fw-bold text-start d-block">Instructions:</span>
                                            <textarea
                                                className="form-control"
                                                value={Instructions}
                                        onChange={this.changeInstructions}
                                                rows="3" 
                                                placeholder="Enter your answer here..."
                                            ></textarea>
                                        </div>
                                <div className="input-group mb-3">
                                    <span className="input-group-text">Type</span>
                                    <select className="form-select"
                                        onChange={this.changeDeviceType}
                                        value={DeviceType}>
                                            <option  value="android">
                                                Android
                                            </option>
                                            <option  value="iphone">
                                                iPhone
                                            </option>
                                            <option  value="windows">
                                                Windows
                                            </option>
                                            <option  value="mac">
                                                Mac
                                            </option>
                                            <option  value="troubleshooting">
                                            Troubleshooting
                                            </option>
                                            <option  value="others">
                                                Others
                                            </option>
                                    </select>
                                </div>

                                {
                                    QuestionSerialNumber === 0 ?
                                        <button type='button'
                                            style={{
                                                backgroundColor: variables.PRIMARY_COLOR,
                                                borderColor: variables.PRIMARY_COLOR,
                                                color: 'white',
                                            }}
                                            className='btn btn-primary float-start'
                                            onClick={() => this.createClick()}>
                                            Create
                                        </button>
                                        : null
                                }
                                {
                                    QuestionSerialNumber !== 0 ?
                                        <button type='button'
                                            style={{
                                                backgroundColor: variables.PRIMARY_COLOR,
                                                borderColor: variables.PRIMARY_COLOR,
                                                color: 'white',
                                            }}
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