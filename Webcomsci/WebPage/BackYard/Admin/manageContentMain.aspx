<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="manageContentMain.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.manageContentMain" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="HTMLEditor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 150px;
        }
        .style2
        {
            width: 103px;
            text-align:left;
        }
        .style3
        {
            width: 714px;
          text-align:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style1" 
                style="font-family: tahoma; font-weight: bold; color: #000000; text-align: right">
                จัดการข้อมูลหลัก</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">

    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" ></ajaxToolkit:ToolkitScriptManager>


            </td>
                 <td>
                     &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" style="font-family: tahoma; font-size: 15px; color: #000000">
                ชื่อ</td>
            <td class="style3" >
                <asp:TextBox ID="txttitle" runat="server"></asp:TextBox>
            </td>
                 <td>
                     &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" style="font-family: tahoma; font-size: 15px; color: #000000">
                รูป</td>
            <td class="style3">
                    <asp:FileUpload ID="FUCPic" runat="server" Height="27px" style="margin-left: 0px" Width="207px" />
                    </td>
        </tr>
           <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" style="font-family: tahoma; font-size: 15px; color: #000000">
                ไฟล์ประกอบ</td>
            <td class="style3">
                    <asp:FileUpload ID="FUCPic0" runat="server" Height="27px" 
                    style="margin-left: 0px" Width="207px" />
                    </td>
                 <td>
                     &nbsp;</td>
        </tr>
      <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" style="font-family: tahoma; font-size: 15px; color: #000000">
                รายละเอียด</td>
            <td class="style3">
                            &nbsp;</td>
                 <td>
                     &nbsp;</td>
        </tr>

         <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                </td>
            <td class="style3">
                            <HTMLEditor:Editor ID="editor" runat="server" AutoFocus="true" Height="300px" 
                                OnContentChanged="ContentChanged" style="text-align: center" 
                                Width="100%" />
                        </td>
                 <td>
                     &nbsp;</td>
        </tr>
    <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                </td>
            <td class="style3">
                            <asp:Button ID="butOK" runat="server" style="margin-right:30px;" 
                                Text="ตกลง" />
            </td>
                 <td>
                     &nbsp;</td>
        </tr>

    </table>
    <div _designerregion="0">
        </div>
</asp:Content>
