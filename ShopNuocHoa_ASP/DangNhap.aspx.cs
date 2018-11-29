using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)sqlDsAccount.Select(DataSourceSelectArguments.Empty);
        int num = dv.Count;
        if(num > 0)
        {
            DataTable tb = dv.ToTable();
            DataRow row = tb.Rows[0];
            string name = (string)row[2];

            Account account = new Account();
            account.Username = txtUername.Text;
            account.Password = txtPassword.Text;
            account.HoTen = name;
            account.DiaChi = (string)row[3];
            account.SoDT = (string)row[4];

            Session.Add("tenUser", name);
            Session.Add("user", account);
            Response.Redirect("Trangchu.aspx");
        }
        else
        {
            Response.Redirect("DangNhap.aspx");
        }
    }
}