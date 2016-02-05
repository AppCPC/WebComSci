<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="SubmenuDetailteach.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.SubmenuDetailteach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
<%--<div style="background-position: left; width: 746px; height: 20px; padding-top: 10px; padding-bottom: 30px; background-image: url('../../image/Admin/SubmenuDetailteach/TitleSubmenu.png'); background-repeat: no-repeat;"></div>--%>
<div class="Title_SubmenuDetailteach"></div>
<div style="width: 500px; height: 400px;">
<a href='AddListStudent.aspx?dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["detailTeachID"])%>&subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'><div id="linkstd" runat="server" class="addStd_SubmenuDetailteach"></div></a>
<a href='AddExcellStudent.aspx?dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["detailTeachID"])%>&subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'><div class="addExcel_SubmenuDetailteach"></div></a>
<a href='AddEducationStudent.aspx?dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["detailTeachID"])%>&subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'><div class="addEducation_SubmenuDetailteach"></div></a>



</div>
</asp:Content>
