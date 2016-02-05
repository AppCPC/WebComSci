<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="CheckNameStd.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.CheckNameStd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <link rel="Stylesheet" href="../../../css/skins/TabRoom.css" /> 
            <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
            <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
        <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
            <br />

            <asp:GridView ID="gvCheckName" runat="server" AutoGenerateColumns="False" 
                DataSourceID="sqlCheck" DataKeyNames="enroll" Width="685px" 
                CssClass="MyGridView" onrowcreated="gvCheckName_RowCreated"
                BorderColor="White" BorderStyle="Solid">
                <Columns>

                    <asp:BoundField DataField="stdCode" HeaderText="รหัสนักศึกษา" 
                        SortExpression="stdCode" />
                    <asp:BoundField DataField="fname" HeaderText="ชื่อนักศึกษา" 
                        SortExpression="fname" />
                    <asp:BoundField DataField="lname" HeaderText="นามสกุล" 
                        SortExpression="lname" />

                     <asp:TemplateField HeaderText="เช็คชื่อ">
                        <ItemTemplate>
                        <table><tr>
                         <td> <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="36px" RepeatDirection="Horizontal" Width="300px">
                                  <asp:ListItem Value="S">เข้าเรียน</asp:ListItem>
                                  <asp:ListItem Value="L">มาสาย</asp:ListItem>
                                  <asp:ListItem Value="N">ขาดเรียน</asp:ListItem>
                              </asp:RadioButtonList></td>
                      <td>  <asp:RequiredFieldValidator ID="rfvrdlYesNo" runat="server" ControlToValidate="RadioButtonList1"
             Display="Dynamic"  ValidationGroup="regroup"><p style="color:Red;">*</p></asp:RequiredFieldValidator>
                    </td>
                  </tr></table>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <HeaderStyle CssClass="GridViewHeader" />
            </asp:GridView>
            <br />

   
              <div>

<%--                  <asp:SqlDataSource ID="sqlCheck" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                      
                      
                      SelectCommand="SELECT Student.Std_Campus_Code AS stdCode, Student.Std_FName AS fname, Student.Std_LName AS lname, EnrollIn.Enroll_ID as enroll FROM EnrollIn INNER JOIN
                      Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code WHERE ([DetailTech_ID] = @DetailTech_ID)">
                      <SelectParameters>
                          <asp:QueryStringParameter Name="DetailTech_ID" QueryStringField="dchID" 
                              Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>--%>

                                    <asp:SqlDataSource ID="sqlCheck" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>"  
                      
                      
                      SelectCommand="Select std.Std_Campus_Code AS stdCode, std.Std_FName AS fname, std.Std_LName AS lname, en.Enroll_ID as enroll
                        from Student std INNER JOIN EnrollIn en ON (std.Std_Campus_Code=en.Std_Campus_Code)
                            INNER JOIN DetailEducationOfStudent dedu ON(en.DeEduStd=dedu.DeEduStd)    WHERE (dedu.DeEduStd = @EduStdID)">
                      <SelectParameters>
                          <asp:QueryStringParameter Name="EduStdID" QueryStringField="deEduStd" 
                              Type="Int32" />
                      </SelectParameters>
                  </asp:SqlDataSource>

                  



                      <div>
                     <%-- OnClientClick="return confirm('ยืนยันการเช็คชื่อ ! ');" --%> 
            <asp:Button ID="btnOk" runat="server" onclick="btnOk_Click" ValidationGroup="regroup"  
                                  Text="บันทึก" Width="87px" CssClass="button_in_back" 
                              onclientclick="return confirm('ยืนยันผลการเช็คชื่อนี้ ! ')" />

                    

                          </div>


            </div>
                       <%-- Response.Redirect("ListCheckName.aspx?classid="+classid+"&dchID="+deid+"&stdClass="+classid+"&deEduStd="+deEduStd+"&subjectcode="+subcode);
--%>
         
                  <a href='ListCheckName.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;stdClass=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;deEduStd=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
                <div style="background-position: center; width: 51px; height: 50px; float: right; padding-top: 8px; background-image: url('../../../image/Detail/Icon_backward.png'); background-repeat: no-repeat;"></div></a> 
    
</asp:Content>
