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

public partial class CityMaster : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    string str;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    protected int genno()
    {
        int num;
        string str;
        str = "Select max(CityId) from CityMaster";
        cmd = new SqlCommand(str, conn);
        conn.Open();
        num = Convert.ToInt16(cmd.ExecuteScalar());
        conn.Close();
        return (num + 1);


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mv.ActiveViewIndex = 0;
        ViewState["id"] = -1;
        LBStatus.Text = "New City";
        

    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        int num;
        num = genno();

        if (Convert.ToInt16(ViewState["id"]) == -1)
        {
            str = "insert into CityMaster (CityId,CityName,StateId) values(" + num + ",'" + txtCityName.Text + "'," + ddlState.SelectedItem.Value + ")";
        }
        else
        {
            str = "update CityMaster set CityName ='" + txtCityName.Text + "', " + " StateId=" + ddlState.SelectedItem.Value + " where CityId = " + Convert.ToInt16(ViewState["id"]);
            
        }
        cmd = new SqlCommand(str, conn);
        //cmd = new SqlCommand(str,conn);
        conn.Open();

        cmd.ExecuteNonQuery();
        conn.Close();
        // Mv.ActiveViewIndex = 1;
        mv.ActiveViewIndex = 1;
        GridViewCity.DataBind();

    }
    protected void GridViewCity_SelectedIndexChanged1(object sender, EventArgs e)
    {
        ViewState["id"] = GridViewCity.SelectedRow.Cells[2].Text;
        
        LBStatus.Text = "Edit City";
        mv.ActiveViewIndex = 0;
        txtCityName.Text = GridViewCity.SelectedRow.Cells[3].Text;
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        mv.ActiveViewIndex = 1;
        
        txtCityName.Text = "";

    }
}
