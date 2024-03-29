using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace research_project
{
    public partial class adminform : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-GEEG7J7;Initial Catalog=encrypt;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM user_tb ORDER BY serial ASC", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                user.DataSource = dtbl;
                user.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                user.DataSource = dtbl;
                user.DataBind();
                user.Rows[0].Cells.Clear();
                user.Rows[0].Cells.Add(new TableCell());
                user.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                user.Rows[0].Cells[0].Text = "No Data Found ..!";
                user.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void user_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO user_tb (fname,lname,email,contact,username,pass) VALUES (@fname,@lname,@email,@contact,@username,@pass)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                       // sqlCmd.Parameters.AddWithValue("@serial", (user.FooterRow.FindControl("txtserialFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@fname", (user.FooterRow.FindControl("txtFirstNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@lname", (user.FooterRow.FindControl("txtLastNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@email", (user.FooterRow.FindControl("txtemailFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@contact", (user.FooterRow.FindControl("txtContactFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@username", (user.FooterRow.FindControl("txtusernameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@pass", (user.FooterRow.FindControl("txtpassFooter") as TextBox).Text.Trim());

                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                        lblSuccessMessage.Text = "New Record Added";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void user_RowEditing(object sender, GridViewEditEventArgs e)
        {
            user.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void user_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            user.EditIndex = -1;
            PopulateGridview();
        }

        protected void user_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE user_tb SET fname=@fname,lname=@lname,email=@email,contact=@contact,username=@username,pass=@pass WHERE serial = @serial";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@serial", (user.Rows[e.RowIndex].FindControl("txtserial") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@fname", (user.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@lname", (user.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@email", (user.Rows[e.RowIndex].FindControl("txtemail") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@contact", (user.Rows[e.RowIndex].FindControl("txtContact") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@username", (user.Rows[e.RowIndex].FindControl("txtusername") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@pass", (user.Rows[e.RowIndex].FindControl("txtpass") as TextBox).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    user.EditIndex = -1;
                    PopulateGridview();
                    lblSuccessMessage.Text = "Selected Record Updated";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void user_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM user_tb WHERE serial = @serial";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@serial", Convert.ToInt32(user.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    lblSuccessMessage.Text = "Selected Record Deleted";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void user_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void logoutbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginform.aspx");
        }
    }
}