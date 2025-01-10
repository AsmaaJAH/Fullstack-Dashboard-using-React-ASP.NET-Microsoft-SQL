import React, { useState, useEffect } from 'react';
import { fetchFAQs, createFAQ, updateFAQ, deleteFAQ } from '../API/FaqAPI';
import AddButton from '../components/AddButton';
import OptionsCell from '../components/OptionsCell';
import { variables } from '../components/Variables';


const FAQ: React.FC = () => {
  const [openIndex, setOpenIndex] = useState<number | null>(null);
  const [FAQs, setFAQs] = useState<any[]>([]);
  const [modalTitle, setModalTitle] = useState<string>('');
  const [Id, setId] = useState<number>(0);
  const [QuestionTitle, setQuestionTitle] = useState<string>('');
  const [Answer, setAnswer] = useState<string>('');

  const toggleFAQ = (index: number) => {
      setOpenIndex(prevIndex => (prevIndex === index ? null : index));
  };

  const refreshList = async () => {
      try {
          const data = await fetchFAQs();
          setFAQs(data);
      } catch (error :any) {
          alert(error.message);
      }
  };

  useEffect(() => {
      refreshList();
  }, []);

  const changeQuestionTitle = (event: React.ChangeEvent<HTMLInputElement>) => {
      setQuestionTitle(event.target.value);
  };

  const changeAnswer = (event: React.ChangeEvent<HTMLTextAreaElement>) => {
      setAnswer(event.target.value);
  };

  const addClick = () => {
      setModalTitle('Add FAQ');
      setId(0);
      setQuestionTitle('');
      setAnswer('');
  };

  const editClick = (question: { Id: number; QuestionTitle: string; Answer: string }) => {
      setModalTitle('Edit FAQ');
      setId(question.Id);
      setQuestionTitle(question.QuestionTitle);
      setAnswer(question.Answer);
  };

  const createClick = async () => {
      try {
          const result = await createFAQ(QuestionTitle, Answer);
          alert(result);
          refreshList();
      } catch (error:any) {
          alert(error.message);
      }
  };

  const updateClick = async () => {
      try {
          const result = await updateFAQ(Id, QuestionTitle, Answer);
          alert(result);
          refreshList();
      } catch (error :any) {
          alert(error.message);
      }
  };

  const deleteClick = async (id: string | number) => {
      if (window.confirm('Are you sure you wanna delete this FAQ?')) {
          try {
              const result = await deleteFAQ(id);
              alert(result);
              refreshList();
          } catch (error :any) {
              alert(error.message);
          }
      }
  };

  return (
  <div className="container my-5">
    <div className="d-flex justify-content-end">
    <AddButton addClick={addClick} />
    </div>
    <h1 className="text-center mb-4 fw-bold" style={{ color: 'black'}} >Frequently Asked Questions</h1>
    <div className="accordion pt-0" id="faqAccordion">
      {FAQs.map((faq, index) => (
        <div className="accordion-item mb-3" key={index}>
            <button
              className={`accordion-button ${openIndex === index ? "" : "collapsed"}`}
              type="button"
              onClick={() => toggleFAQ(index)}
              aria-expanded={openIndex === index}
            >
              <OptionsCell
                question={faq}
                editClick={editClick}
                deleteClick={deleteClick}
              />
              <div style={{ width: '50px', display: 'inline-block' }}></div>
              <strong>{faq.QuestionTitle}</strong>
            </button>
          <div
            className={`accordion-collapse collapse ${openIndex === index ? "show" : ""}`}
            aria-labelledby={`faq${index}`}
          >
            <div className="accordion-body">{faq.Answer}</div>
          </div>
        </div>
      ))}
    </div>
    <div className="modal fade" id="exampleModal" tabIndex={-1} aria-hidden="true">
      <div className="modal-dialog modal-lg modal-dialog-centered">
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title">{modalTitle}</h5>
            <button
              type="button"
              className="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div className="modal-body">
            <div className="d-flex flex-column bd-highlight mb-3">
              {/* Content Section */}
              <div className="w-100">
                <div className="form-group mb-3">
                  <span className="form-label fw-bold text-start d-block">Question Title</span>
                  <input
                    type="text"
                    className="form-control"
                    value={QuestionTitle}
                    onChange={changeQuestionTitle}
                  />
                </div>

                <div className="form-group mb-3">
                  <span className="form-label fw-bold text-start d-block">Answer:</span>
                  <textarea
                    className="form-control"
                    value={Answer}
                    onChange={changeAnswer}
                    rows={3}
                    placeholder="Enter your answer here..."
                  ></textarea>
                </div>
              </div>
            </div>
          </div>
          {/* Button Section */}
          {Id === 0 ? (
            <div className="d-flex justify-content-center mb-3">
              <button
                type="button"
                style={{
                  backgroundColor: variables.PRIMARY_COLOR,
                  borderColor: variables.PRIMARY_COLOR,
                  color: "white",
                  fontWeight: "bold",
                  width: "25%",
                }}
                className="btn btn-primary"
                onClick={createClick}
              >
                Create
              </button>
            </div>
          ) : null}
          {Id !== 0 ? (
            <div className="d-flex justify-content-center mb-3">
              <button
                type="button"
                style={{
                  backgroundColor: variables.PRIMARY_COLOR,
                  borderColor: variables.PRIMARY_COLOR,
                  color: "white",
                  fontWeight: "bold",
                }}
                className="btn btn-primary"
                onClick={updateClick}
              >
                Update
              </button>
            </div>
          ) : null}
        </div>
      </div>
    </div>
  </div>
);
};

export default FAQ;
