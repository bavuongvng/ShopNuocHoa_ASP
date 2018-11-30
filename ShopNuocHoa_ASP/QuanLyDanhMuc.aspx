<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="QuanLyDanhMuc.aspx.cs" Inherits="QuanLyDanhMucAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="text-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trang quản lý danh mục</h2>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView_dsdanhmuc" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaDanhMuc" DataSourceID="SqlDataSource_dsdanhmuc" ForeColor="#333333" GridLines="None" OnRowDeleted="gvdanhmuc_RowDeleted" OnRowUpdated="GridView_dsdanhmuc_RowUpdated" Width="829px" OnRowUpdating="GridView_dsdanhmuc_RowUpdating" OnRowCommand="GridView_dsdanhmuc_RowCommand" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="MaDanhMuc" HeaderText="Mã danh mục" InsertVisible="False" ReadOnly="True" SortExpression="MaDanhMuc" />
                <asp:BoundField DataField="TenDanhMuc" HeaderText="Tên danh mục" SortExpression="TenDanhMuc" />
                <asp:CommandField CancelText="Hủy bỏ" DeleteText="Xóa" EditText="Sửa" InsertText="Chèn" NewText="Tạo mới" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_dsdanhmuc" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" DeleteCommand="DELETE FROM [DanhMuc] WHERE [MaDanhMuc] = @MaDanhMuc" InsertCommand="INSERT INTO [DanhMuc] ([TenDanhMuc]) VALUES (@TenDanhMuc)" SelectCommand="SELECT * FROM [DanhMuc]" UpdateCommand="UPDATE [DanhMuc] SET [TenDanhMuc] = @TenDanhMuc WHERE [MaDanhMuc] = @MaDanhMuc" ProviderName="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="MaDanhMuc" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TenDanhMuc" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TenDanhMuc" Type="String" />
                <asp:Parameter Name="MaDanhMuc" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T<span style="font-size: large">hêm danh mục mới<br />
    </span>
    <table class="w-100">
        <tr>
            <td style="width: 150px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label2" runat="server" Text="Tên danh mục"></asp:Label>
                :</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtten" runat="server" Width="339px" ValidationGroup="validate_them"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtten" ErrorMessage="Tên danh mục không được để trống" ForeColor="Red" ValidationGroup="validate_them"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </strong>
    <asp:Button ID="btnthem" runat="server" OnClick="btnthem_Click" Text="Thêm mới" ValidationGroup="validate_them" />
    <br />
    <asp:Label ID="lblthongbao" runat="server"></asp:Label>
    <br />






























    </asp:Content>

