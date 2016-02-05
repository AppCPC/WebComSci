<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true"
    CodeBehind="mainClassroom.aspx.cs" Inherits="Webcomsci.Classroom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <link rel="Stylesheet" href="../../../css/skins/TabGroup.css" />
    <div align="left">
        <img src="../../../image/Title/Room.png" /></div>
    <div align="left" class="nav_menu">
        <a id="AshowSubjectStudy" class="button_nav_menu_tree" href="RegisClassRoom.aspx">ลงทะเบียนเข้าใช้ห้องเรียน</a>
        <div class="nav_menu_space">
        </div> 
    </div>
    <p align="left" style="margin-top: 20px;font-size:18px; margin-left: 20px">
        <b>ห้องเรียนทั้งหมด</b></p><br />
       
         <div class="content_box_curve">
        <asp:ListView runat="server" ID="ListViewShowSubjectRoom"
            GroupItemCount="2" >
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
           
              <%-- <div class="subjectAll">--%>
                      <a class="butSubject" href="CommentClassroom.aspx?classid=<%# Eval("classid")+"&dchID="+Eval("detailid")+"&subjectcode="+Eval("subcode") %> ">
<%--        <a class="butSubject" href="CommentClassroom.aspx?classid=<%# Eval("classid")+"&dchID="+Eval("detailid")+"&subjectcode="+Eval("subcode")+"&ShowPlan_Id="+Eval("planid")  %> ">--%>
            <div class="iconSubject">
               <%-- <asp:Image ID="icon" runat="server" ImageUrl='<%#" Eval("BranchNews_Path") %>' CssClass="icon" />--%>
                   <asp:Image ID="icon" runat="server" ImageUrl='<% #Eval("image")%>'/>
       </div>
            <div class="subjectName" style="margin-top: 20px;">
                
              <asp:Label ID="subjectName" runat="server" Text='<% #Eval("subcode")%>'></asp:Label><br />
            <b>  <p style="font-size:10px;font-style:oblique;">
              <asp:Label ID="Label1" runat="server" Text='<% #Eval("subThai")%>'></asp:Label><br />
                <div style="font-size:20px;">ห้อง : <asp:Label ID="Label2" runat="server" Text='<% #Eval("Room")%>'></asp:Label>
              
                    </div></p></b>
              </div>
        </a>
 
            </td> 

          </ItemTemplate>
        </asp:ListView>

        </div>

</asp:Content>
