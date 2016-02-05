<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Authen.Master" AutoEventWireup="true" CodeBehind="VerifyPassword.aspx.cs" Inherits="Webcomsci.WebPage.Authen.VerifyPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentAuthen" runat="server">
  <p id="head">พิสูจน์ตัวตนผู้ใช้งาน</p>
<p align="left" style="height: 40px"></p>
    <div align="left" style="padding-right: 20px; padding-left: 20px">
        <p style="height: 22px">ชื่อ:</p>
            <asp:TextBox ID="txtName" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox"></asp:TextBox>

        <p style="height: 22px">นามสกุล:</p>
            <asp:TextBox ID="txtSurname" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox"></asp:TextBox>

        <p style="height: 22px">อีเมลล์:</p>
            <asp:TextBox ID="TextBox3" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox"></asp:TextBox>

        <p style="height: 22px">รหัสที่ใช้ในสถานศึกษา:</p>
            <asp:TextBox ID="TextBox4" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox"></asp:TextBox>

          <p style="height: 22px">วันเกิด:</p>
            <asp:TextBox ID="TextBox5" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox"></asp:TextBox>

        <div align="right" style="width: 280px">
            <asp:Button ID="butOK" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="button" Text="ยืนยัน" 
                onclick="butOK_Click" />
            <asp:Button ID="btnCancel" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="button" Text="ยกเลิก" 
                PostBackUrl="~/WebPage/Authen/Login.aspx" />
        </div>

        
        </div>

</asp:Content>
