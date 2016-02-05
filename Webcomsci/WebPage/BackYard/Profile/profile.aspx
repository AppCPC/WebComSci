<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Profile.profile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .style4
        {
            font-family: "Angsana New";
            font-size: 20pt;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <div align="center" style="margin-bottom: 60px; margin-top: 20px;">
    <div align="left" class="style4" 
        style="border-bottom: 2px solid #999999; height: 52px; width: 550px; margin-bottom: 20px;">
        <strong>ข้อมูลผู้ใช้</strong></div>
    <table cellpadding="0" cellspacing="0" class="tablefontset" 
        style="margin-top: 10px; width: 541px; margin-right: 0px;">
        <tr>
            <td class="auto-style1" id="Cellset2">
                ชื่อนักศึกษา 
            </td>
            <td align="left" class="Column2" id="Cellset3">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset4">
            </td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset5">
                นามสกุล 
            </td>
            <td align="left" class="Column2" id="Cellset6">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset8">
                ชื่อเล่น 
            </td>
            <td align="left" class="Column2" id="Cellset9">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset14">
                เพศ 
            </td>
            <td align="left" class="Column2" id="Cellset15">
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset16">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset17">
                วัน/เดือน/ปี เกิด 
            </td>
            <td align="left" class="Column2" id="Cellset18">
                <br />
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset19">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset20">
                ที่อยู่ 
            </td>
            <td align="left" class="Column2" id="Cellset21">
&nbsp;<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset22">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset23">
                โทรศัพท์ 
            </td>
            <td align="left" class="Column2" id="Cellset24">
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset25">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset26">
                สถานะ 
            </td>
            <td align="left" class="Column2" id="Cellset27">
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset28">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset29">
                กำลังศึกษาชั้นปีที่ 
            </td>
            <td align="left" class="Column2" id="Cellset30">
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset31">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" id="Cellset32">
                E-mail</td>
            <td align="left" class="Column2" id="Cellset33">
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3" id="Cellset34">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <div style="width: 310px">
   
   
   
   &nbsp;</div>
</div>
</asp:Content>
