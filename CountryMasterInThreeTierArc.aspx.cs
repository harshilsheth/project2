using System;
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

public partial class CountryMasterInThreeTierArc : System.Web.UI.Page
{
    Country clsCountry = new Country();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    private void BindData()
    {
        grvCountry.DataSource = clsCountry.SelectCountry();
        grvCountry.DataBind();
    }
    protected void grvCountry_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "RowEdit")
            {
                DataRow dr = clsCountry.SelectCountryById(int.Parse(e.CommandArgument.ToString()));
                TBName.Text = dr["CountryName"].ToString();
                lblHid.Text = dr["CountryId"].ToString();
                BtnSave.Text = "Update";
                MultiView1.ActiveViewIndex = 0;
            }
            else if (e.CommandName == "RowDelete")
            {
                if (clsCountry.DeleteCountry(int.Parse(e.CommandArgument.ToString())))
                {
                    lblMsg.Text = "Deleted.";
                    BindData();
                }
                else
                {
                    lblMsg.Text = "Failed to Delete.";
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }


    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        TBName.Text = "";
        BtnSave.Text = "Save";

    }
    protected void btnNewCountry_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        LBStatus.Text = "New Country";
        TBName.Text = "";
        ViewState["Id"] = -1;

    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (BtnSave.Text == "Save")
        {
            clsCountry.InsertCountry(TBName.Text);
            BindData();
            MultiView1.ActiveViewIndex = 1;
        }
        else if (BtnSave.Text == "Update")
        {
            int CountryId;
            string CountryName;
            CountryId = int.Parse(lblHid.Text);
            CountryName = TBName.Text;
            try
            {
                if (clsCountry.UpdateCountry(CountryId, CountryName))
                {
                    TBName.Text = "";
                    BtnSave.Text = "Save";
                    lblMsg.Text = "Sucessfully Updated...";
                    BindData();
                    MultiView1.ActiveViewIndex = 1;
                }

            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }




        }
    }
}