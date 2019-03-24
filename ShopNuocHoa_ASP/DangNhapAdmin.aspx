<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="DangNhapAdmin.aspx.cs" Inherits="DangNhapAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" CssClass="w-100 d-flex justify-content-center">
            <asp:Panel ID="Panel2" runat="server" CssClass="w-50 text-center mt-5 mb-5 login-form">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Đăng nhập hệ thống"></asp:Label>
                <br />
                <asp:Panel ID="Panel3" runat="server" CssClass="text-left mt-5">
                    <asp:Label ID="Label2" runat="server" Text="Tên tài khoản"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtUername" runat="server" CssClass="form-control  mt-1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqTenDN" runat="server" ControlToValidate="txtUername" ErrorMessage="Bạn phải nhập username" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Mật khẩu"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mt-1" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqMK" runat="server" ControlToValidate="txtPassword" ErrorMessage="Bạn phải nhập password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary mt-2" Text="Đăng nhập" OnClick="btnLogin_Click" />
                    <asp:HyperLink ID="HyperLink37" runat="server" CssClass="float-right mt-3" ForeColor="Blue" NavigateUrl="~/DangNhap.aspx">Đăng nhập khách hàng</asp:HyperLink>
                </asp:Panel>
                <asp:SqlDataSource ID="sqlTaiKhoan" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT * FROM [TaiKhoan] WHERE (([TenDangNhap] = @TenDangNhap) AND ([MatKhau] = @MatKhau) AND ([admin] = @admin))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUername" Name="TenDangNhap" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPassword" Name="MatKhau" PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="admin" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:Panel>
        </asp:Panel>
</asp:Content>

