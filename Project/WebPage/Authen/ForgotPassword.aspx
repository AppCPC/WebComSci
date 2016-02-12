<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Authen.Master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="MasterPage_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentAuthen" runat="server">
 <p id="head">ลืมรหัสผ่าน !</p>
<p align="left" style="height: 40px"></p>
    <div align="left" style="padding-right: 20px; padding-left: 20px">
        <p style="height: 22px">รหัสผู้เข้าใช้ระบบ:</p>
            <asp:TextBox ID="txtusername" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox"></asp:TextBox>

        <p style="height: 22px">อีเมลล์:</p>
            <asp:TextBox ID="txtEmail" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="textbox"></asp:TextBox>

        <div align="right" style="width: 280px">
            <asp:Button ID="butOK" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="button" Text="ยืนยัน" 
                onclick="butOK_Click" />
            <asp:Button ID="butCancel" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="button" Text="ยกเลิก" 
                PostBackUrl="~/WebPage/Authen/Login.aspx" />
        </div>

        
        </div>
</asp:Content>
