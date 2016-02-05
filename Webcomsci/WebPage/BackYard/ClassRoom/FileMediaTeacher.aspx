<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="FileMediaTeacher.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.FileMediaTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
         .style3
        {
            width: 32px;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link rel="Stylesheet" href="../../../css/skins/TabRoom.css" />
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

      <script src="../../../js/jquery.min.js"  type="text/javascript"></script>

      <script type="text/javascript">
          $(document).ready(function () {
              $("#btnFileMedia").addClass("button_nav_menu_tree_Active"); 
          });
        </script>
         
        <div align="right" class="Area_PictureUpload_FileMediaTeacher">
        <%--   <a href='CreateMediafile.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
      </a>
     <div id="upload" class="PictureUpload_FileMediaTeacher" runat="server"></div>--%>
       <%-- <asp:Button ID="Button2" runat="server" Text="+ อัพโหลดไฟล์" CssClass="button_in_back" /> --%>
            <input id="btnupload" type="button" value="+ อัพโหลดไฟล์สือการสอน" class="button_in_back"   onClick="location.href='CreateMediafile.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>' " />
            <br />
        
            
    </div>
    
          <strong>จัดการไฟล์สื่อการสอน.....</strong>

     <div class="content_box_curve">
         
       <asp:ListView runat="server" ID="ListViewShowfileMedia" >
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

        <div class="AreaAll_FileMediaTeacher">     
        <div class="AreaPicture_FileMediaTeacher">
        <div class="CropPicture_FileMediaTeacher">
            <img alt="" class="style3" src='<%# Eval("image")%>'/></div>
        </div>
        <div class="AreaContent_FileMediaTeacher">
        <div class="fontTitle_FileMediaTeacher"><%# Eval("InstMedia_Name")%></div>
        <div class="fontDowload_FileMediaTeacher">
            <asp:LinkButton ID="lnkbtndownload" runat="server" CommandArgument='<% #Eval("InstMedia_Path")%>'  onclick="lnkbtndownload_Click" >ดาวน์โหลด</asp:LinkButton>
       </div>
       <div class="AreaDetail_FileMediaTeacher">
        <div class="fonttime_FileMediaTeacher">วันที่ <%# Eval("Create_date")%></div>
        <div class="fontsize_FileMediaTeacher">ขนาด <%# Eval("InstMedia_Size")%> </div>
        </div>      
         <div class="fontDelete_FileMediaTeacher">
           <asp:LinkButton ID="lbtndelete" runat="server" CommandArgument='<% #Eval("InstMedia_ID")+ ","+Eval("InstMedia_Path") %>' OnClientClick="return confirm('คุณต้องการจะลบไฟล์สื่อการสอนนี้จริงหรือไม่ ! ');"   onclick="lnkbtnDelete_Click" >ลบ</asp:LinkButton>
         </div>  
        </div>
        </div>

         </td> 



          </ItemTemplate>
        </asp:ListView>
        
        
         <br />
                   <div align="right" 
    style="font-family: Tahoma; font-size: 12px; color: #333333; margin-bottom: 10px;">
        <asp:DataPager ID="DataPager" runat="server" PagedControlID="ListViewShowfileMedia" Visible="False"
            PageSize="15" OnPreRender="DataPagershowMediafile_PreRender">
            <Fields>
                <asp:NextPreviousPagerField ShowFirstPageButton="True" 
                    ShowNextPageButton="False" FirstPageText="" 
                    PreviousPageText="&lt;&lt;ก่อนหน้า" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ShowLastPageButton="True" 
                    ShowPreviousPageButton="False" LastPageText="" NextPageText="ถัดไป&gt;&gt;" />
            </Fields>
        </asp:DataPager>
        </div>

        </div>
          
          </asp:Content>