<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Authen.Master" AutoEventWireup="true" CodeBehind="ChangeNewPassword.aspx.cs" Inherits="Webcomsci.WebPage.Authen.ChangeNewPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentAuthen" runat="server">
    <p id="head">เปลี่ยนรหัสผ่าน</p>
<p align="left" style="height: 60px"></p>
    <div align="left" style="padding-right: 20px; padding-left: 20px">
        <p style="height: 22px">ชื่อผู้ใช้งาน:</p>
            <asp:TextBox ID="txtusername" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox" 
            Enabled="False"></asp:TextBox>

        <p style="height: 22px">รหัสผ่านเดิม:</p>
            <asp:TextBox ID="txtpassword" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox"></asp:TextBox>

       

        <p style="height: 22px">รหัสผ่านใหม่:</p>
            <asp:TextBox ID="txtNewspassword" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox" 
            TextMode="Password"></asp:TextBox>

        <p style="height: 22px">ยืนยันรหัสผ่านใหม่:</p>
            <asp:TextBox ID="txtConfirmNewsPassword" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox" 
            TextMode="Password"></asp:TextBox>

        <div align="right" style="width: 280px">
            <asp:Button ID="btnok" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="button" Text="ยืนยัน" 
                onclick="btnok_Click" />
            <asp:Button ID="Button2" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="button" Text="ยกเลิก" 
                PostBackUrl="~/WebPage/Authen/Login.aspx" />
            <br />
            <br />
        </div>


        
        </div>
        <br />
        <br />
        <br />
<br />
<br />
<br />
<br />
        <br />
</asp:Content>
