<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back.Master" AutoEventWireup="true" CodeBehind="TreeSearchNodeSubject.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Plane.TreeSearchNodeSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style type="text/css">
        .treeNode
        {
            color:blue;
            font:14px Arial, Sans-Serif;
        }
        .rootNode
        {
            font-size:18px;
            width:100%;
            border-bottom:Solid 1px black;
        }
        .leafNode
        {
            border:Dotted 2px black;
            padding:4px;
            background-color:#eeeeee;
            font-weight:bold;
        }
       .style2
       {
           width: 107px;
       }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
<%-- <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>--%>
    <p>
        <br />
    </p>
    <p>
    </p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <div style="float: left; width: 145px">
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    </div>
                    <div style="float: left; width: 41px; padding-left: 10px; padding-top: 2px;">
                        <asp:ImageButton ID="imgBtnSearch" runat="server" 
                            ImageUrl="~/image/Back/ButtonSearch.jpg" onclick="imgBtnSearch_Click" 
                            Width="26px" />
                    </div>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">

                    <asp:TreeView ID="TreeView1" Runat="server" 
                        onselectednodechanged="TreeView1_SelectedNodeChanged" 
                        ontreenodepopulate="TreeView1_TreeNodePopulate" ImageSet="Arrows">
                        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                        <LevelStyles>
                            <%--<asp:TreeNodeStyle CssClass="nodeLevel1" /> --%>
                            <asp:TreeNodeStyle CssClass="nodeLevel2" />
                            <asp:TreeNodeStyle CssClass="nodeLevel3" />
                            <asp:TreeNodeStyle CssClass="nodeLevel4" />
                        </LevelStyles>
                        <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                            HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                        <ParentNodeStyle Font-Bold="False" />
                        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                            HorizontalPadding="0px" VerticalPadding="0px" />
                    </asp:TreeView>
       
                </td>
                <td>

                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
    </asp:Content>
