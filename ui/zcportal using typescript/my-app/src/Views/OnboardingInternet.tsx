import React, { useState, useEffect } from 'react';
import { variables } from '../components/Variables';
import AddButton from '../components/AddButton';
import OptionsCell from '../components/OptionsCell';
import { Question } from '../Models/Question';

// Debounce function (to limit how often the filter function is called)
const useDebounce = (value: string, delay: number) => {
    const [debouncedValue, setDebouncedValue] = useState(value);

    useEffect(() => {
        const handler = setTimeout(() => {
            setDebouncedValue(value);
        }, delay);

        return () => {
            clearTimeout(handler);
        };
    }, [value, delay]);

    return debouncedValue;
};


export const OnboardingInternet: React.FC = () => {
    const [internetQuestions, setInternetQuestions] = useState<Question[]>([]);
    const [modalTitle, setModalTitle] = useState<string>('');
    const [instructions, setInstructions] = useState<string>('');
    const [deviceType, setDeviceType] = useState<string>('');
    const [questionSerialNumber, setQuestionSerialNumber] = useState<number>(0);
    const [questionSerialNumberFilter, setQuestionSerialNumberFilter] = useState<string>('');
    const [instructionsFilter, setInstructionsFilter] = useState<string>('');
    const [departmentsWithoutFilter, setDepartmentsWithoutFilter] = useState<Question[]>([]);

    // Use debounce for filters
    const debouncedSerialNumberFilter = useDebounce(questionSerialNumberFilter, 500);
    const debouncedInstructionsFilter = useDebounce(instructionsFilter, 500);

    useEffect(() => {
        refreshList();
    }, []);

    useEffect(() => {
        filterFn();
    }, [debouncedSerialNumberFilter, debouncedInstructionsFilter]);

    const refreshList = async () => {
        try {
            const response = await fetch(variables.API_URL + 'OnBoardingInternet');
            const data: Question[] = await response.json();
            setInternetQuestions(data);
            setDepartmentsWithoutFilter(data);
        } catch (error) {
            alert('Failed to fetch data');
        }
    };

    const filterFn = () => {
        const filteredData = departmentsWithoutFilter.filter((element) =>
            element.QuestionSerialNumber.toString().toLowerCase().includes(
                debouncedSerialNumberFilter.trim().toLowerCase()
            ) &&
            element.Instructions.toLowerCase().includes(debouncedInstructionsFilter.trim().toLowerCase())
        );
        setInternetQuestions(filteredData);
    };

    const sortResults = (property: keyof Question, ascending: boolean) => {
        const sortedData = [...departmentsWithoutFilter].sort((a, b) => {
            if (ascending) {
                return a[property] > b[property] ? 1 : a[property] < b[property] ? -1 : 0;
            } else {
                return b[property] > a[property] ? 1 : b[property] < a[property] ? -1 : 0;
            }
        });
        setInternetQuestions(sortedData);
    };

    const handleQuestionSerialNumberFilterChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setQuestionSerialNumberFilter(event.target.value);
    };

    const handleInstructionsFilterChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setInstructionsFilter(event.target.value);
    };

    const handleInstructionsChange = (event: React.ChangeEvent<HTMLTextAreaElement>) => {
        setInstructions(event.target.value);
    };

    const handleDeviceTypeChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
        setDeviceType(event.target.value);
    };

    const handleAddClick = () => {
        setModalTitle('Add Instructions');
        setQuestionSerialNumber(0);
        setDeviceType('');
        setInstructions('');
    };

    const handleEditClick = (question: Question) => {
        setModalTitle('Edit Instructions');
        setQuestionSerialNumber(question.QuestionSerialNumber);
        setDeviceType(question.DeviceType);
        setInstructions(question.Instructions);
    };

    const handleCreateClick = async () => {
        try {
            const response = await fetch(variables.API_URL + 'OnBoardingInternet', {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    Instructions: instructions,
                    DeviceType: deviceType,
                }),
            });
            const result = await response.json();
            alert(result);
            refreshList();
        } catch (error) {
            alert('Failed to create');
        }
    };

    const handleUpdateClick = async () => {
        try {
            const response = await fetch(variables.API_URL + 'OnBoardingInternet', {
                method: 'PUT',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    QuestionSerialNumber: questionSerialNumber,
                    Instructions: instructions,
                    DeviceType: deviceType,
                }),
            });
            const result = await response.json();
            alert(result);
            refreshList();
        } catch (error) {
            alert('Failed to update');
        }
    };

    const handleDeleteClick = async (id: string | number) => {
        if (window.confirm('Are you sure you wanna delete this Department?')) {
            try {
                const response = await fetch(variables.API_URL + 'OnBoardingInternet/' + id, {
                    method: 'DELETE',
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                });
                const result = await response.json();
                alert(result);
                refreshList();
            } catch (error) {
                alert('Failed to delete');
            }
        }
    };

    return (
        <div>
            <AddButton addClick={handleAddClick} />
            <table className='table table-striped'>
                <thead>
                    <tr>
                        <th>
                            <div className="d-flex flex-row">
                                <input
                                    className="form-control m-2"
                                    onChange={handleQuestionSerialNumberFilterChange}
                                    placeholder="Search by serial number"
                                />
                                <button type="button" className="btn btn-light" onClick={() => sortResults('QuestionSerialNumber', true)}>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-down-square-fill" viewBox="0 0 16 16">
                                        <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                    </svg>
                                </button>
                                <div style={{ width: '10px', display: 'inline-block' }}></div>
                                <button type="button" className="btn btn-light" onClick={() => sortResults('QuestionSerialNumber', false)}>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
                                        <path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0" />
                                    </svg>
                                </button>
                            </div>
                            Instruction Serial Number
                        </th>
                        <th>Type</th>
                        <th>
                            <div className="d-flex flex-row">
                                <input
                                    className="form-control m-2"
                                    style={{ marginLeft: '100px' }}
                                    onChange={handleInstructionsFilterChange}
                                    placeholder="Search by the instructions title"
                                />
                                <button type="button" className="btn btn-light" onClick={() => sortResults('Instructions', true)}>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-down-square-fill" viewBox="0 0 16 16">
                                        <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                    </svg>
                                </button>
                                <div style={{ width: '10px', display: 'inline-block' }}></div>
                                <button type="button" className="btn btn-light" onClick={() => sortResults('Instructions', false)}>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
                                        <path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0" />
                                    </svg>
                                </button>
                            </div>
                            Instructions
                        </th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                    {internetQuestions.map((question) => (
                        <tr key={question.QuestionSerialNumber}>
                            <td>{question.QuestionSerialNumber}</td>
                            <td>{question.DeviceType}</td>
                            <td>{question.Instructions}</td>
                            <OptionsCell question={question} editClick={handleEditClick} deleteClick={handleDeleteClick} />
                        </tr>
                    ))}
                </tbody>
            </table>
            <div className="modal fade" id="exampleModal" tabIndex={-1} aria-hidden="true">
                <div className="modal-dialog modal-lg modal-dialog-centered">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title">{modalTitle}</h5>
                            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div className="modal-body">
                            <div className="form-group mb-3">
                                <span className="form-label fw-bold text-start d-block">Instructions:</span>
                                <textarea
                                    className="form-control"
                                    value={instructions}
                                    onChange={handleInstructionsChange}
                                    rows={3}
                                    placeholder="Enter your answer here..."
                                ></textarea>
                            </div>
                            <div className="input-group mb-3">
                                <span className="input-group-text">Type</span>
                                <select className="form-select" onChange={handleDeviceTypeChange} value={deviceType}>
                                    <option value="android">Android</option>
                                    <option value="iphone">iPhone</option>
                                    <option value="mac">Mac</option>
                                    <option value="windows">Windows</option>
                                    <option value="others">Other</option>
                                    <option value="troubleshooting">Troubleshooting</option>
                                </select>
                            </div>
                        </div>
                        <div className="modal-footer d-flex justify-content-center mb-3">

                            {questionSerialNumber === 0 ? (
                                    <button
                                        type="button"
                                        style={{
                                            backgroundColor: variables.PRIMARY_COLOR,
                                            borderColor: variables.PRIMARY_COLOR,
                                            color: "white",
                                            fontWeight: "bold",
                                        }}
                                        className="btn btn-primary"
                                        onClick={handleCreateClick}
                                    >
                                        Create
                                    </button>
                            ) : (
                                    <button
                                        type="button"
                                        style={{
                                            backgroundColor: variables.PRIMARY_COLOR,
                                            borderColor: variables.PRIMARY_COLOR,
                                            color: "white",
                                            fontWeight: "bold",
                                        }}
                                        className="btn btn-primary"
                                        onClick={handleUpdateClick}
                                    >
                                        Update
                                    </button>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};
