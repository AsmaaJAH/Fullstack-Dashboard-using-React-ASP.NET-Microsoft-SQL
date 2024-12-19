import { variables } from '../components/Variables';
import { Announcement } from '../Models/Announcement';

/**
 * Fetches a single announcement by ID.
 * @param id The ID of the announcement to fetch.
 * @returns The announcement object if found, otherwise null.
 */
export const fetchAnnouncementById = async (id: string): Promise<Announcement | null> => {
    try {
        const response = await fetch(`${variables.API_URL}Announcement/${id}`);
        const data = await response.json();
        if (data.Table && data.Table.length > 0) {
            return data.Table[0];
        } else {
            return null;
        }
    } catch (error) {
        console.error('Error fetching announcement:', error);
        return null;
    }
};
