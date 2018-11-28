using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DangNhapAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)sqlTaiKhoan.Select(DataSourceSelectArguments.Empty);
        int num = dv.Count;
        
        if (num > 0)
        {
            DataTable tb = dv.ToTable();
            DataRow row = tb.Rows[0];
            string name = (string)row[2];
            Session.Add("tenAdmin", name);

            Account account = new Account();
            account.Username = txtUername.Text;
            account.Password = txtPassword.Text;
            Session.Add("userAdmin", account);
            Response.Redirect("TrangchuAdmin.aspx");
        }
        else
        {
            Response.Redirect("DangNhapAdmin.aspx");
        }
    }
}