using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLyTaiKhoanKhachHang :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userAdmin"] == null)
        {
            Response.Redirect("DangNhapAdmin.aspx");
        }
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        Label_error.ForeColor = Color.Red;
        Label_thongbao.ForeColor = Color.Red;

        if (GridView_dskhachhang.Rows.Count <= 0)
        {
            Label_thongbao.Text = "Danh sách tài khoản khách hàng trống!";
        }
        else
        {
            Label_thongbao.Text = "";
        }
    }

    protected void Button_them_Click(object sender, EventArgs e)
    {
        SqlDataSource_dskhachhang.InsertParameters["TenDangNhap"].DefaultValue = TextBox_tendn.Text;
        SqlDataSource_dskhachhang.InsertParameters["MatKhau"].DefaultValue = TextBox_matkhau.Text;
        SqlDataSource_dskhachhang.InsertParameters["HoTen"].DefaultValue = TextBox_hoten.Text;
        SqlDataSource_dskhachhang.InsertParameters["DiaChi"].DefaultValue = TextBox_diachi.Text;
        SqlDataSource_dskhachhang.InsertParameters["SoDT"].DefaultValue = TextBox_sodt.Text;
        SqlDataSource_dskhachhang.InsertParameters["admin"].DefaultValue = "0";
        SqlDataSource_dskhachhang.InsertParameters["tinhtrang"].DefaultValue = "1";
        try
        {
            SqlDataSource_dskhachhang.Insert();
        }
        catch (Exception)
        {
            Label_error.Text = "Có lỗi xảy xa khi thêm tài khoản khách hàng!";
            return;
        }

        TextBox_tendn.Text = "";
        TextBox_matkhau.Text = "";
        TextBox_hoten.Text = "";
        TextBox_diachi.Text = "";
        TextBox_sodt.Text = "";
        Label_error.Text = "Thêm tài khoản khách hàng thành công!";
        GridView_dskhachhang.DataBind();

        if (GridView_dskhachhang.Rows.Count <= 0)
        {
            Label_thongbao.Text = "Danh sách tài khoản khách hàng trống!";
        }
        else
        {
            Label_thongbao.Text = "";
        }
    }

    protected void GridView_dskhachhang_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Label_error.Text = "";
        SqlDataSource_dskhachhang.UpdateParameters["admin"].DefaultValue = "0";
    }

    protected void GridView_dskhachhang_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        GridView_dskhachhang.DataBind();

        if (GridView_dskhachhang.Rows.Count <= 0)
        {
            Label_thongbao.Text = "Danh sách tài khoản khách hàng trống!";
        }
        else
        {
            Label_thongbao.Text = "";
        }

        if (e.Exception != null)
        {
            Label_error.Text = "Có lỗi xảy ra khi xoá tài khoản khách hàng!";
            e.ExceptionHandled = true;
        }
    }

    protected void GridView_dskhachhang_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridView_dskhachhang.DataBind();

        if (GridView_dskhachhang.Rows.Count <= 0)
        {
            Label_thongbao.Text = "Danh sách tài khoản khách hàng trống!";
        }
        else
        {
            Label_thongbao.Text = "";
        }

        if (e.Exception != null)
        {
            Label_error.Text = "Có lỗi xảy ra khi sửa tài khoản khách hàng!";
            e.ExceptionHandled = true;
        }
    }
}