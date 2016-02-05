<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.setting.profile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .style4
        {
            font-family: "Angsana New";
            font-size: 20pt;
        }
        .style5
        {
            text-align: left;
            width: 1283px;
            font-size: 16pt;
        }

        .style3
        {
            width: 389px;
            padding-left: 5px;
        }

        .style6
    {
        text-align: left;
        width: 1283px;
        font-size: 16pt;
        height: 36px;
    }
    .style7
    {
        width: 271px;
        padding-left: 25px;
        height: 36px;
    }
    .style8
    {
        width: 389px;
        padding-left: 5px;
        height: 36px;
    }

        .style9
        {
            width: 271px;
            padding-left: 25px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
<div align="left">
    &nbsp;</div>

<div align="center" style="margin-bottom: 60px; margin-top: 20px;">
    <div align="left" class="style4" 
        style="border-bottom: 2px solid #999999; height: 52px; width: 550px; margin-bottom: 20px;">
        <strong>ประวัติ</strong></div>
    <table cellpadding="0" cellspacing="0" class="tablefontset" 
        style="margin-top: 10px; width: 541px; margin-right: 0px;">
        <tr>
            <td class="style5" id="Td1">
            </td>
            <td align="left" class="style9" id="Td2">
            </td>
            <td class="style3" id="Td3">
                <asp:Image ID="ImageUser" runat="server" Height="109px" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style6" id="Cellset">
                ชื่อ</td>
            <td align="left"  colspan="2"  id="Cellset" >
                <asp:Label ID="lblNameStd" runat="server"></asp:Label>
            </td>
            
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                ชื่อภาษาอังกฤษ 
            </td>
            <td align="left" colspan="2"  id="Cellset">
                <asp:Label ID="lblnameStdEn" runat="server"></asp:Label>
            </td>
            
        </tr>
        <tr>
            <td class="style5" id="Cellset" >
                ชื่อเล่น 
            </td>
            <td align="left" class="style9" id="Cellset">
                <asp:Label ID="lblNickNameStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                เพศ 
            </td>
            <td align="left" class="style9" id="Cellset">
                <asp:Label ID="lblSexStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                วัน/เดือน/ปี เกิด 
            </td>
            <td align="left" class="style9" id="Cellset">
                <asp:Label ID="lblBirthStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                โทรศัพท์ 
            </td>
            <td align="left" class="style9" id="Cellset">
                <asp:Label ID="lblTelStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                E-mail</td>
            <td align="left" class="style9" id="Cellset">
                <asp:Label ID="lblEmailStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <div style="width: 310px">
        &nbsp;

   
          
   &nbsp;<br />
    </div>

</div>
</asp:Content>
