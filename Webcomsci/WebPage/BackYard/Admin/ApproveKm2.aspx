<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ApproveKm2.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ApproveKm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 114px;
    }
    .style3
    {
        width: 19px;
    }
    #TextArea1
    {
        height: 165px;
        width: 521px;
    }
    .style4
    {
        width: 114px;
        height: 38px;
    }
    .style5
    {
        width: 19px;
        height: 38px;
    }
    .style6
    {
        height: 38px;
    }
    .style7
    {
        width: 114px;
        height: 185px;
    }
    .style8
    {
        width: 19px;
        height: 185px;
    }
    .style9
    {
        height: 185px;
    }
    .style10
    {
        width: 114px;
        height: 34px;
    }
    .style11
    {
        width: 19px;
        height: 34px;
    }
    .style12
    {
        height: 34px;
    }
    .style13
    {
        width: 114px;
        height: 31px;
    }
    .style14
    {
        width: 19px;
        height: 31px;
    }
    .style15
    {
        height: 31px;
    }
    .style16
    {
        width: 114px;
        height: 29px;
    }
    .style17
    {
        width: 19px;
        height: 29px;
    }
    .style18
    {
        height: 29px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table class="style1">
    <tr>
        <td class="style4">
            ชื่อกระทู้</td>
        <td class="style5">
            :</td>
        <td class="style6">
            <asp:TextBox ID="TextBox1" runat="server" Width="371px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style7">
            รายละเอียด</td>
        <td class="style8">
            :</td>
        <td class="style9">
            <textarea id="TextArea1"></textarea>
        </td>
    </tr>
    <tr>
        <td class="style10">
            รูปที่เกี่ยวข้อง</td>
        <td class="style11">
            :</td>
        <td class="style12">
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="style13">
            ลิ้งค์ที่เกี่ยวข้อง</td>
        <td class="style14">
            :</td>
        <td class="style15">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style16">
            สถานะ</td>
        <td class="style17">
            :</td>
        <td class="style18">
            <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" 
                Height="22px" Width="126px">
                <asp:ListItem>รออนุมัติ</asp:ListItem>
                <asp:ListItem>อนุมัติ</asp:ListItem>
                <asp:ListItem>ไม่อนุมัติ</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="ตกลง" Width="69px" />
&nbsp;
            <asp:Button ID="Button2" runat="server" Text="ยกเลิก" />
        </td>
    </tr>
</table>


</asp:Content>
