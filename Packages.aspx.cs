using System;
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


public partial class Packages : System.Web.UI.Page
{   SqlConnection conn;
    SqlCommand cmd;
    string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    
    
       
    
    protected void Listview1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("PackageDetail.aspx?Id=" + e.CommandArgument.ToString());   
    }
}
