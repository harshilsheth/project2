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
using System.Text;
using System.Net.Mail;
using System.Data.SqlClient;
public partial class UserForgetPassword : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        string str, pwd;
        if (chkuser() == 0)
            lblstatus.Text = "Invalid User ";
        else
        {
            str = "Select Password from Login where UserName = '" + txtusername.Text + "'";
            cmd = new SqlCommand(str, conn);
            conn.Open();
            pwd = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();
            lblstatus.Text = pwd;
            MailMessage msg = new MailMessage();
            msg.To.Add("'" + TxtEmail.Text + "'");
            msg.From = new MailAddress("harshilact@gmail.com");
            msg.Subject = "password recovery mail";
            StringBuilder sb = new StringBuilder();
            sb.Append("<table border = 1> <tr> <td colspan = 2> <b> message from admin </b> </td> </tr> <tr> <td>");
            sb.Append("your user name = ");
            sb.Append(txtusername.Text);
            sb.Append("</br>");
            sb.Append("your password= ");
            sb.Append(pwd);
            sb.Append("</br>");
            sb.Append("</td> </tr> </table>");
            msg.IsBodyHtml = true;
            msg.Body = sb.ToString();
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Credentials = new System.Net.NetworkCredential("harshilact@gmail.com", "actcomputer");
            smtp.Send(msg);
            lblstatus.Text = "mail send";

        }
    }
    protected int chkuser()
    {
        int cnt = 0;
        cmd = new SqlCommand("Select count(*) from login where UserName = '" + txtusername.Text + "'", conn);
        conn.Open();
        cnt = Convert.ToInt16(cmd.ExecuteScalar());
        conn.Close();
        return (cnt);
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserHome.aspx");
    }
}
