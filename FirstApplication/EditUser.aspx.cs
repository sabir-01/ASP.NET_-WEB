using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace FirstApplication
{
    public partial class EditUser : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id;
                if (int.TryParse(Request.QueryString["id"], out id))
                {
                    LoadStudent(id);
                }
            }
        }

        private void LoadStudent(int id)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT Name, Email, Department, Phone FROM Students WHERE Id=@Id", conn);
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtName.Text = dr["Name"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    ddlDepartment.Text = dr["Department"].ToString();
                    txtPhone.Text = dr["Phone"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {


         int id = Convert.ToInt32(Request.QueryString["id"]);

            // Get values from UI
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string gender = rdoMale.Checked ? "Male" : rdoFemale.Checked ? "Female" : "";
            string dob = txtDOB.Text.Trim();
            string department = ddlDepartment.SelectedValue;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(@"
            UPDATE Students
            SET Name = @Name,
                Email = @Email,
                Password = @Password,
                Phone = @Phone,
                Gender = @Gender,
                DOB = @DOB,
                Department = @Department
            WHERE Id = @Id", conn);

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@DOB", dob);
                cmd.Parameters.AddWithValue("@Department", department);
                cmd.Parameters.AddWithValue("@Id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Redirect back to dashboard after update
            Response.Redirect("Dashboard.aspx");
        }


    }
}