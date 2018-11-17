<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="mt-5 rounded shadow col-6 shadow p-5 mb-4 login-form">
                <h3 class="text-center mb-4">Đăng nhập</h3>
                <form action="DanhMucNuocHoa.aspx">
                    <div class="form-group">
                        <label for="usr">Tên tài khoản</label>
                        <asp:TextBox class="form-control" ID="usr" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="pwd">Mật khẩu:</label>
                        <asp:TextBox class="form-control" ID="pwd" runat="server" TextMode="Password" />
                    </div>
                    <div>
                        <asp:Button runat="server" ID="btnLogin" class="btn btn-primary" Text="Đăng nhập" OnClick="btnLogin_Click" />
                        <asp:LinkButton ID="LinkButton1" CssClass="float-right btn-link" runat="server">Quên mật khẩu?</asp:LinkButton>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

