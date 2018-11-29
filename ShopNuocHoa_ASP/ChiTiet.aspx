<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChiTiet.aspx.cs" Inherits="ChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="sqlSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT * FROM [SanPham] WHERE ([MaSanPham] = @MaSanPham)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaSanPham" QueryStringField="MaSanPham" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="frViewSanPham"  runat="server" DataKeyNames="MaSanPham" DataSourceID="sqlSanPham" CssClass="container">
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
            &nbsp;<asp:Panel ID="Panel1" runat="server" CssClass="container mx-auto tbl-chitiet">
                <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Bind("TenSanPham") %>' CssClass=" d-block" Font-Bold="True" Font-Size="X-Large" ForeColor="#9B0E62" />
                <br />
                <table class="w-100">
                    <tr>
                        <td style="border: 1px solid #ccc; text-align: center; padding: 5px 0;">
                            <asp:Image ID="Image5" runat="server" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Width="250px" />
                        </td>
                        <td class="product-detail pl-3">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Giá" Width="150px" CssClass="mt-2"></asp:Label>
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <asp:Label ID="GiaLabel" runat="server" Text='<%# Bind("Gia") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Nồng độ" Width="150px" CssClass="mt-2"></asp:Label>
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <asp:Label ID="NongDoLabel" runat="server" Text='<%# Bind("NongDo") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Xuất sứ" Width="150px" CssClass="mt-2"></asp:Label>
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <asp:Label ID="XuatSuLabel" runat="server" Text='<%# Bind("XuatSu") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Năm phát hành" Width="150px" CssClass="mt-2"></asp:Label>
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <asp:Label ID="NamPhatHanhLabel" runat="server" Text='<%# Bind("NamPhatHanh") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Nhóm hương" Width="150px" CssClass="mt-2"></asp:Label>
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <asp:Label ID="NhomHuongLabel" runat="server" Text='<%# Bind("NhomHuong") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Phong cách" Width="150px" CssClass="mt-2"></asp:Label>
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <asp:Label ID="PhongCachLabel" runat="server" Text='<%# Bind("PhongCach") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Dung tích" Width="150px" CssClass="mt-2"></asp:Label>
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <asp:Label ID="DungTichLabel" runat="server" Text='<%# Bind("DungTich") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger mt-4">Đặt mua</asp:LinkButton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="MoTaLabel" runat="server" Text='<%# Bind("MoTa") %>' CssClass="mt-3 d-block" />
                <br />
            </asp:Panel>
        </ItemTemplate>
    </asp:FormView>
    <br />
</asp:Content>

