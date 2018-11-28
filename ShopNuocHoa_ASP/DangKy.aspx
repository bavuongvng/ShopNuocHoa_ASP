<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" CssClass="w-100 d-flex justify-content-center">
        <asp:Panel ID="Panel2" runat="server" CssClass="w-50 text-center mt-5 mb-5">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Đăng ký"></asp:Label>
            <br />
            <asp:Panel ID="Panel3" runat="server" CssClass="text-left mt-5">
                <asp:Label ID="Label2" runat="server" Text="Tên tài khoản"></asp:Label>
                <br />
                <asp:TextBox ID="txtUername" runat="server" CssClass="form-control  mt-1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUername" ErrorMessage="Bạn phải nhập username" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Mật khẩu"></asp:Label>
                <br />
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mt-1" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Bạn phải nhập password" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Họ tên"></asp:Label>
                <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control mt-1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHoTen" ErrorMessage="Bạn phải nhập họ tên" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Địa chỉ"></asp:Label>
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control mt-1"></asp:TextBox>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Số điện thoại"></asp:Label>
                <asp:TextBox ID="txtSoDT" runat="server" CssClass="form-control mt-1"></asp:TextBox>
                <br />
                <asp:Button ID="btnDangKy" runat="server" CssClass="btn btn-primary mt-2" Text="Đăng ký" OnClick="btnDangKy_Click" />
                <asp:HyperLink ID="HyperLink37" runat="server" CssClass="float-right mt-3" ForeColor="Blue" NavigateUrl="~/DangNhap.aspx">Đăng nhập</asp:HyperLink>
            </asp:Panel>
            <asp:Label ID="lbThongBao" runat="server" CssClass="float-left" ForeColor="Red"></asp:Label>
            <br />
            <asp:SqlDataSource ID="sqlTaiKhoan" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" DeleteCommand="DELETE FROM [TaiKhoan] WHERE [TenDangNhap] = @TenDangNhap" InsertCommand="INSERT INTO [TaiKhoan] ([TenDangNhap], [MatKhau], [HoTen], [DiaChi], [SoDT], [admin], [tinhTrang]) VALUES (@TenDangNhap, @MatKhau, @HoTen, @DiaChi, @SoDT, @admin, @tinhTrang)" SelectCommand="SELECT * FROM [TaiKhoan]" UpdateCommand="UPDATE [TaiKhoan] SET [MatKhau] = @MatKhau, [HoTen] = @HoTen, [DiaChi] = @DiaChi, [SoDT] = @SoDT, [admin] = @admin, [tinhTrang] = @tinhTrang WHERE [TenDangNhap] = @TenDangNhap">
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
            <br />
        </asp:Panel>
    </asp:Panel>
</asp:Content>

