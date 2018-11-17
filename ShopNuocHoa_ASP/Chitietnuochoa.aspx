<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Chitietnuochoa.aspx.cs" Inherits="Chitietnuochoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <asp:SqlDataSource ID="sqlSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT * FROM [SanPham] WHERE ([MaSanPham] = @MaSanPham)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MaSanPham" QueryStringField="MaSanPham" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" CssClass="tbl-chitiet" runat="server" DataKeyNames="MaSanPham" DataSourceID="sqlSanPham" Width="80%">
            <EditItemTemplate>
                MaSanPham:
                <asp:Label ID="MaSanPhamLabel1" runat="server" Text='<%# Eval("MaSanPham") %>' />
                <br />
                MaThuongHieu:
                <asp:TextBox ID="MaThuongHieuTextBox" runat="server" Text='<%# Bind("MaThuongHieu") %>' />
                <br />
                MaDanhMuc:
                <asp:TextBox ID="MaDanhMucTextBox" runat="server" Text='<%# Bind("MaDanhMuc") %>' />
                <br />
                TenSanPham:
                <asp:TextBox ID="TenSanPhamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                <br />
                Gia:
                <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                <br />
                NongDo:
                <asp:TextBox ID="NongDoTextBox" runat="server" Text='<%# Bind("NongDo") %>' />
                <br />
                XuatSu:
                <asp:TextBox ID="XuatSuTextBox" runat="server" Text='<%# Bind("XuatSu") %>' />
                <br />
                NamPhatHanh:
                <asp:TextBox ID="NamPhatHanhTextBox" runat="server" Text='<%# Bind("NamPhatHanh") %>' />
                <br />
                NhomHuong:
                <asp:TextBox ID="NhomHuongTextBox" runat="server" Text='<%# Bind("NhomHuong") %>' />
                <br />
                PhongCach:
                <asp:TextBox ID="PhongCachTextBox" runat="server" Text='<%# Bind("PhongCach") %>' />
                <br />
                DungTich:
                <asp:TextBox ID="DungTichTextBox" runat="server" Text='<%# Bind("DungTich") %>' />
                <br />
                MoTa:
                <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                <br />
                Anh:
                <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                MaThuongHieu:
                <asp:TextBox ID="MaThuongHieuTextBox" runat="server" Text='<%# Bind("MaThuongHieu") %>' />
                <br />
                MaDanhMuc:
                <asp:TextBox ID="MaDanhMucTextBox" runat="server" Text='<%# Bind("MaDanhMuc") %>' />
                <br />
                TenSanPham:
                <asp:TextBox ID="TenSanPhamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                <br />
                Gia:
                <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                <br />
                NongDo:
                <asp:TextBox ID="NongDoTextBox" runat="server" Text='<%# Bind("NongDo") %>' />
                <br />
                XuatSu:
                <asp:TextBox ID="XuatSuTextBox" runat="server" Text='<%# Bind("XuatSu") %>' />
                <br />
                NamPhatHanh:
                <asp:TextBox ID="NamPhatHanhTextBox" runat="server" Text='<%# Bind("NamPhatHanh") %>' />
                <br />
                NhomHuong:
                <asp:TextBox ID="NhomHuongTextBox" runat="server" Text='<%# Bind("NhomHuong") %>' />
                <br />
                PhongCach:
                <asp:TextBox ID="PhongCachTextBox" runat="server" Text='<%# Bind("PhongCach") %>' />
                <br />
                DungTich:
                <asp:TextBox ID="DungTichTextBox" runat="server" Text='<%# Bind("DungTich") %>' />
                <br />
                MoTa:
                <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                <br />
                Anh:
                <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <h3 style="margin-bottom: 15px; color: #9b0e62;">
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TenSanPham") %>' />
                </h3>
                <table class="w-100">
                    <tr>
                        <td style="border: 1px solid #ccc; text-align: center; padding: 5px 0;">
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Width="250px" />
                        </td>
                        <td class="product-detail">
                            <div><b>Giá</b>: <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gia") %>' /></div>
                            <div><b>Nồng độ</b>: <asp:Label ID="NongDoLabel" runat="server" Text='<%# Bind("NongDo") %>' /></div>
                            <div><b>Xuất sứ</b>: <asp:Label ID="XuatSuLabel" runat="server" Text='<%# Bind("XuatSu") %>' /></div>
                            <div><b>Năm phát hành</b>: <asp:Label ID="NamPhatHanhLabel" runat="server" Text='<%# Bind("NamPhatHanh") %>' /></div>
                            <div><b>Nhóm hương</b>: <asp:Label ID="NhomHuongLabel" runat="server" Text='<%# Bind("NhomHuong") %>' /></div>
                            <div><b>Phong cách</b>: <asp:Label ID="PhongCachLabel" runat="server" Text='<%# Bind("PhongCach") %>' /></div>
                            <div><b>Dung tích</b>: <asp:Label ID="DungTichLabel" runat="server" Text='<%# Bind("DungTich") %>' /></div>
                            <div style="margin-top: 20px; display: inline-block; color: white;">
                                <asp:LinkButton ID="LinkButton1" PostBackUrl='<%# Eval("MaSanPham", "~/GioHang.aspx?MaSanPham={0}") %>'  CssClass="btn btn-danger" runat="server">Mua ngay</asp:LinkButton>
                            </div>
                        </td>
                </table>
                <div class="product-description">
                    <asp:Label ID="MoTaLabel" runat="server" Text='<%# Bind("MoTa", "{0}") %>' />
                </div>
                <br />
            </ItemTemplate>
        </asp:FormView>
        <br />
    </div>
</asp:Content>

