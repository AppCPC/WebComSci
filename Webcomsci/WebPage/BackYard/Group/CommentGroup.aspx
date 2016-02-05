<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/BackGroup.Master" AutoEventWireup="true" CodeBehind="CommentGroup.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Group.CommentGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #TextArea2
        {
            height: 47px;
            width: 235px;
        }
        .style2
        {
            width: 123px;
        }
        .style3
        {
            width: 240px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/skins/Back.css" rel="stylesheet" type="text/css" />
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
  <div align="left">
    <img src="../../../image/Post/NamePage.png" />
     <div style="float: right; clear: both; width: 70px;"> 
     <asp:ImageButton ID="ImageButton1" 
            runat="server" Height="26px" 
                   ImageUrl="~/image/Setting_Group.png" Width="26px" 
            PostBackUrl="~/WebPage/BackYard/Group/PersonalCreateGroup.aspx" 
             title="แก้ไขกลุ่ม" />   
            
         <asp:ImageButton ID="ImageButton2" runat="server" 
             ImageUrl="~/image/list_remove.png" Height="26px" Width="26px" title="ลบกลุ่ม" />
              
 <%--           <div>
                     <div class="tooltip_PhotoDetail_box_CommentGroup">
                     <div class="tooltip_PhotoDetail_CommentGroup">
                     <a href="#" id="btnDelHW" title="ลบ"></a>
                     </div>
                     </div>
            </div> --%>    
            </div>


    </div>
<div style="padding-left: 50px; padding-right: 20px;">
<div style="border-width: thin; padding-top: 20px; padding-bottom: 15px; border-bottom-style: groove; border-bottom-color: #F5F5F5;">
    <textarea id="TextArea1" style="width: 443px; height: 75px"></textarea>
    <asp:Button ID="Button1" runat="server" Text="โพสต์" />
</div>
</div>



    <div style="margin-bottom: 20px; float: left; padding-left: 20px; padding-top: 10px;">
        <div class="post">
            <div style="width: 100px; float: left; padding-top: 30px;" align="right">
                <div class="displayUserStatus">
                    <a href="#">
                    <img alt="" class="picDisplayPost" src="../../../image/Post/DisplayUser/274559_100001422740031_1658663394_q.jpg" /></a></div>
            </div>
            <div class="mainPost">
                <div class="postBoxtop">
                    <a href="https://www.facebook.com/llLazor">
                        <asp:Label ID="Label8" runat="server" Text="Art Anuwat" CssClass="UsernameStatusPost"></asp:Label></a>
                </div>
                <div class="postBoxBody">
                    <p align="left" class="statusPost">
                       จะหนาวได้สักกี่วันเชียว... (แต่หลายๆวันก็ดีนะ)</p>
                    <asp:Label ID="Label1" runat="server" Text="5 นาทีที่ผ่านมา" CssClass="timeStatusPost"></asp:Label>
                    <div align="left" class="picClock">
                        <img alt="" class="iconClock" src="../../../image/Post/clock.png" /></div>
                </div>
                <div style="background-image: url('../../../image/Post/ButtomComment.png');
                    background-repeat: no-repeat; width: 582px; height: 7px; float: left;">

                     <%-- <div style="background-image: url('../../../image/Post/ButtomComment.png');
                    background-repeat: no-repeat; width: 582px; height: 7px; float: left;">
                </div>--%>

                </div>
                <div align="left" class="commentPostBoxBody">
                    <div class="commentBox">
                        <div class="displyUserComment">
                            <a href="#">
                            <img alt="" class="picDisplayPost" src="../../../image/Post/DisplayUser/203099_100000049814922_2100602348_q.jpg" /></a></div>
                        <a href="#"><asp:Label ID="Label10" runat="server" Text="Beer Samoy" CssClass="UsernameComment"></asp:Label></a>
                        <p class="postComment">
                            โหยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยยย
                        </p>
                        <asp:Label ID="Label2" runat="server" Text="2 นาทีที่ผ่านมา" CssClass="timeCommentPost"></asp:Label>
                    </div>
                    <div class="commentBox">
                        <div class="displyUserComment">
                            <a href="#">
                            <img alt="" class="picDisplayPost" src="../../../image/Post/DisplayUser/274559_100001422740031_1658663394_q.jpg" /></a></div>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="textboxComment"></asp:TextBox>
                    </div>
                </div>
                <div class="commentPostBoxButtom">
                </div>
            </div>
        </div>
        <div class="post">
            <div style="width: 100px; float: left; padding-top: 30px;" align="right">
                <div class="displayUserStatus">
                    <a href="#">
                    <img alt="" class="picDisplayPost" src="../../../image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" /></a></div>
            </div>
            <div class="mainPost">
                <div class="postBoxtop">
                    <a href="#">
                        <asp:Label ID="Label9" runat="server" Text="สิทธิพร จ่างแสง" CssClass="UsernameStatusPost"></asp:Label></a>
                </div>
                <div class="postBoxBody">
                    <p align="left" class="statusPost">
                        แนวข้อสอบ วิชา สิ่งแวดล้อมและการจัดการทรัพยากร 1. ช้อย 30 ข้อ
                        <br />
                        บทที่ 1,2 2. - 5. บทที่ 3 (ทรัพยากรมีกี่ชนิดอะไรบ้าง , การจัดการทรัพยากร)
                        <br />
                        6. - 10. ระบบนิเวศ,สิ่งมีชีวิตที่อยู่อาศัย ผู้ผลิต คือ , ทำหน้าที่อะไร ผู้บรโภค
                        คือ , มี 4 ชนิด ระบบนิเวศ การถ่ายทอดพลังงาน - ผู้ผลิต -&gt; ผู้บริโภค ผู้ผลิตพลังงานมากสุด
                        ผู้ย่อยสลาย พลังงานน้อยสุด
                        <br />
                        การหมุนเวียนสารอาหาร การหมุนเวียนพลังงาน
                        <br />
                        บรรยาย แนวทางการลดภาวะโลกร้อน ประโยชน์ของป่าชายเลน มีข้อย่อ...</p>
                    <asp:Label ID="Label4" runat="server" Text="10 ปีที่ผ่านมา" CssClass="timeStatusPost"></asp:Label>
                    <img alt="" class="iconClock" src="../../../image/Post/clock.png" />
                    <a href="#"><asp:Label ID="Label3" runat="server" Text="อ่านทั้งหมด..." CssClass="readmore"></asp:Label></a>
                </div>
                <div style="background-image: url('../../../image/Post/ButtomComment.png');
                    background-repeat: no-repeat; width: 582px; height: 7px; float: left;">
                </div>
                <div align="left" class="commentPostBoxBody">
                    <div class="commentBox">
                        <img src="../../../image/Post/Comment.png" style="float: left; margin-right: 10px;" />
                        <a href="#"><asp:Label ID="Label5" runat="server" Text="แสดงความคิดเห็นทั้งหมด..." CssClass="showAllComment"></asp:Label></a>
                    </div>
                    <div class="commentBox">
                        <div class="displyUserComment">
                            <a href="#">
                            <img alt="" class="picDisplayPost" src="../../../image/Post/DisplayUser/260750_100000446756588_1730540694_q.jpg" /></a></div>
                        <a href="#"><asp:Label ID="Label11" runat="server" Text="อลอัว Perfect" CssClass="UsernameComment"></asp:Label></a>
                        <p class="postComment">
                            ขอบคุณครับ</p>
                        <asp:Label ID="Label6" runat="server" Text="7 ปีที่ผ่านมา" CssClass="timeCommentPost"></asp:Label>
                    </div>
                    <div class="commentBox">
                        <div class="displyUserComment">
                            <a href="#">
                            <img alt="" class="picDisplayPost" src="../../../image/Post/DisplayUser/369545_570156548_2023600486_q.jpg" /></a></div>
                        <a href="#"><asp:Label ID="Label12" runat="server" Text="Jakapong Khongaksorn" CssClass="UsernameComment"></asp:Label></a>
                        <p class="postComment">
                            จุฟๆ
                        </p>
                        <asp:Label ID="Label7" runat="server" Text="9 ปีที่ผ่านมา" CssClass="timeCommentPost"></asp:Label>
                    </div>
                    <div class="commentBox">
                        <div class="displyUserComment">
                            <a href="#">
                            <img alt="" class="picDisplayPost" src="../../../image/Post/DisplayUser/274559_100001422740031_1658663394_q.jpg" /></a></div>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="textboxComment"></asp:TextBox>
                    </div>
                </div>
                <div class="commentPostBoxButtom">
                </div>
            </div>
        </div>
    </div>


</asp:Content>
