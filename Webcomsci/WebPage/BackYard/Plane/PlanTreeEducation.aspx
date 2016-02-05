<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Plan.Master" AutoEventWireup="true"
    CodeBehind="PlanTreeEducation.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Plane.PlanTreeEducation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ASubject").addClass("button_nav_menu_tree_Active");
            $(".page_num_edu").css("display", "none");
            $(".notation").css("display", "none");

        });
    </script>
    <link href="../../../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <p style="padding-left: 40px; font-size: medium; font-weight: bold; padding-top: 10px;
        text-align: left;">
        <b>ค้นหารายวิชาตัวต่อ</b><ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
    </p>
    <br />
    <div align="left" style="float: left; padding-left: 60px;">
        <div style="float: left; margin-bottom: 20px; width: 561px;">
            <div style="height: 10px; font-family: tahoma; font-size: small; width: 254px;">
                <p style="float: left; margin-right: 10px; height: 16px; margin-top: 3px;">
                    ค้นหา</p>
                <div style="float: left; width: 124px; height: 22px; padding-top: 2px;">
                    <asp:TextBox ID="txtSearch" runat="server" Width="120px" Height="12px"></asp:TextBox>
                </div>
                <div style="float: left; width: 50px; padding-left: 10px; padding-top: 2px;">
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageUrl="~/image/Back/ButtonSearch.jpg"
                        ValidationGroup="ReqRepea" OnClick="imgBtnSearch_Click" Width="25px" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Subject Code Input For Search !  "
                        ValidationGroup="ReqRepea" ControlToValidate="txtSearch" CssClass="style1" Style="color: #FF0000">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <asp:TreeView ID="treeviewSubject" runat="server" OnTreeNodePopulate="TreeView1_TreeNodePopulate"
                ImageSet="Arrows" Font-Size="XX-Large">
                <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
                    NodeSpacing="0px" VerticalPadding="0px" />
                <ParentNodeStyle Font-Bold="False" />
                <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                    VerticalPadding="0px" />
            </asp:TreeView>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" class="alert-error"
                CssClass="regu alert alert-error" DisplayMode="BulletList" HeaderText="Please fill out the full details below"
                ShowMessageBox="false" ShowSummary="true" ValidationGroup="ReqRepea" />
        </div>
        <div style="float: right">
        </div>
          <link href="../../../css/bootstrap/css/bootstrap.css" rel="stylesheet" />
</asp:Content>