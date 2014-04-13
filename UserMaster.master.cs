using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class UserMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            LBmesg.Text = "Welcome " + Convert.ToString(Session["Username"]);
            LinkButton2.Text = "Logout";
            LinkButton1.Visible = false;
            LinkButton1.Enabled = false;
            lbtnViewBooking.Visible = true;
            lbtnViewBooking.Enabled = true;
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] == null )
        {
            Response.Redirect("UserLogin.aspx");
        }
        else
        {
            LBmesg.Text = "";
            Session["Username"] = null;
            LinkButton2.Text = "Login";
            Session.Clear();
            Session.Abandon();
            Response.Redirect("UserHome.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserRegistration.aspx");
    }
    protected void lbtnFamily_Click(object sender, EventArgs e)
    {
        string type = "General";
        Response.Redirect("Tour.aspx?type=" +type );
    }
    protected void lbtnHoneyMoon_Click(object sender, EventArgs e)
    {
        string type = "HoneyMoon";
        Response.Redirect("Tour.aspx?type=" +type );
    }
    protected void lbtnReligious_Click(object sender, EventArgs e)
    {
        string type = "Religious";
        Response.Redirect("Tour.aspx?type=" +type );
    }
    protected void lbtnViewBooking_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewBooking.aspx");
    }
}
