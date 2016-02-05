<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="updateCheckNameStd.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.updateCheckNameStd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
     
            <br />
            <asp:ListView ID="ListViewEditeCheckname" runat="server" DataSourceID="sqlCheck" 
           InsertItemPosition="LastItem"  
            onitemcommand="ListViewEditeCheckname_ItemCommand"  >
            <LayoutTemplate>
                <table border="0" cellpadding="0" width="80%" class="fontTable_updateCheckNameStd" cellspacing="0" style="height: 200px; padding-top: 10px;">
                    <tr class="HeaderTable_updateCheckNameStd">
                       
                        <th align="left"> <asp:Label ID="lbtyear" runat="server" >รหัสนักศึกษา</asp:Label></th>
                         <th align="left"><asp:Label ID="LinkButton1" runat="server" >ชื่อนักศึกษา</asp:Label></th>
                         <th align="left"><asp:Label ID="Label1" runat="server" >นามสกุล</asp:Label></th>
                         <th align="left"><asp:Label ID="Label2" runat="server" >ประเภท</asp:Label></th>
                         <th align="left"><asp:Label ID="Label5" runat="server" >จัดการ</asp:Label></th>
                        <th></th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
                <asp:DataPager ID="ItemDataPager" runat="server" >
                    <Fields>
                        <asp:NumericPagerField ButtonCount="2" />
                    </Fields>
                </asp:DataPager>    
            </LayoutTemplate>
            <ItemTemplate>
                    <tr style="background-color: #FFFFFF"> 
                        <td><asp:Label runat="server" ID="lblyear"><%#Eval("stdCode")%></asp:Label></td>
                         <td><asp:Label runat="server" ID="Label3"><%#Eval("fname")%></asp:Label></td>
                          <td><asp:Label runat="server" ID="Label4"><%#Eval("lname")%></asp:Label></td>
                          <td><asp:Label runat="server" ID="Label6"><%#Eval("status")%></asp:Label></td>
                        <td><asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>
                    </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                    <tr style="background-color:#A4AFC6">
                       <td><asp:Label runat="server" ID="lblyear"><%#Eval("stdCode")%></asp:Label></td>
                         <td><asp:Label runat="server" ID="Label3"><%#Eval("fname")%></asp:Label></td>
                          <td><asp:Label runat="server" ID="Label4"><%#Eval("lname")%></asp:Label></td>
                         <td><asp:Label runat="server" ID="Label7"><%#Eval("status")%></asp:Label></td>
                        <td><asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>

                    </tr>
            </AlternatingItemTemplate>

            <EditItemTemplate>
                       
                    <td>
                    <td><asp:Label runat="server" ID="lblcode"><%#Eval("stdCode")%></asp:Label></td>
                      <td><asp:Label runat="server" ID="Label3"><%#Eval("fname")%></asp:Label></td>
                      <td><asp:Label runat="server" ID="Label4"><%#Eval("lname")%></asp:Label></td>
                     <td> <%--<asp:TextBox ID="txtYear" runat="server" Text='<%#Eval("status") %>' Width="100px"></asp:TextBox>--%>
                    
                       <asp:DropDownList ID="ddlStatusInclass" runat="server">
                                  <asp:ListItem Value="U">--เลือก--</asp:ListItem>
                                   <asp:ListItem Value="S">เข้าเรียน</asp:ListItem>
                                  <asp:ListItem Value="L">มาสาย</asp:ListItem>
                                  <asp:ListItem Value="N">ขาดเรียน</asp:ListItem>
                         </asp:DropDownList>

                     
                     </td>
                      <td><asp:Label ID="lblcheckid" runat="server" Text='<%#Eval("checkid") %>' Visible="false"></asp:Label></td>
                    </td>
                    
                     <td>   
                             <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update">แก้ไข</asp:LinkButton>
                            <%--<asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">ลบ</asp:LinkButton>--%>
                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel">ยกเลิก</asp:LinkButton>
                    </td>
                    
                </tr>
            </EditItemTemplate>

            <InsertItemTemplate>
              <%--  <tr runat="server">
                    <td></td>
                    <td>
                        <asp:TextBox ID="txtNewYear" runat="server" Text='<%#Eval("status") %>' Width="100px">First Name</asp:TextBox>
                        
                    </td>
                     <td> --%>
                     <%-- <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                             Text="Insert" />
                     <asp:LinkButton ID="lnkinsert" runat="server" CommandName="Insert">เพิ่มข้อมูล</asp:LinkButton>--%>
                             
                             </td>
                    
                </tr>
            </InsertItemTemplate>
            
        </asp:ListView>
    
        
                &nbsp;<br />

   
              <div>
        


                  <asp:SqlDataSource ID="sqlCheck" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                      
                      
                      SelectCommand="   SELECT   CheckName.CheckName_ID as checkid,Student.Std_Campus_Code AS stdCode, Student.Std_FName AS fname, Student.Std_LName AS lname, EnrollIn.Enroll_ID AS enroll,  
                                           CASE CheckName.CheckName_Status 
					                        WHEN 'S' THEN 'เข้าเรียน'
					                        WHEN 'L' THEN 'สาย'
					                        WHEN 'N' THEN 'ขาดเรียน'
                                            ELSE 'ยังไม่ได้เช็คชื่อ'
					                        END as status 
                                            FROM Student INNER JOIN
                                            EnrollIn ON Student.Std_Campus_Code = EnrollIn.Std_Campus_Code INNER JOIN
                                             CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID
                                             WHERE ([DeEduStd] = @DetailTech_ID) AND ([CheckName_Num] = @checknum)">
                      <SelectParameters>
                          <asp:QueryStringParameter Name="DetailTech_ID" QueryStringField="dchID" Type="String" />
                          <asp:QueryStringParameter Name="checknum" QueryStringField="checknum" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>


                         
                       



                      <div>



                          </div>


            </div>
         
              <a href='DetailcheckName.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;deEduStd=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>'>
                <div style="background-position: center; width: 51px; height: 50px; float: right; padding-top: 8px; background-image: url('../../../image/Detail/Icon_backward.png'); background-repeat: no-repeat;"></div></a> 
    
</asp:Content>
