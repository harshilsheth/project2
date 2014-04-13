using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
public partial class UserLogin : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    protected void Forgetpassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("Userforgetpassword.aspx");
    }
    protected void Save_Click(object sender, EventArgs e)
    {
        int num=0;
        if ((Username.Text == "Admin") && (Password.Text == "123"))
        {
            Session["UserName"] = Username.Text;
            num = 1;
            Response.Redirect("AdminHome.aspx");
        }
        else 
        {

            string str;
            str = "Select id from Registration where Username = '" + Username.Text + "' and Password = '" + Password.Text + "'";
            cmd = new SqlCommand(str, conn);
            conn.Open();
            num = Convert.ToInt16(cmd.ExecuteScalar ());
            conn.Close();
            if (num == 0)
                lblMessage.Text = "Please Do The Registration";
            else
            {
                Session["Username"] = Username.Text;
                Session["UserId"] = num;
                Response.Redirect("UserHome.aspx");
            }
        }
        if (num == 0)
        {
            lblMessage.Text = "Please Do The Registration";
        }
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Username.Text = "";
        Password.Text = "";
        Response.Redirect("UserHome.aspx");
    }

    protected void Changepassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx");
    }
    protected void Newregistration_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserRegistration.aspx");
    }
}
