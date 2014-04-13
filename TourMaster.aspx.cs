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

public partial class TourMaster : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection conn;
    string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
   

    protected void  BtnSave_Click(object sender, EventArgs e)
    {

        if ((Convert.ToInt32(ViewState["Id"])) == -1)
        {
            str = "Insert into TourMaster(PackageId,TourDate,TotalSeats,SeatsRemaining,IsActivated) Values(" + Convert.ToInt32(ddlPackageId.SelectedValue) + ",'" + Convert.ToDateTime(Txtdate.Text) + "'," + Convert.ToInt32(Txtavailable.Text) + "," + Convert.ToInt32(Txtoccupied.Text) + ",'" + DropDownList1.SelectedValue + "')";
        }
        else
        {
            str = "update TourMaster set PackageId = " + Convert.ToInt32(ddlPackageId.SelectedValue) + ", TourDate = '" + Convert.ToDateTime(Txtdate.Text) + "', TotalSeats = " + Convert.ToInt32(Txtavailable.Text) + ", SeatsRemaining = " + Convert.ToInt32(Txtoccupied.Text) + ", IsActivated = '" + DropDownList1.SelectedValue + "' where TourId = " + Convert.ToInt32(ViewState["Id"]) + " ";
        }
         
        cmd = new SqlCommand(str, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvTourMaster.DataBind();
        mvTourMaster.ActiveViewIndex = 1;
        
     }
    protected void ImgBtn_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Txtdate.Text  = Calendar1.SelectedDate.ToString();
            
         Calendar1 .Visible  = false; 
    }
    protected void Btncancel_Click(object sender, EventArgs e)
    {
        
        Txtavailable.Text = "";
        Txtoccupied.Text = "";
        Txtdate.Text = "";
        mvTourMaster.ActiveViewIndex = 1;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ViewState["Id"] = -1;
        
        Txtavailable.Text = "";
        Txtoccupied.Text = "";
        Txtdate.Text = "";
        mvTourMaster.ActiveViewIndex = 0;
    }
    protected void gvTourMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["Id"] = Convert .ToInt32 (gvTourMaster.SelectedRow.Cells[2].Text);
        //ddlPackageId.SelectedValue = gvTourMaster.SelectedRow.Cells[3].Text;
        
        Txtavailable.Text = gvTourMaster.SelectedRow.Cells[5].Text;
        Txtoccupied.Text = gvTourMaster.SelectedRow.Cells[6].Text;
        Txtdate.Text = gvTourMaster.SelectedRow.Cells[4].Text;
        //DropDownList1.SelectedValue = gvTourMaster.SelectedRow.Cells[8].Text;
        mvTourMaster.ActiveViewIndex = 0;
    }
}
