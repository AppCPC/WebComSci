<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="DetailcheckName.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.DetailcheckName" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

 <div class="fontHead2">เลือกรายการที่ต้องการ</div>


     <asp:ListView runat="server" ID="ListViewShowRoomInClass"
            GroupItemCount="2" DataSourceID="SqlDataSourceShowDetailCheckName" >
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
    
               <%-- <div id="cssmenu" align="left" style="padding-left: 50px">
                    <ul>
                        <li>
                                  <a  href='updateCheckNameStd.aspx?checknum=<%# Eval("numCheck") %>&classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
                                  <b> ครั้งที่ :  <asp:Label ID="subjectName" runat="server" Text='<% #Eval("numCheck")%>'></asp:Label><br />
                                <p style="font-size:12px;font-style:oblique;">
                                 วันที่:  <asp:Label ID="Label1" runat="server" Text='<% #Eval("DateCheck")%>'></asp:Label>
                                  </p></b></a>
                                
                                
                                </span>
                        </li>

                    </ul>
                </div> --%>
            <div>
            <ul>
                <li class="button_checkName">
                     <a  href='updateCheckNameStd.aspx?checknum=<%# Eval("numCheck") %>&classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;'>
                        <div align="left" class="RoomName_checkName">
                         <b> ครั้งที่ :  <asp:Label ID="subjectName" runat="server" Text='<% #Eval("numCheck")%>'></asp:Label><br />
                                <p style="font-size:12px;font-style:oblique;">
                                 วันที่:  <asp:Label ID="Label2" runat="server" Text='<% #Eval("DateCheck")%>'></asp:Label>
                                  </p></b>

                          <%-- <asp:Label ID="Label1" runat="server" Text='<%# "วคท."+ Eval("DetailTech_Level") + "  ห้อง "+ Eval("DetailTech_Class") %>'></asp:Label></div>--%> 
                    </a> 
                </li>
            </ul>
        
        </div>
    
         


 
            </td> 
          </ItemTemplate>
        </asp:ListView>
  
             <asp:SqlDataSource ID="SqlDataSourceShowDetailCheckName" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
        SelectCommand=" SELECT DISTINCT(CheckName.CheckName_Num)As numCheck ,CONVERT(VARCHAR(16), CheckName.Create_date , 106)  AS DateCheck ,DeEduStd
                            FROM EnrollIn INNER JOIN
                      CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID  WHERE ([DeEduStd] = @DeEduStd)">
                 <SelectParameters>
                     <asp:QueryStringParameter Name="DeEduStd" 
                         QueryStringField="deEduStd" Type="Int32" />
                 </SelectParameters>
    </asp:SqlDataSource>
  
    

          </ItemTemplate>
        </asp:ListView>




         
                  <a href='ListCheckName.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;stdClass=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;deEduStd=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
    <div style="background-position: center; width: 95px; height: 50px; float: right; background-image: url('../../../image/Detail/Icon_backward.png'); background-repeat: no-repeat;"></div></a> 
</asp:Content>
