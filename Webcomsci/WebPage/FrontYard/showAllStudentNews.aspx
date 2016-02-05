<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true" CodeBehind="showAllStudentNews.aspx.cs" Inherits="Webcomsci.WebPage.FrontYard.showAllStudentNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">

        .style16
        {
            width: 52px;
        }
        </style>
    <div  style="background-color:#9ABFCA;">
        <br />&nbsp; 
        <asp:Label ID="lbltitle" runat="server" Text="Label" style="font-weight: 700" 
            CssClass="Fonttitle_showAllStudentNews"></asp:Label>
            <br />
            <br />
       
        <asp:ListView ID="ListViewNews" runat="server" 
            ItemPlaceholderID="ProductItem">
            <ItemTemplate>
                <div  style="margin-left:50px;">
                  <div class="content_all"><div class="pic1"><div class="pic2"><asp:Image ID="Image2" runat="server" CssClass="style16" 
                     ImageUrl='<%# Eval("StudentNews_Path") %>' /></div></div><div class="text_content"><p class="fontWhite"><b><a href="showDetailNews.aspx?id=4<%# Eval("StudentNews_ID")%>" style="text-decoration:none;" >
                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("StudentNews_Name") %>' /></b><br>
                     <asp:Label ID="BranchNews_DetailLabel0" runat="server" 
                       Text='<%# Eval("StudentNews_Detail").ToString().Substring(0, 128) + "..." %>' />
                       <span class="fontorange"></a></br>
                       <asp:Label ID="Label4" runat="server" Text='<%# Eval("Update_date") %>' /></span></p></div>
                    </div>
                    </em>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <asp:PlaceHolder ID="ProductItem" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemSeparatorTemplate>
                <%--  <hr />--%>
            </ItemSeparatorTemplate>
        </asp:ListView>
        <br />
        <div align="right" style="font-family: Tahoma; font-size: 12px; color: #FFFFFF">
        <asp:DataPager ID="DataPagerNews" runat="server" 
            OnPreRender="DataPagerNews_PreRender" PagedControlID="ListViewNews" 
            PageSize="8">
            <Fields>
                <asp:NextPreviousPagerField ShowFirstPageButton="True" 
                    ShowNextPageButton="False" FirstPageText="" 
                    PreviousPageText="&lt;&lt;ก่อนหน้า" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ShowLastPageButton="True" 
                    ShowPreviousPageButton="False" LastPageText="" 
                    NextPageText="ถัดไป&gt;&gt;" />
            </Fields>
        </asp:DataPager>
        </div>

        <br />
        <br />
    </div>
    
</asp:Content>
