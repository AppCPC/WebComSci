<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Main_Alumni.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.Main_Alumni" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/WebPage/BackYard/Admin/Detail_Alumni.aspx">รายละเอียดของศิษย์เก่า ตรงนี้น่าจะเป็น Gridview</asp:HyperLink>
        <br />
        <br />
        <br />
         <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/WebPage/BackYard/Admin/SubmenuDetailteach.aspx">ส่วนที่สั่งเพิ่ม</asp:HyperLink>
       
</asp:Content>
