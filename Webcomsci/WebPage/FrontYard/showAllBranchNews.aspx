<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true" CodeBehind="showAllBranchNews.aspx.cs" Inherits="Webcomsci.WebPage.FrontYard.showAllBranchNews" %>
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
    <br />
       &nbsp; 
       <%-- <asp:Label ID="lbltitle" runat="server" Text="Label" 
            style="font-weight: 700"></asp:Label>--%>
        <asp:Label ID="lbltitle" runat="server" Text="Label" 
            CssClass="Fonttitle_showAllBranchNews"></asp:Label>
            <br />
            <br />
        <asp:ListView ID="ListViewNews" runat="server" 
            ItemPlaceholderID="ProductItem">
            <ItemTemplate>
                <div  style="margin-left:50px;">
                  

                            <div class="content_all">
                      <div class="pic1"><div class="pic2">
                     <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("BranchNews_Path") %>' CssClass=style16 />
                      </div></div>
                      <div class="text_content">
                      <p class="fontblue2">
                      <a href="showDetailNews.aspx?id=1<%# Eval("BranchNews_ID")%>" style="text-decoration:none;" >
                      <b> <asp:Label ID="Label1" runat="server" Text='<%# Eval("BranchNews_Name") %>' /></b> 
                     <%--   <asp:Label ID="BranchNews_DetailLabel" runat="server"  Text='<%# Eval("BranchNews_Detail") %>' />--%>
                     <br />
                      <%-- <asp:Label runat="server" ID="lblId"><%#Eval("BranchNews_Detail").ToString().Substring(0, Eval("BranchNews_Detail").ToString().Length/4) + "..."%></asp:Label>--%>
                         <asp:Label runat="server" ID="lblId"><%#Eval("BranchNews_Detail").ToString().Substring(0, 128) + "..."%></asp:Label>
                       <br />
                    </a>

                       <span class="fontred"> 
                       <asp:Label ID="Label2" runat="server" Text='<%# Eval("Update_date") %>' /></span></p></div></div>
                  
                
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
