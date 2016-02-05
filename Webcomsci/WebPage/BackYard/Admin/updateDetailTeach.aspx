<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="updateDetailTeach.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.updateDetailTeach" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">



        .style3
        {
            width: 20px;
            text-align: left;
        }
        .style7
        {
            width: 101px;
            text-align: left;
        }
        .style24
        {
            width: 23%;
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
            width: 392px;
            text-align: left;
            height: 31px;
            font-weight: 700;
        }
        .style22
        {
            width: 23%;
            text-align: left;
            height: 31px;
        }
        .style23
        {
            width: 101px;
            text-align: left;
            height: 31px;
        }
        .modalpopup{
   /* background-color:White;
    padding:6px 6px 6px 6px;
    margin-top:-35px;*/
         border: 2px solid Black;
        background-color: White;
        padding: 3px;
    }

        .style25
        {
            width: 176px;
            text-align: left;
        }
        .style26
        {
            width: 176px;
            text-align: left;
            height: 31px;
        }
        .style27
        {
            width: 392px;
            text-align: left;
        }
        .style28
        {
            width: 71px;
            text-align: left;
            height: 15px;
        }
        .style29
        {
            height: 15px;
        }
        .style30
        {
            width: 23%;
            text-align: left;
            height: 15px;
        }
        .style31
        {
            width: 101px;
            text-align: left;
            height: 15px;
        }
        .style32
        {
            width: 160px;
        }
        .style33
        {
            width: 108px;
        }
        .style34
        {
            width: 102px;
        }
        .style35
        {
            width: 281px;
        }
        .textleft
        {
           text-align:left;
        }
        .textright
        {
           text-align:right;
        }
        .style36
        {
            text-align: left;
            width: 281px;
        }
        .style38
        {
            width: 160px;
            height: 40px;
        }
        .style39
        {
            width: 108px;
            height: 40px;
        }
        .style40
        {
            width: 102px;
            height: 40px;
        }
        .style41
        {
            height: 40px;
        }
        .style42
        {
            text-align: left;
            font-weight: bold;
        }
        .style43
        {
            width: 392px;
            text-align: left;
            height: 31px;
        }
        .style44
        {
            height: 15px;
            width: 176px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" >
    </ajaxToolkit:ToolkitScriptManager>
  <br />
  <div style="text-align:left"><b>&nbsp; </b></div>
    <table style="width:90%;">
     <tr>
            <td class="style3">
                &nbsp;</td>
            <td  colspan="3" class="textleft">
                <b>แก้ไขรายละเอียดวิชาที่เปิด สอน</b></td>
        
                    <td class="style7">
                        &nbsp;</td>

                    <td class="style7">
                        &nbsp;</td>

        </tr>

        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style27">
                ปีการศึกษาที่ปรับปรุงหลักสูตร</td>
        <td class="style24">
                <asp:TextBox ID="txtyear" runat="server" Enabled="False"></asp:TextBox>
                </td>
                    <td class="style25">
                        &nbsp;</td>

                    <td class="style7">
                        &nbsp;</td>

                    <td class="style7">
                        &nbsp;</td>

        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style27">
                หมวดวิชา</td>
            <td class="style24">
                <asp:TextBox ID="txtcour" runat="server" Enabled="False"></asp:TextBox>
            </td>
                  <td class="style25">
                กลุ่มวิชา</td>
                  <td class="style7">
                <asp:TextBox ID="txtGroup" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style27">
                &nbsp;</td>
            <td class="style24">
                &nbsp;</td>
                  <td class="style25">
                      &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style27">
               <b> รายละเอียดรายวิชา</b></td>
            <td class="style24">
                &nbsp;</td>
                  <td class="style25">
                      &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style27">
                รหัสวิชา</td>
            <td class="style24">
                <asp:TextBox ID="txtCode" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                  <td class="style25">
                      &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style27">
                ชือวิชาภาษาไทย</td>
            <td class="style24">
                <asp:TextBox ID="txtNameThai" runat="server" Width="214px" Enabled="False"></asp:TextBox>
                    </td>
                  <td class="style25">
                      ชื่อวิชาภาษาอังกฤษ</td>
                  <td class="style7">
                          <asp:TextBox ID="TxtNameEn" runat="server" Width="214px" Enabled="False"></asp:TextBox>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style27">
                หน่วยกิตรายวิชา</td>
            <td class="style24">
                          <asp:TextBox ID="txtCredit" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                  <td class="style25">
                      &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style20">
                </td>
            <td class="style21" >
                &nbsp;</td>
            <td class="style22" 
                          &nbsp;</td>
                          &nbsp;<td class="style26">
                        </td>
                    <td class="style23">
                        &nbsp;</td>
                    <td class="style23">
                        &nbsp;</td>
        </tr>
          <tr>
            <td class="style20" style="background-color: #C0C0C0">
                &nbsp;</td>
            <td colspan="2" class="style42" style="background-color: #C0C0C0" >
                สร้างรายละเอียดการสอน&nbsp;&nbsp;&nbsp; </td>
              <td class="style26" style="background-color: #C0C0C0">
                        &nbsp;</td>
                    <td class="style23" style="background-color: #C0C0C0">
                        &nbsp;</td>
                    <td class="style23" style="background-color: #C0C0C0">
                        &nbsp;</td>
        </tr>
          <tr>
            <td class="style28" style="background-color: #C0C0C0">
                </td>
            <td class="style29" style="background-color: #C0C0C0" >
                อาจารย์ผู้สอน<br />
               </td>
            <td class="style30" 
                          &nbsp;</td style="background-color: #C0C0C0">
              <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                <asp:TextBox ID="txFulltNameTeacher" runat="server" Width="214px" 
                    Enabled="False"></asp:TextBox>
                          <br />
       
                    &nbsp;<td  
                  style="background-color: #C0C0C0;" class="style44">
                        <asp:Button ID="btnShowGrideTeacher" runat="server" Text="ค้นหารายชืออาจารย์" 
                            onclick="btnShowGrideTeacher_Click" />
                    </td>
              <td class="style31" style="background-color: #C0C0C0">
                        </td>
              <td class="style31" style="background-color: #C0C0C0">
                        </td>
        </tr>
          <tr>
            <td style="background-color: #C0C0C0" ></td>
              <td colspan="4" style="background-color: #C0C0C0">

              <div id="idshowGride" runat="server" style="background-color: Gray" visible=false>
              
              
                  <table style="width:100%;">
                      <tr>
                          <td class="style32">
                              <b>ค้นหาอาจารย์ผู้สอน</b></td>
                          <td class="style33">
                              &nbsp;</td>
                          <td class="style34">
                              &nbsp;</td>
                          <td>
                              &nbsp;</td>
                          <td class="style35">
                              &nbsp;</td>
                          <td>
                              &nbsp;</td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style32">
                              &nbsp;</td>
                          <td class="style33">
                ชืออาจารย์</td>
                          <td class="style34">
                          <asp:TextBox ID="txtNameTeacher" runat="server" AutoPostBack="True"></asp:TextBox>
       
                          </td>
                          <td class="textright">
                              สกุล</td>
                          <td class="style36">
                          <asp:TextBox ID="txtLnameTeacher" runat="server" Width="129px" AutoPostBack="True"></asp:TextBox>
       
                          </td>
                          <td>
                              &nbsp;</td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style38">
                              </td>
                          <td class="style39">
                ประเภทอาจารย์</td>
                          <td class="style40">
                          <asp:DropDownList ID="ddlTypeTeacher" runat="server" Height="29px" Width="133px">
                              <asp:ListItem Value="N">--เลือก--</asp:ListItem>
                              <asp:ListItem Value="TE">อาจารย์ประจำ</asp:ListItem>
                              <asp:ListItem Value="TS">อาจารย์พิเศษ</asp:ListItem>
                          </asp:DropDownList>
       
                          </td>
                          <td class="style41">
                              </td>
                          <td class="textright">
       
                          <asp:Button ID="btnok" runat="server" Text="ค้นหา" onclick="btnok_Click" 
                                  Height="27px" Width="59px" />
       
                              </td>
                          <td class="style41">
                              </td>
                          <td class="style41">
                              </td>
                      </tr>
                      </table>


    <asp:GridView ID="gvShowTeacher" runat="server" ShowFooter="True" AutoGenerateColumns="False"
        CellPadding="4"  Width="97%" Style="text-align: left" 
           DataKeyNames="Tch_ID" AllowPaging="True"  onrowcommand="gvShowTeacher_RowCommand" ForeColor="#333333" 
                    GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                <asp:TemplateField HeaderText="ดึงข้อมูลอาจารย์">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnGetTeacher" runat="server" AlternateText="ดึงข้อมูลอาจารย์ที่ท่านต้องการ"
                                    CommandArgument='<%# Eval("Tch_ID") %>' CommandName="getTeacher" 
                                    ToolTip="subjectGet">ดึงข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

               <asp:TemplateField HeaderText="ชื่ออาจารย์">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:Label ID="lblnameteach" runat="server" AlternateText="ชื่ออาจารย์"  Text='<%# Eval("Tch_FName") %>'> </asp:Label>
                                   
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

                         <asp:TemplateField HeaderText="นามสกุล">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:Label ID="lbllnameTeach" runat="server" AlternateText="นามสกุลอาจารย์"  Text='<%# Eval("Tch_LName") %>' > </asp:Label>
                                   
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

                    <%--<asp:BoundField DataField="Tch_FName" HeaderText="ชื่ออาจารย์" 
                        ReadOnly="True" SortExpression="Tch_FName" />

                    <asp:BoundField DataField="Tch_LName" HeaderText="นามสกุลอาจารย์" 
                        SortExpression="Tch_LName" /> --%>


                    <asp:BoundField DataField="Tch_FNameEn" HeaderText="ชื่อภาษาอังกฤษ" 
                        SortExpression="Tch_FNameEn" />
                    <asp:BoundField DataField="Tch_LNameEn" HeaderText="นามสกุลภาษาอังกฤษ" 
                        SortExpression="Tch_LNameEn" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
              
              <p class="textright"> 
                  <asp:Button ID="btnConfirmTea" runat="server" Text="ตกลง" 
                      onclick="btnConfirmTea_Click" Visible="False" /></p>  

              
              
              </div>



                        &nbsp;</td>
              <td class="style23" style="background-color: #C0C0C0">
                        &nbsp;</td>
        </tr>
          <tr>
            <td class="style20" style="background-color: #C0C0C0">
                &nbsp;</td>
            <td class="style43" style="background-color: #C0C0C0" >
                ปีการศึกษา</td>
            <td class="style22" 
                          &nbsp;</td style="background-color: #C0C0C0">
                          <asp:TextBox ID="txtyearEdu" runat="server"></asp:TextBox>
              <td class="textright" style="background-color: #C0C0C0">
                        เทอม</td>
              <td class="style23" style="background-color: #C0C0C0">
                        <asp:DropDownList ID="ddlterm" runat="server" Height="24px" Width="94px">
                            <asp:ListItem Value="N">--เลือก--</asp:ListItem>
                            <asp:ListItem Value="1">เทอม 1 </asp:ListItem>
                            <asp:ListItem Value="2">เทอม 2</asp:ListItem>
                            <asp:ListItem Value="3">summer</asp:ListItem>
                        </asp:DropDownList>
              </td>
              <td class="style23" style="background-color: #C0C0C0">
                        &nbsp;</td>
        </tr>
          <tr>
            <td class="style20" style="background-color: #C0C0C0">
                &nbsp;</td>
            <td class="style43" style="background-color: #C0C0C0" >
                ชั้นปีที่สอน</td>
            <td class="style22" 
                          &nbsp;</td style="background-color: #C0C0C0">
                          <asp:TextBox ID="txtYearTeach" runat="server"></asp:TextBox>
              <td class="textright" style="background-color: #C0C0C0">
                กลุ่มที่สอน</td>
              <td class="style23" style="background-color: #C0C0C0">
                          <asp:TextBox ID="txtgroupteach" runat="server"></asp:TextBox>
              </td>
              <td class="style23" style="background-color: #C0C0C0">
                        &nbsp;</td>
        </tr>
          <tr>
            <td class="style20" style="background-color: #C0C0C0">
                &nbsp;</td>
            <td class="style21" style="background-color: #C0C0C0" >
                &nbsp;</td>
            <td class="style22" 
                          &nbsp;</td style="background-color: #C0C0C0">
                          &nbsp;<td class="style26" style="background-color: #C0C0C0">
       
                              &nbsp;</td>
              <td class="textright" style="background-color: #C0C0C0">
                        <asp:Button ID="txtsaveDetailTearch" runat="server" Height="26px" 
                            Text="บันทึก" onclick="txtsaveDetailTearch_Click" />
              </td>
              <td class="style23" style="background-color: #C0C0C0">
                        &nbsp;</td>
        </tr>
          <tr>
            <td class="style20">
                &nbsp;</td>
            <td colspan="4" >
                <p style="text-align:right">
       
                          &nbsp;</p><b>
                    <p style="text-align:left;">
                    <asp:Label ID="lblTeacher" runat="server" BorderStyle="None" 
                        Text="อาจารย์ผู้สอนรายวิชารายวิชานี้"></asp:Label></p>
                    </b>
                    <br />
                    <asp:GridView ID="gvSubjectShow" runat="server" 
                        AutoGenerateColumns="False" 
                        DataKeyNames="detailid" 
                        onrowcommand="gvSubjectShow_RowCommand" Width="100%" 
                    DataSourceID="SqlDataSourceTeacherTeach" 
                    CssClass="MyGridView_gvSubjectShow_updateDetailTeach">
                        <AlternatingRowStyle CssClass="MyGridView_gvSubjectShowAlt_updateDetailTeach" />
                        <Columns>

                               <asp:TemplateField HeaderText="จัดการห้องเรียน">
                                <ItemTemplate>
                                    <table border="0" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td align="center" style="height: 18px;">
                                                <asp:LinkButton ID="btnAdd" runat="server" AlternateText="จัดการห้องเรียน" 
                                                    CommandArgument='<%# Eval("detailid") %>' CommandName="AddResultGrade" 
                                                    ToolTip="จัดการห้องเรียน">จัดการห้องเรียน</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ลบข้อมูล">
                                <ItemTemplate>
                                    <table border="0" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td align="center" style="height: 18px;">
                                                <asp:LinkButton ID="btnDelete" runat="server" AlternateText="ลบข้อมูลผลการเรียน" 
                                                    CommandArgument='<%# Eval("detailid") %>' CommandName="delResuble" 
                                                    ToolTip="ลบข้อมูลผลการเรียน" 
                                                    onclientclick="return confirm('Are you sure?')">ลบข้อมูล</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="code" HeaderText="รหัสวิชา" />
                             <asp:BoundField DataField="level" HeaderText="ชั้นปี" />
                            <asp:BoundField DataField="term" HeaderText="เทอม" />
                            <asp:BoundField DataField="class" HeaderText="กลุ่ม" />
                            <asp:TemplateField HeaderText="ชื่ออาจารย์ผู้สอน">
                                <ItemTemplate>
                                    <table border="0" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td align="center" style="height: 18px;">
                                                <asp:Label ID="teacher" runat="server" AlternateText="ชื่ออาจารย์ผู้สอน" Text='<%# Eval("nameteach")%>' ></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                            </asp:TemplateField>


                        </Columns>
                        <HeaderStyle 
                            Height="30px" CssClass="GridViewHeader_updateDetailTeach" />
                        <RowStyle Height="20px" 
                            CssClass="MyGridView_gvSubjectShowRow_updateDetailTeach" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceTeacherTeach" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="  SELECT  ( DetailTech.DetailTech_ID) as detailid , (  ShowPlanEducate.StructSub_Code) as code, (DetailTech.DetailTech_Level) as level, (  DetailTech.DetailTech_Term) as term, ( DetailTech.DetailTech_Class) as class, (Teacher.Tch_FName  +'  '+ Teacher.Tch_LName) as nameteach
                        FROM         ShowPlanEducate INNER JOIN
                      DetailTech ON ShowPlanEducate.ShowPlan_Id = DetailTech.ShowPlan_Id INNER JOIN
                      Teacher ON DetailTech.Tch_ID = Teacher.Tch_ID WHERE (ShowPlanEducate.StructSub_Code = @StructSub_Code)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StructSub_Code" QueryStringField="subjectcode" 
                                Type="String" />
                        </SelectParameters>
                </asp:SqlDataSource>
                    <br />
                    <p style="text-align:right">
                              <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" Width="70px" 
                                     PostBackUrl="~/WebPage/BackYard/Admin/MainDetailTeach.aspx" />
                                     </p>
                    <br />
            
              </td>
             <td class="style23">    &nbsp;</td>
        </tr>
          <tr>
            <td  colspan="6" style="text-align:right;">
                              </div>
              
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
