<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DanhMucNuocHoa.aspx.vb" Inherits="DanhMucNuocHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container danhmuc">
        <div class="left-danhmuc">
            <asp:sqldatasource id="sqlDsDanhMuc" runat="server" connectionstring="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" selectcommand="SELECT * FROM [DanhMuc]"></asp:sqldatasource>
            <asp:dropdownlist cssclass="btn bg-transparent border-dark dropdown-toggle w-100" id="ddlDanhMuc" runat="server" appenddatabounditems="True" autopostback="True" datasourceid="sqlDsDanhMuc" datatextfield="TenDanhMuc" datavaluefield="MaDanhMuc">
                <asp:ListItem Value="-1">--Chọn một danh mục--</asp:ListItem>
            </asp:dropdownlist>
            <br />
            <asp:listview id="ListView2" runat="server" datakeynames="MaDanhMuc" datasourceid="sqlDsDanhMuc">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td  class="danh-muc">
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("MaDanhMuc", "~/DanhMucNuocHoa.aspx?MaDanhMuc={0}") %>'>
                                <asp:Label ID="TenDanhMucLabel" runat="server" Text='<%# Eval("TenDanhMuc") %>' />
                            </asp:HyperLink></td></tr></AlternatingItemTemplate><EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="MaDanhMucLabel1" runat="server" Text='<%# Eval("MaDanhMuc") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TenDanhMucTextBox" runat="server" Text='<%# Bind("TenDanhMuc") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td></tr></table></EmptyDataTemplate><InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td><td>
                            <asp:TextBox ID="TenDanhMucTextBox" runat="server" Text='<%# Bind("TenDanhMuc") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td class="danh-muc">
                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# Eval("MaDanhMuc", "~/DanhMucNuocHoa.aspx?MaDanhMuc={0}") %>'>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenDanhMuc") %>' />
                            </asp:HyperLink></td></tr></ItemTemplate><LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="MaDanhMucLabel" runat="server" Text='<%# Eval("MaDanhMuc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TenDanhMucLabel" runat="server" Text='<%# Eval("TenDanhMuc") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:listview>
            <br />
        </div>
        <div class="right-sanpham">
            <asp:sqldatasource id="sqlDsSanPham" runat="server" connectionstring="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" selectcommand="SELECT [MaSanPham], [MaThuongHieu], [MaDanhMuc], [TenSanPham], [Gia], [Anh] FROM [SanPham] WHERE ([MaDanhMuc] = @MaDanhMuc)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlDanhMuc" Name="MaDanhMuc" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:sqldatasource>
            <asp:listview id="ListView1" runat="server" datakeynames="MaSanPham" datasourceid="sqlDsSanPham" groupitemcount="3">
                <AlternatingItemTemplate>
                    <td runat="server" style="" class="product-item">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>'>
                            <p class="product-name">
                                <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' />
                            </p>
                            <asp:Image ID="Image3" runat="server" Height="150px" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' />
                            <p class="product-price">
                                <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' /> đ
                            </p>
                            <p class="btn-action">
                                <asp:LinkButton ID="LinkButton2" CssClass="btn btn-sm btn-primary" runat="server" PostBackUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>'>Chi tiết</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-sm btn-success" runat="server" PostBackUrl="~/GioHang.aspx">Đặt mua</asp:LinkButton>
                            </p>
                        </asp:HyperLink></td></AlternatingItemTemplate><EditItemTemplate>
                    <td runat="server" style="">MaSanPham: <asp:Label ID="MaSanPhamLabel1" runat="server" Text='<%# Eval("MaSanPham") %>' />
                        <br />
                        MaThuongHieu: <asp:TextBox ID="MaThuongHieuTextBox" runat="server" Text='<%# Bind("MaThuongHieu") %>' />
                        <br />
                        MaDanhMuc: <asp:TextBox ID="MaDanhMucTextBox" runat="server" Text='<%# Bind("MaDanhMuc") %>' />
                        <br />
                        TenSanPham: <asp:TextBox ID="TenSanPhamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                        <br />
                        Gia: <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                        <br />
                        Anh: <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr runat="server">
                            <td runat="server">&nbsp;</td></tr></table></EmptyDataTemplate><EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">MaThuongHieu: <asp:TextBox ID="MaThuongHieuTextBox" runat="server" Text='<%# Bind("MaThuongHieu") %>' />
                        <br />
                        MaDanhMuc: <asp:TextBox ID="MaDanhMucTextBox" runat="server" Text='<%# Bind("MaDanhMuc") %>' />
                        <br />
                        TenSanPham: <asp:TextBox ID="TenSanPhamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                        <br />
                        Gia: <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                        <br />
                        Anh: <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="" class="product-item">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>'>
                            <p class="product-name">
                                <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' />
                            </p>
                            <asp:Image ID="Image2" runat="server" Height="150px" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' />
                            <p class="product-price">
                                <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' /> đ
                            </p>
                            <p class="btn-action">
                                <asp:LinkButton ID="LinkButton2" CssClass="btn btn-sm btn-primary" runat="server" PostBackUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>'>Chi tiết</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-sm btn-success" runat="server" PostBackUrl="~/GioHang.aspx">Đặt mua</asp:LinkButton>
                            </p>
                        </asp:HyperLink></td></ItemTemplate><LayoutTemplate>
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
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-secondary" ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">MaSanPham: <asp:Label ID="MaSanPhamLabel" runat="server" Text='<%# Eval("MaSanPham") %>' />
                        <br />
                        MaThuongHieu: <asp:Label ID="MaThuongHieuLabel" runat="server" Text='<%# Eval("MaThuongHieu") %>' />
                        <br />
                        MaDanhMuc: <asp:Label ID="MaDanhMucLabel" runat="server" Text='<%# Eval("MaDanhMuc") %>' />
                        <br />
                        TenSanPham: <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' />
                        <br />
                        Gia: <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' />
                        <br />
                        Anh: <asp:Label ID="AnhLabel" runat="server" Text='<%# Eval("Anh") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:listview>
            </div>
    </div>
</asp:Content>

