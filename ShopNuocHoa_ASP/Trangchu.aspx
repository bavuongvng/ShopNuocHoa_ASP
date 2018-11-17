<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Trangchu.aspx.cs" Inherits="Trangchu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content">
        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner silde-img">
                <div class="carousel-item active">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Img/banner1.jpg" />
                </div>
                <div class="carousel-item  align-content-center">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Img/banner2.jpg" />
                </div>
                <div class="carousel-item  align-content-center">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Img/banner3.jpg" />
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
    <div class="container">
        <asp:SqlDataSource ID="sqlDsNuocHoa" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT [MaSanPham], [MaDanhMuc], [TenSanPham], [Gia], [Anh] FROM [SanPham]"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="MaSanPham" DataSourceID="sqlDsNuocHoa" GroupItemCount="5">
            <AlternatingItemTemplate>
                <td runat="server" class="product-item">
                    <asp:Label ID="TenSanPhamLabel" runat="server" CssClass="product-name" Text='<%# Eval("TenSanPham") %>'></asp:Label>
                    <br />
                    <asp:Image ID="Image5" runat="server" Height="100px" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' />
                    <br />
                    <asp:Label ID="GiaLabel" runat="server" CssClass="product-price" Text='<%# Eval("Gia") %>'></asp:Label>
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success btn-sm btn-action" PostBackUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>' Width="40%">Chi tiết</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary btn-sm btn-action" PostBackUrl="~/GioHang.aspx" Width="40%">Đặt mua</asp:LinkButton>
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="">MaSanPham:
                    <asp:Label ID="MaSanPhamLabel1" runat="server" Text='<%# Eval("MaSanPham") %>' />
                    <br />MaDanhMuc:
                    <asp:TextBox ID="MaDanhMucTextBox" runat="server" Text='<%# Bind("MaDanhMuc") %>' />
                    <br />TenSanPham:
                    <asp:TextBox ID="TenSanPhamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                    <br />Gia:
                    <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                    <br />Anh:
                    <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">MaDanhMuc:
                    <asp:TextBox ID="MaDanhMucTextBox" runat="server" Text='<%# Bind("MaDanhMuc") %>' />
                    <br />TenSanPham:
                    <asp:TextBox ID="TenSanPhamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                    <br />Gia:
                    <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                    <br />Anh:
                    <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" class="product-item">
                    <asp:Label ID="TenSanPhamLabel" runat="server" CssClass="product-name" Text='<%# Eval("TenSanPham") %>'></asp:Label>
                    <br />
                    <asp:Image ID="Image5" runat="server" Height="100px" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' />
                    <br />
                    <asp:Label ID="GiaLabel" runat="server" CssClass="product-price" Text='<%# Eval("Gia") %>'></asp:Label>
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success btn-sm btn-action" PostBackUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>' Width="40%">Chi tiết</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary btn-sm btn-action" PostBackUrl="~/GioHang.aspx" Width="40%">Đặt mua</asp:LinkButton>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="15">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-primary" ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="">MaSanPham:
                    <asp:Label ID="MaSanPhamLabel" runat="server" Text='<%# Eval("MaSanPham") %>' />
                    <br />MaDanhMuc:
                    <asp:Label ID="MaDanhMucLabel" runat="server" Text='<%# Eval("MaDanhMuc") %>' />
                    <br />TenSanPham:
                    <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' />
                    <br />Gia:
                    <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' />
                    <br />Anh:
                    <asp:Label ID="AnhLabel" runat="server" Text='<%# Eval("Anh") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
    </div>

</asp:Content>
