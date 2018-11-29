using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLyTaiKhoan :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userAdmin"] == null)
        {
            Response.Redirect("DangNhapAdmin.aspx");
        }
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (GridView_dstaikhoan.Rows.Count <= 0)
        {
            Label_thongbao.Text = "Danh sách tài khoản trống!";
        }
        else
        {
            Label_thongbao.Text = "";
        }
    }

    protected void Button_them_Click(object sender, EventArgs e)
    {
        SqlDataSource_dstaikhoan.InsertParameters["TenDangNhap"].DefaultValue = TextBox_tendn.Text;
        SqlDataSource_dstaikhoan.InsertParameters["MatKhau"].DefaultValue = TextBox_matkhau.Text;
        SqlDataSource_dstaikhoan.InsertParameters["HoTen"].DefaultValue = TextBox_hoten.Text;
        SqlDataSource_dstaikhoan.InsertParameters["DiaChi"].DefaultValue = TextBox_diachi.Text;
        SqlDataSource_dstaikhoan.InsertParameters["SoDT"].DefaultValue = TextBox_sodt.Text;
        if (CheckBox_admin.Checked)
        {
            SqlDataSource_dstaikhoan.InsertParameters["admin"].DefaultValue = "1";
        }
        else
        {
            SqlDataSource_dstaikhoan.InsertParameters["admin"].DefaultValue = "0";
        }

        if (CheckBox_tinhtrang.Checked)
        {
            SqlDataSource_dstaikhoan.InsertParameters["tinhtrang"].DefaultValue = "1";
        }
        else
        {
            SqlDataSource_dstaikhoan.InsertParameters["tinhtrang"].DefaultValue = "0";
        }

        try
        {
            SqlDataSource_dstaikhoan.Insert();
        }
        catch (Exception)
        {
            Label_error.Text = "Có lỗi xảy xa khi thêm tài khoản!";
            return;
        }

        TextBox_tendn.Text = "";
        TextBox_matkhau.Text = "";
        TextBox_hoten.Text = "";
        TextBox_diachi.Text = "";
        TextBox_sodt.Text = "";
        CheckBox_admin.Checked = false;
        CheckBox_tinhtrang.Checked = false;
        Label_error.Text = "Thêm tài khoản thành công!";
        GridView_dstaikhoan.DataBind();

        if (GridView_dstaikhoan.Rows.Count <= 0)
        {
            Label_thongbao.Text = "Danh sách tài khoản trống!";
        }
        else
        {
            Label_thongbao.Text = "";
        }
    }

    protected void GridView_dstaikhoan_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Label_error.Text = "";
    }

    protected void GridView_dstaikhoan_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        GridView_dstaikhoan.DataBind();

        if (GridView_dstaikhoan.Rows.Count <= 0)
        {
            Label_thongbao.Text = "Danh sách tài khoản trống!";
        }
        else
        {
            Label_thongbao.Text = "";
        }

        if (e.Exception != null)
        {
            Label_error.Text = "Có lỗi xảy ra khi xoá tài khoản!";
            e.ExceptionHandled = true;
        }
    }

    protected void GridView_dstaikhoan_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridView_dstaikhoan.DataBind();

        if (GridView_dstaikhoan.Rows.Count <= 0)
        {
            Label_thongbao.Text = "Danh sách tài khoản trống!";
        }
        else
        {
            Label_thongbao.Text = "";
        }

        if (e.Exception != null)
        {
            Label_error.Text = "Có lỗi xảy ra khi sửa tài khoản!";
            e.ExceptionHandled = true;
        }
    }
}