<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddplanEducation.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddplanEducation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
<div style="text-align:left; margin-bottom: 8px;"> &nbsp;&nbsp;&nbsp;&nbsp; <b>เพิ่มรายวิชา</b></div>

<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">ปีการศึกษา</div>
<div style="float: left; width: 86px;" align="left">
    <asp:TextBox ID="TextBox1" runat="server" Height="18px" Width="58px" 
        CssClass="cropborder"></asp:TextBox>

</div>
</div>


<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">ชั้นปี</div>
<div style="float: left; width: 86px;" align="left">
    <asp:DropDownList ID="DropDownList2" runat="server" Height="22px" Width="58px" 
        CssClass="cropborder">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
    </asp:DropDownList>
</div>
</div>

<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">เทอม</div>
<div style="float: left; width: 86px;" align="left">
    <asp:DropDownList ID="DropDownList3" runat="server" Height="22px" Width="58px" 
        CssClass="cropborder">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>

    </asp:DropDownList>
</div>
</div>

<div align="right" style="width: 885px">
    <asp:Button ID="Button1" runat="server" Text="เพิ่มรายวิชา" 
        CssClass="button_in_admin" />
  
    </div>

<div style="width: 95%; height: auto; margin-bottom: 10px;">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</div>

<div align="right" style="width: 885px">
    <asp:Button ID="Button2" runat="server" Text="ตกลง" 
        CssClass="button_in_admin" />
            <asp:Button ID="Button3" runat="server" Text="ยกเลิก" 
        CssClass="button_in_admin" 
        PostBackUrl="~/WebPage/BackYard/Admin/ShowplanEducation.aspx" />
</div>
</asp:Content>
