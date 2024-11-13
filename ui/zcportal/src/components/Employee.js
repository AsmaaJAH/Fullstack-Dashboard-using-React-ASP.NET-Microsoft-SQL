import React, { Component } from 'react';
import { variables } from './Variables.js';

export class Employee extends Component {
    constructor(props) {
        super(props);
        this.state = {
            departments: [],
            employees: [],
            modalTitle: "",
            EmployeeName: "",
            EmployeeId: 0,
            Department: "",
            DateOfJoining: "",
            PhotoFileName: "anonymous.png",
            PhotoPath: variables.PHOTO_URL,
        }

    }

    refreshList() {
        fetch(variables.API_URL + 'Employee')
            .then(response => response.json())
            .then(data => {
                this.setState(
                    {
                        employees: data
                    }
                );
            });


        fetch(variables.API_URL + 'Department')
            .then(response => response.json())
            .then(data => {
                this.setState(
                    {
                        departments: data
                    }
                );
            });

    }
    componentDidMount() {
        this.refreshList();

    }
    changeEmployeeName = (event) => {
        this.setState({
            EmployeeName: event.target.value
        });
    }
    changeDepartment = (event) => {
        this.setState({
            Department: event.target.value
        });
    }
    changeDateOfJoining = (event) => {
        this.setState({
            DateOfJoining: event.target.value
        });
    }


    addClick() {
        this.setState({
            modalTitle: "Add Employee",
            EmployeeId: 0,
            EmployeeName: "",
            Department: "",
            DateOfJoining: "",
            PhotoFileName: "anonymous.png",
        });
    }
    editClick(emp) {
        this.setState({
            modalTitle: "Edit Employee",
            EmployeeId: emp.EmployeeId,
            EmployeeName: emp.EmployeeName,
            Department: emp.Department,
            DateOfJoining: emp.DateOfJoining,
            PhotoFileName: emp.PhotoFileName,
        });
    }

    createClick() {
        fetch(variables.API_URL + 'Employee', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                EmployeeName: this.state.EmployeeName,
                Department: this.state.Department,
                DateOfJoining: this.state.DateOfJoining,
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
        fetch(variables.API_URL + 'Employee', {
            method: 'PUT',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                EmployeeId: this.state.EmployeeId,
                EmployeeName: this.state.EmployeeName,
                Department: this.state.Department,
                DateOfJoining: this.state.DateOfJoining,
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
        if (window.confirm('Are you sure you wanna delete this Department?')) {
            fetch(variables.API_URL + 'Employee/' + id, {
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

            fetch(variables.API_URL + 'Employee/SaveFile', {
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
            departments,
            employees,
            modalTitle,
            EmployeeId,
            EmployeeName,
            Department,
            DateOfJoining,
            PhotoPath,
            PhotoFileName,

        } = this.state;
        return (
            <div>

                <button type="button" className="btn btn-primary  m-3 float-end"
                    data-bs-toggle="modal" data-bs-target="#exampleModal"
                    onClick={() => this.addClick()}>
                    Add Employee
                </button>




                <table className='table table-striped'>
                    <thead>
                        <tr>
                            <th>
                                Employee ID
                            </th>
                            <th>
                                Employee Name
                            </th>
                            <th>
                                Department
                            </th>
                            <th>
                                Date of Joining
                            </th>
                            <th>
                                Options
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {employees.map(emp =>

                            <tr key={emp.EmployeeId}>
                                <td>{emp.EmployeeId}</td>
                                <td>{emp.EmployeeName}</td>
                                <td>{emp.Department}</td>
                                <td>{emp.DateOfJoining}</td>
                                <td>
                                    <button type='button'
                                        className='btn btn-light mr-1'
                                        data-bs-toggle="modal" data-bs-target="#exampleModal"
                                        onClick={() => this.editClick(emp)}>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                            <path fillRule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                        </svg>
                                    </button>
                                    {/*Spacer div*/}
                                    <div style={{ width: '10px', display: 'inline-block' }}></div>

                                    <button type='button'
                                        className='btn btn-light mr-1'
                                        onClick={() => this.deleteClick(emp.EmployeeId)}
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
                                            <span className="input-group-text">Employee Name</span>
                                            <input type="text" className="form-control"
                                                value={EmployeeName}
                                                onChange={this.changeEmployeeName} />
                                        </div>



                                        <div className="input-group mb-3">
                                            <span className="input-group-text">Department</span>
                                            <select className="form-select"
                                                onChange={this.changeDepartment}
                                                value={Department}>
                                                {departments.map(dep =>
                                                    <option key={dep.DepartmentId} value={dep.DepartmentName}>
                                                        {dep.DepartmentName}
                                                    </option>)}
                                            </select>
                                        </div>



                                        <div className="input-group mb-3">
                                            <span className="input-group-text">Date Of Joining</span>
                                            <input type="date" className="form-control"
                                                value={DateOfJoining}
                                                onChange={this.changeDateOfJoining} />
                                        </div>



                                    </div>
                                    <div className="p-2 w-50 bd-highlight">
                                        <img width="250px" height="250px" src={PhotoPath + PhotoFileName} ></img>
                                        <input className="m-2 ms-5" type="file" onChange={this.imageUpload}></input>
                                    </div>

                                </div>
                            </div>
                            {
                                EmployeeId === 0 ?
                                    <button type='button'
                                        className='btn btn-primary float-start w-50 mb-3 ms-3'
                                        onClick={() => this.createClick()}>
                                        Create
                                    </button>
                                    : null
                            }
                            {
                                EmployeeId !== 0 ?
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