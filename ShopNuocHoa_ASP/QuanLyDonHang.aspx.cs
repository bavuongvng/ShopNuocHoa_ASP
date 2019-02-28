using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLyDonHang :  System.Web.UI.Page
{
     string connString = @"Data Source=DESKTOP-FMUF9B2;Initial Catalog=SHOPNUOCHOA;Integrated Security=True";

  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userAdmin"] == null)
        {
            Response.Redirect("DangNhapAdmin.aspx");
        }
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "dosomething"))
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            int findMe = dataItem.DisplayIndex;
            var route = (Label)dataItem.FindControl("MaDonHangLabel");
            string a = route.Text;

            SqlConnection sqlConn = new SqlConnection(connString);
            sqlConn.Open();
            DataTable dataTable = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM DonHang Where MaDonHang= '" + a + "'", sqlConn);
            adapter.Fill(dataTable);
            FormView1.DataSourceID = "";
            FormView1.DataSource = dataTable;
            FormView1.DataBind();


            DataTable dataTable2 = new DataTable();
            SqlDataAdapter adapter2 = new SqlDataAdapter(" SELECT  TenSanPham, Gia,SoLuong  , Gia*SoLuong as 'ThanhTien',Anh " + " FROM  DonHang inner join ChiTietDonHang  on DonHang.MaDonHang = ChiTietDonHang.MaDonHang inner join SanPham on ChiTietDonHang.MaSanPham = SanPham.MaSanPham where DonHang.MaDonHang ='" + a + "'", sqlConn);
            adapter2.Fill(dataTable2);
            ListView2.DataSourceID = "";
            ListView2.DataSource = dataTable2;
            ListView2.DataBind();


            DataTable dataTable3 = new DataTable();
            SqlDataAdapter adapter3 = new SqlDataAdapter("  SELECT  Sum( Gia*SoLuong) as 'ThanhTien' FROM  DonHang inner join ChiTietDonHang on DonHang.MaDonHang = ChiTietDonHang.MaDonHang inner join SanPham on ChiTietDonHang.MaSanPham = SanPham.MaSanPham where DonHang.MaDonHang = '" + a + "'", sqlConn);
            adapter3.Fill(dataTable3);
            FormView2.DataSourceID = "";
            FormView2.DataSource = dataTable3;
            FormView2.DataBind(); 
            sqlConn.Close();
        }
    }

    protected void droplist_SelectedIndexChanged1(object sender, EventArgs e)
    {

            FormView1.DataSourceID = "";
            FormView1.DataSource = null;
            FormView1.DataBind();
            FormView2.DataSourceID = "";
            FormView2.DataSource = null;
            FormView2.DataBind();
            ListView2.DataSourceID = "";
            ListView2.DataSource = null;
            ListView2.DataBind();
        }




    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        FormView1.DataSourceID = "";
        FormView1.DataSource = null;
        FormView1.DataBind();
        FormView2.DataSourceID = "";
        FormView2.DataSource = null;
        FormView2.DataBind();
        ListView2.DataSourceID = "";
        ListView2.DataSource = null;
        ListView2.DataBind();

    }

    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        FormView1.DataSourceID = "";
        FormView1.DataSource = null;
        FormView1.DataBind();
        FormView2.DataSourceID = "";
        FormView2.DataSource = null;
        FormView2.DataBind();
        ListView2.DataSourceID = "";
        ListView2.DataSource = null;
        ListView2.DataBind();
    }

    protected void ListView1_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        FormView1.DataSourceID = "";
        FormView1.DataSource = null;
        FormView1.DataBind();
        FormView2.DataSourceID = "";
        FormView2.DataSource = null;
        FormView2.DataBind();
        ListView2.DataSourceID = "";
        ListView2.DataSource = null;
        ListView2.DataBind();
    }
}