<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherMy_posts.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Post.OtherMy_posts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
        <link href="../../../css/skins/Back.css" rel="stylesheet" type="text/css" />
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
     <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
  <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

   <script type="text/javascript">
       document.observe('dom:loaded', function (evt) {
           var select, selects, _i, _len, _results;
           if (Prototype.Browser.IE && (Prototype.BrowserFeatures['Version'] === 6 || Prototype.BrowserFeatures['Version'] === 7)) {
               return;
           }
           selects = $$(".chzn-select");
           _results = [];
           for (_i = 0, _len = selects.length; _i < _len; _i++) {
               select = selects[_i];
               _results.push(new Chosen(select));
           }
           deselects = $$(".chzn-select-deselect");
           for (_i = 0, _len = deselects.length; _i < _len; _i++) {
               select = deselects[_i];
               _results.push(new Chosen(select, { allow_single_deselect: true }));
           }
           return _results;
       });
  </script>

   <style type="text/css">
        #TextArea1
        {
            height: 42px;
            width: 333px;
        }
        #Text1
        {
            width: 255px;
        }
        </style>
</head>
 <div class="HeadSite2">
    <center>
        <div style="width: 1024px">
            <div align="left" class="logo">
                <img alt="" class="imgLogo" src="/image/Login/Logo.png" /></div>
            <div class="headcontent" style="text-align: right; width: 633px;">

        <div style="float: right; height: 22px; width: 350px; margin-top: 8px;" align="left">

          <select id="selectddl" data-placeholder="Choose Your My Friend..." class="chzn-select" style="width:250px;" tabindex="2"   >
           <asp:Repeater ID="rptShowSearchuser" runat="server" >
                <ItemTemplate>
                    <option  value='<%#  (Eval("userID") +""+ Eval("UserType")) %>'>  <%# (Eval("name").ToString().Length > 50 ? Eval("name").ToString().Substring(0, 50) + "..." : Eval("name"))%>   </option>  
                </ItemTemplate>
            </asp:Repeater>
               </select>
                <input id="Button1" type="button" value="ค้นหา" onclick="fncAlert()" class="button_in_back"  />

         </div>
            </div>
            <div class="headcontentRight">
                <div style="float: right; width: 31px; height: 29px; padding-top: 3px;" 
                    class="displayimgHead">

                    <a href="../Post/My_posts.aspx">
                    <asp:image  runat="server" ID="imgUser"  CssClass="imgProfile" Height="29px" 
                        Width="31px"></asp:image></a>

                    </div>
                <p style="width: 79px; float: right; height: 16px; padding-top: 10px;" 
                    id="P1" align="left">
                    <a href="../../Authen/Login.aspx?log=logout">ออกจากระบบ</a>
                </p>
                <p style="width: 14px; float: right; padding-top: 10px;" id="P2" 
                    align="center">
                    |
                </p>
                <p style="width: 102px; float: right; padding-top: 10px;" id="P3">
                    <a href="../../FrontYard/Home.aspx">หน้าเว็บสาขา</a></p>
            </div>
        </div>
    </center>
</div>
<body>
      <center>
        <form id="form1" runat="server">
        <div style="width: 1024px; padding-top: 50px;">
            <div align="left" style="height: 160px">
                <div align="center" class="displayimg">
                    <img alt="" class="imgProfile" src="/image/User.png" /></div>
                <div class="nameProfile" style="margin-top: 40px">
                    <a href="../Profile/profile.aspx">
                        <asp:Label ID="lblname" runat="server" Width="100%" CssClass="labelName"></asp:Label>
                        <asp:Label ID="lblClass" runat="server" CssClass="labelClass"></asp:Label>
                    </a>
                    <div style="width: 226px; height: 22px"></div>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="กำลังศึกษาอยู่ชั้นปีที่ " 
                            CssClass="labelTitledetailPersonel"></asp:Label>

                        <asp:Label ID="Label6" runat="server" Text="4" CssClass="labeldetailPersonel"></asp:Label>

                            <br />
                       <asp:Label ID="Label4" runat="server" Text="วันเกิด :" 
                            CssClass="labelTitledetailPersonel"></asp:Label>
                        
                       <asp:Label ID="Label5" runat="server" Text="7 มิถุนายน 2533" 
                            CssClass="labeldetailPersonel"></asp:Label>
                            <br />
                            
                        <asp:Label ID="Label2" runat="server" Text="E-mail :" 
                            CssClass="labelTitledetailPersonel"></asp:Label>
                        <asp:Label ID="lblEmail" runat="server" 
                            CssClass="labeldetailPersonel"></asp:Label>
                            <br />


                    </div>
                    
                </div>
                
                <div style="float: left; width: 335px; height: 149px;">
                    <%# (Eval("name").ToString().Length > 50 ? Eval("name").ToString().Substring(0, 50) + "..." : Eval("name"))%>
                   <div style="margin-top: 100px; height: 42px;" >
                    <asp:Label ID="Label7" runat="server" Text="เพศ :" 
                            CssClass="labelTitledetailPersonel"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="ชาย" 
                            CssClass="labeldetailPersonel"></asp:Label>
                            <br />
                    <asp:Label ID="Label9" runat="server" Text="สถานะ :" 
                            CssClass="labelTitledetailPersonel"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="นักศึกษา" 
                            CssClass="labeldetailPersonel"></asp:Label>
                    
                    </div>
            </div>


      <%-- <textarea id="TextArea1" class="textarea" cols="20" name="S1"></textarea>--%>

              
            <div style="border-width: 1px; border-color: #000000; width: 1024px; float: left; background-image: url('/image/Back/BG.png'); background-repeat: repeat-y;">

                             <div class="Menu">
                    <ul>
	           <li runat=server id="b3"><a href="../Plane/Education2.aspx" class="b3"></a></li>
	           <li><a href="../ClassRoom/mainClassroom.aspx" class="b6"></a></li>
                        <li style="button_menu"><a href="../Report/SelectRoomReport.aspx" class="b10"></a></li>
	                    <li><a href="../Group/Group.aspx" class="b5"></a></li>
	                    <li><a href="../KM/Knowledge.aspx" class="b7"></a></li>
                        <li><a href="../setting/Set.aspx" class="b8"></a></li>
                        <li><a href="../Post/My_posts.aspx" class="b1"></a></li>
                        <li><a href="../Post/Post_all.aspx" class="b2"></a></li>
                        <li><a href="../Photo/Photos2.aspx" class="b4"></a></li>
                            <%--        <div align="left" style="height: 140px">
            <div align="center" class="displayimg2">
                <img alt="" class="imgProfile" src="/image/User.png" />
                    <div class="nameProfile2" align="left">
            <a href="../Profile/profile.aspx">
                <asp:Label ID="lblname" runat="server" Width="100%" 
                    CssClass="labelName"></asp:Label>
                <asp:Label ID="lblClass" runat="server" 
                    CssClass="labelClass"></asp:Label>
                    </a>
            </div>
            </div>

            <div style="float: left; width: 843px; height: 149px;" align="center">
                <textarea id="TextArea1" class="textarea" cols="20" name="S1" rows="2"></textarea></div>
        
        </div>--%>
                        
                    </ul>
                </div>


                <div class="content" id="s1">
             <div align="left">
            <img src="../../../image/Title/My_Post.png" /></div>
    

            <div align="left" style="padding-left: 90px">
        <div 
            style="width: 550px; padding-top: 5px; margin-top: 20px; position: relative;
            top: 0px; left: 0px; height: 109px;">
            <div class="post_status_top_box_right">
                <div class="status_profile_img_box" style="width: 95px; height: 95px">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/image/Post/DisplayUser/274559_100001422740031_1658663394_q.jpg" />
                </div>
                <div style="top: 1px; right: -4px; bottom: -1px; left: 4px; float: right;" 
                    class="arrow_post_status_box">
                </div>
            </div>
            <div class="post_status_top_box_left">
                <textarea id="txtPost" 
                    style="width: 100%; height: 60px; border-radius: 5px 5px 0px 0px; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #C7C7C7;" placeholder="เขียนแสดงความคิดเห็น..."
                    class="txtare_in_post" name="S1"></textarea>
                <div style="float: right; position: relative; top: -13px; left: 8px;">
                    <asp:Button ID="Button2" runat="server" Text="แสดงความคิดเห็น" 
                        CssClass="button_post_in_back" /></div>
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


    <div class="post_area">
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
                <div style="float: left">
                <span class="readmore" onclick="text_status.className='text_status_showall';this.style.display='none';less_status.style.display='block'"  " id="readmore_status">แสดงทั้งหมด..</span>
                <span id="less_status" class="less_text_status" onclick=" this.style.display='none';readmore_status.style.display='block';text_status.className='text_status' ">ย่อลง</span>
                    
                </div>
                <div class="timepost">
                    <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="timepost"
                        runat="server" Text="เมื่อ 2 ชั่วโมงที่แล้ว"></asp:Label>
                </div>
            </div>
            <div class="post_comment_box" align="center">
                <div style="background-color: #efefef; height: 25px; margin-bottom: 3px; width: 505px;" 
                    align="left">
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
                    <div style="clear: both">
                    <div style="float: left; margin-left: 52px;">
                        <span class="readmore" onclick="text_comment.className='text_comment_showall';this.style.display='none';less_comment.style.display='block'"
                            id="readmore_comment">แสดงทั้งหมด..</span> 
                            <span id="less_comment" class="less_text_comment"onclick=" this.style.display='none';readmore_comment.style.display='block';text_comment.className='text_comment' ">
                                ย่อลง</span>
                    </div>
                    <div class="timepost">
                        <img src="../../../image/Post/clock.png" class="iconClock" /><asp:Label ID="Label3"
                            runat="server" Text="เมื่อ 1 ชั่วโมงที่แล้ว"></asp:Label>
                    </div>
                    </div>
                </div>
                <div id="commentPost" class="comment_post_box">
                    <div class="comment_profile_img_box">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/image/Post/DisplayUser/187447_100000148320653_1279950673_q.jpg" />
                    </div>
                    <div class="txt_comment_box" align="left">
                        <div style="float: left; width: 442px; margin-left: 5px;">
                            <asp:TextBox ID="textarea" runat="server" CssClass="textbox_in_back" TextMode="MultiLine" 
                                placeholder="เขียนความคิดเห็น..." Height="32px" Width="99%" 
                                EnableTheming="True"
                                style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #C7C7C7;"></asp:TextBox>
                        </div>
                        <div style="float: right; clear: both; margin-top: -15px;">
                            <asp:Button ID="Button3" runat="server" Text="โพสต์" 
                                CssClass="button_post_in_back" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        </div>








               
                </div>
            </div>
        </div>
        </form>
    </center>
</body>
</html>
