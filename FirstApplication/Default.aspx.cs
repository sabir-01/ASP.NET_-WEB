using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;



namespace FirstApplication
{
    public partial class Default : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
        }

        void clear()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Email, Password FROM Students WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@Email", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim()); // Optional: hash this for security

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // User found
                        Session["user"] = txtUsername.Text;
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        // No match
                        lblMessage.Text = "Invalid email or password.";
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
                finally
                {
                    conn.Close();
                }


            }
            }
        }
}
