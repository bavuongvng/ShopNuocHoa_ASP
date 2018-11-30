using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GioHang : System.Web.UI.Page
{
    ShoppingCart aCart;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CartItem"] == null)
        {
            aCart = new ShoppingCart();
        }
        else
        {
            aCart = (ShoppingCart)Session["CartItem"];
        }

        BindGrid(aCart);

        if (gvGioHang.Rows.Count < 0)
        {
            return;
        }

        if (gvSP.Rows.Count <= 0)
        {
            return;
        }

        int masp = Convert.ToInt32(gvSP.Rows[0].Cells[0].Text);
        string tensp = gvSP.Rows[0].Cells[1].Text;
        string nongdo = gvSP.Rows[0].Cells[2].Text;
        string xuatsu = gvSP.Rows[0].Cells[3].Text;
        int namphathanh = Convert.ToInt32(gvSP.Rows[0].Cells[4].Text);
        string nhomhuong = gvSP.Rows[0].Cells[5].Text;
        string phongcach = gvSP.Rows[0].Cells[6].Text;
        int dungtich = Convert.ToInt32(gvSP.Rows[0].Cells[7].Text);
        string mota = gvSP.Rows[0].Cells[8].Text;
        int gia = Convert.ToInt32(gvSP.Rows[0].Cells[9].Text);
        string anh = gvSP.Rows[0].Cells[10].Text;

        if(Session["CartItem"]==null)
        {
            aCart = new ShoppingCart();
        }
        else
        {
            aCart = (ShoppingCart)Session["CartItem"];
        }

        aCart.InsertItem(masp, tensp, nongdo, xuatsu, namphathanh, nhomhuong, phongcach, dungtich, mota, gia, 1, anh);

        Session["CartItem"] = aCart;

        if (!IsPostBack)
        {
            BindGrid(aCart);
        }
    }

    public void BindGrid(ShoppingCart aCart)
    {
        gvGioHang.DataSource = aCart.Items;
        gvGioHang.DataBind();
        lblTongTien.Text = "Tổng tiền: " + aCart.TongTien.ToString();
    }

    protected void gvGioHang_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            int masp = Convert.ToInt32(gvGioHang.Rows[rowIndex].Cells[0].Text);
            string a = gvGioHang.Rows[rowIndex].Cells[0].Text;
            masp = Convert.ToInt32(gvGioHang.Rows[rowIndex].Cells[0].Text);

            TextBox txtsoluong = (TextBox)gvGioHang.Rows[rowIndex].Cells[10].FindControl("txtSoLuong");
            int soluong = Convert.ToInt32(txtsoluong.Text);

            if (Session["CartItem"] == null)
            {
                aCart = new ShoppingCart();
            }
            else
            {
                aCart = (ShoppingCart)Session["CartItem"];
            }

            int rowID = aCart.getIndex(masp);

            aCart.UpdateItem(rowID, soluong);

            BindGrid(aCart);
            Session["CartItem"] = aCart;
        }catch(Exception ex)
        {

        }
    }

    protected void btnXoaGioHang_Click(object sender, EventArgs e)
    {
        Session.Remove("CartItem");
        lblTongTien.Text = "";
        Response.Redirect("GioHang.aspx");
    }
}