using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
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

        //----------------------------------------------- Registration ---------------------------------
        [HttpPost("registration")]
        public JsonResult Registration(Person person)
        {
            string msg = string.Empty;
            try
            {
                string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
                using (SqlConnection conn = new SqlConnection(sqlDataSource))
                {
                    using (SqlCommand cmd = new SqlCommand("registration", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", person.Name);
                        cmd.Parameters.AddWithValue("@Email", person.Email);
                        cmd.Parameters.AddWithValue("@Password", person.Password);
                        cmd.Parameters.AddWithValue("@isAdmin", person.isAdmin);

                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        conn.Close();

                        msg = rowsAffected > 0 ? "Added Successfully" : "Error: No rows were affected.";
                    }
                }
            }
            catch (Exception error)
            {
                msg = error.Message;
            }
            return new JsonResult(msg);
        }

        //----------------------------------------------- Login ---------------------------------
        [HttpPost("login")]
        public JsonResult Login(Person person)
        {
            string msg = string.Empty;
            try
            {
                string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
                using (SqlConnection conn = new SqlConnection(sqlDataSource))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter("personlogin", conn))
                    {
                        adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                        adapter.SelectCommand.Parameters.AddWithValue("@Email", person.Email);
                        adapter.SelectCommand.Parameters.AddWithValue("@Password", person.Password);

                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        msg = dataTable.Rows.Count > 0
                            ? "Email and password are correct!"
                            : "Email or password are incorrect!";
                    }
                }
            }
            catch (Exception error)
            {
                msg = error.Message;
            }
            return new JsonResult(msg);
        }
    }
}
