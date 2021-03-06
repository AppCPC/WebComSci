﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="ApproveStudentInclass.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.ApproveStudentInclass" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxtoolkit" %>
<%@ Register src="../Admin/ucManageUserStudent.ascx" tagname="popupstudent" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

    <table style="width:100%;">
        <tr>
            <td class="style24">
                <strong>&nbsp;จัดการการเข้าใช้ห้องเรียนของนักศึกษา</strong></td>
            <td class="style25">
                </td>
            <td class="style20">
                </td>
            <td class="style26">
                    </td>
            <td class="style27">
                </td>
            <td class="style28">
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</tr>
        </table>
    <span class="wrap">
    <div id="container">
    <asp:GridView ID="gvList" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Std_Campus_Code" 
        Width="100%" onpageindexchanging="gvListStd_PageIndexChanging" 
        onrowcommand="gvList_RowCommand"   
    CssClass="MyGridView_CreatestudentInClassRoom"  
    PagerStyle-CssClass="pgr"  
    AlternatingRowStyle-CssClass="alt">

        <AlternatingRowStyle CssClass="Alt_CreatestudentInClassRoom" />
        <Columns>
            <asp:TemplateField HeaderText="อนุมัติเข้าใช้ห้องเรียน">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="อนุมัติการเข้าใช้ห้องเรียน" 
                                    CommandArgument='<%# Eval("Std_Campus_Code") %>' CommandName="stdGet" 
                                    ToolTip="อนุมัติการเข้าใช้ห้องเรียน">อนุมัติ</asp:LinkButton>
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
        <HeaderStyle Height="30px" CssClass="GridViewHeader_CreatestudentInClassRoom" />
        <PagerStyle />
        <RowStyle Height="20px" CssClass="row_CreatestudentInClassRoom" />
    </asp:GridView>
    </div>

           <asp:HiddenField ID="HiddenTargetShow" runat="server" />

           <ajaxtoolkit:modalpopupextender ID="modalEditStudent" runat="server" DynamicServicePath=""
                                                        Enabled="True" 
        TargetControlID="HiddenTargetShow" CancelControlID="imgproClose" PopupControlID="pnl"
                                                        
        BackgroundCssClass="modalbackground"></ajaxtoolkit:modalpopupextender>

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
        onrowcommand="gvListStudentInclass_RowCommand" Width="90%" 
        DataSourceID="SqlDataSourceStudentInclass" 
        PageSize="20" CssClass="MyGridView_gvListStudentInclass_checkNameSum">
        <AlternatingRowStyle CssClass="MyGridViewAlt_gvListStudentInclass_checkNameSum" />
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
        <HeaderStyle Height="30px" 
            CssClass="GridViewHeader_gvListStudentInclass_checkNameSum" />
        <RowStyle Height="20px" 
            CssClass="MyGridViewRow_gvListStudentInclass_checkNameSum" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceStudentInclass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
        SelectCommand="SELECT     EnrollIn.Enroll_ID, EnrollIn.[DeEduStd], EnrollIn.Std_Campus_Code, Student.Std_FName, Student.Std_LName, Student.Std_FNameEn, Student.Std_Nickname, 
                      Student.Std_LNameEn, Student.Std_Campus_Code, Student.Std_YearEducate, Student.Std_Group
                      FROM  Student INNER JOIN
                      EnrollIn ON Student.Std_Campus_Code = EnrollIn.Std_Campus_Code WHERE ([DeEduStd] = @DetailTech_ID) and  (EnrollIn.Enroll_Status='A')">
        <SelectParameters>
            <asp:QueryStringParameter Name="DetailTech_ID" QueryStringField="dchID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div style="text-align:right;">
        <asp:ImageButton ID="imgback" runat="server" Height="55px" 
            ImageUrl="~/image/Detail/Icon_backward.png" onclick="imgback_Click" />
           
    </div>



    <br />

            <asp:Panel ID="pnl" CssClass="modalpopupUser" runat="server" Style="display: none">
             
            <div style="text-align: right;background-color:Gray;" > 
              <asp:ImageButton ID="imgproClose" runat="server" ImageUrl="~/image/close_button.png" AlternateText="ปิด" />
               </div>
               <uc1:PopupStudent ID="PopupStudent" runat="server" />  

                 </asp:Panel>

    </span>

</asp:Content>
