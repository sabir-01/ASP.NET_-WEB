using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FirstApplication
{
    public partial class StudentSignup : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string gender = rdoMale.Checked ? "Male" : rdoFemale.Checked ? "Female" : "";
            string dob = txtDOB.Text;
            string department = ddlDepartment.SelectedValue;

            byte[] imageBytes = null;
            if (fuImage.HasFile)
            {
                using (BinaryReader br = new BinaryReader(fuImage.PostedFile.InputStream))
                {
                    imageBytes = br.ReadBytes(fuImage.PostedFile.ContentLength);
                }
            }


            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO Students 
                                (Name, Email, Password, Phone, Gender, DOB, Department, Image) 
                                 VALUES (@Name, @Email, @Password, @Phone, @Gender, @DOB, @Department, @Image)";                
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@DOB", dob);
                cmd.Parameters.AddWithValue("@Department", department);
                cmd.Parameters.AddWithValue("@Image", (object)imageBytes ?? DBNull.Value);

                try
                {
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    lblMessage.CssClass = "text-success";
                    lblMessage.Text = "Student registered successfully!";
                    Response.Redirect("Default.aspx");
                }
                catch (Exception ex)
                {
                    lblMessage.CssClass = "text-danger";
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }

        }
    }
}