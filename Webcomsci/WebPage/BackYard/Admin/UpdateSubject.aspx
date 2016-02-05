<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateSubject.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.UpdateSubject" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="HTMLEditor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register Src="ucAddSubject.ascx" TagName="PopupAddsubject" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">


        .style3
        {
            width: 20px;
            text-align: left;
        }
        .style2
        {
            width: 199px;
            text-align:left;
        }
        .style7
        {
            width: 101px;
            text-align: left;
        }
        .style24
        {
            width: 61%;
            text-align: left;
        }
        .style20
        {
            width: 71px;
            text-align: left;
            height: 31px;
        }
        .style21
        {
            width: 199px;
            text-align: left;
            height: 31px;
        }
        .style22
        {
            width: 61%;
            text-align: left;
            height: 31px;
        }
        .style23
        {
            width: 101px;
            text-align: left;
            height: 31px;
        }
        .style17
        {
            width: 71px;
            text-align: left;
            height: 233px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" >
    </ajaxToolkit:ToolkitScriptManager>
  <br />
  <div style="text-align:left"><b>&nbsp; </b></div>
    <table style="width:100%;">
     <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2" colspan="2">
                <b>แก้ไขข้อมูลรายวิชา</b></td>
        
                    <td class="style7">
                        &nbsp;</td>

        </tr>

        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                ปีการศึกษาที่ปรับปรุงหลักสูตร</td>
        <td class="style24">
                <asp:DropDownList ID="ddlYear" 
                    runat="server" DataSourceID="SqlDataSourceYearEdu" 
                    DataTextField="Curri_Year" DataValueField="Curri_Year">
                </asp:DropDownList>
                <asp:TextBox ID="txtyear" runat="server" Enabled="False"></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataSourceYearEdu" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Curri_Year] FROM [Curriculum]"></asp:SqlDataSource>
                </td>
                    <td class="style7">
                        &nbsp;</td>

        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                หมวดวิชา</td>
            <td class="style24">
                <asp:DropDownList ID="ddlCourses" runat="server" Height="27px" Width="153px" 
                    AutoPostBack="True" DataSourceID="SqlDataSourceCourse" 
                    DataTextField="Curri_Course" DataValueField="Curri_Course">
                </asp:DropDownList>
                <asp:TextBox ID="txtcour" runat="server" Enabled="False"></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT DISTINCT [Curri_Course] FROM [Curriculum] WHERE ([Curri_Year] = @Curri_Year)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlYear" 
                            Name="Curri_Year" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                กลุ่มวิชา</td>
            <td class="style24">
                          <asp:DropDownList ID="ddlGroup" runat="server" DataSourceID="SqlDataGroup" 
                              DataTextField="Curri_Group" DataValueField="Curri_Group">
                </asp:DropDownList>
                <asp:TextBox ID="txtGroup" runat="server" Enabled="False"></asp:TextBox>
                          <asp:SqlDataSource ID="SqlDataGroup" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                              
                              
                              SelectCommand="SELECT [Curri_Group] FROM [Curriculum] WHERE (([Curri_Course] = @Curri_Course) AND ([Curri_Year] = @Curri_Year))">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="ddlCourses" Name="Curri_Course" 
                                      PropertyName="SelectedValue" Type="String" />
                                  <asp:ControlParameter ControlID="ddlYear" Name="Curri_Year" 
                                      PropertyName="SelectedValue" Type="String" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
               <b> รายละเอียดรายวิชา</b></td>
            <td class="style24">
                &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                รหัสวิชา</td>
            <td class="style24">
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                ชือวิชาภาษาไทย</td>
            <td class="style24">
                <asp:TextBox ID="txtNameThai" runat="server"></asp:TextBox>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                      ชื่อวิชาภาษาอังกฤษ</td>
            <td class="style24">
                          <asp:TextBox ID="TxtNameEn" runat="server"></asp:TextBox>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style20">
                </td>
            <td class="style21" >
                หน่วยกิตรายวิชา</td>
            <td class="style22" 
                          &nbsp;</td>
                          <asp:TextBox ID="txtCredit" runat="server"></asp:TextBox>
                    <td class="style23">
                        </td>
        </tr>
          <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style21" >
                วิชาบังคับผ่าน<br />
               <p style="text-align:right; width: 261px;"> ค้นหาจากรหัสผ่าน</p></td>
            <td class="style22" 
                          &nbsp;</td>
                          <br />
                          <asp:TextBox ID="TxtCodePass" runat="server"></asp:TextBox>
       
                          <asp:Button ID="btnok" runat="server" Text="ค้นหา" onclick="btnok_Click" />
       
                    &nbsp;<asp:Button ID="btnAddNewSubject" runat="server" Text="เพิ่มรายวิชาบังคับผ่าน" 
                              onclick="btnAddNewSubject_Click" Height="26px"  />

                        <asp:HiddenField ID="HiddenTargetShow" runat="server" />

                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" DynamicServicePath=""
                                                        Enabled="True" TargetControlID="HiddenTargetShow" CancelControlID="imgproClose" PopupControlID="pnl"
                                                        BackgroundCssClass="modalbackground">
                                                    </ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="pnl" CssClass="modalpopup" runat="server" Style="display: none">
             
            <div style="text-align: right;background-color:Gray;" > 
              <asp:ImageButton ID="imgproClose" runat="server" ImageUrl="~/image/close_button.png" AlternateText="ปิด" />
               </div>
               <uc1:PopupAddsubject ID="PopupAddsubject" runat="server" />  

                 </asp:Panel>


              <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" DynamicServicePath=""
                                                        Enabled="True" TargetControlID="HiddenTargetShow" CancelControlID="imgproClose" PopupControlID="pnl"
                                                        BackgroundCssClass="modalbackground">
                                                    </ajaxToolkit:ModalPopupExtender>
                   
                    <td class="style23">
                        &nbsp;</td>
        </tr>
          <tr>
            <td class="style20">
                &nbsp;</td>
            <td colspan="2" >
                <div id="show" runat="server" visible="false">
                <p style="text-align:left"></p>


    <asp:GridView ID="gvSubject" runat="server" ShowFooter="True" AutoGenerateColumns="False"
   
                CellPadding="3" 
                Width="97%" Style="text-align: left" 
                    DataSourceID="SqlDataSourceShowGride" 
           DataKeyNames="StructSub_Code" BackColor="White" BorderColor="#CCCCCC" 
           BorderStyle="None" BorderWidth="1px" PageSize="5" AllowPaging="True" 
           AllowSorting="True" onrowcommand="gvSubject_RowCommand">
                <Columns>
                <asp:TemplateField HeaderText="ดึงรายวิชา">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnSubjectGet" runat="server" AlternateText="subjectGet" 
                                    CommandArgument='<%# Eval("StructSub_Code") %>' CommandName="subjectGet" 
                                    ToolTip="subjectGet">ดึงข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

                    <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" 
                        ReadOnly="True" SortExpression="StructSub_Code" />
                    <asp:BoundField DataField="StructSub_NameTha" HeaderText="ชื่อรายวิชา" 
                        SortExpression="StructSub_NameTha" />
                    <asp:BoundField DataField="StructSub_NameEn" HeaderText="ชื่อรายวิชาภาษาอังกฤษ" 
                        SortExpression="StructSub_NameEn" />
                    <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิตรายวิชา" 
                        SortExpression="StructSub_Credit" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>

                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceShowGride" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                        SelectCommand="SELECT [StructSub_Code], [StructSub_NameTha], [StructSub_NameEn], [StructSub_Credit] FROM [StructSubject] WHERE ([StructSub_Code] LIKE @StructSub_Code + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TxtCodePass" Name="StructSub_Code" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <b>
                    <p style="text-align:left;">
                    <asp:Label ID="lblNameSubPass" runat="server" BorderStyle="None" 
                        Text="รายวิชาบังคับผ่านทั้งหมด"></asp:Label></p>
                    </b>
                    <br />
                    <asp:GridView ID="gvSubjectShow" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        DataKeyNames="StructSub_Code" ForeColor="Black" GridLines="Vertical" 
                        onpageindexchanging="gvSubject_PageIndexChanging" 
                        onrowcommand="gvSubjectShow_RowCommand" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="ลบข้อมูล">
                                <ItemTemplate>
                                    <table border="0" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td align="center" style="height: 18px;">
                                                <asp:LinkButton ID="btnDelete" runat="server" AlternateText="DeleteSubject" 
                                                    CommandArgument='<%# Eval("StructSub_Code") %>' CommandName="DeleteSubject" 
                                                    ToolTip="DeleteSubject">ลบข้อมูล</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                            </asp:TemplateField>
                    <%--    <asp:BoundField DataField="Curri_Group" HeaderText="กลุ่มวิชา" />--%>
                            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" />
                            <asp:HyperLinkField DataTextField="StructSub_NameTha" 
                                HeaderText="ชื่อรายวิชา" />
                            <asp:BoundField DataField="StructSub_NameEn" 
                                HeaderText="ชื่อรายวิชาภาษาอังกฤษ" />
                            <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" 
                            Height="30px" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" Height="20px" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <br />
                    <br />
                </div>
              </td>
            <td class="style23">
                        &nbsp;</td>
        </tr>
          <tr>
            <td class="style17">
                </td>
            <td  colspan="2" >
          <p style="text-align:left;">    <b > รายละเอียดรายวิชา  </b></p>
                <br />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtArea" runat="server" Height="184px" 
                    TextMode="MultiLine" Width="84%"></asp:TextBox>
                        <br />
                <br />
       
       <div style="  text-align: right; height: 22px;">
                                 <asp:Button ID="btnSave" runat="server" Text="บันทึก" ValidationGroup="Reg1" 
                              Width="70px" onclick="btnSave_Click" />

                              <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" Width="70px" 
                                     onclick="btnCancel_Click" 
                                     PostBackUrl="~/WebPage/BackYard/Admin/SearchSubject.aspx" /></div>
              
                        <br />
              
                <br />
                <br />
              
                        </td>
           
        </tr>
        </tr>

         </tr>

         </tr>
          </table>

          <div>

          </div>
          <br /><br />
                       
    </asp:Content>
