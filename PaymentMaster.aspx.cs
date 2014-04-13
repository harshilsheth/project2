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


public partial class PaymentMaster : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    }
    protected int genno()
    {
        int num;
        string str;
        str = "Select max(PaymentId) from PaymentMaster";
        cmd = new SqlCommand(str, conn);
        conn.Open();
        num = Convert.ToInt16(cmd.ExecuteScalar());
        conn.Close();
        return (num + 1);


    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string str;
        int num;
        num = genno();
        str = "insert into PaymentMater (PaymentId,TourId,Username,Paymode,Amount) values(" + num + "," + DDLtourid.SelectedItem.Value + ",'" + ddlUName.SelectedItem.Text  + "','" + Rblmode.Text + "','" + TxtAmount.Text + "')";
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("AdminHome.aspx");


    }


    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }
}
