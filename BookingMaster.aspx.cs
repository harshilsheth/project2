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

public partial class BookingMaster : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    string str;
    SqlDataAdapter adp;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
 
    }
    protected void gvBookingMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["id"] = gvBookingMaster.SelectedRow.Cells[2].Text;
        hfBId.Value = gvBookingMaster.SelectedRow.Cells[2].Text;
        DropDownList1.SelectedValue = gvBookingMaster.SelectedRow.Cells[7].Text;
        lblMassage.Text = "";
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
       int Id = Convert .ToInt32 (gvBookingMaster .SelectedRow .Cells [4].Text );
       int tickets = Convert .ToInt32 (gvBookingMaster .SelectedRow .Cells [5].Text);
       str = "Select SeatsRemaining from TourMaster where TourId = " + Id + " ";
       adp = new SqlDataAdapter(str, conn);
       adp.Fill(ds);
       int seats = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());

        if(DropDownList1 .SelectedValue == "Select")
        {
            lblMassage .Text = "Please Select Yes/No in Is Payment";
        }
        else if (DropDownList1.SelectedValue == "No")
        {
            if (DropDownList1.SelectedValue != gvBookingMaster.SelectedRow.Cells[7].Text)
            {
                str = "update TourMaster set SeatsRemaining = " + (seats + tickets) + "  where  TourId = " + Id + " ";
                cmd = new SqlCommand(str, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                str = "update Booking set PaymentRec = '" + DropDownList1.SelectedValue + "' where BookingId = " + Convert.ToInt32(ViewState["id"]) + " ";
                cmd = new SqlCommand(str, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                gvBookingMaster.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                gvBookingMaster.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
        }
        else
        {
            
            if (tickets > seats)
            {
                lblMassage.Text = " That Much Tickets are Not Available. So you are late to pay. Sorry";
            }
            else
            {
                if (DropDownList1.SelectedValue == "Yes")
                {
                    if (DropDownList1.SelectedValue != gvBookingMaster.SelectedRow.Cells[7].Text)
                    {
                        str = "update TourMaster set SeatsRemaining = " + (seats - tickets) + "  where  TourId = " + Id + " ";
                        cmd = new SqlCommand(str, conn);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        str = "update Booking set PaymentRec = '" + DropDownList1.SelectedValue + "' where BookingId = " + Convert.ToInt32(ViewState["id"]) + " ";
                        cmd = new SqlCommand(str, conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        gvBookingMaster.DataBind();
                        MultiView1.ActiveViewIndex = 0;
                    }
                    else
                    {
                        gvBookingMaster.DataBind();
                        MultiView1.ActiveViewIndex = 0;
                    }
                }
            }


        }
        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedValue = "Select";
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnViewDetail_Click(object sender, EventArgs e)
    {
                                                                                                                            gvTicketDetail.DataBind();
        MultiView1.ActiveViewIndex = 2;
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
}
