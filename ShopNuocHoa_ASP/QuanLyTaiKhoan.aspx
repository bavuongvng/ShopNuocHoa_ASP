<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="QuanLyTaiKhoan.aspx.cs" Inherits="QuanLyTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quản lý tài khoản</b></h1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label_thongbao" runat="server" ForeColor="Red"></asp:Label>
    <table class="w-100">
        <tr>
            <td style="width: 40px">&nbsp;&nbsp;</td>
            <td>
    <asp:GridView ID="GridView_dstaikhoan" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TenDangNhap" DataSourceID="SqlDataSource_dstaikhoan" OnRowCommand="GridView_dstaikhoan_RowCommand" OnRowDeleted="GridView_dstaikhoan_RowDeleted" OnRowUpdated="GridView_dstaikhoan_RowUpdated">
        <Columns>
            <asp:BoundField DataField="TenDangNhap" HeaderText="Tên tài khoản" ReadOnly="True" SortExpression="TenDangNhap" />
            <asp:BoundField DataField="MatKhau" HeaderText="Mật khẩu" SortExpression="MatKhau" />
            <asp:BoundField DataField="HoTen" HeaderText="Họ tên" SortExpression="HoTen" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
            <asp:BoundField DataField="SoDT" HeaderText="Số điện thoại" SortExpression="SoDT" />
            <asp:BoundField DataField="admin" HeaderText="Admin" SortExpression="admin" />
            <asp:BoundField DataField="tinhTrang" HeaderText="Tình trạng" SortExpression="tinhTrang" />
            <asp:CommandField ButtonType="Button" CancelText="Huỷ bỏ" DeleteText="Xoá" EditText="Sửa" InsertText="Thêm" NewText="Thêm mới" SelectText="Chọn" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource_dstaikhoan" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" DeleteCommand="DELETE FROM [TaiKhoan] WHERE [TenDangNhap] = @TenDangNhap" InsertCommand="INSERT INTO [TaiKhoan] ([TenDangNhap], [MatKhau], [HoTen], [DiaChi], [SoDT], [admin], [tinhTrang]) VALUES (@TenDangNhap, @MatKhau, @HoTen, @DiaChi, @SoDT, @admin, @tinhTrang)" SelectCommand="SELECT * FROM [TaiKhoan]" UpdateCommand="UPDATE [TaiKhoan] SET [MatKhau] = @MatKhau, [HoTen] = @HoTen, [DiaChi] = @DiaChi, [SoDT] = @SoDT, [admin] = @admin, [tinhTrang] = @tinhTrang WHERE [TenDangNhap] = @TenDangNhap" ProviderName="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString.ProviderName %>">
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
            <asp:Parameter Name="tinhtrang" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MatKhau" Type="String" />
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="SoDT" Type="String" />
            <asp:Parameter Name="admin" Type="Int32" />
            <asp:Parameter Name="tinhtrang" Type="Int32" />
            <asp:Parameter Name="TenDangNhap" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br/>
    <h3><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Thêm tài khoản</b></h3>
    <table class="w-100">
        <tr>
            <td style="width: 199px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_tendn" runat="server" AssociatedControlID="TextBox_tendn" Text="Tên tài khoản:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_tendn" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_tendn" runat="server" ControlToValidate="TextBox_tendn" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Tên tài khoản không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 199px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_matkhau" runat="server" Text="Mật khẩu:" AssociatedControlID="TextBox_matkhau"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_matkhau" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_matkhau" runat="server" ControlToValidate="TextBox_matkhau" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Mật khẩu không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 199px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_hoten" runat="server" Text="Họ tên:" AssociatedControlID="TextBox_hoten"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_hoten" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_hoten" runat="server" ControlToValidate="TextBox_hoten" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Họ tên không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 199px; height: 25px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_diachi" runat="server" Text="Địa chỉ:" AssociatedControlID="TextBox_diachi"></asp:Label>
            </td>
            <td style="height: 25px">
                <asp:TextBox ID="TextBox_diachi" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_diachi" runat="server" ControlToValidate="TextBox_diachi" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Địa chỉ không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 199px; height: 25px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_sodt" runat="server" Text="Số điện thoại:" AssociatedControlID="TextBox_sodt"></asp:Label>
            </td>
            <td style="height: 25px">
                <asp:TextBox ID="TextBox_sodt" runat="server" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_sodt" runat="server" ControlToValidate="TextBox_sodt" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="validate_them">Số điện thoại không được để trống!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 199px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_admin" runat="server" Text="Admin:" AssociatedControlID="CheckBox_admin"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="CheckBox_admin" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 199px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_tinhtrang" runat="server" Text="Tình trạng:"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="CheckBox_tinhtrang" runat="server" />
            </td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Button ID="Button_them" runat="server" Text="Thêm" OnClick="Button_them_Click" ValidationGroup="validate_them" />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:Label ID="Label_error" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>

