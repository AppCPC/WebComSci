<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ImportUserTeacher.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ImportUserTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 94px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-size:small;">
     <table style="padding: 5px; font-size: 11px;">
                <tbody>
                <tr>
                    <td class="style1">
                        <b style="font-size:small;">เลือกข้อมูลอาจารย์ที่ท่านต้องการดึงเข้าฐานข้อมูล...</b>
                        <br />
                        <br />
                        <br />
                        <div style="text-align:left;color:Red;font-size:small;">
                            <b>ข้อกำหนดในการ upload ข้อมูล</b>
                        <br />
                        - ต้องเป็นไฟล์ Excell ที่นามสกุล .xls,.xlsx<br />
                        - ชื่อชีส ต้องชื่อ Sheet1
                        </div>
                        </td>
                        
                </tr>
                    <tr>
                        <td>
                        <div style="background: url(hline.gif) repeat-x bottom #F2F2F2;padding: 8px 5px;border-bottom: 1px solid #ccc;">
                            <asp:FileUpload ID="txtFilePath" runat="server"></asp:FileUpload>&nbsp;&nbsp;<asp:Button 
                                ID="btnUpload" runat="server" Text="Upload" onclick="btnUpload_Click" />
                            <br />
                            <asp:Label ID="lblMessage" runat="server" Visible="False" Font-Bold="True" 
                                ForeColor="#009933"></asp:Label>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:GridView ID="grvExcelData" runat="server" Height="200" Width="740px" 
                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                CellPadding="2" ForeColor="Black" GridLines="None" Font-Size="Small">
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                        <RowStyle CssClass="sectiontableentry2" />
                        <AlternatingRowStyle CssClass="sectiontableentry1" BackColor="PaleGoldenrod" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                        <div style="text-align:right;">
                            <asp:Button 
                                ID="btnOK" runat="server" Text="บันทึก" onclick="btnOK_Click" />
                            </div>
                            <br />

                          
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>
</asp:Content>
