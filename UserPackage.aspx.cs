using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPackage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Date"] = DateTime.Today;
        
    }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lbl;
        lbl = (Label)e.Item.FindControl("lblPId");
        Response.Redirect("PackageDetail.aspx?id=" +lbl.Text);
    }
    }
    

