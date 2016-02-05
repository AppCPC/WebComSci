<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true" CodeBehind="showAllTrainningNews.aspx.cs" Inherits="Webcomsci.WebPage.FrontYard.showAllTrainningNews" %>
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
       &nbsp; <asp:Label ID="lbltitle" runat="server" Text="Label" 
            style="font-weight: 700" CssClass="Fonttitle_showAllTrainningNews"></asp:Label>
            <br />
            <br />
        <asp:ListView ID="ListViewNews" runat="server" 
            ItemPlaceholderID="ProductItem">
            <ItemTemplate>
                <div  style="margin-left:50px;">
                  
                  <div class="content_all"><div 
                              class="pic1"><div class="pic2"><%--  <img alt="" border="2" class="style16" src="../../image/Detail/3.jpg" /> --%><asp:Image 
                                  ID="Image1" runat="server" CssClass="style16" 
                                  ImageUrl='<%# Eval("Training_Path") %>' /></div></div><div 
                              class="text_content"><p class="fontblue2"><a 
                                      href='showDetailNews.aspx?id=2<%# Eval("Training_ID")%>' 
                                      style="text-decoration:none;"><b>
                                       <asp:Label ID="Training_NameLabel" runat="server" Text='<%# Eval("Training_Name") %>' /></b>
                                      <span   class="fontred">
                                       &nbsp; <asp:Label ID="Create_dateLabel" runat="server"  Text='<%# Eval("Update_date") %>' />
                                    &nbsp;    <p style="color:Black;"><asp:Label  ID="Training_DetailLabel" runat="server"  Text='<%# Eval("Training_Detail").ToString().Substring(0, 128) + "..." %>' /></p> 
                                        </span></a></p></div></div>
                         
                
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
    
        </span></span></span></span></span></span></span></span></span></span></span>
        </span></span></span></span></span></span></span></span></span></span></span>
        </span></span></span></span></span></span></span></span></span></span></span>
        </span></span></span></span></span></span></span></span></span></span></span>
        </span></span></span></span></span></span>
    
        </span></span></span></span></span></span></span></span></span></span>
    
    </asp:Content>
