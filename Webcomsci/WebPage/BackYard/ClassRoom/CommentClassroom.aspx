<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="CommentClassroom.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.CommentClassroom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<meta http-equiv="refresh" content="30">

    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
  
  <script src="../../../js/jquery.min.js"  type="text/javascript"></script>
     
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnCommentClass").addClass("button_nav_menu_tree_Active"); 
        });
        </script>
    <style type="text/css">
    #TextArea2
    {
        width: 275px;
        height: 40px;
    }
    .sRight
    {
        text-align:right;
        }
        
   .styleimg
   {
       position: relative;
    }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
   
    <div style="padding-left: 50px; padding-right: 20px;">
<div style="border-width: thin; padding-top: 20px; padding-bottom: 15px; border-bottom-style: groove; border-bottom-color: #F5F5F5;">
     <textarea id="TextAreaPostClassRoom" runat="server" style="width: 443px; height: 75px"></textarea> 
     <%--
                 <asp:Label ID="Label6" runat="server"  Text='<%#  " เวลา :" + (string)Eval("timecomment")%>' ></asp:Label> --%>


    <br />

    <div style="margin-left:358px;">
    <asp:Button ID="btnPost" runat="server" Text="โพสต์" onclick="btnPost_Click" 
        CssClass="button_in_back" Height="30px" Width="91px" />
    &nbsp;</div>

</div>
</div>


   
    
    
  <div class="post_area">
  <asp:ListView runat="server" ID="ListViewShowPost" 
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
   <%--     <a  href="../Post/My_posts.aspx?id=<%# (Eval("userid") +""+ Eval("usertype")) %> ">--%>
            <asp:Image ID="Image2" runat="server" ImageUrl='<% #Eval("picuserpath")%>' />
      <%--   </a>--%>

<%--            <asp:ImageButton ID="Image2" ImageUrl='<% #Eval("picuserpath")%>' PostBackUrl='~/WebPage/BackYard/Post/My_posts.aspx?id=(Eval("userID") +""+ Eval("UserType"))' runat="server" />--%>
        </div>
        <div class="arrow_post_status_box"></div>
        <div class="post_status-comment_area" align="center">

        <div class="post_status_box" align="left">
           
           <p style="text-align:right">
                <asp:ImageButton ID="imgBtnClosePost" Visible="false" runat="server" 
                    Width="16px" Height="16px" 
                    OnClientClick="return confirm('คุณต้องการจะลบโพสต์นี้หรือไม่ ! ');"  
                    CommandArgument='<% #Eval("PostClassRoom_ID") + "," + Eval("userid") %>' ToolTip="ลบโพสต์"
                    ImageUrl="~/image/Post/btn_del_post.png"
                     onclick="imgBtnClosePost_Click"  />
               </p>


                   <%--  <span class="btn_del_post">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/Post/btn_del_post.png"
                        onmouseover="this.src='/../image/Post/btn_del_post_hover.png'" onmouseout="this.src='/../image/Post/btn_del_post.png'"
                        ToolTip="ลบ" /></span>--%>




            <asp:LinkButton ID="linkname" runat="server" CssClass="user_name_status_post" Text='<% #Eval("name")%>'></asp:LinkButton>
            <asp:Label ID="lblPostUserID" runat="server" Text='<% #Eval("userid")%>' Visible="false" ></asp:Label>
             <asp:Label ID="lblpostClassID" runat="server" Text='<% #Eval("PostClassRoom_ID")%>' Visible="false" ></asp:Label>

                <p class="text_status" id="text_status">

                    <asp:Label ID="Label1" runat="server" Text='<% #Eval("PostClassRoom_Detail")%>'></asp:Label>

                </p>
            <%--<div style="float: left">
                <span class="readmore" onclick="text_status.className='text_status_showall';this.style.display='none';less_status.style.display='block'"  " id="readmore_status">แสดงทั้งหมด..</span>
                <span id="less_status" class="less_text_status" onclick=" this.style.display='none';readmore_status.style.display='block';text_status.className='text_status' ">ย่อลง</span>
            </div>--%>
            <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" />
                <asp:Label ID="timepost" runat="server" Text='<% # Eval("datepost")%>'></asp:Label>
            </div>
        </div>

        <div class="post_comment_box" align="left">

    

                <div
                    align="left" class="show_all_coments">
                    <img alt="" class="style2" src="../../../image/Post/Comment.png" style="position: relative" />
                    <span style="margin-left: 10px;">
                        <asp:LinkButton ID="lblshowAllComment" runat="server"  CommandArgument='<% #Eval("PostClassRoom_ID")%>' Visible="false"  CssClass="show_all_comment">แสดงความคิดเห็นทั้งหมด</asp:LinkButton></span>
                </div>



    <asp:ListView ID="lvwComments" runat="server" ItemPlaceholderID="itemPlaceholder2" 
                DataSource='<%# getCommentsForPost((string)Eval("PostClassRoom_ID")) %>' 
                DataKeyNames="PostClassRoom_ID, ComPostClass_ID" 
                onitemdatabound="lvwComments_ItemDataBound"  >
       <ItemTemplate>

        <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 3px; display: table;width:98%; height: 109px;" 
                id="comment">
        <div class="comment_profile_img_box">
 <%--       <a  href="../Post/My_posts.aspx?id=<%# (Eval("userid") +""+ Eval("usertype")) %> ">--%>
            <asp:Image ID="Image1" runat="server" 
                ImageUrl='<% #Eval("picuserpath")%>' />
     <%--     </a>--%>

        </div>
            <div class="user_name_status_post_box"><a class="user_name_comment_post">&nbsp;<asp:Label ID="Label10" runat="server" Text='<% #Eval("name")%>' ></asp:Label>
                        <asp:Label ID="lblcomuseridID" runat="server" Text='<% #Eval("userid")%>' Visible="false" ></asp:Label>
            </a>
            </div>

             <p style="text-align:right">
                <asp:ImageButton ID="imgBtnCloseComment" Visible="false" runat="server" Width="20px" Height="20px" OnClientClick="return confirm('คุณต้องการจะลบคอมเม้นนี้หรือไม่ ! ');"  
                     CommandArgument='<% #Eval("ComPostClass_ID") + "," + Eval("userid") %>' ToolTip="ลบคอมเม้น"
                    ImageUrl="~/image/classroom/cc_closeComment.ico" 
                     onclick="imgBtnCloseComment_Click"   /></p>

            <p class="text_comment" id="text_comment">

             <asp:Label ID="lbldetailComment" runat="server" Text='<% #Eval("ComPostClass_Detail")%>'></asp:Label>

             </p>
        <%--   <div style="float: left; margin-left: 42px;">
                <span class="readmore" onclick="text_comment.className='text_comment_showall';this.style.display='none';less_comment.style.display='block'" id="readmore_comment">แสดงทั้งหมด..</span>
                <span id="less_comment" class="less_text_comment" onclick=" this.style.display='none';readmore_comment.style.display='block';text_comment.className='text_comment' ">ย่อลง</span>
            </div>--%>
        <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" />

                 <asp:Label ID="Label11" runat="server"    Text='<%#  Eval("datecomment")%>' ></asp:Label><br /><%--
                 <asp:Label ID="Label6" runat="server"  Text='<%#  " เวลา :" + (string)Eval("timecomment")%>' ></asp:Label> --%>

            </div>
            </div>

            </ItemTemplate>                          
         </asp:ListView>

            <div style="padding: 6px 3px 3px 6px; background-color: #efefef; margin-bottom: 5px; display: table; clear: both;" 
                id="commentPost">
        <div class="comment_profile_img_box">
            <%--<asp:Image ID="imgUser" runat="server"  />--%>


            <asp:ImageButton ID="imgOwn" runat="server" ImageUrl='<%#  Eval("userpath")%>' PostBackUrl="~/WebPage/BackYard/Post/My_posts.aspx" Width="30px" Height="30px" />
        </div>
            <div class="txt_comment_box">
           <asp:TextBox ID="textarea" runat="server" CssClass="txt_comment" 
                    TextMode="MultiLine" placeholder="เขียนความคิดเห็น..." Width="447px" ></asp:TextBox>
                </div>


                    <div style="text-align:right">
                     <asp:Button ID="btnComment" runat="server" Text="คอมเม้น" onclick="btnComment_Click"  CommandArgument='<% #Eval("PostClassRoom_ID")%>'   CssClass="button_in_back" Height="25px" Width="75px" />
                     </div>

            </div>
            
        </div>
    </div>

    </td> 


        </ItemTemplate>
        </asp:ListView>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <br />

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
            NextPageImageUrl="~/image/classroom/nextpage.ico" NextPageText="ถัดไป" />
    </Fields>
</asp:DataPager>

        <br />
        <br />
        <br />

        </div>
    
        


		<br />
		<script src="../../../js/jsTextArea/jquery.elastic.source.js" type="text/javascript" charset="utf-8"></script>

		<script type="text/javascript">
			// <![CDATA[
		    jQuery.noConflict();
		    jQuery(document).ready(function () {
		        jQuery('textarea').elastic();
		        jQuery('textarea').trigger('update');
		    });	
			// ]]>
		</script>





    

  
</asp:Content>
