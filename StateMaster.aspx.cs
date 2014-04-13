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

public partial class StateMaster : System.Web.UI.Page
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
        str = "Select max(StateId) from StateMaster";
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
        LBStatus.Text = "New State";
       

    }
    protected void GridViewState_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        int num;
        num = genno();

        if (Convert.ToInt16(ViewState["id"]) == -1)
        {
            str = "insert into StateMaster (StateId,StateName,Countryid) values(" + num + ",'" + TxtStateName.Text + "'," + ddlCountry.SelectedItem.Value + ")";
        }
        else
        {
            str = "update StateMaster set StateName ='" + TxtStateName.Text + "', " + " Countryid=" + ddlCountry.SelectedItem.Value + " where StateId = " + Convert.ToInt16(ViewState["id"]);
       
        }
        cmd = new SqlCommand(str, conn);
        //cmd = new SqlCommand(str,conn);
        conn.Open();

        cmd.ExecuteNonQuery();
        conn.Close();
        // Mv.ActiveViewIndex = 1;
        mv.ActiveViewIndex = 1;
        GridViewState.DataBind();

    }
    protected void GridViewState_SelectedIndexChanged1(object sender, EventArgs e)
    {
        ViewState["id"] = GridViewState.SelectedRow.Cells[2].Text;
       
        LBStatus.Text = "Edit State";
        mv.ActiveViewIndex = 0;
        TxtStateName.Text = GridViewState.SelectedRow.Cells[3].Text;
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        mv.ActiveViewIndex = 1;
       
        TxtStateName.Text = "";

    }


 

}
