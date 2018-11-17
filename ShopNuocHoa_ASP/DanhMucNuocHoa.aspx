<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DanhMucNuocHoa.aspx.cs" Inherits="DanhMucNuocHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container danhmuc">
        <div class="left-danhmuc">
            <asp:sqldatasource id="sqlDsDanhMuc" runat="server" connectionstring="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" selectcommand="SELECT * FROM [DanhMuc]"></asp:sqldatasource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MaDanhMuc" DataSourceID="sqlDsDanhMuc" CssClass="danh-muc">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="maDanhMuc" DataNavigateUrlFormatString="~/DanhMucNuocHoa.aspx?madanhmuc={0}" DataTextField="TenDanhMuc" NavigateUrl="~/DanhMucNuocHoa.aspx" HeaderText="Danh mục" Text="Danh mục" >
                    <HeaderStyle BackColor="#1055F1" Font-Bold="True" Font-Size="X-Large" HorizontalAlign="Justify" VerticalAlign="Middle" CssClass="danhmuc-header" ForeColor="White" Height="50px" />
                    </asp:HyperLinkField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="right-sanpham">
            <asp:SqlDataSource ID="sqlDsSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT [MaSanPham], [MaThuongHieu], [MaDanhMuc], [TenSanPham], [Gia], [Anh] FROM [SanPham] WHERE ([MaDanhMuc] = @MaDanhMuc)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="MaDanhMuc" QueryStringField="madanhmuc" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="sqlDsSanPham" GroupItemCount="4">
                <AlternatingItemTemplate>
                    <td runat="server" class="product-item">
                        <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' CssClass="product-name" />
                        <br />
                        <asp:Image ID="Image5" runat="server" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Height="100px" />
                        <br />
                        <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' CssClass="product-price" />
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>' CssClass="btn btn-success btn-sm btn-action" Width="40%">Chi tiết</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/GioHang.aspx" CssClass="btn btn-primary btn-sm btn-action" Width="40%">Đặt mua</asp:LinkButton>
                        <br /></td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">MaSanPham:
                        <asp:Label ID="MaSanPhamLabel1" runat="server" Text='<%# Eval("MaSanPham") %>' />
                        <br />MaThuongHieu:
                        <asp:TextBox ID="MaThuongHieuTextBox" runat="server" Text='<%# Bind("MaThuongHieu") %>' />
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
                    <td runat="server" style="">MaThuongHieu:
                        <asp:TextBox ID="MaThuongHieuTextBox" runat="server" Text='<%# Bind("MaThuongHieu") %>' />
                        <br />MaDanhMuc:
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
                        <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' CssClass="product-name"></asp:Label>
                        <br />
                        <asp:Image ID="Image5" runat="server" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Height="100px" />
                        <br />
                        <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' CssClass="product-price"></asp:Label>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>' CssClass="btn btn-sm btn-success btn-action" ForeColor="White" Width="40%">Chi tiết</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/GioHang.aspx" CssClass="btn btn-sm btn-primary btn-action" Width="40%">Đặt mua</asp:LinkButton>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="text-align: center;">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary btn-sm" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">MaSanPham:
                        <asp:Label ID="MaSanPhamLabel" runat="server" Text='<%# Eval("MaSanPham") %>' />
                        <br />MaThuongHieu:
                        <asp:Label ID="MaThuongHieuLabel" runat="server" Text='<%# Eval("MaThuongHieu") %>' />
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
    </div>
</asp:Content>

