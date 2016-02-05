<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true"
    CodeBehind="MainHomework.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.MainHomework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
  

    <script src="../../../js/jquery.min.js"  type="text/javascript"></script>

      <script type="text/javascript">
          $(document).ready(function () {
              $("#btnhomework").addClass("button_nav_menu_tree_Active");
          });
        </script>

      <div style="float: right; width: 338px; height: 30px; margin-bottom: 5px; margin-top: 10px;" 
        align="right">
        <p style="float: left; font-family: tahoma; font-size: 13px; color: #000; margin-right: 5px; margin-top: 4px;">
            สร้างชื่อไฟล์:</p>
        <div style="float: left; margin-right: 3px; padding-top: 1px;">
            <asp:TextBox ID="txtCreateHomeWork" runat="server" CssClass="textbox_in_back"></asp:TextBox>
        </div>
        <div style="float: left"><asp:Button ID="btncreateHomework" runat="server" Text="สร้าง" CssClass="button_in_back" 
           
            OnClientClick="return confirm('ยืนยันชื่อการบ้านนี้เพื่อสร้างไฟล์การบ้าน ? ');" 
            onclick="btncreateHomework_Click" /></div>
    </div>
    <p align="left" 
        
        style="font-size: medium; float: left; margin-left: 20px; margin-top: 10px; font-weight: 700;">
        จัดการการบ้าน..</p>
        <br />   <br />
        <br/>
        <br/>
        <div class="content_box_curve">
     <asp:ListView runat="server" ID="ListviewHomeWork"
            GroupItemCount="2" DataSourceID="SqlDataSourceShowMainHomework" >
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
        
  <%--<a href="DetailHoneWorkTeacher.aspx" > --%>
      <td id="Td1" valign="top" align="center" style="width:100" runat="server"> 

 <div>
   <div style="clear: both" align="center">
        <ul style="width: 370px;">
            <li class="button_homework" onclick="location.href='DetailHomeWorkTeacher.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>&numhom=<%# Eval("Homework_Num") %>'">
                <div class="name_homework_in_button"><asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("Homework_Name")%>'></asp:Label></div><br/>
                <asp:TextBox ID="txtEditeName" runat="server" Visible="false"></asp:TextBox>
                 <div class="date_homework_in_button" align="left"><asp:Label ID="Label2" 
                         runat="server" Text='<%# "วันที่ "+ Eval("Create_date")%>'></asp:Label></div>
                 <div align="left" class="time_homework_in_button">
                 <asp:Label ID="Label3" runat="server" Text='<%# "เวลา "+ Eval("Create_time")%>'></asp:Label></div>

                 <div align="right" class="num_send_in_button">
                     <img src="../../../image/Back/Classroom/HomeWork/numsend_icon.png" style="border:0px;
                         title="จำนวนคนส่งงาน" /><asp:Label ID="Label4" runat="server" 
                         Text='<%# "ส่ง "+ Eval("countuser") +" คน " %>'></asp:Label></div>

                <div class="tooltip_homework_box">
                    <div class="tooltip_homework">

                         
               <asp:LinkButton ID="LinkButton1"   runat="server" CssClass="btndel" onclick="LinkButton1_Click" CommandArgument='<%# Eval("Homework_Num") + "," + Eval("Tch_Create") %>' OnClientClick="return confirm('คุณต้องการจะลบข้อมูลไฟล์การบ้านนี้หรือไม่ ?');" ToolTip="ลบ"></asp:LinkButton>
                </div>

            </li>

             

   </div>
     
  </td>
        
          </ItemTemplate>
        </asp:ListView>

        </div>

    <asp:SqlDataSource ID="SqlDataSourceShowMainHomework" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
        SelectCommand="SELECT distinct [Homework_Name],(  SELECT distinct CONVERT(VARCHAR(12),Create_date, 106)FROM    Homework  INNER JOIN
                      EnrollIn ON Homework.Enroll_ID = EnrollIn.Enroll_ID INNER JOIN
                      DetailTech ON EnrollIn.DetailTech_ID = DetailTech.DetailTech_ID where (DetailTech.ClassRoom_ID = @ClassRoom_ID ) AND (Homework.Homework_Num='1')) AS Create_date
                     ,(SELECT distinct( CONVERT(CHAR(5), Create_date, 114))
						FROM         Homework  INNER JOIN
                      EnrollIn ON Homework.Enroll_ID = EnrollIn.Enroll_ID INNER JOIN
                      DetailTech ON EnrollIn.DetailTech_ID = DetailTech.DetailTech_ID where (DetailTech.ClassRoom_ID = @ClassRoom_ID ) AND (Homework.Homework_Num='1')) as Create_time 
                     ,( SELECT count(Homework.Enroll_ID) 
						FROM         Homework  INNER JOIN
                      EnrollIn ON Homework.Enroll_ID = EnrollIn.Enroll_ID INNER JOIN
                      DetailTech ON EnrollIn.DetailTech_ID = DetailTech.DetailTech_ID where (DetailTech.ClassRoom_ID = @ClassRoom_ID ) AND (Homework.Homework_Num='1') AND Homework.Homework_Status='Y' ) AS countuser
      ,[Homework_Num]
      ,[Tch_Create]
  FROM [WEBCSDB].[dbo].[Homework]">
  
    <SelectParameters>
            <asp:QueryStringParameter Name="ClassRoom_ID" QueryStringField="classid" 
                Type="Int32" />
        </SelectParameters>
  
  
  </asp:SqlDataSource>



   
 


<%-- ClassRoom/MainHomework.aspx?classid=24&dchID=38&subjectcode=13102354&ShowPlan_Id=63--%>
    </a></asp:Content>
