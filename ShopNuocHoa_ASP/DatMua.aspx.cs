using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DatMua : System.Web.UI.Page
{
    static int maDonHang;
    static ShoppingCart gioHang;
    protected void Page_Load(object sender, EventArgs e)
    {
        gioHang = (ShoppingCart)Session["CartItem"];
        DataView dv = (DataView)SqlDDonHang.Select(DataSourceSelectArguments.Empty);

        int num = dv.Count;

        if (num == 0)
        {
            maDonHang = 1;
        }
        else
        {
            DataTable tb = dv.ToTable();
            DataRow row = tb.Rows[num - 1];
            maDonHang = (int)row[0] + 1;
        }

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
            List<CartItem> Items = gioHang.Items;
            foreach (var item in Items)
            {
                sqlChiTietDonHang.InsertParameters["MaDonHang"].DefaultValue = maDonHang.ToString();
                sqlChiTietDonHang.InsertParameters["MaSanPham"].DefaultValue = item.Masanpham.ToString();
                sqlChiTietDonHang.InsertParameters["SoLuong"].DefaultValue = item.Soluong.ToString();
                sqlChiTietDonHang.Insert();
            }
            Response.Redirect("TrangChu.aspx");
        }
        catch (Exception ex)
        {
            lblLoi.Text = ex.Message;
        }




    }
}