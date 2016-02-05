<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAddDetailTeach1.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ucAddDetailTeach1" %>
<style type="text/css">

        .style3
        {
            width: 550px;
        }
        .auto-style26
{
    width: 468px;
    height: 25px;
}

.auto-style27
{
    width: 468px;
}

        .textbox_in_back
            {
                border: 1px solid #bfbfbf;
                padding-left: 3px;
      }

    

.button_in_admin
{
    border: 1px solid #bfbfbf;
    padding-right: 15px;
    padding-left: 15px;
    border-radius: 4px;
    padding-bottom: 3px;
    background-color: #dedede;
    background-image: url('../../../image/Back/Bg_Button_in_back.png');
    background-repeat: repeat-x;
    text-shadow: 0.1em 0.1em #fff;
    cursor: pointer;
}


.MyGridView_SearchSubject
{
    font-family: tahoma;
    font-size: 13px;
    color: #000000;
}


.GridViewHeader_SearchSubject
{
    font-family: tahoma;
    font-size: 14px;
    height: 35px;
    background-repeat: repeat-x;
    color: #FFFFFF;
    background-color: #333399;
}


.MyGridViewRow_SearchSubject
{
    background-color: #ADB8D3;
    height: 28px;
    text-align: center;
}

.MyGridViewAlt_SearchSubject
{
    background-color: #D7D7D7;
    height: 28px;
    text-align: center;
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
        
</style>

   <asp:UpdatePanel id="test" runat="server">
   <ContentTemplate>


   <div style="text-align: right;background-color: #999999;" > 
              <asp:ImageButton ID="imgproClose" runat="server" 
                  ImageUrl="~/image/close_button.png" AlternateText="ปิด" 
                  onclick="imgproClose_Click" />
               </div>


        <table style="width:100%; text-align:left; margin-right: 0px; height: 80%;" >
        

            <tr>
                <td class="style3" >ปีการศึกษา</td>
                <td >




                    <asp:Label ID="lblyear" runat="server" Text="0"></asp:Label>
                </td>

                
                <td>
                   เทอม</td>

                
                <td >
                <asp:Label ID="lblterm" runat="server" Text="0"></asp:Label>
                </td>

                
                <td>
                    &nbsp;</td>

                
            </tr>
            <tr>
                <td class="style3">
                    ชั้นปี </td>
                <td class="auto-style26">





                    <asp:Label ID="lbllevel" runat="server" Text="0"></asp:Label>
                </td>
                <td class="auto-style26">
                    &nbsp; ห้อง</td>
                <td class="auto-style26">

                    <asp:DropDownList ID="DropDownListClass" runat="server">
                        <asp:ListItem Value="N">--เลือก--</asp:ListItem>
                        <asp:ListItem Value="1">กลุ่ม 1 </asp:ListItem>
                        <asp:ListItem Value="2">กลุ่ม 2</asp:ListItem>
                        <asp:ListItem Value="3">กลุ่ม 3</asp:ListItem>
                        <asp:ListItem Value="4">กลุ่ม 4</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style26">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    รหัสวิชา</td>
                <td class="auto-style26">
                    <asp:Label ID="lblsubcode" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style26">
                    ชือวิชา</td>
                <td class="auto-style26">
                    <asp:Label ID="lblnameSubjec" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style26">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    อาจารย์ผู้สอน</td>
                <td class="auto-style27">
                <div style="width: 500px; height: 50px; padding-top: 15px;">
                 <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">ค้นหาจากชื่อเรื่อง </div>
                    <div style="float: left; width: 148px;"> 
                        <asp:TextBox ID="txtfullNameTeacher" 
                            runat="server" CssClass="textbox_in_back" Enabled="False" Width="154px"></asp:TextBox> </div>
                    <div style="width: 92px; float: left">  
                        <asp:ImageButton ID="imgbtnSeachTeacher" runat="server" 
                            ImageUrl="/image/Back/ButtonSearch.jpg" onclick="imgbtnSeachTeacher_Click" />
                        <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                       
                       
                       </div>
                  
                  
                </div>


                </td>
                <td class="auto-style27">
                    &nbsp;</td>
                <td class="auto-style27">
                    <asp:Button ID="btnSaveDetailTeach" runat="server" CssClass="button_in_admin" 
                        onclick="btnSaveDetailTeach_Click" Text="บันทึก" 
                        onclientclick="return confirm('ยืนยันการบันทึกรายละเอียดการสอนนี้');" />
                </td>
                <td class="auto-style27">
                    &nbsp;</td>
                <caption style=" font-weight: bold; margin-left: 14px;">
                    ค้นหารายชื่ออาจารย์<caption>
                            &nbsp;<tr>
                                <td colspan="5" style="text-align:right">
                                
                   <div id="showSearch" runat="server" visible="false" style="background-color: #CCCCFF">             
                  <table style="width:100%;">
                      <tr>
                          <td colspan="2" >
                              <b>ค้นหาอาจารย์ผู้สอน</b></td>
                          <td class="style34">
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
                          <asp:TextBox ID="txtNameTeacher" runat="server" AutoPostBack="True" 
                                  CssClass="textbox_in_back"></asp:TextBox>
       
                          </td>
                          <td class="textright">
                              สกุล</td>
                          <td class="style36">
                          <asp:TextBox ID="txtLnameTeacher" runat="server" Width="129px" AutoPostBack="True" 
                                  CssClass="textbox_in_back"></asp:TextBox>
       
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style38">
                              </td>
                          <td class="style39">
                ประเภทอาจารย์</td>
                          <td class="style40">
                          <asp:DropDownList ID="ddlTypeTeacher" runat="server" Height="29px" Width="133px" 
                                  CssClass="textbox_in_back">
                              <asp:ListItem Value="N">--เลือก--</asp:ListItem>
                              <asp:ListItem Value="TE">อาจารย์ประจำ</asp:ListItem>
                              <asp:ListItem Value="TS">อาจารย์พิเศษ</asp:ListItem>
                          </asp:DropDownList>
       
                          </td>
                          <td class="style41">
                              </td>
                          <td class="textright">
       
                          <asp:Button ID="btnok" runat="server" Text="ค้นหาข้อมูลอาจารย์" onclick="btnok_Click" 
                                  Height="31px" Width="168px" CssClass="button_in_admin" />
       
                              </td>
                          <td class="style41">
                              </td>
                      </tr>
                      <tr>
                          <td colspan="6">

<center>
    <asp:GridView ID="gvShowTeacher" runat="server" ShowFooter="True" AutoGenerateColumns="False"
        CellPadding="4"  Width="80%" Style="text-align: left" 
           DataKeyNames="Tch_ID" AllowPaging="True"  onrowcommand="gvShowTeacher_RowCommand" ForeColor="#333333" 
                    GridLines="None" PageSize="5">
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
            </center>
              
                          </td>
                      </tr>
                      <tr>
                          <td class="style38">
                              &nbsp;</td>
                          <td class="style39">
                              &nbsp;</td>
                          <td class="style40">
                              &nbsp;</td>
                          <td class="style41">
                              &nbsp;</td>
                          <td class="textright">
       
                              &nbsp;</td>
                          <td class="style41">
                              &nbsp;</td>
                      </tr>
                      </table>


                                
                                
                                </div>
                                
                                <tr>
                                        <td colspan="3">
                                        <div id="showTitle" runat="server">
                                            <strong>รายละเอียดที่มีการลงทะเบียน&nbsp;</strong></div><tr>
                                                <td colspan="4">
                                                    <span class="wrap">
                                                  
                                                  <center>
                                                    <asp:GridView ID="GridViewShowDetailTeach" runat="server" 
                                                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DetailTech_ID" 
                                                        DataSourceID="SqlDataSourceShowDetailTeach" ForeColor="#333333" 
                                                        GridLines="None" onrowcommand="GridView1_RowCommand" Width="80%">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="ดึงรายวิชา">
                                                                <ItemTemplate>
                                                                    <table border="0" cellpadding="1" cellspacing="1">
                                                                        <tr>
                                                                            <td align="center" style="height: 18px;">
                                                                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="ลบข้อมูลรายวิชา" 
                                                                                    CommandArgument='<%# Eval("DetailTech_ID") %>' CommandName="del" 
                                                                                    ToolTip="ลบข้อมูลรายวิชา">ลบข้อมูล</asp:LinkButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="DetailTeach_Year" HeaderText="ปีการศึกษา" 
                                                                SortExpression="DetailTeach_Year" />
                                                            <asp:BoundField DataField="DetailTech_Term" HeaderText="เทอม" 
                                                                SortExpression="DetailTech_Term" />
                                                            <asp:BoundField DataField="DetailTech_Level" HeaderText="ชั้นปี" 
                                                                SortExpression="DetailTech_Level" />
                                                            <asp:BoundField DataField="DetailTech_Class" HeaderText="กลุ่ม" 
                                                                SortExpression="DetailTech_Class" />
                                                            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสวิชา" 
                                                                SortExpression="StructSub_Code" />
                                                        </Columns>
                                                        <EditRowStyle BackColor="#7C6F57" />
                                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#E3EAEB" />
                                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                    </asp:GridView>

                                                      <asp:SqlDataSource ID="SqlDataSourceShowDetailTeach" runat="server" 
                                                          ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                                                          
                                                          SelectCommand="SELECT * FROM [DetailTech] WHERE (([DetailTeach_Year] = @DetailTeach_Year) AND ([DetailTech_Term] = @DetailTech_Term) AND ([DetailTech_Level] = @DetailTech_Level))">
                                                          <SelectParameters>
                                                              <asp:ControlParameter ControlID="lblyear" Name="DetailTeach_Year" 
                                                                  PropertyName="Text" Type="String" />
                                                              <asp:ControlParameter ControlID="lblterm" Name="DetailTech_Term" 
                                                                  PropertyName="Text" Type="Int32" />
                                                              <asp:ControlParameter ControlID="lbllevel" Name="DetailTech_Level" 
                                                                  PropertyName="Text" Type="Int32" />
                                                          </SelectParameters>
                                                      </asp:SqlDataSource>
                                                      <br />

                                                    </center>
                                                    </span>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </td>
                                    </tr>
                                </td>
                                </td>
                            </tr>
                        </caption>
                    </tr>
                </caption>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="auto-style27">
                        &nbsp;</td>
                    <td class="auto-style27">
                        <center>
                            &nbsp;&nbsp;</center>
                    </td>
                    <td style="text-align:right">
                                                                                                            <asp:Button ID="btnAddDetailTeach" runat="server" onclick="Button1_Click" 
                                                                                                                Text="ตกลง" CssClass="button_in_admin" />
                                                                                                        </td>
                    <td style="text-align:right">
                        &nbsp;</td>
                </tr>
            </tr>
            </tr >
        </table>
        
              </ContentTemplate>
          </asp:UpdatePanel>
          