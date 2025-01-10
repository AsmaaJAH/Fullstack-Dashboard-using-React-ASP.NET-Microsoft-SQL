import { useParams, useNavigate } from "react-router-dom";
import "../Styles/DepartmentLandingPage.css"; // Assuming CSS for hover effects is here.

const DepartmentLandingPage = () => {
  const { department } = useParams(); // Get department name from URL
  const navigate = useNavigate();

  const cards = [
    {
      title: "Services",
      subtitle: "Explore our services",
      image: "/Portal/images/services.PNG",
      link: `/departments/${department}/services`,
    },
    {
      title: "Announcements",
      subtitle: "Stay updated With Our Latest Announcements, and Events",
      image: "/Portal/images/announcement.PNG",
      link: `/departments/${department}/announcements`,
    },
    {
      title: "FAQ",
      subtitle: "Find answers to your frequantly-asked questions",
      image: "/Portal/images/faq.PNG",
      link: `/departments/${department}/faq`,
    },
  ];

  return (
    <div className="department-landing">
      <h2 className="text-center mb-4 fw-bold">{department} Department Details</h2>
      <div className="row justify-content-center">
        {cards.map((card, index) => (
          <div
            className="col-md-4 mb-4"
            key={index}
            onClick={() => navigate(card.link)}
            style={{ cursor: "pointer" }}
          >
            <div className="landing-card text-center p-3 border shadow-sm hover-zoom">
              <img
                src={card.image}
                alt={card.title}
                className="img-fluid mb-3"
                style={{ maxHeight: "200px", objectFit: "cover" }}
              />
              <h4>{card.title}</h4>
              <p>{card.subtitle}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default DepartmentLandingPage;

