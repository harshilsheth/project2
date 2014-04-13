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

public partial class ChangePassword : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    protected void Btnsave_Click(object sender, EventArgs e)
    {
        string str;
        str = "update Registration set Password ='" + Txtconfirm.Text + "' where Username ='" + txtusername.Text + "' and Password = '" + Txtoldpass.Text + "'";
        cmd = new SqlCommand(str, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("UserHome.aspx");
    }
    protected void Btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Userlogin.aspx");
    }
}
