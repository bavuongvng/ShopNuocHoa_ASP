<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="QuanLyTaiKhoanKhachHang.aspx.cs" Inherits="QuanLyTaiKhoanKhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1><b>&nbsp;&nbsp; Quản lý tài khoản khách hàng</b></h1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label_thongbao" runat="server" ForeColor="Red"></asp:Label>
    <table class="w-100">
        <tr>
            <td style="width: 40px">&nbsp;&nbsp;</td>
            <td>
    <asp:GridView ID="GridView_dskhachhang" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TenDangNhap,MatKhau,HoTen,DiaChi,SoDT,admin" DataSourceID="SqlDataSource_dskhachhang" OnRowCommand="GridView_dskhachhang_RowCommand" OnRowDeleted="GridView_dskhachhang_RowDeleted" OnRowUpdated="GridView_dskhachhang_RowUpdated">
        <Columns>
            <asp:BoundField DataField="TenDangNhap" HeaderText="Tên tài khoản" ReadOnly="True" SortExpression="TenDangNhap" />
            <asp:BoundField DataField="MatKhau" HeaderText="Mật khẩu" ReadOnly="True" SortExpression="MatKhau" />
            <asp:BoundField DataField="HoTen" HeaderText="Họ tên" ReadOnly="True" SortExpression="HoTen" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" ReadOnly="True" SortExpression="DiaChi" />
            <asp:BoundField DataField="SoDT" HeaderText="Số điện thoại" ReadOnly="True" SortExpression="SoDT" />
            <asp:BoundField DataField="admin" HeaderText="Admin" ReadOnly="True" SortExpression="admin" Visible="False" />
            <asp:BoundField DataField="tinhTrang" HeaderText="Tình trạng" SortExpression="tinhTrang" />
            <asp:CommandField ButtonType="Button" CancelText="Huỷ bỏ" DeleteText="Xoá" EditText="Sửa" InsertText="Thêm" NewText="Thêm mới" SelectText="Chọn" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource_dskhachhang" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" DeleteCommand="DELETE FROM [TaiKhoan] WHERE [TenDangNhap] = @TenDangNhap" InsertCommand="INSERT INTO [TaiKhoan] ([TenDangNhap], [MatKhau], [HoTen], [DiaChi], [SoDT], [admin], [tinhTrang]) VALUES (@TenDangNhap, @MatKhau, @HoTen, @DiaChi, @SoDT, @admin, @tinhTrang)" SelectCommand="SELECT * FROM [TaiKhoan] WHERE ([admin] = @admin)" UpdateCommand="UPDATE [TaiKhoan] SET [MatKhau] = @MatKhau, [HoTen] = @HoTen, [DiaChi] = @DiaChi, [SoDT] = @SoDT, [admin] = @admin, [tinhTrang] = @tinhTrang WHERE [TenDangNhap] = @TenDangNhap">
        <DeleteParameters>
            <asp:Parameter Name="TenDangNhap" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenDangNhap" Type="String" />
            <asp:Parameter Name="MatKhau" Type="String" />
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="SoDT" Type="String" />
            <asp:Parameter Name="admin" Type="Int32" />
            <asp:Parameter Name="tinhTrang" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="admin" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MatKhau" Type="String" />
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="SoDT" Type="String" />
            <asp:Parameter Name="admin" Type="Int32" />
            <asp:Parameter Name="tinhTrang" Type="Int32" />
            <asp:Parameter Name="TenDangNhap" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br/>
    <h3><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thêm khách hàng</b></h3>
    <table class="w-100">
        <tr>
            <td style="width: 171px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_tendn" runat="server" Text="Tên tài khoản:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_tendn" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_tendn" runat="server" ControlToValidate="TextBox_tendn" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Tên tài khoản không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_matkhau" runat="server" Text="Mật khẩu:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_matkhau" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_matkhau" runat="server" ControlToValidate="TextBox_matkhau" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Mật khẩu không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_hoten" runat="server" Text="Họ tên:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_hoten" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_hoten" runat="server" ControlToValidate="TextBox_hoten" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Họ tên không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_diachi" runat="server" Text="Địa chỉ:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_diachi" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_diachi" runat="server" ControlToValidate="TextBox_diachi" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Địa chỉ không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_sodt" runat="server" Text="Số điện thoại:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_sodt" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_sodt" runat="server" ControlToValidate="TextBox_sodt" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Số điện thoại không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:Button ID="Button_them" runat="server" OnClick="Button_them_Click" Text="Thêm" ValidationGroup="validate_them" />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Label ID="Label_error" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>

