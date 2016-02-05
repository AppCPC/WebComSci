<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="MainRoomMangeUserInClass.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.MainRoomMangeUserInClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

    <div class="fontHead2">กรุณาเลือกห้องที่ต้องการ</div>
   
    <script src="../../../js/jquery.min.js"  type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnCreateUser").addClass("button_nav_menu_tree_Active");
        });
        </script>

   <div class="content_box_curve">
  <asp:ListView runat="server" ID="ListViewShowRoomInClass"
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
           
 


            <%--    <div id="cssmenu" align="left" style="padding-left: 50px;">  
                    <ul>
                        <li>           
                        <a href='MainCreateUserInClass.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%# Eval("DetailTech_ID")%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'><span>
                            <br></br>
                       <b>  <asp:Label ID="Label2" runat="server" Text='<%# "วคท."+ Eval("DetailTech_Level") + "ห้อง :"+ Eval("DetailTech_Class") %>' ></asp:Label></b>  
                        </span></a>

                      </li>
                    </ul>
                </div>
               --%>
         <div>
            <ul>
                <li class="button_roomMange">
                    <a href='MainCreateUserInClass.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%# Eval("DeEduStd")%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>' 
                        class="button_roomMange">
                        <div align="left" class="RoomName_roomMange">
                            <asp:Label ID="Label1" runat="server" Text='<%# "วคท."+ Eval("stdlevel") + " ห้อง "+ Eval("stdClass") %>'></asp:Label></div>
                    </a>
                </li>
            </ul>
        
        </div>

 
            </td> 
          </ItemTemplate>
        </asp:ListView>
        </div>

        

</asp:Content>
