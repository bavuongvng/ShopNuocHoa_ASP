<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Panel ID="Panel1" runat="server" CssClass="w-100 d-flex justify-content-center">
            <asp:Panel ID="Panel2" runat="server" CssClass="w-50 text-center mt-5 mb-5">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Đăng nhập hệ thống"></asp:Label>
                <br />
                <asp:Panel ID="Panel3" runat="server" CssClass="text-left mt-5">
                    <asp:Label ID="Label2" runat="server" Text="Tên tài khoản"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtUername" runat="server" CssClass="form-control  mt-1"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Mật khẩu"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mt-1" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary mt-2" OnClick="btnLogin_Click" Text="Đăng nhập" />
                </asp:Panel>
                <asp:SqlDataSource ID="sqlDsAccount" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT * FROM [TaiKhoan] WHERE (([TenDangNhap] = @TenDangNhap) AND ([MatKhau] = @MatKhau))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUername" Name="TenDangNhap" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPassword" Name="MatKhau" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:Panel>
        </asp:Panel>
    
</asp:Content>

