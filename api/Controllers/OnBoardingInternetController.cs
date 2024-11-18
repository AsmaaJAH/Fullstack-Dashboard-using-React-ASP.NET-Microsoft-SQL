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
    public class OnBoardingInternetController : ControllerBase //Controller
    {
        private readonly IConfiguration _configuration;
        public OnBoardingInternetController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [HttpGet]
        public JsonResult Get()
        {
            string query = @"select QuestionSerialNumber, DeviceType , QuestionTitle from dbo.InternetQuestion";
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
        public JsonResult Post(InternetQuestion question)
        {
            string query = @"insert into dbo.InternetQuestion (QuestionTitle,DeviceType)
                    values (@QuestionTitle,@DeviceType)";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;
            SqlDataReader myReader;

            using (SqlConnection myCon = new SqlConnection(sqlDataSource))

            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@QuestionTitle", question.Instructions);
                    myCommand.Parameters.AddWithValue("@DeviceType", question.DeviceType);

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
        public JsonResult Put(InternetQuestion question)
        {
            string query = @"update dbo.InternetQuestion 
                               set  QuestionTitle= @QuestionTitle
                                    DeviceType = @DeviceType
                              where QuestionSerialNumber=@QuestionSerialNumber";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;
            SqlDataReader myReader;

            using (SqlConnection myCon = new SqlConnection(sqlDataSource))

            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@QuestionSerialNumber", question.QuestionSerialNumber);

                    myCommand.Parameters.AddWithValue("@QuestionTitle", question.Instructions);
                    myCommand.Parameters.AddWithValue("@DeviceType", question.DeviceType);

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
                           delete from dbo.InternetQuestion
                            where QuestionSerialNumber=@QuestionSerialNumber
                            ";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@QuestionSerialNumber", id);

                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }
            return new JsonResult("Deleted Successfully");
        }
    }
}