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
public partial class PackageMaster : System.Web.UI.Page
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
        str = "Select max(PackageId) from PackageMaster";
        cmd = new SqlCommand(str, conn);
        conn.Open();
        num = Convert.ToInt16(cmd.ExecuteScalar());
        conn.Close();
        return (num + 1);


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        ViewState["id"] = -1;
        LBStatus.Text = "New Package";
        txtCost.Text = "";
        txtNoofDays .Text ="";
        txtPackageDetail.Text = "";
        txtPackageImg.Text = "";
        txtPackageName.Text = "";
        ddlPType.SelectedValue = "Select";
        MultiView1.ActiveViewIndex = 0;

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        int num;
        num = genno();

        if (Convert.ToInt16(ViewState["id"]) == -1)
        {
            str = "insert into PackageMaster (PackageId,PackageName,PackageImage,Cost,NoofDays,PackageDetail,PackageType) values(" + num + ",'" + txtPackageName.Text + "','" + txtPackageImg.Text + "'," + Convert .ToInt32 (txtCost.Text) + " , '" + txtNoofDays .Text + "' , '" + txtPackageDetail .Text + "','" + ddlPType .SelectedValue + "' ) ";
            
        }
        else
        {
            str = "update PackageMaster set PackageName ='" + txtPackageName.Text + "'," + "PackageImage = '" + txtPackageImg.Text + "'," + " Cost = " + num + " , NoofDays = '" + txtNoofDays .Text  + "' , PackageDetail = '" + txtPackageDetail .Text + "' , PackageType = '" + ddlPType .SelectedValue + "'  where PackageId = " + Convert.ToInt16(ViewState["id"]) + " ";
            
        }
        cmd = new SqlCommand(str, conn);

        conn.Open();

        cmd.ExecuteNonQuery();
        conn.Close();

        MultiView1.ActiveViewIndex = 1;
        GridView1.DataBind();

    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        

        txtCost.Text = "";
        txtNoofDays.Text = "";
        txtPackageDetail.Text = "";
        txtPackageImg.Text = "";
        txtPackageName.Text = "";
        ddlPType.SelectedValue = "Select";
        MultiView1.ActiveViewIndex = 1;

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["id"] = GridView1.SelectedRow.Cells[2].Text;
        
        LBStatus.Text = "Edit Package";
        MultiView1.ActiveViewIndex = 0;
        txtPackageName.Text = GridView1.SelectedRow.Cells[3].Text;
        txtPackageImg.Text = GridView1.SelectedRow.Cells[4].Text;
        txtCost.Text = GridView1.SelectedRow.Cells[5].Text;
        txtNoofDays.Text = GridView1.SelectedRow.Cells[6].Text;
        txtPackageDetail.Text = GridView1.SelectedRow.Cells[7].Text;
        ddlPType.SelectedValue = GridView1.SelectedRow.Cells[8].Text;
    }
   
}
