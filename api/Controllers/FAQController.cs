
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using zcportal.Models;


namespace zcportal.Controllers

{


    [Route("api/[controller]")]
    [ApiController]


    public class FAQController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _env;

        public FAQController(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration = configuration;
            _env = env;
        }
     

        [HttpGet]
        public JsonResult Get()
        {
            string query = @"
                            select Id, QuestionTitle,Answer,
                            convert(varchar(10),PostingDate,120) as PostingDate, PhotoFileName
                            from
                            dbo.FAQ
                            ";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }

            return new JsonResult(table);
        }




        //---------------------------------------------------------------------------------------------------
        [HttpPost]
        public JsonResult Post(FAQ question)
        {
            string query = @"
                           insert into dbo.FAQ
                           (QuestionTitle,Answer,PostingDate,PhotoFileName)
                    values (@QuestionTitle,@Answer,@PostingDate,@PhotoFileName)
                            ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;
            SqlDataReader myReader;

            using (SqlConnection myCon = new SqlConnection(sqlDataSource))

            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@QuestionTitle", question.QuestionTitle);
                    myCommand.Parameters.AddWithValue("@Answer", question.Answer);
                    myCommand.Parameters.AddWithValue("@PostingDate", question.PostingDate);
                    myCommand.Parameters.AddWithValue("@PhotoFileName", question.PhotoFileName);


                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }
            return new JsonResult("Added Successfully");


        }

        //------------------------------------------------------------------------


        [HttpPut]
        public JsonResult Put(FAQ question)

        {
            // يعني، لما يكون عندك موظف رقمه في قاعدة البيانات هو 5 مثلاً، وتحط @EmployeeId = 5، فالكود هذا راح يروح ويحدث بيانات الموظف اللي رقمه 5 فقط، وما يغير شي في باقي الموظفين.
            string query = @"update dbo.FAQ
                               set  QuestionTitle= @QuestionTitle,
                                Answer=@Answer,
                               PostingDate=@PostingDate,
                               PhotoFileName=@PhotoFileName
                                where Id=@Id";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;
            SqlDataReader myReader;

            using (SqlConnection myCon = new SqlConnection(sqlDataSource))

            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@Id", question.Id);
                    myCommand.Parameters.AddWithValue("@QuestionTitle", question.QuestionTitle);
                    myCommand.Parameters.AddWithValue("@Answer", question.Answer);
                    myCommand.Parameters.AddWithValue("@PostingDate", question.PostingDate);
                    myCommand.Parameters.AddWithValue("@PhotoFileName", question.PhotoFileName);

                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }
            return new JsonResult("Updated Successfully");


        }
        //----------------------------------------------------------------------------------
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = @"
                           delete from dbo.FAQ
                            where Id=@Id
                            ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@Id", id);

                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }
            return new JsonResult("Deleted Successfully");
        }


        [Route("SaveFile")]
        [HttpPost]  
        public JsonResult SaveFile() {
            try
            {
                var httpRequest = Request.Form;
                var postedFile= httpRequest.Files[0];
                string filename = postedFile.FileName;
                var physicalPath = _env.ContentRootPath + "/Photos/" + filename;


                using (var stream = new FileStream(physicalPath, FileMode.Create))
                {
                    postedFile.CopyTo(stream);

                }


                    return new JsonResult(filename);

            }
            catch (Exception ) {
                return new JsonResult("anonymous.png");

            }
        }


    }
}
