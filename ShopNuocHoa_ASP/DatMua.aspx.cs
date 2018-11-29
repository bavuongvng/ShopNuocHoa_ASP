using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DatMua : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("DangNhap.aspx");
        }
        else
        {
            txtNgayDatHang.Text = DateTime.Now.ToShortDateString();
            Account customer = (Account)Session["user"];
            txtHoTen.Text = customer.HoTen;
            txtDiaChi.Text = customer.DiaChi;
            txtSoDT.Text = customer.SoDT;
            txtTenDangNhap.Text = customer.Username;
        }

    }

    protected void lbtnXacNhan_Click(object sender, EventArgs e)
    {
        SqlDDonHang.InsertParameters["HoTen"].DefaultValue = txtHoTen.Text;
        SqlDDonHang.InsertParameters["SoDT"].DefaultValue = txtSoDT.Text;
        SqlDDonHang.InsertParameters["DiaChi"].DefaultValue = txtDiaChi.Text;
        SqlDDonHang.InsertParameters["NgayDatHang"].DefaultValue = txtNgayDatHang.Text;
        SqlDDonHang.InsertParameters["TenDangNhap"].DefaultValue = txtTenDangNhap.Text;



        try
        {
            SqlDDonHang.Insert();
            Response.Redirect("Trangchu.aspx");
        }
        catch (Exception ex)
        {

        }
    }
}