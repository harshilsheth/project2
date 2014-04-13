using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
using System.Web.Security;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class CountryMaster : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    protected void btnNewCountry_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        LBStatus.Text = "New Country";
        TBName.Text = "";
        ViewState["Id"] = -1;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["Id"] = GridView1.SelectedRow.Cells[2].Text;
        TBName.Text = GridView1.SelectedRow.Cells[3].Text;
        LBStatus.Text = "Edit Country";
        MultiView1.ActiveViewIndex = 0;
    }
    protected void BtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
   
    protected int genno()
    {
        string str;
        int rno;
        str = "Select max(Countryid) from CountryMaster";
        cmd = new SqlCommand(str, conn);
        conn.Open();
        rno = Convert.ToInt16(cmd.ExecuteScalar());
        conn.Close();
        return (rno + 1);
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
     
    
        string str;
        int num;
        num = genno();
        if (Convert.ToInt16(ViewState["Id"]) == -1)
            str = "Insert into CountryMaster(CountryId,Countryname) Values(" + num + ",'" + TBName.Text + "')";
        else
            str = "Update CountryMaster set CountryName = '" + TBName.Text + "'" + " where Countryid = " + Convert.ToInt16(ViewState["Id"]);
        cmd = new SqlCommand(str, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        MultiView1.ActiveViewIndex = 1;
        GridView1.DataBind();

    }
}
