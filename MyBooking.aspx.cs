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

public partial class MyBooking : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    string str;
        protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        str = " select Count(*) from Booking ";
        cmd = new SqlCommand(str, conn);
        conn.Open();
        hfId.Value = cmd.ExecuteScalar().ToString ();
        conn.Close();
    }
}
