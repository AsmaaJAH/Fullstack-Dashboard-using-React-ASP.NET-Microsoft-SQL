import { variables } from '../components/Variables';
import { Question } from '../Models/Question';

// Fetch the list of internet questions
export const fetchInternetQuestions = async (): Promise<Question[]> => {
    const response = await fetch(variables.API_URL + 'OnBoardingInternet');
    if (!response.ok) {
        throw new Error('Failed to fetch data');
    }
    return response.json();
};

// Create a new internet question
export const createInternetQuestion = async (instructions: string, deviceType: string): Promise<string> => {
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
    if (!response.ok) {
        throw new Error('Failed to create');
    }
    return response.json();
};

// Update an existing internet question
export const updateInternetQuestion = async (
    questionSerialNumber: number,
    instructions: string,
    deviceType: string
): Promise<string> => {
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
    if (!response.ok) {
        throw new Error('Failed to update');
    }
    return response.json();
};

// Delete an internet question
export const deleteInternetQuestion = async (id: string | number): Promise<string> => {
    const response = await fetch(variables.API_URL + 'OnBoardingInternet/' + id, {
        method: 'DELETE',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        },
    });
    if (!response.ok) {
        throw new Error('Failed to delete');
    }
    return response.json();
};
