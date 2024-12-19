import { variables } from '../components/Variables';

// Fetch the FAQ list
export const fetchFAQs = async (): Promise<any[]> => {
    const response = await fetch(variables.API_URL + 'FAQ');
    if (!response.ok) {
        throw new Error('Failed to fetch FAQs');
    }
    return response.json();
};

// Create a new FAQ
export const createFAQ = async (QuestionTitle: string, Answer: string): Promise<string> => {
    const response = await fetch(variables.API_URL + 'FAQ', {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            QuestionTitle,
            Answer,
        }),
    });
    if (!response.ok) {
        throw new Error('Failed to create FAQ');
    }
    return response.json();
};

// Update an existing FAQ
export const updateFAQ = async (Id: number, QuestionTitle: string, Answer: string): Promise<string> => {
    const response = await fetch(variables.API_URL + 'FAQ', {
        method: 'PUT',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            Id,
            QuestionTitle,
            Answer,
        }),
    });
    if (!response.ok) {
        throw new Error('Failed to update FAQ');
    }
    return response.json();
};

// Delete an FAQ
export const deleteFAQ = async (id: string | number): Promise<string> => {
    const response = await fetch(variables.API_URL + 'FAQ/' + id, {
        method: 'DELETE',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        },
    });
    if (!response.ok) {
        throw new Error('Failed to delete FAQ');
    }
    return response.json();
};
