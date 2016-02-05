<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ImportExcellCreateDetailTeach.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.CreateDetailTeach" %><%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register src="ucAddSubject.ascx" tagname="popupaddsubject" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .modalpopup{
   /* background-color:White;
    padding:6px 6px 6px 6px;
    margin-top:-35px;*/
         border: 2px solid Black;
        background-color: White;
        padding: 3px;
    }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-size:small;">
     <table style="padding: 5px; font-size: 11px;">
                <tbody>
                <tr>
                    <td>
                    <div style="font-size:large;text-align:left;">  เพิ่มรายละเอียดการสอน : 
                        <b style="font-size:small;">เลือกข้อมูลที่ท่านต้องการดึงเข้าฐานข้อมูล...</b>
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
