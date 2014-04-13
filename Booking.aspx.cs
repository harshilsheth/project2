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
public partial class Booking : System.Web.UI.Page
{
    SqlConnection Conn;
    SqlCommand Cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        Conn  = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    }
   


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Add")
        {
            String strName = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text;

            string strAge =((TextBox)GridView1.FooterRow.FindControl("txtAge")).Text;

            string strSex = ((TextBox)GridView1.FooterRow.FindControl("txtSex")).Text;
            //SqlDataSource1.InsertParameters.Clear();
            //SqlDataSource1.InsertParameters.Add
            //("FirstName", strFirstName);
            //SqlDataSource1.InsertParameters.Add
            //("LastName", strLastName);
            //SqlDataSource1.InsertParameters.Add
            //("Department", strDepartment);
            //SqlDataSource1.InsertParameters.Add
            //("Location", strLocation);

            SqlDataSource1.InsertParameters["Name"].DefaultValue = strName;
            SqlDataSource1.InsertParameters["Age"].DefaultValue = strAge;
            SqlDataSource1.InsertParameters["Sex"].DefaultValue = strSex;
            SqlDataSource1.Insert();
        }
    }

    protected void SaveNewRecord(object sender, EventArgs e)
    {


        string strName = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text;
        string strAge =((TextBox)GridView1.FooterRow.FindControl("txtAge")).Text;

        string strSex =((TextBox)GridView1.FooterRow.FindControl("txtSex")).Text;
        //SqlDataSource1.InsertParameters.Clear();
        //SqlDataSource1.InsertParameters.Add
        //("FirstName", strFirstName);
        //SqlDataSource1.InsertParameters.Add
        //("LastName", strLastName);
        //SqlDataSource1.InsertParameters.Add
        //("Department", strDepartment);
        //SqlDataSource1.InsertParameters.Add
        //("Location", strLocation);

        SqlDataSource1.InsertParameters["Name"].DefaultValue = strName;
        SqlDataSource1.InsertParameters["Age"].DefaultValue = strAge;
        SqlDataSource1.InsertParameters["Sex"].DefaultValue = strSex;
        SqlDataSource1.Insert();

    }

    protected void InsertRecord()
    {
        
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        int i, j;
        string query;
        Conn.Open();
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            query = "insert into TempBooking (Username,Name,Age,sex) values ('" + TBFName.Text + "','" + GridView1.Rows[i].Cells[1].Text + "'," + Convert.ToInt16(GridView1.Rows[i].Cells[2].Text) + ",'" + GridView1.Rows[i].Cells[3].Text + "')";
        
            Cmd = new SqlCommand(query, Conn);
            Cmd.ExecuteNonQuery();
        }
        Conn.Close(); 
            
                
    }

}
