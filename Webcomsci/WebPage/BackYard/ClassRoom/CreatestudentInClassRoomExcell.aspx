<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="CreatestudentInClassRoomExcell.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.CreatestudentInClassRoomExcell" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxtoolkit" %>
<%@ Register src="../Admin/ucManageUserStudent.ascx" tagname="popupstudent" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .textleft
        {
            text-align:left;
        }
        .textright
        {
           text-align:right;    
        }
            
        .style2
        {
            width: 52px;
        }
        .style17
        {
            width: 49px;
        }
        .style18
        {
            width: 78px;
        }
        .style19
        {
            width: 61px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

      <div class="content_box_curve">

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
                        <div style="text-align:left;color:Red;font-size:small;">
                            <b>ข้อกำหนดในการ upload ข้อมูล</b>
                        <br />
                        - ต้องเป็นไฟล์ Excell ที่นามสกุล .xls,.xlsx<br />
                        - ชื่อชีส ต้องชื่อ Sheet1
                            <br />
                            <strong>&nbsp; ตัวอย่าง</strong>
                                          &nbsp;<table cellpadding="0" cellspacing="0" class="style4">
                            <tr>
                                <td class="style17" 
                                    
                                    
                                    style="border: 1px solid #808080; background-color: #5F5F5F; font-family: tahoma; font-size: small; color: #FFFFFF; text-align: center;">
                                    ลำดับ</td>
                                <td class="style18" 
                                    
                                    
                                    style="border: 1px solid #808080; background-color: #5F5F5F; font-family: tahoma; font-size: small; color: #FFFFFF; text-align: center;">
                                    รหัส</td>
                                <td class="style19" 
                                    
                                    
                                    style="border: 1px solid #808080; background-color: #5F5F5F; font-family: tahoma; font-size: small; color: #FFFFFF; text-align: center;">
                                    ชื่อ</td>
                            </tr>
                            <tr>
                                <td class="style17" 
                                    style="border: 1px solid #808080; background-color: #EFEFEF;">
                                    &nbsp;</td>
                                <td class="style18" 
                                    style="border: 1px solid #808080; background-color: #EFEFEF;">
                                    &nbsp;</td>
                                <td style="border: 1px solid #808080; background-color: #EFEFEF;" 
                                    class="style19">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17" 
                                    style="border: 1px solid #808080; background-color: #EFEFEF;">
                                    &nbsp;</td>
                                <td class="style18" 
                                    style="border: 1px solid #808080; background-color: #EFEFEF;">
                                    &nbsp;</td>
                                <td style="border: 1px solid #808080; background-color: #EFEFEF;" 
                                    class="style19">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17" 
                                    style="border: 1px solid #808080; background-color: #EFEFEF;">
                                    &nbsp;</td>
                                <td class="style18" 
                                    style="border: 1px solid #808080; background-color: #EFEFEF;">
                                    &nbsp;</td>
                                <td style="border: 1px solid #808080; background-color: #EFEFEF;" 
                                    class="style19">
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
                            <asp:FileUpload ID="txtFilePath" runat="server"></asp:FileUpload>&nbsp;&nbsp;
                            <asp:Button  ID="btnUpload" runat="server" Text="Upload" 
                                onclick="btnUpload_Click" CssClass="button_in_back"
                                Width="89px" />
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
                                ID="btnOK" runat="server" Text="บันทึก" onclick="btnOK_Click" Height="28px" CssClass="button_in_back"
                                               Width="75px" /> </td>
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
                            

        <%--<asp:ImageButton ID="imgback" runat="server" Height="55px" 
            ImageUrl="~/image/back.ico" onclick="imgback_Click" />--%>

    <span class="wrap">
 



    </span>

                            </div>
                            <br />

                          
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>

            </div>
           <div style="width: 100%;" align="right">
        <asp:ImageButton ID="imgback" runat="server" Height="55px" 
            ImageUrl="~/image/Detail/Icon_backward.png" onclick="imgback_Click" />
         </div>
</asp:Content>
