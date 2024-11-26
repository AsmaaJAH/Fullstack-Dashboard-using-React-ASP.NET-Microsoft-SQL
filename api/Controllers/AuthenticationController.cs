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


    public class AuthenticationController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public AuthenticationController(IConfiguration configuration)
        {
            _configuration = configuration;
        }


        //----------------------------------------------- registration ---------------------------------
        [HttpPost]
        public JsonResult registration(Person person)
        {
            string msg = string.Empty;
            try
            {
                string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;

                SqlCommand cmd = null;
                SqlConnection conn = new SqlConnection(sqlDataSource);
                cmd = new SqlCommand("registration", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", person.Name);
                cmd.Parameters.AddWithValue("@Email", person.Email);
                cmd.Parameters.AddWithValue("@Password", person.Password);
                cmd.Parameters.AddWithValue("@isAdmin", person.isAdmin);

                conn.Open();
                int i = cmd.ExecuteNonQuery();
                conn.Close();

                if (i > 0)
                {
                    msg = "Added Successfully";

                }
                else
                {
                    msg = "Error";
                }
            }
            catch (Exception error)
            {
                msg = error.Message;

            }
            return new JsonResult(msg);

        }



        //----------------------------------------------- sign-in ---------------------------------
        [HttpPost]
        public JsonResult login(Person person)
        {
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection")!;
            SqlCommand cmd = null;
            SqlConnection conn = new SqlConnection(sqlDataSource);

            string msg = string.Empty;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter("personlogin", conn);
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                adapter.SelectCommand.Parameters.AddWithValue("@Email", person.Email);
                adapter.SelectCommand.Parameters.AddWithValue("@Password", person.Password);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                if (dataTable.Rows.Count>0)
                {
                    msg = "Email or password are correct.";
                } else
                {
                    msg = "Email or password are incorrect!";
                }

            }
            catch(Exception error)
            {
                msg = error.Message;
            }
            return new JsonResult(msg);
        }


    }
}