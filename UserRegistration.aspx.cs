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


public partial class UserRegistration : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection conn;
    SqlDataAdapter Adp;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        if (IsPostBack == false)
            CapturImg();
    }
    protected void BtnChangeImg_Click(object sender, EventArgs e)
    {
        CapturImg();

    }
    protected void CapturImg()
    {
        Random ran = new Random();
        int i;
        i = ran.Next(1, 5);
        string str;
        str = "Select * from Securityimg where Id =" + i;
        cmd = new SqlCommand(str, conn);
        Adp = new SqlDataAdapter(cmd);
        ds = new DataSet();
        Adp.Fill(ds);
        ImgCaptch.ImageUrl = ds.Tables[0].Rows[0][1].ToString();
        ViewState["code"] = ds.Tables[0].Rows[0][0].ToString();

    }

    protected void BtnReg_Click(object sender, EventArgs e)
    {
        if (CB1Accept.Checked)
        {
            string str, chk;
            str = "select Ans from Securityimg  where Id = " + Convert.ToInt16(ViewState["code"]);
            cmd = new SqlCommand(str, conn);
            conn.Open();
            chk = cmd.ExecuteScalar().ToString();
            conn.Close();
            if (TBAns.Text == chk)
            {
                str = "insert into Registration (Firstname,Lastname,Countryid,Stateid,Cityid,Username,Password,Emailid) values( '" + TBFName.Text + "','" + TBLName.Text + "'," + DDLCountry.SelectedItem.Value + "," + DDLState.SelectedItem.Value + "," + DDLCity.SelectedItem.Value + ",'" + TBUName.Text + "','" + TBpass.Text + "','" + TBEmail.Text + "')";
                cmd = new SqlCommand(str, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("UserHome.aspx");
            }
            else
                status.Text = "Invalid Code";
        }
        else
            status.Text = "Please accept the terms and conditions";


    }

    protected void TBUName_TextChanged(object sender, EventArgs e)
    {
        int num;
        string str;
        str = "Select count(*) from Registration where Username = '" + TBUName.Text + "'";
        cmd = new SqlCommand(str, conn);
        conn.Open();
        num = Convert.ToInt16(cmd.ExecuteScalar());
        conn.Close();
        if (num == 0)
        {
            LBAvail.Text = "Valid UserName";
            LBAvail.ForeColor = System.Drawing.Color.DarkSlateBlue ;
        }
        else
        {
            LBAvail.Text = "InValid UserName";
            LBAvail.ForeColor = System.Drawing.Color.Red;
        }
    }
}
