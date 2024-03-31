using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace research_project
{
    public partial class signupform : System.Web.UI.Page

    {

        SqlConnection sqlCon = new SqlConnection("Data Source=DESKTOP-GEEG7J7;Initial Catalog=encrypt;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            suggestbox.Text = GenerateRandomUsername(); 
        }

        public static string GenerateRandomUsername()
        {
            string rv = "";

            char[] lowers = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
            char[] uppers = new char[] { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
            char[] numbers = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

            int l = lowers.Length;
            int u = uppers.Length;
            int n = numbers.Length;

            Random random = new Random();

            rv += lowers[random.Next(0, l)].ToString();
            rv += lowers[random.Next(0, l)].ToString();
            rv += lowers[random.Next(0, l)].ToString();

            rv += uppers[random.Next(0, u)].ToString();
            rv += uppers[random.Next(0, u)].ToString();
            rv += uppers[random.Next(0, u)].ToString();

            rv += numbers[random.Next(0, n)].ToString();
            rv += numbers[random.Next(0, n)].ToString();
            rv += numbers[random.Next(0, n)].ToString();

            return rv;
        }

        protected void submitbutton_Click(object sender, EventArgs e)
        {
            if (passbox.Text == cpassbox.Text)
            {
                lblErrorMessage.Visible = false;
                lblSuccessMessage.Visible = true;
                lblSuccessMessage.Text = "Password Match!";


                sqlCon.Open();

                string query = "INSERT INTO user_tb (fname,lname,email,contact,username,pass) VALUES (@fname,@lname,@email,@contact,@username,@pass)";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@fname", fnamebox.Text);
                sqlCmd.Parameters.AddWithValue("@lname", lnamebox.Text);
                sqlCmd.Parameters.AddWithValue("@email", mailbox.Text);
                sqlCmd.Parameters.AddWithValue("@contact", (DropDownList0.Text + nobox.Text));
                sqlCmd.Parameters.AddWithValue("@username", userbox.Text);
                sqlCmd.Parameters.AddWithValue("@pass", passbox.Text);


                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Data Entered" + "');", true);

            }
            else
            {
                lblSuccessMessage.Visible = false;
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Password not Matched!";
      
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            fnamebox.Text = "";
            lnamebox.Text = "";
            mailbox.Text = "";
            nobox.Text = "";
            mailverifybox.Text = "";
            userbox.Text = "";
            passbox.Text = "";
            cpassbox.Text = "";
        }

        protected void suggestbox_TextChanged(object sender, EventArgs e)
        {
            userbox.Text = suggestbox.Text;
        }

        protected void validitycheck_Click(object sender, EventArgs e)
        {
            DataTable dtbl = new DataTable();
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM user_tb", sqlCon);
                sqlDa.Fill(dtbl);

                if (dtbl.Rows.Count <= 0)
                {
                    validlbl.ForeColor = System.Drawing.Color.Green;
                    validlbl.Text = "Valid";
                }
                else
                {
                    validlbl.ForeColor = System.Drawing.Color.Red;
                    validlbl.Text = "Not Valid";
                }
            }

            sqlCon.Close();
        }
        public static void Email(string htmlString)
        {
            string str="";
            str = Convert.ToString(mailbox.Text);
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("f180252@nu.edu.pk");
                message.To.Add(new MailAddress(str));
                message.Subject = "Test";
                message.IsBodyHtml = true; //to make message body as html  
                message.Body = htmlString;
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("f180252@nu.edu.pk", "03027933808");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            }
            catch (Exception) { }
        }

        protected void submitbutton1_Click(object sender, EventArgs e)
        {
         
           // string htmlString = getHtml(dgStudent); //here you will be getting an html string  
           // Email(htmlString); //Pass html string to Email function.  
       
        //MailMessage mm = new MailMessage();
        //mm.To.Add(new MailAddress("yourwebsitemailchecker@gmail.com", "Request for Verification"));
        //mm.From = new MailAddress("yourwebsitemailid@gmail.com");
        //mm.Body = "<a href="\"http://www.yourwebsitename.com/verificationpage.aspx?custid=" + Session">click here to verify</a> fgdfgdfgdfgdfgdfgdfgfdg";
        //mm.IsBodyHtml = true;
        //mm.Subject = "Verification";
        //SmtpClient smcl = new SmtpClient();
        //smcl.Host = "smtp.gmail.com";
        //smcl.Port = 587;
        //smcl.Credentials = new NetworkCredential("yourwebsitemailid@gmail.com", "yourmailpasswrod");
        //smcl.EnableSsl = true;
        //smcl.Send(mm);
    }
    }
}