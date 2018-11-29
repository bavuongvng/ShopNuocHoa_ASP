  using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class ShoppingCart
{
    List<CartItem> items;

    public List<CartItem> Items
    {
        get
        {
            return items;
        }
        set
        {
            items = value;
        }
    }

    private int tongtien;
    public int TongTien
    {
        get
        {
            tongtien = 0;
            if(Items != null)
            {
                foreach(var item in Items)
                {
                    tongtien += item.ThanhTien;
                }
            }
            return tongtien;
        }
    }
    public ShoppingCart()
    {
        if(this.Items == null)
        {
            this.Items = new List<CartItem>();
        }
    }

    public int getIndex(int ma)
    {
        int index = 0;
        foreach(var item in this.Items)
        {
            if(item.Masanpham == ma)
            {
                return index;
            }
            index++;
        }
        return -1;
    }

    public void InsertItem(int masanpham, string tensanpham, string nongdo, string xuatsu, int namphathanh, string nhomhuong, string phongcach, int dungtich, string mota, int gia, int sl, string anh)
    {
        int index = this.getIndex(masanpham);
        if(index == -1)
        {
            CartItem anItem = new CartItem(masanpham,tensanpham,nongdo,xuatsu,namphathanh,nhomhuong,phongcach,dungtich,mota,gia,sl,anh);
            Items.Add(anItem);
        }
        else
        {
            Items[index].Soluong += sl;
        }
    }

    public void DeleteItem(int rowID)
    {
        Items.RemoveAt(rowID);
    }

    public void UpdateItem(int rowID,int soluong)
    {
        if (soluong == 0)
        {
            DeleteItem(rowID);
        }
        else
        { 
            CartItem updateItem = Items[rowID];
            updateItem.Soluong = soluong;
        }
    }
}