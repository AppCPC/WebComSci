<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Main_Manage_Plan.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.Main_Manage_Plan" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
             <%--
         <link href="../../../css/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
       <link href="../../../css/bootstrap/css/bootstrap-responsive.min.css" type="text/css" />
       <link href="../../../css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
      <link href="../../../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script src="../../../css/bootstrap/js/bootstrap.js" type="text/jscript"></script>
    <script src="../../../css/bootstrap/js/bootstrap.min.js" type="text/jscript"></script>--%>
    <link href="../../../css/StyleSheetInAjaxControltoolkite.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
   <div style="text-align:left; width:90%;">
  <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
      </ajaxToolkit:ToolkitScriptManager>
      <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
         Width="100%" CssClass="ajax__tab_xp">
          
          <ajaxToolkit:TabPanel runat="server" HeaderText="ข่าวสาขา" ID="TabPanel1">
              <ContentTemplate>
              aaaa
              <a href="ManageEducate/ManageSubjectOpen.aspx">test</a>
              </ContentTemplate>
                  </ajaxToolkit:TabPanel>


              <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="ข่าวฝึกอบรม">
              <HeaderTemplate>ฝึกอบรม</HeaderTemplate>
                 <ContentTemplate>
                 bbbb
              </ContentTemplate>


        </ajaxToolkit:TabPanel>
      </ajaxToolkit:TabContainer>
      </div>



</asp:Content>
