using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userAdmin"] == null)
        {
            btnDangNhap.Visible = true;
            btnDangXuat.Visible = false;
            lblThongTin.Visible = false;
        }
        else
        {
            lblThongTin.Text = "Xin chào " + Session["tenAdmin"];
            btnDangXuat.Visible = true;
            btnDangNhap.Visible = false;
            lblThongTin.Visible = true;
        }
    }

    protected void btnDangXuat_Click(object sender, EventArgs e)
    {
        Session.Remove("userAdmin");
        Response.Redirect("TrangchuAdmin.aspx");
    }
}
