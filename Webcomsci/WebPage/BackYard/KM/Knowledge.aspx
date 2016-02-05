<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true" CodeBehind="Knowledge.aspx.cs" Inherits="Webcomsci.Knowledge"  EnableEventValidation="false"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register Src="~/WebPage/BackYard/KM/Cratekm.ascx" TagName="PopupAddsubject" TagPrefix="uc1" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="HTMLEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
  
  <script src="../../../js/jquery.min.js"  type="text/javascript"></script>
    <script src="../../../js/jquery.exptextarea.js"  type="text/javascript"></script>
  
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
   

    <div align="left">
    <img src="../../../image/Title/KM.png" />
    <p style="text-align:right">
       <asp:Button ID="btnCreateKm" runat="server" Text="สร้างโพสต์"   CssClass="button_in_back"
           onclick="btnCreateKm_Click" /></p>


    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" >
    </ajaxToolkit:ToolkitScriptManager>

                        <asp:HiddenField ID="HiddenTargetShow" runat="server" />

                        <br />
  <asp:ListView runat="server" ID="ListViewShowKmPost" 
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
                <asp:ImageButton ID="imgBtnClosePost" Visible="false" runat="server" Width="30px" Height="30px" OnClientClick="return confirm('คุณต้องการจะลบโพสต์นี้หรือไม่ ! ');"  CommandArgument='<% #Eval("KmPost_ID") + "," + Eval("userid") %>' ToolTip="ลบโพสต์"
                    ImageUrl="~/image/classroom/comment_close.ico" 
                     onclick="imgBtnClosePost_Click"  />
                 </p>

            <asp:LinkButton ID="linkname" runat="server" CssClass="user_name_status_post" Text='<% #Eval("name")%>'></asp:LinkButton>
            <asp:Label ID="lblPostUserID" runat="server" Text='<% #Eval("userid")%>' Visible="false" ></asp:Label>
             <asp:Label ID="lblpostClassID" runat="server" Text='<% #Eval("KmPost_ID")%>' Visible="false" ></asp:Label>

                <p class="text_status" id="text_status">
                      <b>  ชื่อเรื่อง  :   <asp:Label ID="Label4" runat="server" Text='<% #Eval("title")%>'></asp:Label></b><br />
                        รายละเอียด :  <asp:Label ID="Label3" runat="server" Text='<% #Eval("detail")%>'></asp:Label><br /><br />
                        ลิงค์อ้างอิง : <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<% #Eval("link")%>' Text="www.linkKM.com"></asp:LinkButton>

                <%--    <asp:Label ID="Label1" runat="server" Text='<% #Eval("detail")%>'></asp:Label>--%>

                </p>
            <div style="float: left">
           <%--     <span class="readmore" onclick="text_status.className='text_status_showall';this.style.display='none';less_status.style.display='block'"  " id="readmore_status">แสดงทั้งหมด..</span>
                <span id="less_status" class="less_text_status" onclick=" this.style.display='none';readmore_status.style.display='block';text_status.className='text_status' ">ย่อลง</span>--%>
            </div>
            <div class="timepost">
                <img src="../../../image/Post/clock.png" class="iconClock" />
                <asp:Label ID="timepost" runat="server" Text='<% # Eval("datepost")%>'></asp:Label>
            </div>
        </div>

        <div class="post_comment_box" align="left">

        <div style="background-color: #efefef; height: 25px; margin-bottom: 3px;" >
           <%-- <img alt="" class="style2" src="../../../image/Post/Comment.png" 
                style="position: relative" />--%>

            <asp:Image ID="imgPicAllcom"  CssClass="styleimg" ImageUrl="~/image/Post/Comment.png"  Visible="false"  runat="server" />

                <span style="margin-left: 10px; ">
                    <asp:LinkButton ID="lblshowAllComment" runat="server" CommandArgument='<% #Eval("KmPost_ID")%>' Visible="false"
                CssClass="show_all_comment" onclick="lblshowAllComment_Click">แสดงความคิดเห็นทั้งหมด</asp:LinkButton>
                </span>
            
                
                </div>


    <asp:ListView ID="lvwComments" runat="server" ItemPlaceholderID="itemPlaceholder2" 
                DataSource='<%# getCommentsForPost((string)Eval("KmPost_ID")) %>' 
                DataKeyNames="KmPost_ID, KmComPost_ID" 
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
            <div class="user_name_status_post_box"><a class="user_name_comment_post">&nbsp;
            <asp:Label ID="Label10" runat="server" Text='<% #Eval("name")%>' ></asp:Label>
                        <asp:Label ID="lblcomuseridID" runat="server" Text='<% #Eval("userid")%>' Visible="false" ></asp:Label>
            </a>
            </div>

             <p style="text-align:right">
                <asp:ImageButton ID="imgBtnCloseComment" Visible="false" runat="server" Width="20px" Height="20px" OnClientClick="return confirm('คุณต้องการจะลบคอมเม้นนี้หรือไม่ ! ');"  
                     CommandArgument='<% #Eval("KmComPost_ID") + "," + Eval("userid") %>' ToolTip="ลบคอมเม้น"
                    ImageUrl="~/image/classroom/cc_closeComment.ico" 
                     onclick="imgBtnCloseComment_Click"   /></p>

            <p class="text_comment" id="text_comment">

             <asp:Label ID="lbldetailComment" runat="server" Text='<% #Eval("ComPost_Detail")%>'></asp:Label>

             </p>
           <div style="float: left; margin-left: 42px;">
<%--                <span class="readmore" onclick="text_comment.className='text_comment_showall';this.style.display='none';less_comment.style.display='block'" id="readmore_comment">แสดงทั้งหมด..</span>
                <span id="less_comment" class="less_text_comment" onclick=" this.style.display='none';readmore_comment.style.display='block';text_comment.className='text_comment' ">ย่อลง</span>--%>
            </div>
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
            <asp:ImageButton ID="imgOwn" runat="server" PostBackUrl="~/WebPage/BackYard/Post/My_posts.aspx" Width="30px" Height="30px" />
        </div>
            <div class="txt_comment_box">
           <asp:TextBox ID="textarea" runat="server" CssClass="txt_comment" 
                    TextMode="MultiLine" placeholder="เขียนความคิดเห็น..." Width="447px" ></asp:TextBox>
                </div>


                    <div style="text-align:right">
                     <asp:Button ID="btnComment" runat="server" Text="คอมเม้น" onclick="btnComment_Click"  CommandArgument='<% #Eval("KmPost_ID")%>'   CssClass="button_in_back" Height="25px" Width="75px" />
                     </div>

            </div>
            
        </div>
    </div>

    </td> 


        </ItemTemplate>
        </asp:ListView>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <br />

                        <ajaxToolkit:ModalPopupExtender ID="modalpopupshow" runat="server" DynamicServicePath=""
                                                        Enabled="True" TargetControlID="HiddenTargetShow" CancelControlID="imgproClose" PopupControlID="pnl"
                                                        BackgroundCssClass="modalbackground">
                                                    </ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="pnl" CssClass="modalpopup" runat="server" Style="display: none">
             
            <div style="text-align: right;background-color:Gray;" > 
              <asp:ImageButton ID="imgproClose" runat="server" ImageUrl="~/image/close_button.png" AlternateText="ปิด" />
               </div>
               <uc1:PopupAddsubject ID="PopupAddsubject" runat="server" />  

                 </asp:Panel>
    </div>

               <asp:HiddenField ID="hidden_popupmsg" runat="server" />
                    <ajaxToolkit:ModalPopupExtender ID="mdlpopupmsg" runat="server" BackgroundCssClass="modalbackground" TargetControlID="hidden_popupmsg" 
                     PopupControlID="pnlprogress" >
                    </ajaxToolkit:ModalPopupExtender>

    <asp:Panel ID="pnlprogress" runat="server" CssClass="modalpopup" Width="800px">

                      <div style="margin-left:758px; margin-top:-10px; width: 61px;">
                                                <asp:ImageButton ID="imgClose" runat="server" ImageUrl="~/image/close_button.png" />
                                            </div>

                        <asp:UpdatePanel ID="test" runat="server">
                            <ContentTemplate>
                                <table class="style1" style="width: 998px">
                                    <tr>
                                        <td class="style2">
                                            &nbsp;&nbsp; ชื่อกระทู้
                                        </td>
                                        <td class="style4">
                                            :</td>
                                        <td class="style6">
                                            <asp:TextBox ID="txtName" runat="server" CssClass="textbox_in_back" 
                                                Width="371px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                            &nbsp;&nbsp; รายละเอียด
                                        </td>
                                        <td class="style4">
                                            :</td>
                                        <td>
                                            <%--  <asp:UpdatePanel ID="updatePanel1" runat="server">
              <ContentTemplate>--%>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                            &nbsp;&nbsp;&nbsp; รูปที่เกี่ยวข้อง
                                        </td>
                                        <td class="style4">
                                            :</td>
                                        <td class="style12">
                                            <asp:FileUpload ID="FileUpload" runat="server" CssClass="textbox_in_back" 
                                                ViewStateMode="Enabled" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                            &nbsp;ลิ้งค์ที่เกี่ยวข้อง
                                        </td>
                                        <td class="style4">
                                            http :
                                        </td>
                                        <td class="style15">
                                            <asp:TextBox ID="TextBoxLink" runat="server" CssClass="textbox_in_back" 
                                                Width="373px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                            &nbsp;</td>
                                        <td class="style4">
                                            &nbsp;</td>
                                        <td class="style16">
                                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblPathImage" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                      </asp:UpdatePanel>
                        <br />
                    </asp:Panel>
        
         


</asp:Content>

