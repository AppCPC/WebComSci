<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManageDetailTeach.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManageDetailTeach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .styleLeft
        {
            
            text-align:left;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
<div style="text-align:left; margin-bottom: 8px;"> &nbsp;&nbsp;&nbsp;&nbsp; <b>อนุมัติรายวิชา</b></div>



<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">ปีการศึกษา</div>
<div style="float: left; width: 86px;" align="left">
    <asp:DropDownList ID="ddlYear" runat="server" Height="30px" Width="120px" 
        CssClass="btn dropdown-toggle"  AutoPostBack="True" 
        onselectedindexchanged="ddlYear_SelectedIndexChanged">
    </asp:DropDownList>

</div>
</div>


<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">ชั้นปี</div>
<div style="float: left; width: 86px;" align="left">
    <asp:DropDownList ID="ddlLevel" runat="server"  Height="30px" Width="120px" 
        CssClass="btn dropdown-toggle" AutoPostBack="True" 
        onselectedindexchanged="ddlLevel_SelectedIndexChanged">
        <asp:ListItem Value="0">--เลือก--</asp:ListItem>
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
    <asp:DropDownList ID="ddlterm" runat="server"  Height="30px" Width="120px" 
        CssClass=".btn-large" AutoPostBack="True" 
        onselectedindexchanged="ddlterm_SelectedIndexChanged">
        <asp:ListItem Value="0">--เลือก--</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>

        <asp:ListItem>3</asp:ListItem>

    </asp:DropDownList>
</div>
</div>

<div align="right" style="width: 885px">
    <asp:Button ID="btnsearch" runat="server" Text="ค้นหา" 
        CssClass="button_in_admin" onclick="btnsearch_Click" /> 
        &nbsp;

            <%--<asp:Button ID="btnmanage" runat="server" Text="จัดการข้อมูลย้อนหลัง" 
        CssClass="button_in_admin" 
        PostBackUrl="~/WebPage/BackYard/Admin/AddDetailTeachAfter.aspx" />--%>
  

    <asp:Button ID="btnAdd" runat="server" Text="เพิ่มข้อมูลใหม่" 
        CssClass="button_in_admin" 
        PostBackUrl="~/WebPage/BackYard/Admin/ManinChooseDetailTeach.aspx" />
        


    </div>  <br />

<div style="width: 95%; height: auto">
     <%--  <span class="wrap">--%>
    <asp:GridView ID="dgvShowdetailTeach" runat="server"  AllowPaging="true"
        AutoGenerateColumns="False" DataKeyNames="StructSub_Code" 
        Width="95%" EmptyDataText="ไม่พบข้อมูลที่คุณค้นหา" 
           CssClass="table table-striped" PageSize="20" 
           onpageindexchanging="gvSubject_PageIndexChanging">
        <AlternatingRowStyle />
        <Columns>
            <asp:BoundField DataField="DetailTeach_Year" HeaderText="ปีการศึกษา" />
             <asp:BoundField DataField="DetailTech_Term" HeaderText="เทอมการศึกษา" />
            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" />
           <asp:BoundField DataField="StructSub_NameTha" HeaderText="ชือวิชา" />
            <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" />

        </Columns>
        <HeaderStyle Height="30px" />
        <RowStyle Height="20px" />
    </asp:GridView>
    <%--</span>--%>

</div>
</asp:Content>
