import React from 'react';
import '../Styles/Home.css';
import { useNavigate } from "react-router-dom";


const Home: React.FC = () => {
    const navigate = useNavigate();

    return (
        <div className="container">
            {/* Banner Section */}
            <div
                className="banner text-center py-4 mb-5"
                style={{ backgroundColor: '#009ab5', color: 'white' }}
            >
                <h1>Welcome to the IT Portal</h1>
            </div>

            {/* Slider Section */}
            <div id="carouselExampleIndicators" className="carousel slide mb-5" data-bs-ride="carousel">
                <div className="carousel-indicators">
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="0"
                        className="active"
                        aria-current="true"
                        aria-label="Slide 1"
                    ></button>
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="1"
                        aria-label="Slide 2"
                    ></button>
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="2"
                        aria-label="Slide 3"
                    ></button>
                </div>
                <div className="carousel-inner">
                    <div className="carousel-item active">
                        <img src="/images/zewail.PNG" className="d-block w-100" alt="Slide 1" />
                    </div>

                    <div className="carousel-item">
                        <img src="/images/IT.PNG" className="d-block w-100" alt="Slide 2" />
                    </div>
                    <div className="carousel-item">
                        <img src="/images/zewail_logo.PNG" className="d-block w-100" alt="Slide 3" />
                    </div>
                </div>
                <button
                    className="carousel-control-prev"
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev"
                >
                    <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span className="visually-hidden">Previous</span>
                </button>
                <button
                    className="carousel-control-next"
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next"
                >
                    <span className="carousel-control-next-icon" aria-hidden="true"></span>
                    <span className="visually-hidden">Next</span>
                </button>
            </div>

            {/* Departments Section */}
            <div className="departments">
      <h2 className="text-center mb-4 fw-bold">ZC Departments</h2>
      <div className="row justify-content-center">
        {[
          "HR",
          "BMS",
          "LTS",
          "IT",
          "Finance",
          "Warehouses",
          "Library",
          "Legal Affairs",
          "Safety & Security",
          "Dorms",
          "Academic",
          "Research",
          "Admission & Registrar",
          "Administrative Affairs",
          "Student Affairs",
          "Marketing & Communications",
          "Procurement",
          "Transportation",
          "Medical",
          "Engineering",
        ].map((department, index) => (
          <div
            className="col-md-3 col-sm-4 col-6 mb-3"
            key={index}
            onClick={() => navigate(`/department/${department}`)} // Navigate to department page
          >
            <div className="department-card d-flex align-items-center justify-content-center">
              <span className="department-name">{department}</span>
            </div>
          </div>
        ))}
      </div>
    </div>


        </div>
    );
};

export default Home;
