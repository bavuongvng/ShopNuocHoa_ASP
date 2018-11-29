<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DatMua.aspx.cs" Inherits="DatMua" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center">
        <h1>
            NHẬP THÔNG TIN CỦA BẠN
        </h1>
    </div>
    <div style="text-align:center">
        <asp:Label ID="Label1" runat="server" Text="Họ tên:" Width="150px"></asp:Label><asp:TextBox ID="txtHoTen" runat="server" Width="300px" ValidationGroup="vldThongBao"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHoTen" ErrorMessage="Bạn cần nhập họ tên" ForeColor="Red" ValidationGroup="vldThongBao" Width="200px"></asp:RequiredFieldValidator>
    <br />
        <asp:Label ID="Label2" runat="server" Text="Số điện thoại: " Width="150px"></asp:Label><asp:TextBox ID="txtSoDT" runat="server" Width="300px" ValidationGroup="vldThongBao"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSoDT" ErrorMessage="Bạn cần nhập số điện thoại" ForeColor="Red" ValidationGroup="vldThongBao" Width="200px"></asp:RequiredFieldValidator>
    <br />
        <asp:Label ID="Label3" runat="server" Text="Địa chỉ: " Width="150px"></asp:Label><asp:TextBox ID="txtDiaChi" runat="server" Width="300px" ValidationGroup="vldThongBao"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDiaChi" ErrorMessage="Bạn cần nhập địa chỉ" ForeColor="Red" ValidationGroup="vldThongBao" Width="200px"></asp:RequiredFieldValidator>
    <br />
        <asp:Label ID="Label4" runat="server" Text="Tên đăng nhập: " Width="150px"></asp:Label><asp:TextBox ID="txtTenDangNhap" runat="server" Width="300px" ValidationGroup="vldThongBao"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTenDangNhap" ErrorMessage="Bạn cần nhập tên ĐN" ForeColor="Red" ValidationGroup="vldThongBao" Width="200px"></asp:RequiredFieldValidator>
    <br />
        <asp:Label ID="Label5" runat="server" Text="Ngày đặt hàng: " Width="150px"></asp:Label><asp:TextBox ID="txtNgayDatHang" runat="server" Width="500px" BorderStyle="None" ReadOnly="True"></asp:TextBox>
    </div>
    <div style="text-align:center">
        <asp:LinkButton ID="lbtnXacNhan" PostBackUrl='<%# Eval("MaDonHang", "ThongBao.aspx?MaDonHang={0}") %>' CssClass="btn btn-success btn-sm btn-action" runat="server" OnClick="lbtnXacNhan_Click" ValidationGroup="vldThongBao">Xác nhận</asp:LinkButton>
        <asp:LinkButton ID="lbtnTroVe" PostBackUrl="~/GioHang.aspx" CssClass="btn btn-success btn-sm btn-action" runat="server">Trở về</asp:LinkButton>
    </div>
    <div>
        <asp:SqlDataSource ID="SqlDDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" DeleteCommand="DELETE FROM [DonHang] WHERE [MaDonHang] = @MaDonHang" InsertCommand="INSERT INTO [DonHang] ([HoTen], [soDT], [DiaChi], [NgayDatHang], [TenDangNhap]) VALUES (@HoTen, @soDT, @DiaChi, @NgayDatHang, @TenDangNhap)" SelectCommand="SELECT * FROM [DonHang]" UpdateCommand="UPDATE [DonHang] SET [HoTen] = @HoTen, [soDT] = @soDT, [DiaChi] = @DiaChi, [NgayDatHang] = @NgayDatHang, [TenDangNhap] = @TenDangNhap WHERE [MaDonHang] = @MaDonHang">
            <DeleteParameters>
                <asp:Parameter Name="MaDonHang" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="HoTen" Type="String" />
                <asp:Parameter Name="soDT" Type="String" />
                <asp:Parameter Name="DiaChi" Type="String" />
                <asp:Parameter Name="NgayDatHang" Type="DateTime" />
                <asp:Parameter Name="TenDangNhap" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="HoTen" Type="String" />
                <asp:Parameter Name="soDT" Type="String" />
                <asp:Parameter Name="DiaChi" Type="String" />
                <asp:Parameter Name="NgayDatHang" Type="DateTime" />
                <asp:Parameter Name="TenDangNhap" Type="String" />
                <asp:Parameter Name="MaDonHang" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

