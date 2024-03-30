using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
//using System.Windows;
using System.Data;

namespace research_project
{
    public partial class Loginform : System.Web.UI.Page
    {
        bool userflag, passflag = false;

        SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-GEEG7J7;Initial Catalog=encrypt;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsPostBack)
            //{
            //    if (Session["LoginId"] == null)
            //        Response.Redirect("loginpage.aspx");
            //    else
            //    {
            //        Response.ClearHeaders();
            //        Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            //        Response.AddHeader("Pragma", "no-cache");
            //    }
            //}
        }
        protected void Login_Click1(object sender, EventArgs e)
        {
            Session["uname"] = null;

            if (text1.Text == "admin")
            {
                if (text2.Text == "admin")
                {
                    Session["uname"] = "Admin";
                    Response.Redirect("adminform.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "USERNAME/PASSWORD INCORRECT!" + "');", true);

                }
            }

            else if (text1.Text != "admin")
            {
                userflag = passflag = false;
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from [user]";
                cmd.Connection = sqlcon;
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    if (rd[5].ToString() == text1.Text && rd[6].ToString() == text2.Text)
                    {

                        userflag = true;
                        passflag = true;


                    }
                    if (userflag == true && passflag == true)
                    {
                        Session["uname"] = rd[1] + " " + rd[2].ToString();
                        Response.Redirect("home.aspx");
                    }
                }
                rd.Close();
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "USERNAME/PASSWORD INCORRECT!" + "');", true);
        }
    }
}