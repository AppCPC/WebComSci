<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true"
    CodeBehind="AddDetailTeachNew.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddDetailTeachNew" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/WebPage/BackYard/Admin/ucAddDetailTeach1.ascx" TagName="PopupAddsubject"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style3
        {
            width: 550px;
        }
        .textbox_in_back
        {
            border: 1px solid #bfbfbf;
            padding-left: 3px;
        }
        
        .className
        {
            /*background: url('../image/Admin/book_open.png') no-repeat 0 0;
    border: 0;
    height: 61px;
    width: 60px;
    background-color: #C0C0C0;*/
            text-align: right;
            background-position: left top;
            border: 1px solid #bfbfbf;
            padding-right: 30px;
            padding-left: 10px;
            border-radius: 4px;
            padding-bottom: 5px;
            background-color: #dedede;
            background-image: url('../image/Admin/book_open.png');
            background-repeat: no-repeat;
            text-shadow: 0.1em 0.1em #fff;
            cursor: pointer;
            width: 100px;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
    <p style="text-align: left;">
        &nbsp;<strong>เพิ่มข้อมูลรายละเอียดวิชาที่เปิดสอน
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </strong>
    </p>
    <p style="text-align: right;">
      
      
                     <asp:Button ID="btnSwap" runat="server" CssClass="textbox_in_back" 
                         onclick="btnSwap_Click" Text="จัดการรายวิชา &gt;&gt;" />
                 </p>
    <div>
        <fieldset style="width: 70%">
            <legend>ชั้นปีที่ 1 </legend>
            <table style="width: 100%;">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="wrap" __designer:mapid="208">
                            <asp:GridView ID="dgVdetailDetailTeach1" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="subcode" ForeColor="#333333" 
                            GridLines="None" Width="100%" 
                            onpageindexchanging="dgVdetailDetailTeach1_PageIndexChanging">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="no" HeaderText="ลำดับที่" />
                                    <asp:BoundField DataField="subcode" HeaderText="รหัสวิชา" />
                                    <asp:BoundField DataField="subThai" HeaderText="ชือวิชา" />
                                    <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" />
                                    <asp:TemplateField HeaderText="ดึงรายวิชา">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">
                                                        <asp:Button ID="btnConfirmOpenSubjec" runat="server" CommandArgument='<%# Eval("subcode") + ","+Eval("subThai") %>'
                                                            Text="  ยืนยันเปิดสอน" CssClass="className" Height="36px" OnClick="btnConfirmOpenSubjec_Click"
                                                            Width="162px" />

                                                       <%--   <br />
                                                        <asp:Button ID="btnSwap1" runat="server" 
                                                            CommandArgument='<%# Eval("subcode") + ","+Eval("subThai")+ ","+Eval("curi") %>' 
                                                            CssClass="className" Height="36px" OnClick="btnSwap1_Click" Text="สลับรายวิชา" 
                                                            Width="162px" />--%>
                                                       

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>
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
                        </span>
                      
                        <div style="text-align:right;">


                     <asp:Button ID="btnchotsub1" runat="server" CssClass="textbox_in_back" 
                         onclick="btnchotsub1_Click" Text="เลือกรายวิชาเอง" />

                           <br />
                        <br />
                         </div>

                         <fieldset style="width: 80%">


                         

            <legend> รายละเอียดวิชาที่เปิดสำหรับนักศึกษาปี 1 .....</legend><br />

                                                <asp:GridView ID="gvShowSubject1" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="code" 
                                                    ForeColor="Black" GridLines="Vertical"
                                                    PageSize="5" Style="text-align: left" Width="90%" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                            DataSourceID="SqlDataSourceShowdtch1">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                   
                                                     
                                                        <asp:BoundField DataField="y" HeaderText="ปี" />
                                                        <asp:BoundField DataField="le" HeaderText="ชั้นปี"  />
                                                         <asp:BoundField DataField="term" HeaderText="เทอม"  />

                                                        <asp:BoundField DataField="code" HeaderText="ชื่อวิชา" />
                                                        <asp:BoundField DataField="nameTha" HeaderText="หน่วยกิต"  />
                                                            

                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCC99" />
                                                    <RowStyle BackColor="#F7F7DE" />
                                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                                </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceShowdtch1" 
                            runat="server" 
                            ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                            SelectCommand="SELECT  distinct  ( DetailTech.DetailTeach_Year) as y, ( DetailTech.DetailTech_Level) as le, (DetailTech.DetailTech_Term) as term,  ( DetailTech.StructSub_Code) as code,( StructSubject.StructSub_NameTha) as nameTha            
                                FROM         DetailTech INNER JOIN  StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
                                           where DetailTech.DetailTeach_Status='A' and DetailTech_Level='1' "></asp:SqlDataSource>
&nbsp;<br />
</fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%-- Style="display: none; width: 60%;--%>


                        <asp:HiddenField ID="HiddenTargetShow" runat="server" />
                        <asp:Panel ID="pnl" CssClass="modalpopup" runat="server" Style= " width: 60%;"><%-- Style="display: none; width: 60%;--%>
                            <%--<uc1:PopupAddsubject ID="popupDetailTeach" runat="server" />--%>
                            <asp:UpdatePanel ID="test" runat="server">
                                <ContentTemplate>
                                    <div style="text-align: right; background-color: #999999;">
                                        <asp:ImageButton ID="imgproClose" runat="server" ImageUrl="~/image/close_button.png"
                                            AlternateText="ปิด" OnClick="imgproClose_Click"/>
                                    </div>
                                    <table style="width: 100%; text-align: left; margin-right: 0px; height: 80%;">
                                        <tr>
                                            <td class="style3">
                                                ปีการศึกษา
                                            </td>
                                            <td>
                                                <asp:Label ID="lblyear" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                เทอม
                                            </td>
                                            <td>
                                                <asp:Label ID="lblterm" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                ชั้นปี
                                            </td>
                                            <td class="auto-style26">
                                                <asp:Label ID="lbllevel" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td class="auto-style26">
                                                &nbsp; ห้อง
                                            </td>
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
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                รหัสวิชา
                                            </td>
                                            <td class="auto-style26">

                                            <div id="lblsubject">
                                                <asp:Label ID="lblsubcode" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;ชื่อวิชา :&nbsp;<asp:Label ID="lblnameSubjec" runat="server" Text="Label"></asp:Label>
                                           </div>

                                              <div id="lblSearchsubject" runat="server" visible="false" style="width: 500px; height: 50px; padding-top: 15px;">
                                                    <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">
                                                        ค้นหารายวิชา
                                                    </div>
                                                    <div style="float: left; width: 148px;">
                                                        <asp:TextBox ID="txtcodeSub" runat="server" CssClass="textbox_in_back" Enabled="False"
                                                            Width="154px"></asp:TextBox>
                                                    </div>
                                                    <div style="width: 92px; float: left">
                                                        <asp:ImageButton ID="imgbtnsearchSubject" runat="server" 
                                                            ImageUrl="/image/Back/ButtonSearch.jpg" OnClick="imgbtnsearchSubject_Click"
                                                            />
                                                    </div>
                                                </div>

                                               
                                                <br />
                                               
                                            </td>
                                            <td class="auto-style26">
                                          
                                            </td>
                                            <td class="auto-style26">
                                                
                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;
                                            </td>
                                        </tr>

                                        <tr>
                                        <td colspan="5">

                                        <div id="showSearchSubject" runat="server" visible="false">
                                            <table style="width: 100%;background-color: #CCCCFF">
                                                <tr>
                                                    <td>
                                                     ค้นหาจากปีที่ปรับปรุง
                                                    </td>
                                                    <td>
                                                       <asp:DropDownList ID="ddlYear"    runat="server" DataSourceID="SqlDataSourceYearEdu" 
                                                            DataTextField="Curri_Year" DataValueField="Curri_Year" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSourceYearEdu" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                                                            SelectCommand="SELECT DISTINCT [Curri_Year] FROM [Curriculum]"></asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                   ค้นหาจากรหัสวิชา
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtsubcode" runat="server"></asp:TextBox>

                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        ค้นหาจากชือวิชา
                                                    </td>
                                                    <td>
                                                         <asp:TextBox ID="txtnameThai" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                       <asp:Button ID="btnSearchSubject" runat="server" Text="ค้นหา"
                                                                                Height="31px" Width="168px" CssClass="button_in_admin" 
                                                            onclick="btnSearchSubject_Click" />
                                                    </td>
                                                </tr>
                                            </table>

                                            <center>
                                         <asp:GridView ID="gvShowSubject" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="StructSub_Code" 
                                                    ForeColor="#333333" GridLines="None"
                                                    PageSize="5" ShowFooter="True" Style="text-align: left" Width="80%" 
                                                onpageindexchanging="gvShowSubject_PageIndexChanging" 
                                                onrowcommand="gvShowSubject_RowCommand">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="ดึงข้อมูล">
                                                            <ItemTemplate>
                                                                <table border="0" cellpadding="1" cellspacing="1">
                                                                    <tr>
                                                                        <td align="center" style="height: 18px;">
                                                                            <asp:LinkButton ID="btnGetTeacher0" runat="server" 
                                                                                AlternateText="ดึงข้อมูลอาจารย์ที่ท่านต้องการ" 
                                                                                CommandArgument='<%# Eval("StructSub_Code") %>' CommandName="getSubject" 
                                                                                ToolTip="subjectGet">ดึงข้อมูล</asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                     
                                                      <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสวิชา" />
                                                        <asp:BoundField DataField="StructSub_NameTha" HeaderText="ชื่อวิชา" />
                                                        <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต"  />
                                                            

                                                    </Columns>
                                                    <EditRowStyle BackColor="#7C6F57" />
                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
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
                                                </div>

                                                </td>
                                        </tr>


                                        <tr>
                                            <td class="style3">
                                                อาจารย์ผู้สอน
                                            </td>
                                            <td class="auto-style27">
                                                <div style="width: 500px; height: 50px; padding-top: 15px;">
                                                    <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">
                                                        ค้นหาอาจารย์
                                                    </div>
                                                    <div style="float: left; width: 148px;">
                                                        <asp:TextBox ID="txtfullNameTeacher" runat="server" CssClass="textbox_in_back" Enabled="False"
                                                            Width="154px"></asp:TextBox>
                                                    </div>
                                                    <div style="width: 92px; float: left">
                                                        <asp:ImageButton ID="imgbtnSeachTeacher" runat="server" ImageUrl="/image/Back/ButtonSearch.jpg" OnClick="imgbtnSeachTeacher_Click"
                                                            />
                                                        <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="auto-style27">
                                                &nbsp;
                                            </td>
                                            <td class="auto-style27">
                                                <asp:Button ID="btnSaveDetailTeach" runat="server" CssClass="button_in_admin" OnClick="btnSaveDetailTeach_Click"
                                                    Text="บันทึก" OnClientClick="return confirm('ยืนยันการบันทึกรายละเอียดการสอนนี้');" />
                                            </td>
                                            <td class="auto-style27">
                                                &nbsp;
                                            </td>
                                            <caption style="font-weight: bold; margin-left: 14px;">
                                                <caption>
                                                    &nbsp;<tr>
                                                        <td colspan="5" style="text-align: right">
                                                            <div id="showSearch" runat="server" visible="false" style="background-color: #CCCCFF">
                                                                <table style="width: 100%;">
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <b>ค้นหาอาจารย์ผู้สอน</b>
                                                                        </td>
                                                                        <td class="style34">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td class="style35">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style32">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td class="style33">
                                                                            ชืออาจารย์
                                                                        </td>
                                                                        <td class="style34">
                                                                            <asp:TextBox ID="txtNameTeacher" runat="server" AutoPostBack="True" CssClass="textbox_in_back"></asp:TextBox>
                                                                        </td>
                                                                        <td class="textright">
                                                                            สกุล
                                                                        </td>
                                                                        <td class="style36">
                                                                            <asp:TextBox ID="txtLnameTeacher" runat="server" Width="129px" AutoPostBack="True"
                                                                                CssClass="textbox_in_back"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style38">
                                                                        </td>
                                                                        <td class="style39">
                                                                            ประเภทอาจารย์
                                                                        </td>
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
                                                                            <asp:Button ID="btnok" runat="server" Text="ค้นหาข้อมูลอาจารย์" OnClick="btnok_Click"
                                                                                Height="31px" Width="168px" CssClass="button_in_admin" />
                                                                        </td>
                                                                        <td class="style41">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6">
                                                                            <center>
                                                                                <asp:GridView ID="gvShowTeacher" runat="server" ShowFooter="True" AutoGenerateColumns="False"
                                                                                    CellPadding="4" Width="80%" Style="text-align: left" DataKeyNames="Tch_ID" AllowPaging="True"
                                                                                    OnRowCommand="gvShowTeacher_RowCommand" ForeColor="#333333" GridLines="None"
                                                                                    PageSize="5">
                                                                                    <AlternatingRowStyle BackColor="White" />
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="ดึงข้อมูลอาจารย์">
                                                                                            <ItemTemplate>
                                                                                                <table border="0" cellpadding="1" cellspacing="1">
                                                                                                    <tr>
                                                                                                        <td align="center" style="height: 18px;">
                                                                                                            <asp:LinkButton ID="btnGetTeacher" runat="server" AlternateText="ดึงข้อมูลอาจารย์ที่ท่านต้องการ"
                                                                                                                CommandArgument='<%# Eval("Tch_ID") %>' CommandName="getTeacher" ToolTip="subjectGet">ดึงข้อมูล</asp:LinkButton>
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
                                                                                                            <asp:Label ID="lblnameteach" runat="server" AlternateText="ชื่ออาจารย์" Text='<%# Eval("Tch_FName") %>'> </asp:Label>
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
                                                                                                            <asp:Label ID="lbllnameTeach" runat="server" AlternateText="นามสกุลอาจารย์" Text='<%# Eval("Tch_LName") %>'> </asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                            <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                          <asp:BoundField DataField="Tch_FNameEn" HeaderText="ชื่อภาษาอังกฤษ" SortExpression="Tch_FNameEn" />
                                                                                        <asp:BoundField DataField="Tch_LNameEn" HeaderText="นามสกุลภาษาอังกฤษ" SortExpression="Tch_LNameEn" />
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
                                                                            &nbsp;
                                                                        </td>
                                                                        <td class="style39">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td class="style40">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td class="style41">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td class="textright">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td class="style41">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <div id="showTitle" runat="server">
                                                                        <strong>รายละเอียดที่มีการลงทะเบียน&nbsp;</strong></div>
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            <span class="wrap">
                                                                                <center>
                                                                                    <asp:GridView ID="GridViewShowDetailTeach" runat="server" AutoGenerateColumns="False"
                                                                                        CellPadding="4" DataKeyNames="DetailTech_ID" DataSourceID="SqlDataSourceShowDetailTeach"
                                                                                        ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" Width="80%">
                                                                                        <AlternatingRowStyle BackColor="White" />
                                                                                        <Columns>
                                                                                            <asp:TemplateField HeaderText="ดึงรายวิชา">
                                                                                                <ItemTemplate>
                                                                                                    <table border="0" cellpadding="1" cellspacing="1">
                                                                                                        <tr>
                                                                                                            <td align="center" style="height: 18px;">
                                                                                                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="ลบข้อมูลรายวิชา" CommandArgument='<%# Eval("DetailTech_ID") %>'
                                                                                                                    CommandName="del" ToolTip="ลบข้อมูลรายวิชา">ลบข้อมูล</asp:LinkButton>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField DataField="DetailTeach_Year" HeaderText="ปีการศึกษา" SortExpression="DetailTeach_Year" />
                                                                                            <asp:BoundField DataField="DetailTech_Term" HeaderText="เทอม" SortExpression="DetailTech_Term" />
                                                                                            <asp:BoundField DataField="DetailTech_Level" HeaderText="ชั้นปี" SortExpression="DetailTech_Level" />
                                                                                            <asp:BoundField DataField="DetailTech_Class" HeaderText="กลุ่ม" SortExpression="DetailTech_Class" />
                                                                                            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสวิชา" SortExpression="StructSub_Code" />
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
                                                                                    <asp:SqlDataSource ID="SqlDataSourceShowDetailTeach" runat="server" ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>"
                                                                                        SelectCommand="SELECT * FROM [DetailTech] WHERE (([DetailTeach_Year] = @DetailTeach_Year) AND ([DetailTech_Term] = @DetailTech_Term) AND ([DetailTech_Level] = @DetailTech_Level))">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="lblyear" Name="DetailTeach_Year" PropertyName="Text"
                                                                                                Type="String" />
                                                                                            <asp:ControlParameter ControlID="lblterm" Name="DetailTech_Term" PropertyName="Text"
                                                                                                Type="Int32" />
                                                                                            <asp:ControlParameter ControlID="lbllevel" Name="DetailTech_Level" PropertyName="Text"
                                                                                                Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>
                                                                                    <br />
                                                                                </center>
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
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
                                                &nbsp;
                                            </td>
                                            <td class="auto-style27">
                                                &nbsp;
                                            </td>
                                            <td class="auto-style27">
                                                <center>
                                                    &nbsp;&nbsp;</center>
                                            </td>
                                            <td style="text-align: right">
                                                <asp:Button ID="btnAddDetailTeach" runat="server" Text="ตกลง"
                                                    CssClass="button_in_admin" onclick="btnAddDetailTeach_Click" />
                                            </td>
                                            <td style="text-align: right">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        </tr> </tr >
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" TargetControlID="HiddenTargetShow" PopupControlID="pnl" BackgroundCssClass="modalbackground">
                        </ajaxToolkit:ModalPopupExtender>


             <%--display: none;--%>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
                                                                                <asp:GridView ID="GridView1" runat="server" ShowFooter="True" 
        AutoGenerateColumns="False"
                                                                                    
        CellPadding="4" Width="80%" Style="text-align: left" DataKeyNames="Tch_ID" 
        AllowPaging="True"
                                                                                    
        OnRowCommand="gvShowTeacher_RowCommand" ForeColor="#333333" 
        GridLines="None"
                                                                                    
        PageSize="5">
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
                                                                                                            <asp:Label ID="lblnameteach" runat="server" AlternateText="ชื่ออาจารย์" 
                                                                                                                Text='<%# Eval("Tch_FName") %>'> </asp:Label>
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
                                                                                                            <asp:Label ID="lbllnameTeach" runat="server" AlternateText="นามสกุลอาจารย์" 
                                                                                                                Text='<%# Eval("Tch_LName") %>'> </asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                            <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
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
    <br />
    <br />
    <div>
        <fieldset style="width: 70%">
            <legend>ชั้นปีที่ 2 </legend>
            <table style="width: 100%;">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="wrap" __designer:mapid="208">
                            <asp:GridView ID="dgVdetailDetailTeach2" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="subcode" ForeColor="#333333" 
                            GridLines="None" Width="100%" 
                            onpageindexchanging="dgVdetailDetailTeach2_PageIndexChanging">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="no" HeaderText="ลำดับที่" />
                                    <asp:BoundField DataField="subcode" HeaderText="รหัสวิชา" />
                                    <asp:BoundField DataField="subThai" HeaderText="ชือวิชา" />
                                    <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" />
                                    <asp:TemplateField HeaderText="ดึงรายวิชา">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">
                                                        <asp:Button ID="btnConfirmOpenSubjec2" runat="server" CommandArgument='<%# Eval("subcode") + ","+Eval("subThai") %>'
                                                            Text="  ยืนยันเปิดสอน" CssClass="className" Height="36px" OnClick="btnConfirmOpenSubjec2_Click"
                                                            Width="162px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>
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
                        </span>
                        <br />

                        <div style="text-align:right;">


                     <asp:Button ID="Button4" runat="server" CssClass="textbox_in_back" 
                          Text="เลือกรายวิชาเอง" onclick="btnchotsub2_Click" />

                           <br />
                        <br />
                         </div>


            <fieldset style="width: 80%">
            <legend> รายละเอียดวิชาที่เปิดสำหรับนักศึกษาปี 2.....</legend><br />

                                                                     <asp:GridView ID="gvShowSubject2" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="code" 
                                                    ForeColor="Black" GridLines="Vertical"
                                                    PageSize="5" Style="text-align: left" Width="90%" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                            DataSourceID="SqlDataSourceShowdtch2">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                  
                                                     
                                                        <asp:BoundField DataField="y" HeaderText="ปี" />
                                                        <asp:BoundField DataField="le" HeaderText="ชั้นปี"  />
                                                         <asp:BoundField DataField="term" HeaderText="เทอม"  />

                                                        <asp:BoundField DataField="code" HeaderText="ชื่อวิชา" />
                                                        <asp:BoundField DataField="nameTha" HeaderText="หน่วยกิต"  />
                                                            

                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCC99" />
                                                    <RowStyle BackColor="#F7F7DE" />
                                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                                </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceShowdtch2" 
                            runat="server" 
                            ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                            SelectCommand="SELECT  distinct  ( DetailTech.DetailTeach_Year) as y, ( DetailTech.DetailTech_Level) as le, (DetailTech.DetailTech_Term) as term,  ( DetailTech.StructSub_Code) as code,( StructSubject.StructSub_NameTha) as nameTha            
                                FROM         DetailTech INNER JOIN  StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
                                           where DetailTech.DetailTeach_Status='A' and DetailTech_Level='2' "></asp:SqlDataSource>

                  </fieldset>
                    </td>

                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <br />
    <br />
    <div>
        <fieldset style="width: 70%">
            <legend>ชั้นปีที่ 3 </legend>
            <table style="width: 100%;">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="wrap" __designer:mapid="208">
                            <asp:GridView ID="dgVdetailDetailTeach3" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="subcode" ForeColor="#333333" 
                            GridLines="None" Width="100%" 
                            onpageindexchanging="dgVdetailDetailTeach3_PageIndexChanging">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="no" HeaderText="ลำดับที่" />
                                    <asp:BoundField DataField="subcode" HeaderText="รหัสวิชา" />
                                    <asp:BoundField DataField="subThai" HeaderText="ชือวิชา" />
                                    <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" />
                                    <asp:TemplateField HeaderText="ดึงรายวิชา">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">
                                                        <asp:Button ID="btnConfirmOpenSubjec3" runat="server" CommandArgument='<%# Eval("subcode") + ","+Eval("subThai") %>'
                                                            Text="  ยืนยันเปิดสอน" CssClass="className" Height="36px" OnClick="btnConfirmOpenSubjec3_Click"
                                                            Width="162px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>
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
                        </span>
                        <br />

                        <div style="text-align:right;">


                     <asp:Button ID="Button5" runat="server" CssClass="textbox_in_back" 
                         onclick="btnchotsub3_Click" Text="เลือกรายวิชาเอง" />

                           <br />
                        <br />
                         </div>


               <fieldset style="width: 80%">
            <legend> รายละเอียดวิชาที่เปิดสำหรับนักศึกษาปี 3 .....</legend><br />

                                                                      <asp:GridView ID="gvShowSubject3" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="code" 
                                                    ForeColor="Black" GridLines="Vertical"
                                                    PageSize="5" Style="text-align: left" Width="90%" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                            DataSourceID="SqlDataSourceShowdtch3">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                     
                                                        <asp:BoundField DataField="y" HeaderText="ปี" />
                                                        <asp:BoundField DataField="le" HeaderText="ชั้นปี"  />
                                                         <asp:BoundField DataField="term" HeaderText="เทอม"  />

                                                        <asp:BoundField DataField="code" HeaderText="ชื่อวิชา" />
                                                        <asp:BoundField DataField="nameTha" HeaderText="หน่วยกิต"  />
                                                            

                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCC99" />
                                                    <RowStyle BackColor="#F7F7DE" />
                                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                                </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceShowdtch3" 
                            runat="server" 
                            ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                            SelectCommand="SELECT  distinct  ( DetailTech.DetailTeach_Year) as y, ( DetailTech.DetailTech_Level) as le, (DetailTech.DetailTech_Term) as term,  ( DetailTech.StructSub_Code) as code,( StructSubject.StructSub_NameTha) as nameTha            
                                FROM         DetailTech INNER JOIN  StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
                                           where DetailTech.DetailTeach_Status='A' and DetailTech_Level='3' "></asp:SqlDataSource>

</fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <br />
    <br />
    <div>
        <fieldset style="width: 70%">
            <legend>ชั้นปีที่ 4 </legend>
            <table style="width: 100%;">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="wrap" __designer:mapid="208">
                            <asp:GridView ID="dgVdetailDetailTeach4" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="subcode" ForeColor="#333333" 
                            GridLines="None" Width="100%" 
                            onpageindexchanging="dgVdetailDetailTeach4_PageIndexChanging">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="no" HeaderText="ลำดับที่" />
                                    <asp:BoundField DataField="subcode" HeaderText="รหัสวิชา" />
                                    <asp:BoundField DataField="subThai" HeaderText="ชือวิชา" />
                                    <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" />
                                    <asp:TemplateField HeaderText="ดึงรายวิชา">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">
                                                        <asp:Button ID="btnConfirmOpenSubjec4" runat="server" CommandArgument='<%# Eval("subcode") + ","+Eval("subThai") %>'
                                                            Text="  ยืนยันเปิดสอน" CssClass="className" Height="36px" OnClick="btnConfirmOpenSubjec4_Click"
                                                            Width="162px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>
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
                        </span>
                        <br />

                         <div style="text-align:right;">


                     <asp:Button ID="Button6" runat="server" CssClass="textbox_in_back" 
                         onclick="btnchotsub4_Click" Text="เลือกรายวิชาเอง" />

                           <br />
                        <br />
                         </div>


                                               <fieldset style="width: 80%">
            <legend> รายละเอียดวิชาที่เปิดสำหรับนักศึกษาปี 4 .....</legend><br />

                                                                      <asp:GridView ID="gvShowSubject4" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="code" 
                                                    ForeColor="Black" GridLines="Vertical"
                                                    PageSize="5" Style="text-align: left" Width="100%" 
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                            DataSourceID="SqlDataSourceShowdtch4">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                     
                                                     
                                                        <asp:BoundField DataField="y" HeaderText="ปี" />
                                                        <asp:BoundField DataField="le" HeaderText="ชั้นปี"  />
                                                         <asp:BoundField DataField="term" HeaderText="เทอม"  />

                                                        <asp:BoundField DataField="code" HeaderText="ชื่อวิชา" />
                                                        <asp:BoundField DataField="nameTha" HeaderText="หน่วยกิต"  />
                                                            

                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCC99" />
                                                    <RowStyle BackColor="#F7F7DE" />
                                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                                </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceShowdtch4" 
                            runat="server" 
                            ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                            SelectCommand="SELECT  distinct  ( DetailTech.DetailTeach_Year) as y, ( DetailTech.DetailTech_Level) as le, (DetailTech.DetailTech_Term) as term,  ( DetailTech.StructSub_Code) as code,( StructSubject.StructSub_NameTha) as nameTha            
                                FROM         DetailTech INNER JOIN  StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
                                           where DetailTech.DetailTeach_Status='A' and DetailTech_Level='4' "></asp:SqlDataSource>
                    
                    </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <br />
    <div>
        <fieldset style="width: 70%">
            <table style="width: 100%;">
                <tr>
                    <td>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
   

  <%--display: none;--%>

                          <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:Panel ID="Panel1" CssClass="modalpopup" runat="server" Style=" width: 60%;"><%--display: none;--%>
                            <%--<uc1:PopupAddsubject ID="popupDetailTeach" runat="server" />--%>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div style="text-align: right; background-color: #999999;">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/close_button.png"
                                            AlternateText="ปิด" OnClick="imgproClose_Click"/>
                                    </div>
                                    &nbsp;<table style="width: 100%; text-align: left; margin-right: 0px; height: 80%;">
                                        <tr>
                                            <td class="style3">
                                                รหัสวิชา
                                            </td>
                                            <td class="auto-style26">
                                               
                                                  <div style="width: 500px; height: 50px; padding-top: 15px;">
                                                    <div style="width: 382px; float: left">
                                                        <asp:Label ID="Labelcode" runat="server"></asp:Label>
                                                        <asp:Label ID="lblNameThai" runat="server"></asp:Label>
                                                        <asp:Label ID="lblcurri" runat="server"></asp:Label>
                                                    </div>
                                                </div>

                                            </td>
                                            <td class="auto-style26">
                                               
                                            </td>
                                            <td class="auto-style26">
                                                
                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;
                                            </td>
                                        </tr>


                                        <tr>
                                            <td colspan="4">
                                                <div ID="Div2" runat="server">
                                                    <asp:GridView ID="gvShowSubjectSwap" runat="server" AllowPaging="True" 
                                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                                                        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="code" 
                                                        ForeColor="Black" GridLines="Vertical" 
                                                        PageSize="5" Style="text-align: left" Width="100%" 
                                                        onpageindexchanging="gvShowSubjectSwap_PageIndexChanging">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                           <asp:TemplateField HeaderText="สลับรายวิชา">
                                                            <ItemTemplate>
                                                                <table border="0" cellpadding="1" cellspacing="1">
                                                                    <tr>
                                                                        <td align="center" style="height: 18px;">
                                                                            <asp:LinkButton ID="lbtnSwap" runat="server" onclick="lbtnSwap_Click" CommandArgument='<%# Eval("code") %>' > สลับรายวิชา</asp:LinkButton> <%--CommandArgument='<%# Eval("subcode") + ","+Eval("subThai") %>'--%>

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />

                                                        </asp:TemplateField>
                                                          <asp:BoundField DataField="code" HeaderText="รหัสวิชา" />
                                                            <asp:BoundField DataField="nameTha" HeaderText="ชื่อรายวิชา" />
                                                            <asp:BoundField DataField="credit" HeaderText="หน่วยกิต" />

                                                      <%--      <asp:BoundField DataField="y" HeaderText="ปี" />
                                                            <asp:BoundField DataField="le" HeaderText="ชั้นปี" />
                                                            <asp:BoundField DataField="term" HeaderText="เทอม" />
                                                            <asp:BoundField DataField="code" HeaderText="ชื่อวิชา" />
                                                            <asp:BoundField DataField="nameTha" HeaderText="หน่วยกิต" />--%>
                                                        </Columns>
                                                        <FooterStyle BackColor="#CCCC99" />
                                                        <RowStyle BackColor="#F7F7DE" />
                                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                        <SortedAscendingHeaderStyle BackColor="#848384" />
                                                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                        <SortedDescendingHeaderStyle BackColor="#575357" />
                                                    </asp:GridView>
                                                </div>
                                                <tr>
                                                    <td colspan="4">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
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
                                                &nbsp;
                                            </td>
                                            <td class="auto-style27">
                                                &nbsp;
                                            </td>
                                            <td class="auto-style27">
                                                <center>
                                                    &nbsp;&nbsp;</center>
                                            </td>
                                            <td style="text-align: right">
                                                &nbsp;</td>
                                            <td style="text-align: right">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        </tr> </tr >
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" DynamicServicePath=""
                            Enabled="True" TargetControlID="HiddenTargetShow" PopupControlID="Panel1" BackgroundCssClass="modalbackground">
                        </ajaxToolkit:ModalPopupExtender>



<%--      <asp:BoundField DataField="y" HeaderText="ปี" />
                                                            <asp:BoundField DataField="le" HeaderText="ชั้นปี" />
                                                            <asp:BoundField DataField="term" HeaderText="เทอม" />
                                                            <asp:BoundField DataField="code" HeaderText="ชื่อวิชา" />
                                                            <asp:BoundField DataField="nameTha" HeaderText="หน่วยกิต" />--%>
</asp:Content>
