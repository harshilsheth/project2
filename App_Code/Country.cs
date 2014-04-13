using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient; 

/// <summary>
/// Summary description for Country
/// </summary>
public class Country
{    SqlConnection con;
    SqlDataAdapter adp;
    DataSet ds;
    SqlCommand cmd;
	public Country()
	{
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
	}
    public bool InsertCountry(string CountryName)
    {
        //string query = "Insert Into CountryMaster (CountryName) Values("+CountryName+ ")";
        cmd = new SqlCommand("InsertCountry", con);
        cmd.Parameters.AddWithValue("@countryName", CountryName);
        cmd.CommandType = CommandType.StoredProcedure;

        con.Open();
        int res = cmd.ExecuteNonQuery();
        con.Close();
        if (res > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public DataTable SelectCountry()
    {
        cmd = new SqlCommand("SelectCountry", con);
        cmd.CommandType = CommandType.StoredProcedure;
        adp = new SqlDataAdapter(cmd);
        ds = new DataSet();
        adp.Fill(ds);
        if (ds != null && ds.Tables.Count > 0)
        {
            return ds.Tables[0];
        }
        else
        {
            return null;
        }
    }
    public DataRow SelectCountryById(int CountryId)
    {
        cmd = new SqlCommand("SelectCountryById", con);
        cmd.Parameters.AddWithValue("@CountryId", CountryId);
        cmd.CommandType = CommandType.StoredProcedure;
        adp = new SqlDataAdapter(cmd);
        ds = new DataSet();
        adp.Fill(ds);
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0];
        }
        else
        {
            return null;
        }
    }
    public bool UpdateCountry(int CountryId, String CountryName)
    {
        cmd = new SqlCommand("UpdateCountry", con);
        cmd.Parameters.AddWithValue("@CountryId", CountryId);
        cmd.Parameters.AddWithValue("@CountryName", CountryName);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        int res = cmd.ExecuteNonQuery();
        con.Close();
        if (res > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public bool DeleteCountry(int CountryId)
    {
        cmd = new SqlCommand("DeleteCountryById", con);
        cmd.Parameters.AddWithValue("@CountryId", CountryId);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        int res = cmd.ExecuteNonQuery();
        con.Close();
        if (res > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }


}
