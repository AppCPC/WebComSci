<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddExcellStudent.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddExcellStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style2
        {
            width: 52px;
        }
        .style3
        {
            width: 892px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 

    <div style="font-size:small;">
     <table style="padding: 5px; font-size: 11px;">
                <tbody>
                <tr>
                    <td class="style3">
                        <b style="font-size:small;">เลือกข้อมูลอาจารย์ที่ท่านต้องการดึงเข้าฐานข้อมูล...</b>
                        <br />
                        <br />
                        <br />
                        <div style="text-align:left; font-size: 16px; text-transform: capitalize; color: #FF0000; font-weight: bolder;">
                       &nbsp;</div>
                        <div style="text-align:left;color:Red;font-size:small; background-color: #CCCCFF;">
                            <b>ข้อกำหนดในการ upload ข้อมูล</b>
                        <br />
                        - ต้องเป็นไฟล์ Excell ที่นามสกุล .xls,.xlsx<br />
                        - ชื่อชีส ต้องชื่อ Sheet1
                            <br />
                            <strong>&nbsp; ตัวอย่าง</strong><table style="width:50%;">
                                <tr>
                                    <td style="background-color: #339966; font-size: 12px; font-weight: bolder; color: #FFFFFF; text-align: center;">
                                        &nbsp;ลำดับ&nbsp;</td>
                                    <td style="background-color: #339966; font-size: 12px; font-weight: bolder; color: #FFFFFF; text-align: center;">
                                        รหัส</td>
                                    <td style="background-color: #339966; font-size: 12px; font-weight: bolder; color: #FFFFFF; text-align: center;">
                                        ชื่อ</td>
                                </tr>
                                <tr>
                                    <td style="background-color: #FFFFCC">
                                        &nbsp;</td>
                                    <td style="background-color: #FFFFCC">
                                        &nbsp;</td>
                                    <td style="background-color: #FFFFCC">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="background-color: #FFFFCC">
                                        &nbsp;</td>
                                    <td style="background-color: #FFFFCC">
                                        &nbsp;</td>
                                    <td style="background-color: #FFFFCC">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                        </div>
                        </td>
                        
                </tr>
                    <tr>
                        <td class="style3">
                        <div style="background: #F2F2F2 url('../ClassRoom/hline.gif') repeat-x 50% bottom; padding: 8px 5px;border-bottom: 1px solid #ccc;">
                            <asp:FileUpload ID="txtFilePath" runat="server"></asp:FileUpload>&nbsp;&nbsp;<asp:Button 
                                ID="btnUpload" runat="server" Text="Upload" onclick="btnUpload_Click" 
                                Width="60px" />
                            <br />
                            <asp:Label ID="lblMessage" runat="server" Visible="False" Font-Bold="True" 
                                ForeColor="#009933"></asp:Label>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        <asp:GridView ID="grvExcelData" runat="server" Height="200px" Width="740px" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Small">
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" 
                                HorizontalAlign="Center" />
                        <RowStyle CssClass="sectiontableentry2" BackColor="#E3EAEB" />
                        <AlternatingRowStyle CssClass="sectiontableentry1" BackColor="White" />
                            <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                           <div style="text-align:right;"> 
                           
                           <table style="width: 100%;">
                                   <tr>
                                       <td class="style2">
                                           &nbsp;
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                                   <tr>
                                       <td class="style2">
                                           &nbsp;
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                                   <tr>
                                       <td class="style2">
                                           &nbsp;
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                                   <tr>
                                       <td class="style2">
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;</td>
                                       <td>
                            <asp:Button 
                                ID="btnOK" runat="server" Text="บันทึก" onclick="btnOK_Click" /> </td>
                                   </tr>
                                   <tr>
                                       <td class="style2">
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;</td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                               </table>
                           
                           </div>
                        <div style="text-align:right;">
                            &nbsp;
                            

        <asp:ImageButton ID="imgback" runat="server" Height="55px" 
            ImageUrl="~/image/back.ico" onclick="imgback_Click" />

    <span class="wrap">
 



    </span>

                            </div>
                            <br />

                          
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>

</asp:Content>
