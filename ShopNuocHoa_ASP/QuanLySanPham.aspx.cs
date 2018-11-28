using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLySanPham :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userAdmin"] == null)
        {
            Response.Redirect("DangNhapAdmin.aspx");
        }
    }
}