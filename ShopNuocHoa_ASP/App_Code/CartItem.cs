using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
    int masanpham,namphathanh,dungtich,soluong;
    string tensanpham,nongdo,xuatsu,nhomhuong,phongcach,mota,anh;
    int gia,thanhtien;

    public int ThanhTien
    {
        get
        {
            thanhtien = Gia * Soluong;
            return thanhtien;
        }
    }

    public int Masanpham { get => masanpham; set => masanpham = value; }
    public int Namphathanh { get => namphathanh; set => namphathanh = value; }
    public int Dungtich { get => dungtich; set => dungtich = value; }
    public int Soluong { get => soluong; set => soluong = value; }
    public string Tensanpham { get => tensanpham; set => tensanpham = value; }
    public string Nongdo { get => nongdo; set => nongdo = value; }
    public string Xuatsu { get => xuatsu; set => xuatsu = value; }
    public string Nhomhuong { get => nhomhuong; set => nhomhuong = value; }
    public string Phongcach { get => phongcach; set => phongcach = value; }
    public string Mota { get => mota; set => mota = value; }
    public string Anh { get => anh; set => anh = value; }
    public int Gia { get => gia; set => gia = value; }

    public CartItem()
    {
        //
        // TODO: Add constructor logic here
        //
        
    }
    public CartItem(int masanpham,string tensanpham,string nongdo,string xuatsu,int namphathanh,string nhomhuong,string phongcach,int dungtich,string mota,int gia, int soluong,string anh)
    {
        this.Masanpham = masanpham;
        this.Tensanpham = tensanpham;
        this.Nongdo = nongdo;
        this.Xuatsu = xuatsu;
        this.Namphathanh = namphathanh;
        this.Nhomhuong = nhomhuong;
        this.Phongcach = phongcach;
        this.Dungtich = dungtich;
        this.Mota = mota;
        this.Anh = anh;
        this.Gia = gia;
        this.Soluong = soluong;
    }
}