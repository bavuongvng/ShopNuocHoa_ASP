using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class QuanLyDanhMucAdmin :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userAdmin"] == null)
        {
            Response.Redirect("DangNhapAdmin.aspx");
        }
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void btnthem_Click(object sender, EventArgs e)
    {
        SqlDataSource_dsdanhmuc.InsertParameters["TenDanhMuc"].DefaultValue = txtten.Text;
        try{
            SqlDataSource_dsdanhmuc.Insert();
            
            txtten.Text = "";
            GridView_dsdanhmuc.DataBind();
            lblthongbao.Text = "";
        }
        catch( Exception ex)
        {
            lblthongbao.Text = "có lỗi khi thêm dữ liệu.<br/>" + "Message:" + ex.Message;
        }
    }

    protected void gvdanhmuc_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

        GridView_dsdanhmuc.DataBind();

        if (GridView_dsdanhmuc.Rows.Count <= 0)
        {
            lblthongbao.Text = "Danh sách tài khoản trống!";
        }
        else
        {
            lblthongbao.Text = "";
        }

        if (e.Exception != null)
        {
            lblthongbao.Text = "Có lỗi xảy ra khi xoá tài khoản!";
            e.ExceptionHandled = true;
        }
    }

    protected void GridView_dsdanhmuc_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridView_dsdanhmuc.DataBind();

        if (GridView_dsdanhmuc.Rows.Count <= 0)
        {
            lblthongbao.Text = "Danh sách tài khoản trống!";
        }
        else
        {
            lblthongbao.Text = "";
        }

        if (e.Exception != null)
        {
            lblthongbao.Text = "Có lỗi xảy ra khi sửa tài khoản!";
            e.ExceptionHandled = true;
        }
    }


    

    protected void GridView_dsdanhmuc_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string ten = (GridView_dsdanhmuc.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        if (ten == "")
        {

            Response.Write("<script>alert('Tên Loại Sản Phẩm Không Được Rỗng !')</script>");

        }

    }

    protected void GridView_dsdanhmuc_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        lblthongbao.Text = "";
    }
}