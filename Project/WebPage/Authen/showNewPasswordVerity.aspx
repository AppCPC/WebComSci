<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Authen.Master" AutoEventWireup="true" CodeFile="showNewPasswordVerity.aspx.cs" Inherits="MasterPage_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentAuthen" runat="server">
<p id="head">&nbsp;</p>
    <div align="left" style="padding-right: 20px; padding-left: 20px">
<p align="left" style="height: 40px"></p>
        <p style="height: 22px; font-size: 16px;">&nbsp; ระบบได้ทำการส่ง ข้อมูล ชื่อผู้เข้าใช้ 
            และ รหัสผ่าน !</p>
        <p style="height: 22px">&nbsp;</p>

        <p style="height: 22px; font-size: 16px;">&nbsp;ไปยัง E-Mail ของคุณ
            <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>
&nbsp;กรุณาตรวจสอบ E-Mail ด้วย !</p>
        <p style="height: 22px">&nbsp;</p>
        <p style="height: 22px">&nbsp;</p>

       

        <div align="right" style="width: 280px">
            <asp:Button ID="butOk" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="button" Text="ตกลง" 
                PostBackUrl="~/WebPage/Authen/Login.aspx" />
            <%-- <asp:Button ID="Button2" runat="server" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="1px" CssClass="button" Text="ยกเลิก" /> --%>
        </div>

        
        </div>
</asp:Content>
