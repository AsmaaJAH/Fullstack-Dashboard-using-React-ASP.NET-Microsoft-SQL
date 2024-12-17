import React from 'react';

interface AddButtonProps {
  addClick: () => void; // Define the type of the onClick handler
}

const AddButton: React.FC<AddButtonProps> = ({ addClick }) => {
  return (
    <button
      type="button"
      className="btn m-3 float-end"
      style={{
        backgroundColor: '#00b3d1',
        paddingRight: '15px',
        color: 'white',
        fontWeight: 'bold',
      }}
      data-bs-toggle="modal"
      data-bs-target="#exampleModal"
      onClick={addClick}
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="30px"
        height="30px"
        fill="white"
        stroke="white"
        strokeWidth="0.5"
        className="bi bi-plus"
        viewBox="0 0 16 16"
      >
        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
      </svg>
      add
    </button>
  );
};

export default AddButton;
