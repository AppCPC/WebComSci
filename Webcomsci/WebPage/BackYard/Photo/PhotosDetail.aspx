<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true"
    CodeBehind="PhotosDetail.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Photo.Photos5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 462px;
            height: 366px;
        }
        .style3
        {
            width: 16px;
            height: 13px;
            top: 3px;
            left: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/skins/Back.css" rel="stylesheet" type="text/css" />
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js"
        type="text/javascript"></script>
    <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../../../Scripts/JScript1.js" type="text/javascript"></script>
    <div align="left">
        <img src="../../../image/Title/Photo.png" /></div>
    <div class="post_detailPicture">
        The Gang GoTo หัวหิน สนุกมากๆๆ</div>
    <div class="page_photo5">
        <div class="photo_big">
            <img alt="" class="style2" src="../../../image/Photo/TestPhoto/23.jpg" />
            <div class="tooltip_PhotoDetail_box">
                <div class="tooltip_PhotoDetail">
                    <a href="#" id="btnDelHW" title="ลบ"></a>
                </div>
            </div>
        </div>
        <div class="post_area" style="padding: 0px">
            <hr style="width: 662px; margin-bottom: 30px;" align="left" />
            <div class="status_profile_img_box">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/image/Post/DisplayUser/274559_100001422740031_1658663394_q.jpg" />
            </div>
            <div class="arrow_post_status_box">
            </div>
            <div class="post_status-comment_area" align="center">
                <div class="post_status_box" align="left">
                    <span style="float: left; width: 505px;">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="user_name_status_post">อนุวัฒน์ ชัยชนะ</asp:LinkButton>
                    </span><span class="btn_del_post">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/Post/btn_del_post.png"
                            onmouseover="this.src='/../image/Post/btn_del_post_hover.png'" onmouseout="this.src='/../image/Post/btn_del_post.png'"
                            ToolTip="ลบ" /></span>
                    <div class="text_status" id="text_status">
                        ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ
                        ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ
                        ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ
                        ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ ข้อความสถานะ
                        ข้อความสถานะ ข้อความสถานะ
                    </div>
                    <div class="timepost">
                        <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="timepost"
                            runat="server" Text="เมื่อ 2 ชั่วโมงที่แล้ว"></asp:Label>
                    </div>
                </div>
                <div class="post_comment_box" align="center">
                    <div
                        align="left" class="show_all_coments">
                        <img alt="" src="../../../image/Post/Comment.png" style="position: relative; top: 3px;
                            left: 7px;" />
                        <span style="margin-left: 10px;">
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="show_all_comment">แสดงความคิดเห็นทั้งหมด</asp:LinkButton></span>
                    </div>
                    <div id="comment" class="comment_post_box" align="left">
                        <div class="comment_profile_img_box">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
                        </div>
                        <div class="user_name_status_post_box" align="left">
                            <a class="user_name_comment_post">สิทธิพร จ่างแสง</a></div>
                        <span class="btn_del_post">
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/Post/btn_del_post.png"
                                onmouseover="this.src='/../image/Post/btn_del_post_hover.png'" onmouseout="this.src='/../image/Post/btn_del_post.png'"
                                ToolTip="ลบ" /></span>
                        <div class="text_comment" id="text_comment">
                            แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น
                            แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น
                            แสดงความคิดเห็น
                        </div>
                        <div class="timepost2">
                            <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="Label2"
                                runat="server" Text="เมื่อ 1 ชั่วโมงที่แล้ว"></asp:Label>
                        </div>
                    </div>
                    <div id="Div1" class="comment_post_box" align="left">
                        <div class="comment_profile_img_box">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
                        </div>
                        <div class="user_name_status_post_box" align="left">
                            <a class="user_name_comment_post">สิทธิพร จ่างแสง</a></div>
                        <span class="btn_del_post">
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/image/Post/btn_del_post.png"
                                onmouseover="this.src='/../image/Post/btn_del_post_hover.png'" onmouseout="this.src='/../image/Post/btn_del_post.png'"
                                ToolTip="ลบ" /></span>
                        <div class="text_comment" id="Div2">
                            แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น
                            แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น
                            แสดงความคิดเห็น
                        </div>
                        <div class="timepost2">
                            <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="Label1"
                                runat="server" Text="เมื่อ 1 ชั่วโมงที่แล้ว"></asp:Label>
                        </div>
                    </div>
                    <div id="commentPost" class="comment_post_box">
                        <div class="comment_profile_img_box">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
                        </div>
                        <div class="txt_comment_box" align="left">
                            <div style="float: left; width: 442px; margin-left: 5px;">
                                <asp:TextBox ID="textarea" runat="server" CssClass="textbox_in_back" TextMode="MultiLine"
                                    placeholder="เขียนความคิดเห็น..." Height="32px" Width="99%" EnableTheming="True"
                                    Style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #C7C7C7;"></asp:TextBox>
                            </div>
                            <div style="float: right; clear: both; margin-top: -15px;">
                                <asp:Button ID="Button2" runat="server" Text="โพสต์" CssClass="button_post_in_back" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<div style="float: left; width: 300px;">

        <div class="post_comment_box_PhotosDetail" align="left">
        <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 3px; display: table;" 
                id="comment">
        <div class="comment_profile_img_box">
            <asp:Image ID="Image1" runat="server" 
                ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
        </div>
            <div class="user_name_status_post_box"><a class="user_name_comment_post">สิทธิพร จ่างแสง</a></div>
            <p class="text_comment" id="text_comment">แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น 
            แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น </p>
           <div style="float: left; margin-left: 42px;">
                <span class="readmore" onclick="text_comment.className='text_comment_showall';this.style.display='none';less_comment.style.display='block'" id="readmore_comment">แสดงทั้งหมด..</span>
                <span id="less_comment" class="less_text_comment" onclick=" this.style.display='none';readmore_comment.style.display='block';text_comment.className='text_comment' ">ย่อลง</span>
            </div>
        <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="Label2" runat="server" Text="เมื่อ 1 ชั่วโมงที่แล้ว"></asp:Label>
            </div>
            </div>

                    <div style="background-color: #efefef; height: 25px; margin-bottom: 3px;">
            <img alt="" class="style3" src="../../../image/Post/Comment.png" 
                style="position: relative" />
                <span style="margin-left: 10px; ">
                    <asp:LinkButton ID="LinkButton2" runat="server" 
                CssClass="show_all_comment">แสดงความคิดเห็นทั้งหมด</asp:LinkButton></span>
                
                </div>

                    <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 3px; display: table;" 
                id="Div1">
        <div class="comment_profile_img_box">
            <asp:Image ID="Image2" runat="server" 
                ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
        </div>
            <div class="user_name_status_post_box"><a class="user_name_comment_post">สิทธิพร จ่างแสง</a></div>
            <p class="text_comment" id="P1">แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น 
            แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น </p>
           <div style="float: left; margin-left: 42px;">
                <span class="readmore" onclick="text_comment.className='text_comment_showall';this.style.display='none';less_comment.style.display='block'" id="Span1">แสดงทั้งหมด..</span>
                <span id="Span2" class="less_text_comment" onclick=" this.style.display='none';readmore_comment.style.display='block';text_comment.className='text_comment' ">ย่อลง</span>
            </div>
        <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="Label3" runat="server" Text="เมื่อ 1 ชั่วโมงที่แล้ว"></asp:Label>
            </div>
            </div>


                                <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 3px; display: table;" 
                id="Div2">
        <div class="comment_profile_img_box">
            <asp:Image ID="Image4" runat="server" 
                ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
        </div>
            <div class="user_name_status_post_box"><a class="user_name_comment_post">สิทธิพร จ่างแสง</a></div>
            <p class="text_comment" id="P2">แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น 
            แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น </p>
           <div style="float: left; margin-left: 42px;">
                <span class="readmore" onclick="text_comment.className='text_comment_showall';this.style.display='none';less_comment.style.display='block'" id="Span3">แสดงทั้งหมด..</span>
                <span id="Span4" class="less_text_comment" onclick=" this.style.display='none';readmore_comment.style.display='block';text_comment.className='text_comment' ">ย่อลง</span>
            </div>
        <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="Label1" runat="server" Text="เมื่อ 1 ชั่วโมงที่แล้ว"></asp:Label>
            </div>
            </div>

                                <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 3px; display: table;" 
                id="Div3">
        <div class="comment_profile_img_box">
            <asp:Image ID="Image5" runat="server" 
                ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
        </div>
            <div class="user_name_status_post_box"><a class="user_name_comment_post">สิทธิพร จ่างแสง</a></div>
            <p class="text_comment" id="P3">แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น 
            แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น แสดงความคิดเห็น </p>
           <div style="float: left; margin-left: 42px;">
                <span class="readmore" onclick="text_comment.className='text_comment_showall';this.style.display='none';less_comment.style.display='block'" id="Span5">แสดงทั้งหมด..</span>
                <span id="Span6" class="less_text_comment" onclick=" this.style.display='none';readmore_comment.style.display='block';text_comment.className='text_comment' ">ย่อลง</span>
            </div>
        <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="Label4" runat="server" Text="เมื่อ 1 ชั่วโมงที่แล้ว"></asp:Label>
            </div>
            </div>





            <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 5px; display: table;" 
                id="commentPost">
        <div class="comment_profile_img_box">
            <asp:Image ID="Image3" runat="server" 
                ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
        </div>
            <div class="txt_comment_box_photo">
     
           <asp:TextBox ID="textarea" runat="server" CssClass="txt_comment" 
                    TextMode="MultiLine" placeholder="เขียนความคิดเห็น..." Width="413px" 
                    Height="26px" ></asp:TextBox>
                </div>
            </div>
            
        </div>



</div>--%>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var showChar = 150;
            var ellipsestext = ".....";
            var moretext = "แสดงทั้งหมด";
            var lesstext = "ย่อลง";
            $(".text_status").each(function () {
                var content = $(this).html();

                if (content.length > showChar) {

                    var c = content.substr(0, showChar);
                    var h = content.substr(showChar - 1, content.length - showChar);

                    var html = c + '<span class="moreelipses">' + ellipsestext + '<br/><br/></span><span class="morecontent"><span>' + h + '<br/><br/></span><a  href="" class="morelink">' + moretext + '</a></span>';

                    $(this).html(html);
                }

            });

            $(".morelink").click(function () {
                if ($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var showChar = 150;
            var ellipsestext = ".....";
            var moretext = "แสดงทั้งหมด";
            var lesstext = "ย่อลง";
            $(".text_comment").each(function () {
                var content = $(this).html();

                if (content.length > showChar) {

                    var c = content.substr(0, showChar);
                    var h = content.substr(showChar - 1, content.length - showChar);

                    var html = c + '<span class="moreelipses2">' + ellipsestext + '<br/><br/></span><span class="morecontent2"><span>' + h + '<br/><br/></span><a  href="" class="morelink2">' + moretext + '</a></span>';

                    $(this).html(html);
                }

            });

            $(".morelink2").click(function () {
                if ($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });
        });
    </script>
</asp:Content>
