using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DangKy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDangKy_Click(object sender, EventArgs e)
    {
        sqlTaiKhoan.InsertParameters["TenDangNhap"].DefaultValue = txtUername.Text;
        sqlTaiKhoan.InsertParameters["MatKhau"].DefaultValue = txtPassword.Text;
        sqlTaiKhoan.InsertParameters["HoTen"].DefaultValue = txtHoTen.Text;
        sqlTaiKhoan.InsertParameters["DiaChi"].DefaultValue = txtDiaChi.Text;
        sqlTaiKhoan.InsertParameters["SoDT"].DefaultValue = txtSoDT.Text;
        sqlTaiKhoan.InsertParameters["admin"].DefaultValue = "0";
        sqlTaiKhoan.InsertParameters["tinhTrang"].DefaultValue = "1";
        try
        {
            sqlTaiKhoan.Insert();

            Account account = new Account();
            account.Username = txtUername.Text;
            account.Password = txtPassword.Text;
            account.DiaChi = txtDiaChi.Text;
            account.HoTen = txtHoTen.Text;
            account.SoDT = txtSoDT.Text;

            Session.Add("tenUser", txtHoTen.Text);
            Session.Add("user", account);
            Response.Redirect("Trangchu.aspx");

            lbThongBao.Text = "";

        }
        catch (Exception ex)
        {
            lbThongBao.Text = "Loi " + ex.Message;
        }
    }
}