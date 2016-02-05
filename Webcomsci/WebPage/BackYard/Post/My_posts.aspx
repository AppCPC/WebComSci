<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back2.Master" AutoEventWireup="true"
    CodeBehind="My_posts.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Post.My_posts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="refresh" content="30">
    <script src="../../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

        });
    </script>
    <script type="text/javascript" language="javascript">

        function handleEnter(obj, event) {
            var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
            if (keyCode == 13) {
                document.getElementById(obj).click();
                return false;
            }
            else {
                return true;
            }
        } 
    </script>
    <style type="text/css">
        .style2
        {
            width: 16px;
            height: 13px;
            top: 3px;
            left: 7px;
        }
        *
        {
            padding: 0;
            margin: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/skins/Back.css" rel="stylesheet" type="text/css" />
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" type="text/javascript"></script>
    <script src="../../../js/jquery.exptextarea.js" type="text/javascript"></script>--%>
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js"
        type="text/javascript"></script>
    <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../../../Scripts/JScript1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(".post_status_top_box_left").click(function () {
                $(".post_status_top_box_right").fadeIn(400);
            });
            $(".post_area").click(function () {
                $(".post_status_top_box_right").fadeOut(400);
            });
        });
    </script>
    <div align="left">
        <img src="../../../image/Title/My_Post.png" /></div>
    <br />
    <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js"
        type="text/javascript"></script>
    <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <div align="left" style="padding-left: 90px">
        <div style="width: 550px; padding-top: 5px; margin-top: 20px; position: relative;
            top: 0px; left: 0px; height: 109px;">
            <div class="post_status_top_box_right">
                <div class="status_profile_img_box" style="width: 95px; height: 95px">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/image/Post/DisplayUser/274559_100001422740031_1658663394_q.jpg" />
                </div>
                <div style="top: 1px; right: -4px; bottom: -1px; left: 4px; float: right;" class="arrow_post_status_box">
                </div>
            </div>
            <div class="post_status_top_box_left">
                <textarea id="txtPost" style="width: 100%; height: 60px; border-radius: 5px 5px 0px 0px;
                    border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #C7C7C7;"
                    placeholder="เขียนแสดงความคิดเห็น..." class="txtare_in_post" name="S1"></textarea>
                <div style="float: right; position: relative; top: -13px; left: 8px;">
                    <asp:Button ID="Button1" runat="server" Text="แสดงความคิดเห็น" CssClass="button_post_in_back" /></div>
                <div style="float: left; background-color: #DADADA; border-radius: 0px 0px 15px 5px;
                    top: 0px; width: 139px; left: 0px; padding-left: 7px; padding-bottom: 3px; padding-right: 15px;"
                    align="left">
                    <div>
                        <asp:CheckBox ID="CheckBox1" runat="server" Font-Names="Tahoma" Font-Size="Small"
                            Text="แชร์บน" />
                        <img src="../../../image/Post/facebook_icon.png" style="position: relative; top: 2px;
                            left: 0px; height: 16px;" /></div>
                </div>
            </div>
        </div>
    </div>
    <%--<div style="padding-left: 50px; padding-right: 20px;">
<div style="border-bottom: thin groove #F5F5F5; padding-top: 20px; padding-bottom: 15px; margin-left:150px; width: 454px; border-left-width: thin; border-right-width: thin; border-top-width: thin;">
     <textarea id="TextAreaPost" runat="server" 
         style="width: 443px; height: 75px" cols="20" name="S1" rows="1"></textarea> 



    <br />

    <div style="margin-left:358px;">
    <asp:Button ID="btnPost" runat="server" Text="โพสต์" onclick="btnPost_Click" 
        CssClass="button_in_back" Height="30px" Width="91px" />
    &nbsp;</div>

</div>
</div>--%>



    <div class="post_area">
        <hr style="width: 662px; margin-bottom: 30px;" align="left" />
<%--
<asp:ListView runat="server" ID="ListViewShowPost" 
        DataSourceID="SqlDataSource1"  >
          <LayoutTemplate>
            <table cellpadding="2" runat="server"
                   id="tblProducts" style="height:320px">
              <tr runat="server" id="groupPlaceholder">
              </tr>
            </table>
           
          </LayoutTemplate>
          <GroupTemplate>
            <tr runat="server" id="productRow"
                style="height:80px">
              <td runat="server" id="itemPlaceholder">
              </td>
            </tr>
          </GroupTemplate>
          <ItemTemplate>
                  <td id="Td1" valign="top" align="center" style="width:100" runat="server">--%>
    <br />
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
                    <img alt="" class="style2" src="../../../image/Post/Comment.png" style="position: relative" />
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
   
        </td> 

<%--
        </ItemTemplate>
        </asp:ListView>--%>
 </div>




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
        SelectCommand="SELECT * FROM [CommentPost]"></asp:SqlDataSource>

    <%--<asp:ListView runat="server" ID="ListViewShowPost" 
    onitemdatabound="ListViewShowKmPost_ItemDataBound"  >
          <LayoutTemplate>
            <table cellpadding="2" runat="server"
                   id="tblProducts" style="height:320px">
              <tr runat="server" id="groupPlaceholder">
              </tr>
            </table>
           
          </LayoutTemplate>
          <GroupTemplate>
            <tr runat="server" id="productRow"
                style="height:80px">
              <td runat="server" id="itemPlaceholder">
              </td>
            </tr>
          </GroupTemplate>
          <ItemTemplate>

        

           <td id="Td1" valign="top" align="center" style="width:100" runat="server">
             
        
        <div class="status_profile_img_box">
        <a  href="../Post/My_posts.aspx?id=<%# (Eval("userid") +""+ Eval("usertype")) %> ">
            <asp:Image ID="Image2" runat="server" ImageUrl='<% #Eval("picuserpath")%>' />
         </a>


        </div>
        <div class="arrow_post_status_box"></div>
        <div class="post_status-comment_area" align="center">

        <div class="post_status_box" align="left">
             <p style="text-align:right;"> 
                <asp:ImageButton ID="imgBtnClosePost" Visible="false" runat="server" Width="30px" Height="30px" OnClientClick="return confirm('คุณต้องการจะลบโพสต์นี้หรือไม่ ! ');"  CommandArgument='<% #Eval("Post_ID") + "," + Eval("userid") %>' ToolTip="ลบโพสต์"
                    ImageUrl="~/image/classroom/comment_close.ico" 
                     onclick="imgBtnClosePost_Click"  />
                 </p>

            <asp:LinkButton ID="linkname" runat="server" CssClass="user_name_status_post" Text='<% #Eval("name")%>'></asp:LinkButton>
            <asp:Label ID="lblPostUserID" runat="server" Text='<% #Eval("userid")%>' Visible="false" ></asp:Label>
             <asp:Label ID="lblpostClassID" runat="server" Text='<% #Eval("Post_ID")%>' Visible="false" ></asp:Label>

                <p class="text_status" id="text_status">

                    <asp:Label ID="Label1" runat="server" Text='<% #Eval("Post_Detail")%>'></asp:Label>

                </p>
            <div style="float: left">
                <span class="readmore" onclick="text_status.className='text_status_showall';this.style.display='none';less_status.style.display='block'"  " id="readmore_status">แสดงทั้งหมด..</span>
                <span id="less_status" class="less_text_status" onclick=" this.style.display='none';readmore_status.style.display='block';text_status.className='text_status' ">ย่อลง</span>
            </div>
            <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" />
                <asp:Label ID="timepost" runat="server" Text='<% # Eval("datepost")%>'></asp:Label>
            </div>
        </div>

        <div class="post_comment_box" align="left">

        <div style="background-color: #efefef; height: 25px; margin-bottom: 3px;" >
            <asp:Image ID="imgPicAllcom"  CssClass="styleimg" ImageUrl="~/image/Post/Comment.png"  Visible="false"  runat="server" />

                <span style="margin-left: 10px; ">
                    <asp:LinkButton ID="lblshowAllComment" runat="server" CommandArgument='<% #Eval("Post_ID")%>' Visible="false"
                CssClass="show_all_comment" onclick="lblshowAllComment_Click">แสดงความคิดเห็นทั้งหมด</asp:LinkButton>
                </span>
            
                
                </div>


    <asp:ListView ID="lvwComments" runat="server" ItemPlaceholderID="itemPlaceholder2" 
                DataSource='<%# getCommentsForPost((string)Eval("Post_ID")) %>' 
                DataKeyNames="Post_ID, ComPost_ID" 
                onitemdatabound="lvwComments_ItemDataBound"  >
       <ItemTemplate>

        <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 3px; display: table;width:98%; height: 109px;" 
                id="comment">
        <div class="comment_profile_img_box">
        <a  href="../Post/My_posts.aspx?id=<%# (Eval("userid") +""+ Eval("usertype")) %> ">
            <asp:Image ID="Image1" runat="server" 
                ImageUrl='<% #Eval("picuserpath")%>' />
          </a>

        </div>
            <div class="user_name_status_post_box"><a class="user_name_comment_post">&nbsp;<asp:Label ID="Label10" runat="server" Text='<% #Eval("name")%>' ></asp:Label>
                        <asp:Label ID="lblcomuseridID" runat="server" Text='<% #Eval("userid")%>' Visible="false" ></asp:Label>
            </a>
            </div>

             <p style="text-align:right">
                <asp:ImageButton ID="imgBtnCloseComment" Visible="false" runat="server" Width="20px" Height="20px" OnClientClick="return confirm('คุณต้องการจะลบคอมเม้นนี้หรือไม่ ! ');"  
                     CommandArgument='<% #Eval("ComPost_ID") + "," + Eval("userid") %>' ToolTip="ลบคอมเม้น"
                    ImageUrl="~/image/classroom/cc_closeComment.ico" 
                     onclick="imgBtnCloseComment_Click"   /></p>

            <p class="text_comment" id="text_comment">

             <asp:Label ID="lbldetailComment" runat="server" Text='<% #Eval("ComPost_Detail")%>'></asp:Label>

             </p>
           <div style="float: left; margin-left: 42px;">
                <span class="readmore" onclick="text_comment.className='text_comment_showall';this.style.display='none';less_comment.style.display='block'" id="readmore_comment">แสดงทั้งหมด..</span>
                <span id="less_comment" class="less_text_comment" onclick=" this.style.display='none';readmore_comment.style.display='block';text_comment.className='text_comment' ">ย่อลง</span>
            </div>
        <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" />

                 <asp:Label ID="Label11" runat="server"    Text='<%#  Eval("datecomment")%>' ></asp:Label><br />

            </div>
            </div>

            </ItemTemplate>                          
         </asp:ListView>

            <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 5px; display: table; clear: both;" 
                id="commentPost">
        <div class="comment_profile_img_box">
            <asp:ImageButton ID="imgOwn" runat="server" PostBackUrl="~/WebPage/BackYard/Post/My_posts.aspx" Width="30px" Height="30px" />
        </div>
            <div class="txt_comment_box">
           <asp:TextBox ID="textarea" runat="server" CssClass="txt_comment" 
                    TextMode="MultiLine" placeholder="เขียนความคิดเห็น..." Width="447px" ></asp:TextBox>
                </div>


                    <div style="text-align:right">
                     <asp:Button ID="btnComment" runat="server" Text="คอมเม้น" onclick="btnComment_Click"  CommandArgument='<% #Eval("Post_ID")%>'   CssClass="button_in_back" Height="25px" Width="75px" />
                     </div>

            </div>
            
        </div>
    </div>

    </td> 


        </ItemTemplate>
        </asp:ListView>--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <%--
        <asp:DataPager ID="DataPagerPost" runat="server" PagedControlID="ListViewShowPost"
    PageSize="20" OnPreRender="DataPagerPost_PreRender">
    <Fields>
        <asp:NextPreviousPagerField ShowFirstPageButton="True" 
            ShowNextPageButton="False" FirstPageText="หน้าแรก" 
            PreviousPageText="ก่อนหน้า" />
        <asp:NumericPagerField />
        <asp:NextPreviousPagerField ShowLastPageButton="True" 
            ShowPreviousPageButton="False" 
            LastPageImageUrl="~/image/classroom/lastpage.ico" LastPageText="หน้าสุดท้าย" 
            NextPageImageUrl="~/image/classroom/nextpage.ico" NextPageText="ถัดไป" 
            ButtonCssClass="button_in_back" ButtonType="Button" />
    </Fields>
</asp:DataPager>--%>
    <br />
    <br />
    <br />
    </div>
    <br />
    <script src="../../../js/jsTextArea/jquery.elastic.source.js" type="text/javascript"
        charset="utf-8"></script>
    <script type="text/javascript">
			// <![CDATA[
        jQuery.noConflict();
        jQuery(document).ready(function () {
            jQuery('textarea').elastic();
            jQuery('textarea').trigger('update');
        });	
			// ]]>
    </script>
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
