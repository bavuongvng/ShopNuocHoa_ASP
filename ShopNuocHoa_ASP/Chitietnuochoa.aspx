﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Chitietnuochoa.aspx.vb" Inherits="Chitietnuochoa" %>

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
                <table class="w-100">
                    <tr>
                        <td rowspan="8">
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Width="200px" />
                        </td>
                        <td><b>Tên sản phẩm:</b></td>
                        <td>
                            <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Bind("TenSanPham") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Giá:</b></td>
                        <td>
                            <asp:Label ID="GiaLabel" runat="server" Text='<%# Bind("Gia") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Nồng độ:</b></td>
                        <td>
                            <asp:Label ID="NongDoLabel" runat="server" Text='<%# Bind("NongDo") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Xuất sứ:</b></td>
                        <td>
                            <asp:Label ID="XuatSuLabel" runat="server" Text='<%# Bind("XuatSu") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Năm phát hành:</b></td>
                        <td>
                            <asp:Label ID="NamPhatHanhLabel" runat="server" Text='<%# Bind("NamPhatHanh") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Nhóm hương:</b></td>
                        <td>
                            <asp:Label ID="NhomHuongLabel" runat="server" Text='<%# Bind("NhomHuong") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Phong cách:</b></td>
                        <td>
                            <asp:Label ID="PhongCachLabel" runat="server" Text='<%# Bind("PhongCach") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Dung tích:</b></td>
                        <td>
                            <asp:Label ID="DungTichLabel" runat="server" Text='<%# Bind("DungTich") %>' />
                        </td>
                    </tr>
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

