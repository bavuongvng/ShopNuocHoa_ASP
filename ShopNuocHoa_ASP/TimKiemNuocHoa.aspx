<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TimKiemNuocHoa.aspx.cs" Inherits="TimKiemNuocHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div  class="container"> 
        <asp:sqldatasource runat="server"></asp:sqldatasource>
           <br />
         <div style="margin-left:20px;">   
            <div style="width:100%;margin-left:20px;">  
                <label> <h4> Tìm kiếm theo giá :  </h4> </label>
            <asp:dropdownlist  id="droplist"   runat="server"  CssClass="dropdown-toggle" AutoPostBack="True"> 
            <asp:ListItem Value="0">0-500.000</asp:ListItem>
            <asp:ListItem Value="500000">500.000-1.000.000</asp:ListItem>
            <asp:ListItem Value="1000000">1.000.000-1.500.000</asp:ListItem>
            <asp:ListItem Value="2000000">1.500.000-2.000.000</asp:ListItem>
            <asp:ListItem Value="2500000">2.500.000-3.000.000</asp:ListItem>  
        </asp:dropdownlist>
             </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT TOP (1000) MaSanPham, MaThuongHieu, MaDanhMuc, TenSanPham, Gia, NongDo, XuatSu, NamPhatHanh, NhomHuong, PhongCach, DungTich, MoTa, Anh FROM SanPham WHERE (Gia &gt; @gia) AND (Gia &lt;= @gia + 500000)">
            <SelectParameters>
                <asp:ControlParameter ControlID="droplist" Name="gia" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
         



        <asp:ListView ID="lvSanPham" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="5">
                <AlternatingItemTemplate>
                    <td runat="server" class="product-item">
                        <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' CssClass="product-name" />
                        <br />
                        <asp:Image ID="Image5" runat="server" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Height="100px" />
                        <br />
                        <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' CssClass="product-price" />
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# Eval("MaSanPham", "~/Chitietnuochoa.aspx?MaSanPham={0}") %>' CssClass="btn btn-success btn-sm btn-action" Width="40%">Chi tiết</asp:LinkButton>
                        <asp:LinkButton ID="btnThemGioHang" runat="server"  CssClass="btn btn-primary btn-sm btn-action" Width="40%"  PostBackUrl='<%# Eval("MaSanPham", "GioHang.aspx?MaSanPham={0}") %>'>Đặt mua</asp:LinkButton>
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
                            <td><h4 style="margin-left:20px;height:70px;line-height:70px">Không có sản phẩm nào với mức giá đó</h4></td>
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
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl='<%# Eval("MaSanPham", "GioHang.aspx?MaSanPham={0}") %>' CssClass="btn btn-sm btn-primary btn-action" Width="40%">Đặt mua</asp:LinkButton>
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
         



     </div>
 


        
</div>
</asp:Content>

