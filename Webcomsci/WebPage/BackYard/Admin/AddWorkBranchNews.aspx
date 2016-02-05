<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddWorkBranchNews.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddWorkBranchNews" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="HTMLEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />

   <%--   <div id="test" runat="server" style="position:absolute;margin-left:400px;margin-top:-50px;">
                    <asp:ImageButton ID="imgPic" runat="server" Height="98px" Visible="False" Width="91px" /> --%>

    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" >
    </ajaxToolkit:ToolkitScriptManager>
    <table style="width:98%; text-align:left; margin-right: 0px; height: 548px;" >
        <tr>
            <td class="auto-style24"><strong __designer:mapid="e7">&nbsp;กิจกรรมสาขา..</strong></td>
            <td class="auto-style27">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25">ชื่อเรื่อง:</td>
            <td class="auto-style26">
                <asp:TextBox ID="txttitle" runat="server" CssClass="textbox_in_back"></asp:TextBox>
            </td>
        <tr>
            <td class="auto-style24">รูปภาพ:</td>
            <td class="auto-style27">
                  
                      <%--     <asp:Image ID="Img" runat="server" ControlStyle-Height="50" ControlStyle-Width="50" Height="107px" style="margin-left: 0px" Width="113px" />
                    <asp:Button ID="UploadButton" runat="server" Height="25px" onclick="UploadButton_Click" text="Upload" Width="105px" />--%></div>
                    <asp:FileUpload ID="FUCPic" runat="server" Height="27px" style="margin-left: 0px" 
                          Width="207px" CssClass="textbox_in_back" />
                    &nbsp;
                  
                    <%--     <asp:Image ID="Img" runat="server" ControlStyle-Height="50" ControlStyle-Width="50" Height="107px" style="margin-left: 0px" Width="113px" />
                    <asp:Button ID="UploadButton" runat="server" Height="25px" onclick="UploadButton_Click" text="Upload" Width="105px" />--%>
                </td>
        </tr>
        <tr>
            <td class="auto-style24">วันหมดอายุ</td>
            <td class="auto-style27">
                <asp:TextBox ID="txtdate" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtdate" CssClass="MyCalendar" Format="dd/MM/yyyy"/>
            </td>
        <caption style="background-color: #666699; font-weight: bold; color: #FFFFFF; margin-left: 14px;">
                    เพิ่มข้อมูล<tr>
            <td class="auto-style24">รายละเอียด:</td>
            <td class="auto-style27">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style19">&nbsp;</td>
                    </tr>
                </table>
        <tr>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style27">
                <div style="width: 631px">
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>
                            <HTMLEditor:Editor ID="editor" runat="server" AutoFocus="true" Height="300px" OnContentChanged="ContentChanged" style="text-align: center" Width="100%" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
                        </td>
                    </tr>
                </caption>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style27">
                        <center>
                            <asp:Button ID="btnok" runat="server" Height="34px" OnClick="btnok_Click" 
                                Text="บันทึกข้อมูล" Width="97px" CssClass="button_in_back" />
                            &nbsp;
                            <asp:Button ID="btnCancel" runat="server" Height="34px" 
                                OnClick="btnCancel_Click" Text="ยกเลิก" Width="82px" 
                                CssClass="button_in_back" />
                        </center>
                    </td>
        </tr>
    </table>
</asp:Content>
