<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddListStudent.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddListStudent" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxtoolkit" %>
<%@ Register src="ucManageUserStudent.ascx" tagname="popupstudent" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        .style12
        {
            width: 359px;
        }
        .style13
        {
            width: 14px;
        }
        .textleft
        {
            text-align:left;
        }
        .textright
        {
           text-align:right;    
        }
        .style14
        {
            width: 33px;
        }
        .style15
        {
            width: 99px;
        }
    </style>
   
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2" class="textleft">
                <strong>&nbsp;&nbsp; เพิ่มรายชื่อนักศึกษาในห้องเรียน</strong></td>
            <td class="style15">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style14">
                    &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="textright">
                รหัสผู้ใช้ &nbsp;</td>
            <td class="style15">
                <asp:TextBox ID="txtstdCode" runat="server"></asp:TextBox>
            </td>
            <td class="style4">
                    &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="textright">
                ชื่อ &nbsp;</td>
            <td class="style15">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td class="textright">
                    นามสกุล&nbsp;&nbsp;&nbsp;</td>
            <td class="style14">
                <asp:TextBox ID="txtLname" runat="server" Width="135px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style4">
                    &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="textright">
                <span class="wrap">
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="ค้นหา" ValidationGroup="valid" Width="80px" />
                </span></td>
        </tr>
    </table>
    <span class="wrap">
    <asp:GridView ID="gvList" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Std_Campus_Code" 
        Width="90%" onpageindexchanging="gvListStd_PageIndexChanging" 
        onrowcommand="gvList_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ดึงข้อมูล">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="ดึงข้อมูล" 
                                    CommandArgument='<%# Eval("Std_Campus_Code") %>' CommandName="stdGet" 
                                    ToolTip="ดึงข้อมูล">ดึงข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:BoundField HeaderText="รหัสนักศึกษา" DataField="Std_Campus_Code">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="ชื่อนักศึกษา" DataField="Std_FName">
            </asp:BoundField>
            <asp:BoundField DataField="Std_LName" HeaderText="ชื่อสกุล">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Std_YearEducate" HeaderText="ปีที่เข้าศึกษา" />
            <asp:BoundField DataField="Std_Group" HeaderText="กลุ่ม" />
        </Columns>
        <HeaderStyle BackColor="White" Height="30px" />
        <PagerStyle BackColor="White" />
        <RowStyle Height="20px" />
    </asp:GridView>

           <asp:HiddenField ID="HiddenTargetShow" runat="server" />

           <table style="width:100%;">
               <tr>
                   <td colspan="2" class="textleft">
                       <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; รายชื่อนักศึกษาในห้องเรียน</strong></td>
                   <td>
                       &nbsp;</td>
                   <td class="style12">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style13">
                       &nbsp;</td>
                   <td colspan="3">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               </table>
    <asp:GridView ID="gvListStudentInclass" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Std_Campus_Code" 
        onrowcommand="gvListStudentInclass_RowCommand" Width="90%" CellPadding="4" 
        DataSourceID="SqlDataSourceStudentInclass" ForeColor="#333333" GridLines="None" 
        PageSize="20">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ลบข้อมูล">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btndel" runat="server" AlternateText="ลบข้อมูล" 
                                    CommandArgument='<%# Eval("Std_Campus_Code") %>' CommandName="stddel" 
                                    ToolTip="ลบข้อมูล">ลบ</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="Std_Campus_Code" HeaderText="รหัสนักศึกษา">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Std_FName" HeaderText="ชื่อนักศึกษา" />
            <asp:BoundField DataField="Std_LName" HeaderText="ชื่อสกุล">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Std_YearEducate" HeaderText="ปีที่เข้าศึกษา" />
            <asp:BoundField DataField="Std_Group" HeaderText="กลุ่ม" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Height="30px" Font-Bold="True" 
            ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle Height="20px" BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceStudentInclass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
        SelectCommand="SELECT     EnrollIn.Enroll_ID, EnrollIn.DetailTech_ID, EnrollIn.Std_Campus_Code, Student.Std_FName, Student.Std_LName, Student.Std_FNameEn, Student.Std_Nickname, 
                      Student.Std_LNameEn, Student.Std_Campus_Code, Student.Std_YearEducate, Student.Std_Group
                      FROM  Student INNER JOIN
                      EnrollIn ON Student.Std_Campus_Code = EnrollIn.Std_Campus_Code WHERE ([DetailTech_ID] = @DetailTech_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DetailTech_ID" QueryStringField="dchID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div style="text-align:right;">
        <asp:ImageButton ID="imgback" runat="server" Height="55px" 
            ImageUrl="~/image/back.ico" onclick="imgback_Click" />
           
    </div>



    <br />

           <ajaxtoolkit:modalpopupextender ID="modalEditStudent" runat="server" DynamicServicePath=""
                                                        Enabled="True" 
        TargetControlID="HiddenTargetShow" CancelControlID="imgproClose" PopupControlID="pnl"
                                                        
        BackgroundCssClass="modalbackground"></ajaxtoolkit:modalpopupextender>

            <asp:Panel ID="pnl" CssClass="modalpopupUser" runat="server" Style="display: none">
             
            <div style="text-align: right;background-color:Gray;" > 
              <asp:ImageButton ID="imgproClose" runat="server" ImageUrl="~/image/close_button.png" AlternateText="ปิด" />
               </div>
               <uc1:PopupStudent ID="PopupStudent" runat="server" />  

                 </asp:Panel>

    </span>
</asp:Content>
