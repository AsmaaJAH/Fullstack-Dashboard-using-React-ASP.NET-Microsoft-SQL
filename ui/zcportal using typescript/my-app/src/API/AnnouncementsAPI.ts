import { variables } from '../components/Variables';

/**
 * Fetches all announcements from the API.
 */
export const fetchAnnouncements = async (): Promise<any[]> => {
    const response = await fetch(`${variables.API_URL}Announcement`);
    return await response.json();
};

/**
 * Fetches all internet questions from the API.
 */
export const fetchInternetQuestions = async (): Promise<any[]> => {
    const response = await fetch(`${variables.API_URL}OnBoardingInternet`);
    return await response.json();
};

/**
 * Creates a new announcement.
 */
export const createAnnouncement = async (announcement: any): Promise<string> => {
    const response = await fetch(`${variables.API_URL}Announcement`, {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(announcement),
    });
    return await response.json();
};

/**
 * Updates an existing announcement.
 */
export const updateAnnouncement = async (announcement: any): Promise<string> => {
    const response = await fetch(`${variables.API_URL}Announcement`, {
        method: 'PUT',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(announcement),
    });
    return await response.json();
};

/**
 * Deletes an announcement by ID.
 */
export const deleteAnnouncement = async (id: number): Promise<string> => {
    const response = await fetch(`${variables.API_URL}Announcement/${id}`, {
        method: 'DELETE',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
        },
    });
    return await response.json();
};

/**
 * Uploads an image to the API.
 */
export const uploadImage = async (file: File): Promise<string> => {
    const formData = new FormData();
    formData.append('file', file);

    const response = await fetch(`${variables.API_URL}Announcement/SaveFile`, {
        method: 'POST',
        body: formData,
    });
    return await response.json();
};
