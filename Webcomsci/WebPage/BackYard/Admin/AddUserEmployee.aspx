<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddUserEmployee.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddUserEmployee" %>

<%@ Register src="~/WebPage/BackYard/Admin/ucManageUserEmployee.ascx" tagname="ucManageEmployee" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<uc1:ucManageEmployee ID="ucManageEmployee" runat="server" Visible="True" />
</asp:Content>
