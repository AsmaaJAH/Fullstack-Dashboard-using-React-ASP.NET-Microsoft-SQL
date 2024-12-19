
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { fetchAnnouncements, createAnnouncement, updateAnnouncement, deleteAnnouncement, uploadImage } from '../API/AnnouncementsAPI';
import { variables } from '../components/Variables';
import AddButton from '../components/AddButton';
import OptionsCell from '../components/OptionsCell';
import '../Styles/Announcements.css';

const Announcements: React.FC = () => {
    const [announcements, setAnnouncements] = useState<any[]>([]);
    const [modalTitle, setModalTitle] = useState('');
    const [id, setId] = useState(0);
    const [title, setTitle] = useState('');
    const [content, setContent] = useState('');
    const [postingDate, setPostingDate] = useState('');
    const [photoFileName, setPhotoFileName] = useState('anonymous.PNG');
    const photoPath = variables.PHOTO_URL;

    const refreshList = async () => {
        try {
            const announcementsData = await fetchAnnouncements();
            setAnnouncements(announcementsData);
        } catch (error: any) {
            alert('Failed to fetch data: ' + error.message);
        }
    };

    useEffect(() => {
        refreshList();
    }, []);

    const handleAddClick = () => {
        setModalTitle('Add Announcement');
        setId(0);
        setTitle('');
        setContent('');
        setPostingDate('');
        setPhotoFileName('anonymous.PNG');
    };

    const handleEditClick = (announcement: any) => {
        setModalTitle('Edit Announcement');
        setId(announcement.Id);
        setTitle(announcement.Title);
        setContent(announcement.Content);
        setPostingDate(announcement.PostingDate);
        setPhotoFileName(announcement.PhotoFileName);
    };

    const handleCreateClick = async () => {
        try {
            await createAnnouncement({
                Title: title,
                Content: content,
                PostingDate: postingDate,
                PhotoFileName: photoFileName,
            });
            alert('Announcement added successfully.');
            refreshList();
        } catch (error: any) {
            alert('Failed to add announcement: ' + error.message);
        }
    };

    const handleUpdateClick = async () => {
        try {
            await updateAnnouncement({
                Id: id,
                Title: title,
                Content: content,
                PostingDate: postingDate,
                PhotoFileName: photoFileName,
            });
            alert('Announcement updated successfully.');
            refreshList();
        } catch (error: any) {
            alert('Failed to update announcement: ' + error.message);
        }
    };

    const handleDeleteClick = async (deleteId: number) => {
        if (window.confirm('Are you sure you want to delete this announcement?')) {
            try {
                await deleteAnnouncement(deleteId);
                alert('Announcement deleted successfully.');
                refreshList();
            } catch (error: any) {
                alert('Failed to delete announcement: ' + error.message);
            }
        }
    };

    const handleImageUpload = async (event: React.ChangeEvent<HTMLInputElement>) => {
        if (event.target.files && event.target.files[0]) {
            try {
                const fileName = await uploadImage(event.target.files[0]);
                setPhotoFileName(fileName);
            } catch (error: any) {
                alert('Failed to upload image: ' + error.message);
            }
        } else {
            alert('No file selected. Please select a file and try again.');
        }
    };

    return (
      <div>
      <AddButton addClick={handleAddClick} />
      <h1 className="text-center mb-4">Announcements</h1>

      <div className="row">
        {announcements.map((post: any) => (
          <div className="col-md-4 mb-4" key={post.Id}>
            <div className="card h-100 shadow-sm">
              <Link to={`/announcement/${post.Id}`} style={{ textDecoration: 'none', color: 'inherit', cursor: 'pointer' }}>
                {post.PhotoFileName === null || post.PhotoFileName === 'anonymous.PNG' ? (
                  <img src={`https://via.placeholder.com/300x200?text=${post.Title}`} className="card-img-top" alt="Announcement" />
                ) : (
                  <img src={photoPath + post.PhotoFileName} className="card-img-top" alt="Announcement" />
                )}
                <div className="card-body">
                  <h5 className="card-title" style={{ color: variables.PRIMARY_COLOR }}>{post.Title}</h5>
                  <h6 className="card-subtitle mb-2 text-muted">{new Date(post.PostingDate).toLocaleDateString()}</h6>
                  <p className="card-text">{post.Content.length > 33 ? `${post.Content.slice(0, 30)}...` : post.Content}</p>
                </div>
              </Link>
              <div className="d-flex justify-content-between align-items-center p-2">
                <OptionsCell editClick={() => handleEditClick(post)} deleteClick={() => handleDeleteClick(post.Id)} question={post} />
              </div>
            </div>
          </div>
        ))}
      </div>

      <div className="modal fade" id="exampleModal" tabIndex={-1} aria-hidden="true">
        <div className="modal-dialog modal-lg modal-dialog-centered">
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title">{modalTitle}</h5>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body">
              <div className="d-flex flex-row bd-highlight mb-3">
                <div className="p-2 w-50 bd-highlight">
                  <div className="form-group mb-3">
                    <span className="form-label fw-bold text-start d-block">Title:</span>
                    <input type="text" className="form-control" value={title} onChange={(e) => setTitle(e.target.value)} />
                  </div>
                  <div className="form-group mb-3">
                    <span className="form-label fw-bold text-start d-block">Content:</span>
                    <textarea className="form-control" value={content} onChange={(e) => setContent(e.target.value)} rows={3} placeholder="Enter your content here..." />
                  </div>
                  <div className="form-group">
                    <span className="form-label fw-bold text-start d-block">Posting Date:</span>
                    <input type="date" className="form-control" value={postingDate} onChange={(e) => setPostingDate(e.target.value)} />
                  </div>
                </div>
                <div className="p-2 w-50 bd-highlight">
                  <img width="250px" height="250px" src={photoPath + photoFileName} alt="your pic" />
                  <input className="m-2 ms-5" type="file" onChange={handleImageUpload} />
                </div>
              </div>
            </div>
            {id === 0 ? (
              <button type="button" style={{ backgroundColor: variables.PRIMARY_COLOR, borderColor: variables.PRIMARY_COLOR, color: 'white', fontWeight: 'bold' }} className="btn btn-primary float-start w-50 mb-3 ms-3" onClick={handleCreateClick}>
                Create
              </button>
            ) : (
              <button type="button" style={{ backgroundColor: variables.PRIMARY_COLOR, borderColor: variables.PRIMARY_COLOR, color: 'white', fontWeight: 'bold' }} className="btn btn-primary float-start w-50 mb-3 ms-3" onClick={handleUpdateClick}>
                Update
              </button>
            )}
          </div>
        </div>
      </div>
    </div>

 
    );
};

export default Announcements;
