<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="QuanLyDonHang.aspx.cs" Inherits="QuanLyDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin: 10px">
        <br />
        <label>
            <h3 style="color:#c60055">Tình Trạng Hóa Đơn :</h3>
        </label>

        <asp:DropDownList ID="droplist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="droplist_SelectedIndexChanged1">
            <asp:ListItem Value="true">Đã xác nhận</asp:ListItem>
            <asp:ListItem Value="false">Chưa xác nhận</asp:ListItem>
        </asp:DropDownList>
        <div style="height: 15px"></div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" DeleteCommand="DELETE FROM [DonHang] WHERE [MaDonHang] = @MaDonHang" InsertCommand="INSERT INTO [DonHang] ([HoTen], [soDT], [DiaChi], [NgayDatHang], [TenDangNhap], [TinhTrangDonHang]) VALUES (@HoTen, @soDT, @DiaChi, @NgayDatHang, @TenDangNhap, @TinhTrangDonHang)" SelectCommand="SELECT * FROM [DonHang] WHERE ([TinhTrangDonHang] = @TinhTrangDonHang)" UpdateCommand="UPDATE [DonHang] SET [HoTen] = @HoTen, [soDT] = @soDT, [DiaChi] = @DiaChi, [NgayDatHang] = @NgayDatHang, [TenDangNhap] = @TenDangNhap, [TinhTrangDonHang] = @TinhTrangDonHang WHERE [MaDonHang] = @MaDonHang">
            <DeleteParameters>
                <asp:Parameter Name="MaDonHang" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="HoTen" Type="String" />
                <asp:Parameter Name="soDT" Type="String" />
                <asp:Parameter Name="DiaChi" Type="String" />
                <asp:Parameter Name="NgayDatHang" Type="DateTime" />
                <asp:Parameter Name="TenDangNhap" Type="String" />
                <asp:Parameter Name="TinhTrangDonHang" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="droplist" Name="TinhTrangDonHang" PropertyName="SelectedValue" Type="Boolean" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="HoTen" Type="String" />
                <asp:Parameter Name="soDT" Type="String" />
                <asp:Parameter Name="DiaChi" Type="String" />
                <asp:Parameter Name="NgayDatHang" Type="DateTime" />
                <asp:Parameter Name="TenDangNhap" Type="String" />
                <asp:Parameter Name="TinhTrangDonHang" Type="Boolean" />
                <asp:Parameter Name="MaDonHang" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div style="width: 100%">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="MaDonHang" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemCanceling="ListView1_ItemCanceling" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating"    >
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF; color: #333333;">
                        <td style=" text-align:center">
                            <asp:Button ID="EditButton" runat="server" Width="90" Height="25" BorderWidth="1" BackColor="#9ccc65" Font-Bold="true" ForeColor="Black" Font-Size="Small" CommandName="Edit" Text="Sửa" />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="MaDonHangLabel" runat="server" Text='<%# Eval("MaDonHang") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="HoTenLabel" runat="server" Text='<%# Eval("HoTen") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="soDTLabel" runat="server" Text='<%# Eval("soDT") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Eval("DiaChi") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="NgayDatHangLabel" runat="server" Text='<%# Eval("NgayDatHang") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="TenDangNhapLabel" runat="server" Text='<%# Eval("TenDangNhap") %>' />
                        </td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="TinhTrangDonHangCheckBox" runat="server" Checked='<%# Eval("TinhTrangDonHang") %>' Enabled="false" />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:LinkButton runat="server"  Font-Bold="true" Font-Size="14px" ForeColor="#6b9b37"  CommandName="dosomething" > Chi Tiết</asp:LinkButton>
                           </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #FFFFFF">
                        <td style="text-align: center; padding: 7px">
                            <asp:Button ID="UpdateButton" runat="server" Width="90" Height="25" BorderWidth="1" BackColor="#c60055" Font-Bold="true" ForeColor="White" Font-Size="Small" CommandName="Update" Text="Cập nhật" />
                            <div style="height: 3px"></div>
                            <asp:Button ID="CancelButton" runat="server" Width="90" Height="25" BorderWidth="1" BackColor="White" ForeColor="#c60055" Font-Size="Small" CommandName="Cancel" Text="Trở lại" />
                        </td>
                        <td style="padding-left: 10px;">
                            <asp:Label ID="MaDonHangLabel" runat="server" Width="85px" Text='<%# Eval("MaDonHang") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="HoTenTextBox" runat="server" Width="200px" Text='<%# Bind("HoTen") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="soDTTextBox" runat="server" Width="140px" Text='<%# Bind("soDT") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="DiaChiTextBox" runat="server" Width="140px" Text='<%# Bind("DiaChi") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="NgayDatHangTextBox" runat="server" Width="140px" Text='<%# Bind("NgayDatHang") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="TenDangNhapTextBox" runat="server" Width="140px" Text='<%# Bind("TenDangNhap") %>' />
                        </td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="TinhTrangDonHangCheckBox" Width="140px" Checked='<%# Bind("TinhTrangDonHang") %>' runat="server" />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:LinkButton runat="server"  Font-Bold="true" Font-Size="14px" ForeColor="#6b9b37" CommandName="dosomething">Chi tiết</asp:LinkButton> 
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>
                                <h3>Không tìm thấy hóa đơn nào</h3>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="HoTenTextBox" runat="server" Text='<%# Bind("HoTen") %>' />
                        </td>
                        <td>
                            <asp:Label ID="soDTTextBox" runat="server" Text='<%# Bind("soDT") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NgayDatHangTextBox" runat="server" Text='<%# Bind("NgayDatHang") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TenDangNhapTextBox" runat="server" Text='<%# Bind("TenDangNhap") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="TinhTrangDonHangCheckBox" runat="server" Checked='<%# Bind("TinhTrangDonHang") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #FFFFFF; color: #333333;">
                        <td style="padding: 7px; text-align: center;">
                            <asp:Button ID="EditButton" runat="server" Width="90" Height="25" BorderWidth="1" BackColor="#9ccc65" Font-Bold="true" ForeColor="Black" Font-Size="Small" CommandName="Edit" Text="Sửa" />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="MaDonHangLabel" runat="server" Text='<%# Eval("MaDonHang") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="HoTenLabel" runat="server" Text='<%# Eval("HoTen") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="soDTLabel" runat="server" Text='<%# Eval("soDT") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Eval("DiaChi") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="NgayDatHangLabel" runat="server" Text='<%# Eval("NgayDatHang") %>' />
                        </td>
                        <td style="padding-left: 10px">
                            <asp:Label ID="TenDangNhapLabel" runat="server" Text='<%# Eval("TenDangNhap") %>' />
                        </td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="TinhTrangDonHangCheckBox" runat="server" Checked='<%# Eval("TinhTrangDonHang") %>' Enabled="false" />
                        </td>
                        <td style="padding-left: 10px">
                         
                            <asp:LinkButton runat="server" Font-Bold="true" Font-Size="14px" ForeColor="#6b9b37" CommandName="dosomething">Chi tiết</asp:LinkButton> 

                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #FE588F;height:50px; color: #333333;">
                                        <th style="width: 10px;font-size:10px" runat="server"></th>
                                        <th style="width: 80px;font-size:16px;color:white" runat="server">Mã ĐH</th>
                                        <th style="width: 200px;font-size:16px;color:white" runat="server">Họ Tên</th>
                                        <th style="width: 140px;font-size:16px;color:white" runat="server">Số Điện Thoại</th>
                                        <th style="width: 140px;font-size:16px;color:white" runat="server">Địa Chỉ</th>
                                        <th style="width: 140px;font-size:16px;color:white" runat="server">Ngày Đặt</th>
                                        <th style="width: 140px;font-size:16px;color:white" runat="server">Tên Đăng Nhập</th>
                                        <th style="width: 140px;font-size:16px;color:white" runat="server">Tình Trạng ĐH</th>
                                        <th style="width: 85px" runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: white; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                                <div style="height: 15px"></div>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Image" ShowFirstPageButton="True" ShowLastPageButton="True" LastPageText="Trang cuối" NextPageText="Trang kế tiếp" PreviousPageText="Trang sau đó" FirstPageImageUrl="Img/first_button.png" RenderDisabledButtonsAsLabels="False" FirstPageText="Trang đầu" LastPageImageUrl="Img/last_button.png" NextPageImageUrl="Img/next_button.png" PreviousPageImageUrl="Img/previous_button.png" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                        <td>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="MaDonHangLabel" runat="server" Text='<%# Eval("MaDonHang") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HoTenLabel" runat="server" Text='<%# Eval("HoTen") %>' />
                        </td>
                        <td>
                            <asp:Label ID="soDTLabel" runat="server" Text='<%# Eval("soDT") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Eval("DiaChi") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NgayDatHangLabel" runat="server" Text='<%# Eval("NgayDatHang") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TenDangNhapLabel" runat="server" Text='<%# Eval("TenDangNhap") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="TinhTrangDonHangCheckBox" runat="server" Checked='<%# Eval("TinhTrangDonHang") %>' Enabled="false" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
    </div>

    <div style=" width:100%; height: 100%">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="SELECT * FROM [DonHang] WHERE ([MaDonHang] = @MaDonHang)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MaDonHang" QueryStringField="MaDonHang" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource> 
             
         <div style="margin:  0px 10px 10px 13px">
            <asp:FormView ID="FormView1"  runat="server" Width="100%" DataKeyNames="MaDonHang" DataSourceID="SqlDataSource2">
                <EditItemTemplate>
                    MaDonHang:
                   <asp:Label ID="MaDonHangLabel" runat="server" Text='<%# Eval("MaDonHang") %>' />
                    <br />
                    HoTen:
                   <asp:TextBox ID="HoTenTextBox" runat="server" Text='<%# Bind("HoTen") %>' />
                    <br />
                    soDT:
                   <asp:TextBox ID="soDTTextBox" runat="server" Text='<%# Bind("soDT") %>' />
                    <br />
                    DiaChi:
                   <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                    <br />
                    NgayDatHang:
                   <asp:TextBox ID="NgayDatHangTextBox" runat="server" Text='<%# Bind("NgayDatHang") %>' />
                    <br />
                    TenDangNhap:
                   <asp:TextBox ID="TenDangNhapTextBox" runat="server" Text='<%# Bind("TenDangNhap") %>' />
                    <br />
                    TinhTrangDonHang:
                   <asp:CheckBox ID="TinhTrangDonHangCheckBox" runat="server" Checked='<%# Bind("TinhTrangDonHang") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    HoTen:
                   <asp:TextBox ID="HoTenTextBox" runat="server" Text='<%# Bind("HoTen") %>' />
                    <br />
                    soDT:
                   <asp:TextBox ID="soDTTextBox" runat="server" Text='<%# Bind("soDT") %>' />
                    <br />
                    DiaChi:
                   <asp:TextBox ID="DiaChiTextBox" runat="server" Text='<%# Bind("DiaChi") %>' />
                    <br />
                    NgayDatHang:
                   <asp:TextBox ID="NgayDatHangTextBox" runat="server" Text='<%# Bind("NgayDatHang") %>' />
                    <br />
                    TenDangNhap:
                   <asp:TextBox ID="TenDangNhapTextBox" runat="server" Text='<%# Bind("TenDangNhap") %>' />
                    <br />
                    TinhTrangDonHang:
                   <asp:CheckBox ID="TinhTrangDonHangCheckBox" runat="server" Checked='<%# Bind("TinhTrangDonHang") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table class="w-100" style="margin-bottom:15px;margin-top:15px"">
                        <tr>
                            <td colspan="8">
                                <h4 style="color:#c60055">Chi tiết đơn hàng</h4>
                            </td>
                            <tr>
                        <tr >
                            <td style="font-size: 20px;line-height:45px; width:140px;height:45px" >Mã đơn hàng: </td>
                             <td style="font-size: 18px;line-height:45px; font-style:italic; width:140px;height:45px" >
                                <asp:Label ID="MaDonHangLabel" runat="server" Text='<%# Eval("MaDonHang") %>' />
                            </td>
                             <td style="font-size: 20px;line-height:45px; width:200px;height:45px" >Họ Tên:</td>
                      <td style="font-size: 18px;line-height:45px; font-style:italic; width:230px;height:45px" >
                                <asp:Label ID="HoTenLabel" runat="server" Text='<%# Bind("HoTen") %>' />
                            </td>
                       <td style="font-size: 20px;line-height:45px; width:170px;height:45px" >Tên đăng nhâp:</td>
                           <td style="font-size: 18px;line-height:45px; font-style:italic; width:140px;height:45px" >
                                <asp:Label ID="TenDangNhapLabel" runat="server" Text='<%# Bind("TenDangNhap") %>' /></td>
                     <td style="font-size: 20px;line-height:45px; width:100px;height:45px" >Địa chỉ:</td>
                           <td style="font-size: 18px;line-height:45px; font-style:italic; width:100px;height:45px" >
                                <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Bind("DiaChi") %>' />

                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 20px;line-height:45px;  height:45px" >Số Điện Thoại:</td>
                              <td style="font-size: 18px;line-height:45px; font-style:italic; width:140px;height:45px" >
                                <asp:Label ID="soDTLabel" runat="server" Text='<%# Bind("soDT") %>' /></td>

                              <td style="font-size: 20px;line-height:45px; height:45px" >Ngày đặt hàng:</td>
                            <td style="font-size: 18px; font-style:italic; width:230px;height:45px" >
                                <asp:Label ID="NgayDatHangLabel" runat="server" Text='<%# Bind("NgayDatHang") %>' /></td>
                            <td colspan="2" style="font-size: 20px">Tình trạng đơn hàng:</td>
                            <td colspan="2">
                                <asp:CheckBox ID="TinhTrangDonHangCheckBox" runat="server" Checked='<%# Bind("TinhTrangDonHang") %>' Enabled="false" />
                            </td>
                        </tr>

                    </table>
                </ItemTemplate>
            </asp:FormView>  

        <asp:ListView ID="ListView2" runat="server"    DataSourceID="SqlDataSource3">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; height:150px;   color: #333333;">
                     <td style="text-align:center">
                        <asp:Image ID="AnhLabel" runat="server" Width="90px" Height="120" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' />
                    </td>
                  <td style="width:350px;padding-left:10px"">
                        <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' />
                    </td>
                    <td style="width:150px;padding-left:10px;text-align:center">
                        <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' />
                    </td>
                     <td style="width:150px;padding-left:10px;text-align:center">
                        <asp:Label ID="SoLuongLabel" runat="server" Text='<%# Eval("SoLuong") %>' />
                    </td>
                      <td style="width:150px;padding-left:10px;text-align:center">
                        <asp:Label ID="ThanhTienLabel" runat="server" Text='<%# Eval("ThanhTien") %>' />
                    </td>
                   
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="TenSanPhamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                    </td>
                    <td>
                         <asp:TextBox ID="SoLuongTextBox" runat="server" Text='<%# Bind("SoLuong") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ThanhTienTextBox" runat="server" Text='<%# Bind("ThanhTien") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr> 
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="TenSanPhamTextBox" runat="server" Text='<%# Bind("TenSanPham") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="GiaTextBox" runat="server" Text='<%# Bind("Gia") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SoLuongTextBox" runat="server" Text='<%# Bind("SoLuong") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ThanhTienTextBox" runat="server" Text='<%# Bind("ThanhTien") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AnhTextBox" runat="server" Text='<%# Bind("Anh") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFFFF;height:150px; color: #333333;">
                       <td  style="text-align:center;width:300px;" >
                        <asp:Image ID="AnhLabel" runat="server" Width="90px" Height="120" ImageUrl='<%# Eval("Anh", "~/Img/imgProducts/{0}") %>' />
                    </td>
                         <td style="width:400px;padding-left:30px"">
                        <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' />
                    </td>
                    <td style="width:170px;padding-left:10px;text-align:center">
                        <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' />
                    </td>
                    <td style="width:170px;padding-left:10px;text-align:center">
                        <asp:Label ID="SoLuongLabel" runat="server" Text='<%# Eval("SoLuong") %>' />
                    </td>
                   <td style="width:190px;padding-left:10px;text-align:center">
                        <asp:Label ID="ThanhTienLabel" runat="server" Text='<%# Eval("ThanhTien") %>' />
                    </td>
                 
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                              <tr runat="server" style="background-color: #FFFFFF;height:35px; color: #333333;">
                                    <th style="color:black;font-size:12px" runat="server">Ảnh</th>
                                    <th  style="color:black;font-size:15px" runat="server">Tên Sản phẩm</th>
                                    <th  style="color:black;font-size:15px" runat="server">Giá</th>
                                    <th  style="color:black;font-size:15px" runat="server">Số Lượng</th>
                                    <th  style="color:black;font-size:15px" runat="server">Thành Tiền</th> 
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                    <td style="width:10px">
                        <asp:Label ID="TenSanPhamLabel" runat="server" Text='<%# Eval("TenSanPham") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GiaLabel" runat="server" Text='<%# Eval("Gia") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SoLuongLabel" runat="server" Text='<%# Eval("SoLuong") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ThanhTienLabel" runat="server" Text='<%# Eval("ThanhTien") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AnhLabel" runat="server" Text='<%# Eval("Anh") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand=" SELECT  TenSanPham, Gia,SoLuong  , Gia*SoLuong as 'ThanhTien',Anh 
 FROM  DonHang inner join ChiTietDonHang 
 on DonHang.MaDonHang=ChiTietDonHang.MaDonHang 
 inner join SanPham on ChiTietDonHang.MaSanPham=SanPham.MaSanPham  
 where DonHang.MaDonHang=@MaDonHang
">
             <SelectParameters>
                <asp:QueryStringParameter Name="MaDonHang" QueryStringField="MaDonHang" Type="Int32" />
            </SelectParameters>
            
                   
        </asp:SqlDataSource>
        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource4">
            <EditItemTemplate>
                ThanhTien:
                <asp:TextBox ID="ThanhTienTextBox" runat="server" Text='<%# Bind("ThanhTien") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                ThanhTien:
                <asp:TextBox ID="ThanhTienTextBox" runat="server" Text='<%# Bind("ThanhTien") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                
                <br />
                <table class="w-100">
                    <tr>
                         <td>
                       <asp:Label ID="Label1" Font-Bold="true" Font-Size="25px" Width="150px" ForeColor="#c60055" runat="server" Text="Tổng tiền :" />
                             </td>
                       <td>
                            <asp:Label ID="ThanhTienLabel"  Font-Bold="true" Font-Size="25px" ForeColor="#c60055" runat="server" Text='<%# Bind("ThanhTien") %>' />
                        </td>
                    </tr>
                </table>
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SHOPNUOCHOAConnectionString %>" SelectCommand="  SELECT  Sum( Gia*SoLuong) as 'ThanhTien'
 FROM  DonHang inner join ChiTietDonHang 
 on DonHang.MaDonHang=ChiTietDonHang.MaDonHang 
 inner join SanPham on ChiTietDonHang.MaSanPham=SanPham.MaSanPham  
 where DonHang.MaDonHang=@MaDonHang ">
            <SelectParameters>
                <asp:QueryStringParameter Name="MaDonHang" QueryStringField="MaDonHang" />
            </SelectParameters>
        </asp:SqlDataSource> 
    </div>
        </div>















</asp:Content>

