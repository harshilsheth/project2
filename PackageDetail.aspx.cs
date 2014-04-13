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

public partial class PackageDetail : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    string str;
    SqlDataAdapter adp;
    DataSet ds = new DataSet();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        hfId.Value = Request.QueryString["id"].ToString();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
    }
    protected void btnBookNow_Click(object sender, EventArgs e)
    {
        if (txtNoofTickets .Text == "")
            lblMessage .Text = "Please Enter No. of Tickets";
        else
        {
            if (Session["Username"] != null)
            {
                int Tcost;
                str = "select PackageMaster.Cost,PackageMaster.PackageType,TourMaster.SeatsRemaining FROM PackageMaster INNER JOIN TourMaster ON PackageMaster.PackageId = TourMaster.PackageId where TourMaster.TourId = " + Convert.ToInt32(hfId.Value) + " ";
                adp = new SqlDataAdapter(str, conn);
                adp.Fill(ds);
                string type = ds.Tables[0].Rows[0][1].ToString();
                if (type == "HoneyMoon" && ((Convert.ToInt32(txtNoofTickets.Text) % 2) != 0))
                {
                    lblMessage.Text = " This is Couple Tour So You Must Book Tickets in Couple ";
                }
                else
                {
                    int seats = Convert .ToInt32 (ds.Tables [0].Rows [0][2].ToString ());
                    if (seats < Convert.ToInt32(txtNoofTickets.Text))
                        lblMessage.Text = " That much Tickets are not available";
                    else
                    {
                        Tcost = Convert.ToInt32(ds.Tables[0].Rows [0][0].ToString());
                        Tcost = Tcost * Convert.ToInt32(txtNoofTickets.Text);
                        string str1 = "No";
                        str = "insert into Booking (UserId,TourId,TBook,TotalCost,PaymentRec) values ( " + Convert.ToInt32(Session["UserId"]) + "," + Convert.ToInt32(hfId.Value) + " , " + Convert.ToInt32(txtNoofTickets.Text) + " ," + Tcost + " ,'" + str1 + "')";
                        cmd = new SqlCommand(str, conn);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        str=" select BookingId from Booking where UserId = " + Convert .ToInt32 (Session["UserId"]) + " and TourId = " + Convert .ToInt32 (hfId .Value ) + " ";
                        adp = new SqlDataAdapter (str,conn );
                        ds= new DataSet ();
                        adp.Fill (ds);
                        for(int i = 1; i<=Convert.ToInt32 (txtNoofTickets .Text ) ; i++)
                        {
                            str = " insert into BookingDetail (BookingId) values ( " + Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + ") ";
                            cmd = new SqlCommand(str, conn);
                            cmd.ExecuteNonQuery();
                        }
                        hfBId .Value  = ds.Tables [0].Rows [0][0].ToString ();
                        conn.Close();
                        gvTicketDetail.DataBind();
                        mvPackageDetail.ActiveViewIndex = 1;
                            
                        

                    }
                }
            }
            else
                Response.Redirect("UserLogin.aspx");
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyBooking.aspx");
    }
    
}
