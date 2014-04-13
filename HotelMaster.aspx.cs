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

public partial class HotelMaster : System.Web.UI.Page
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
        str = "Select max(HotelId) from HotelMaster";
        cmd = new SqlCommand(str, conn);
        conn.Open();
        num = Convert.ToInt16(cmd.ExecuteScalar());
        conn.Close();
        return (num + 1);


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        ViewState["id"] = -1;
        LBStatus.Text = "New Hotel";


    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        int num;
        num = genno();

        if (Convert.ToInt16(ViewState["id"]) == -1)
        {
            str = "insert into HotelMaster (HotelId,HotelName,RoomCharge,CityId) values(" + num + ",'" + txtHotelName.Text + "','" + txtRoomCharge.Text + "'," + ddlcity.SelectedItem.Value + ")";

        }
        else
        {
            str = "update HotelMaster set HotelName ='" + txtHotelName.Text + "'," + "RoomCharge = '" + txtRoomCharge.Text + "'," + " CityId = " + ddlcity.SelectedItem .Value  +" where HotelId = " + Convert.ToInt16(ViewState["id"]);
            Label1.Text = "str";
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
        MultiView1.ActiveViewIndex = 1;

        txtHotelName.Text = "";

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["id"] = GridView1.SelectedRow.Cells[2].Text;
        Label1.Text = "str";
        LBStatus.Text = "Edit Hotel";
        MultiView1.ActiveViewIndex = 0;
        txtHotelName.Text = GridView1.SelectedRow.Cells[3].Text;
        txtRoomCharge.Text = GridView1.SelectedRow.Cells[4].Text;
         
    }
}
