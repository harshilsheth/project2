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

public partial class Tour : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Date"] = DateTime.Now;
    }

    protected void rptrTour_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lbl;
        lbl = (Label)e.Item.FindControl("lblPId");
        Response.Redirect("PackageDetail.aspx?id=" +lbl.Text);
    }
}
