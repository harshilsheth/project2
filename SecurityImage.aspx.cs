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


public partial class SecurityImage : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ViewState["Id"] = -1;
        txtAns.Text = "";
        mvSecurityImage.ActiveViewIndex = 1;

    }
    protected void gvSecurityImage_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["Id"] = gvSecurityImage.SelectedRow.Cells[2].Text;
        txtAns.Text = gvSecurityImage .SelectedRow .Cells [4].Text;
        mvSecurityImage.ActiveViewIndex = 1;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(ViewState["Id"]) == -1)
        {
            str = "insert into Securityimg (ImgPath,Ans) values ('" + ("~/Image/Code/" + fuImagePath.FileName) + "','" + txtAns.Text + "')";
            cmd = new SqlCommand(str, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        else
        {
            str = "update Securityimg set ImgPath = '" + ("~/Image/Code/" + fuImagePath.FileName) + "',Ans='" + txtAns.Text + "' where Id = " + Convert.ToInt32(ViewState["Id"]) + " ";
            cmd = new SqlCommand(str, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        gvSecurityImage.DataBind();
        mvSecurityImage .ActiveViewIndex =0;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        
        txtAns.Text = "";
        mvSecurityImage.ActiveViewIndex = 0;
    }
}
