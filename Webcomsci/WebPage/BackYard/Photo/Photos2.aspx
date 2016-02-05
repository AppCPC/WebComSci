<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true" CodeBehind="Photos2.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Photo.Photos2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
        <div align="left">
        <img src="../../../image/Title/Photo.png" />
<%--        <div align="right">
            <asp:Button ID="Button1" runat="server" Text="+ เพิ่มรูปภาพ" 
                CssClass="button_Photo2" 
                PostBackUrl="~/WebPage/BackYard/Photo/CreatePicture.aspx" Width="109px" />

                            <asp:Button ID="Button2" runat="server" Text="ลบรูปภาพ" 
                CssClass="button_Photo2" Width="109px" />
                </div>--%>

        </div>
    <div style="float: left; padding-bottom: 10px;">
        <div class="AllMenuPhoto">
            <a class="PhotoOfYouMenu" href="CreatePicture.aspx">
                <p class="titlePhoto" align="center">
                    + เพิ่มรูปภาพ</p>
                <asp:Label ID="Label1" runat="server" Text="12" CssClass="numOfPhoto"></asp:Label></a>
<%--            <a class="PhotoMenu" href="#">
                <p class="titlePhoto">
                    รูปภาพ</p>
                <asp:Label ID="Label2" runat="server" Text="532" CssClass="numOfPhoto"></asp:Label></a>
            <a class="AlbumMenu" href="#">
                <p class="titlePhoto">
                    อัลบั้ม</p>
                <asp:Label ID="Label3" runat="server" Text="6" CssClass="numOfPhoto"></asp:Label></a>--%>
        </div>
        <div style="padding-left: 12px; float: left; width: 100%; margin-top: 5px;">
            <div class="photoFrame">
                <a class="photoFrame" href="PhotosDetail.aspx">
                    <img alt="" class="photo" src="../../../image/Photo/TestPhoto/23.jpg" /></a>
                   <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
                    </div>
                   
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Desert.jpg" class="photo" /></a>
                   <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
                    
                    </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Hydrangeas.jpg" class="photo" /></a>
                     <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Jellyfish.jpg" class="photo" /></a>
                                         <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>

            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Koala.jpg" class="photo" /></a>
                                         <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>

            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Lighthouse.jpg" class="photo" /></a>
                        <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Penguins.jpg" class="photo" /></a>

                     <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Tulips.jpg" class="photo" /></a>
                     <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Desert.jpg" class="photo" /></a>
                     <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Hydrangeas.jpg" class="photo" /></a>
                     <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Jellyfish.jpg" class="photo" /></a>
                     <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div>
            <div class="photoFrame">
                <a href="#">
                    <img src="../../../image/Photo/TestPhoto/Lighthouse.jpg" class="photo" /></a>
                     <div class="tooltip_Photo_box">
                     <div class="tooltip_Photo">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div>
        </div>
    </div>
</asp:Content>
