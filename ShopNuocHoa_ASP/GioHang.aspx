<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .btn{
            margin-right:20px;
            margin-left:20px;
        }
    </style>
    <div style="text-align:center">
        <h2>GIỎ HÀNG CỦA BẠN</h2>
    </div>
    <asp:gridview runat="server" ID="gvSP" DataSourceID="sqlDSP" Visible="False">
    </asp:gridview>
    <asp:sqldatasource runat="server" ID="sqlDSP" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT [MaSanPham], [TenSanPham], [NongDo], [XuatSu], [NamPhatHanh], [NhomHuong], [PhongCach], [DungTich], [MoTa], [Gia], [Anh] FROM [SanPham] WHERE ([MaSanPham] = @MaSanPham)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaSanPham" QueryStringField="MaSanPham" Type="Int32" />
        </SelectParameters>
    </asp:sqldatasource>
    <div>
        <asp:Panel ID="Panel1" runat="server" CssClass="container">
            <asp:gridview runat="server" AutoGenerateColumns="False" ID="gvGioHang" OnRowCommand="gvGioHang_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Mã sản phẩm">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("MaSanPham") %>'></asp:Label>
                            <br />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên sản phẩm">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("TenSanPham") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NongDo" HeaderText="Nồng độ" />
                    <asp:BoundField DataField="XuatSu" HeaderText="Xuất sứ" />
                    <asp:BoundField DataField="NamPhatHanh" HeaderText="Năm phát hành" />
                    <asp:TemplateField HeaderText="Nhóm hương">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("NhomHuong") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phong cách">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("PhongCach") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DungTich" HeaderText="Dung tích" />
                    <asp:TemplateField HeaderText="Mô tả">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Height="100px" Text='<%# Eval("MoTa") %>' Width="200px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Gia" HeaderText="Giá"  />
                    <asp:TemplateField HeaderText="Số lượng">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Eval("SoLuong") %>' BorderColor="Black" Width="50px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField DataImageUrlField="Anh" HeaderText="Ảnh" DataImageUrlFormatString="~/Img/imgProducts/{0}">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" />
                    <asp:ButtonField HeaderText="Cập nhập" Text="Cập nhập" ButtonType="Button" ValidationGroup="sl" />
                </Columns>
                <EmptyDataTemplate>
                    Không có hàng trong giỏ
                </EmptyDataTemplate>
            </asp:gridview>
        </asp:Panel>
        <br />
    </div>
    <div style="text-align:center" >
        <asp:label runat="server" ID="lblTongTien"></asp:label>
    </div>
    <div style="text-align:center">
        <asp:button runat="server" text="Đặt mua" PostBackUrl="~/DatMua.aspx" CssClass="btn" />
        <asp:button runat="server" text="Xóa giỏ hàng" ID="btnXoaGioHang" OnClick="btnXoaGioHang_Click" CssClass="btn" />
        <asp:Button ID="btnTiepTuc" runat="server" Text="Tiếp tục mua" PostBackUrl="~/TrangChu.aspx" CssClass="btn" />
    </div>
</asp:Content>

