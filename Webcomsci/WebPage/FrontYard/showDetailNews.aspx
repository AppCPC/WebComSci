<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true" CodeBehind="showDetailNews.aspx.cs" Inherits="Webcomsci.WebPage.FrontYard.showDetailNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .image
        {
            width: 105px;
            height: 112px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div style="width:91%; margin-left:20px; margin-right: 10px; margin-top: 10px; margin-bottom: 10px;">
           <h3>
               <asp:Label ID="lbltitle" runat="server" Text="Label" CssClass="fontHead_showDetailNews"></asp:Label>
            </h3>
           <h4>
               <asp:Label ID="lblheader" runat="server" Text="Label" CssClass="fontHeadWrite_showDetailNews"></asp:Label>
            </h4>
             <h5><asp:Label ID="lbltime" runat="server" Text="Label" 
                     CssClass="fonttime_showDetailNews"></asp:Label></h5>
            <!--<img src="images/01.png" alt="an image" class="image" />-->

             &nbsp;<asp:Image ID="imgPic" runat="server" />
            <p id="detail" runat="server" class="fontWhite_showDetailNews">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>

        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
</asp:Content>
