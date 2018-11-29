<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="QuanLySanPham.aspx.cs" Inherits="QuanLySanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 >Trang quản lý sản phẩm</h2>
    <p >&nbsp;</p>
    <strong>Chọn sản phẩm</strong>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="Sqlddlsp" DataTextField="TenSanPham" DataValueField="MaSanPham">
        <asp:ListItem>--Chọn một sản phẩm--</asp:ListItem>
    </asp:DropDownList>
    <br __designer:mapid="5e3" />
    <asp:SqlDataSource ID="Sqlddlsp" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT [MaSanPham], [TenSanPham] FROM [SanPham]" ProviderName="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString.ProviderName %>"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="sqlsanpham" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" DeleteCommand="DELETE FROM [SanPham] WHERE [MaSanPham] = @MaSanPham" InsertCommand="INSERT INTO [SanPham] ([MaThuongHieu], [MaDanhMuc], [TenSanPham], [Gia], [NongDo], [XuatSu], [NamPhatHanh], [NhomHuong], [PhongCach], [DungTich], [MoTa], [Anh]) VALUES (@MaThuongHieu, @MaDanhMuc, @TenSanPham, @Gia, @NongDo, @XuatSu, @NamPhatHanh, @NhomHuong, @PhongCach, @DungTich, @MoTa, @Anh)" SelectCommand="SELECT * FROM [SanPham] WHERE ([MaSanPham] = @MaSanPham)" UpdateCommand="UPDATE [SanPham] SET [MaThuongHieu] = @MaThuongHieu, [MaDanhMuc] = @MaDanhMuc, [TenSanPham] = @TenSanPham, [Gia] = @Gia, [NongDo] = @NongDo, [XuatSu] = @XuatSu, [NamPhatHanh] = @NamPhatHanh, [NhomHuong] = @NhomHuong, [PhongCach] = @PhongCach, [DungTich] = @DungTich, [MoTa] = @MoTa, [Anh] = @Anh WHERE [MaSanPham] = @MaSanPham" ProviderName="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString.ProviderName %>">
        <DeleteParameters>
            <asp:Parameter Name="MaSanPham" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaThuongHieu" Type="Int32" />
            <asp:Parameter Name="MaDanhMuc" Type="Int32" />
            <asp:Parameter Name="TenSanPham" Type="String" />
            <asp:Parameter Name="Gia" Type="Int32" />
            <asp:Parameter Name="NongDo" Type="String" />
            <asp:Parameter Name="XuatSu" Type="String" />
            <asp:Parameter Name="NamPhatHanh" Type="Int32" />
            <asp:Parameter Name="NhomHuong" Type="String" />
            <asp:Parameter Name="PhongCach" Type="String" />
            <asp:Parameter Name="DungTich" Type="Int32" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="Anh" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="MaSanPham" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaThuongHieu" Type="Int32" />
            <asp:Parameter Name="MaDanhMuc" Type="Int32" />
            <asp:Parameter Name="TenSanPham" Type="String" />
            <asp:Parameter Name="Gia" Type="Int32" />
            <asp:Parameter Name="NongDo" Type="String" />
            <asp:Parameter Name="XuatSu" Type="String" />
            <asp:Parameter Name="NamPhatHanh" Type="Int32" />
            <asp:Parameter Name="NhomHuong" Type="String" />
            <asp:Parameter Name="PhongCach" Type="String" />
            <asp:Parameter Name="DungTich" Type="Int32" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="Anh" Type="String" />
            <asp:Parameter Name="MaSanPham" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="MaSanPham" DataSourceID="sqlsanpham" ForeColor="#333333" Width="734px" CssClass="css">
        <EditItemTemplate>
            <table style="width: 113%">
                <tr>
                    <td style="width: 168px; height: 24px">Mă sản phẩm</td>
                    <td class="text-left" style="width: 351px; height: 24px;">
                        <asp:Label ID="MaSanPhamLabel3" runat="server" Text='<%# Eval("MaSanPham") %>' />
                    </td>
                    <td style="height: 24px">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px; height: 24px;">Mã thương hiệu</td>
                    <td class="text-left" style="height: 24px; width: 351px;">
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="MaThuongHieu" DataValueField="MaThuongHieu" SelectedValue='<%# Bind("MaThuongHieu") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT * FROM [ThuongHieu]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">Mã danh mục</td>
                    <td class="text-left" style="width: 351px">
                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="MaDanhMuc" DataValueField="MaDanhMuc" SelectedValue='<%# Bind("MaDanhMuc") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT [MaDanhMuc] FROM [DanhMuc]" ProviderName="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString.ProviderName %>"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">Tên sản phẩm</td>
                    <td class="text-left" style="width: 351px">
                        <asp:TextBox ID="TenSanPhamTextBox10" runat="server" Text='<%# Bind("TenSanPham") %>' Width="299px" />
                        <asp:RequiredFieldValidator ID="reqtensp0" runat="server" ControlToValidate="TenSanPhamTextBox10" ErrorMessage="Tên sản phẩm không được để trống" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">Giá</td>
                    <td class="text-left" style="width: 351px">
                        <asp:TextBox ID="GiaTextBox10" runat="server" Text='<%# Bind("Gia") %>' Width="297px" />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="GiaTextBox10" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="1000000000" MinimumValue="0" Type="Integer">Giá phải là số</asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">Nồng độ</td>
                    <td class="text-left" style="width: 351px">
                        <asp:TextBox ID="NongDoTextBox10" runat="server" Text='<%# Bind("NongDo") %>' Width="296px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">Xuất sứ</td>
                    <td class="text-left" style="width: 351px">
                        <asp:TextBox ID="XuatSuTextBox10" runat="server" Text='<%# Bind("XuatSu") %>' Width="293px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">Năm phát hành</td>
                    <td class="text-left" style="width: 351px">
                        <asp:TextBox ID="NamPhatHanhTextBox10" runat="server" Text='<%# Bind("NamPhatHanh") %>' Width="297px" />
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="NamPhatHanhTextBox10" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="1000000" MinimumValue="0" Type="Integer">Năm phát hành phải là số</asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px; ">Nhóm hương</td>
                    <td class="text-left" style="width: 351px">
                        <asp:TextBox ID="NhomHuongTextBox10" runat="server" Text='<%# Bind("NhomHuong") %>' Width="294px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px; height: 24px">Phong cách</td>
                    <td class="text-left" style="width: 351px;">
                        <asp:TextBox ID="PhongCachTextBox10" runat="server" Text='<%# Bind("PhongCach") %>' Width="294px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px; height: 24px;">Dung tích</td>
                    <td class="text-left" style="width: 351px;">
                        <asp:TextBox ID="DungTichTextBox10" runat="server" Text='<%# Bind("DungTich") %>' Width="293px" />
                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="DungTichTextBox10" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="1000000" MinimumValue="0" Type="Integer">Dung tích phải là số</asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">Mô tả</td>
                    <td class="text-left" style="width: 351px">
                        <asp:TextBox ID="MoTaTextBox10" runat="server" Height="200px" Text='<%# Bind("MoTa") %>' TextMode="MultiLine" Width="500px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">Ảnh</td>
                    <td class="text-left" style="width: 351px">
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Anh") %>'></asp:Label>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Save" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Image ID="Image4" runat="server" Height="150px" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Width="150px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 168px">&nbsp;</td>
                    <td class="text-left" style="width: 351px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Cập nhật"    />
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Hủy bỏ" />
        </EditItemTemplate>
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="width: 199px; height: 24px">Mã thương hiệu</td>
                    <td class="text-left">
                        <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MaThuongHieu" DataValueField="MaThuongHieu" SelectedValue='<%# Bind("MaThuongHieu") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" ProviderName="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [ThuongHieu]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px">Mã danh mục</td>
                    <td class="text-left">
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="MaDanhMuc" DataValueField="MaDanhMuc" SelectedValue='<%# Bind("MaDanhMuc") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT [MaDanhMuc] FROM [DanhMuc]" ProviderName="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString.ProviderName %>"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px">Tên sản phẩm</td>
                    <td class="text-left">
                        <asp:TextBox ID="TenSanPhamTextBox1" runat="server" Text='<%# Bind("TenSanPham") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TenSanPhamTextBox1" ErrorMessage="Tên sản phẩm không được để trống" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px">Giá</td>
                    <td class="text-left">
                        <asp:TextBox ID="GiaTextBox1" runat="server" Text='<%# Bind("Gia") %>' />
                        <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="GiaTextBox1" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="1000000000" MinimumValue="0" Type="Integer">Giá phải là số</asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px">Nồng độ</td>
                    <td class="text-left">
                        <asp:TextBox ID="NongDoTextBox1" runat="server" Text='<%# Bind("NongDo") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px">Xuất sứ</td>
                    <td class="text-left">
                        <asp:TextBox ID="XuatSuTextBox1" runat="server" Text='<%# Bind("XuatSu") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px">Năm phát hành</td>
                    <td class="text-left">
                        <asp:TextBox ID="NamPhatHanhTextBox1" runat="server" Text='<%# Bind("NamPhatHanh") %>' />
                        <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="NamPhatHanhTextBox1" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="1000000" MinimumValue="0" Type="Integer">Năm phát hành phải là số</asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px">Nhóm hương</td>
                    <td class="text-left">
                        <asp:TextBox ID="NhomHuongTextBox1" runat="server" Text='<%# Bind("NhomHuong") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px; height: 24px">Phong cách</td>
                    <td class="text-left">
                        <asp:TextBox ID="PhongCachTextBox1" runat="server" Text='<%# Bind("PhongCach") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px; height: 24px">Dung tích</td>
                    <td class="text-left">
                        <asp:TextBox ID="DungTichTextBox1" runat="server" Text='<%# Bind("DungTich") %>' />
                        <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="DungTichTextBox1" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="1000000" MinimumValue="0" Type="Integer">Dung tích phải là số</asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="text-left d-inline-block w-25" style="width: 199px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mô tả</td>
                    <td class="text-left">
                        <asp:TextBox ID="MoTaTextBox1" runat="server" Text='<%# Bind("MoTa") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 199px">Ảnh</td>
                    <td class="text-left">
                        <asp:FileUpload ID="FileUpload3" runat="server" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" OnClick="Button2_Click" Text="Save" />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Anh") %>'> </asp:Label>
                        <asp:Image ID="Image5" runat="server" Height="150px" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Width="150px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Tạo" />
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Hủy bỏ" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            <table style="width: 100%">
                <tr>
                    <td style="width: 340px">Mă sản phẩm</td>
                    <td>
                        <asp:Label ID="MaSanPhamLabel1" runat="server" Text='<%# Eval("MaSanPham") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px">Mã thương hiệu</td>
                    <td>
                        <asp:Label ID="MaThuongHieuLabel1" runat="server" Text='<%# Bind("MaThuongHieu") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px">Mã danh mục</td>
                    <td>
                        <asp:Label ID="MaDanhMucLabel1" runat="server" Text='<%# Bind("MaDanhMuc") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px; height: 30px;">Tên sản phẩm</td>
                    <td>
                        <asp:Label ID="TenSanPhamLabel1" runat="server" Text='<%# Bind("TenSanPham") %>' />
                    </td>
                    <td style="height: 30px"></td>
                </tr>
                <tr>
                    <td style="width: 340px">Giá</td>
                    <td>
                        <asp:Label ID="GiaLabel1" runat="server" Text='<%# Bind("Gia") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px">Nồng độ</td>
                    <td>
                        <asp:Label ID="NongDoLabel1" runat="server" Text='<%# Bind("NongDo") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px; height: 24px;">Xuất sứ</td>
                    <td style="height: 24px">
                        <asp:Label ID="XuatSuLabel1" runat="server" Text='<%# Bind("XuatSu") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px">Năm phát hành</td>
                    <td>
                        <asp:Label ID="NamPhatHanhLabel1" runat="server" Text='<%# Bind("NamPhatHanh") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px">Nhóm hương</td>
                    <td>
                        <asp:Label ID="NhomHuongLabel1" runat="server" Text='<%# Bind("NhomHuong") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px; height: 24px">Phong cách</td>
                    <td style="height: 24px">
                        <asp:Label ID="PhongCachLabel1" runat="server" Text='<%# Bind("PhongCach") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px; height: 24px">Dung tích</td>
                    <td style="height: 24px">
                        <asp:Label ID="DungTichLabel1" runat="server" Text='<%# Bind("DungTich") %>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px">Mô tả</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="200px" Text='<%# Bind("MoTa") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 340px">Ảnh</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Anh") %>' />
                        <asp:Image ID="Image3" runat="server" Height="150px" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' Width="150px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Sửa" />
            &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa" />
            &nbsp;&nbsp; &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Tạo mới" />
        </ItemTemplate>
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>
    <br />
    <br />
</asp:Content>

