<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUseStudent.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManageUseStudent" %>
<%@ Register Src="ucManageUserStudent.ascx" TagName="PopupStudent" TagPrefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



   <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />

    <style type="text/css">

        .style1
        {
            width: 131px;
            text-align: left;
        }
        .style2
        {
            width: 228px;
                 text-align:left;
        }
        .style3
        {
            width: 130px;
                 text-align:left;
        }
        .style5
        {
            width: 141px;
                 text-align:left;
        }
        .style13
        {
            width: 269px;
        }
        .style14
        {
            width: 269px;
            text-align: left;
        }
        .style15
        {
            width: 169px;
            text-align: left;
        }
        .style16
        {
            width: 231px;
            text-align: left;
        }
        .style17
        {
            width: 85px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
    <table style="width:100%;">
        <tr>
            <td colspan="2" 
                style="font-family: tahoma; color: #000000; font-weight: bold; text-align: center;">
                จัดการข้อมูลนักศึกษา</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td class="style15">
                    &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
            </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style16" 
                style="font-family: tahoma; font-size: 15px; color: #000000">
                รหัสผู้ใช้</td>
            <td class="style2">
                <asp:TextBox ID="txtstdCode" runat="server"></asp:TextBox>
            </td>
            <td class="style17">
                    &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style16" 
                style="font-family: tahoma; font-size: 15px; color: #000000">
                ชื่อ</td>
            <td class="style2">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td class="style17" 
                style="font-family: tahoma; font-size: 15px; color: #000000">
                    นามสกุล&nbsp;&nbsp;&nbsp;</td>
            <td class="style15">
                <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style16" 
                style="font-family: tahoma; font-size: 15px; color: #000000">
                ปีการศึกษาที่เข้าศึกษา</td>
            <td class="style2">
                <asp:TextBox ID="txtyearEducate" runat="server"></asp:TextBox>
            </td>
            <td class="style17" 
                style="font-family: tahoma; font-size: 15px; color: #000000">
                    ประเภท</td>
            <td class="style15">
                            <asp:DropDownList ID="ddlTypeUser" runat="server" Height="22px" 
                    Width="141px">
                                <asp:ListItem Value="N">--ประเภทผู้ใช้งาน--</asp:ListItem>
                                <asp:ListItem Value="ST">นักศึกษา</asp:ListItem>
                                <asp:ListItem Value="AL">นักศึกษาศิษย์เก่า</asp:ListItem>
                            </asp:DropDownList>

            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style17">
                    &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style13">
                <span class="wrap">
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="ค้นหา" ValidationGroup="valid" Width="80px" />
                <%--<asp:Button ID="btnReset" runat="server" onclick="btnReset_Click" 
                    Text="ตั้งค่าใหม่" Width="80px" />--%>
                <asp:Button ID="btnAdd" runat="server" Height="25px" onclick="btnAdd_Click" 
                    PostBackUrl="~/WebPage/BackYard/Admin/AddUserStudent.aspx" Text="เพิ่ม" 
                    Width="80px" />
                </span></td>
        </tr>
    </table>
    <br /><span class="wrap">
    <asp:GridView ID="gvList" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Std_Campus_Code" PageSize="20" 
        Width="95%" onpageindexchanging="gvListStd_PageIndexChanging" 
        onrowcommand="gvList_RowCommand" CssClass="MyGridView_ManageUseStudent">
        <AlternatingRowStyle CssClass="MyGridViewAlt_ManageUseStudent" />
        <Columns>
            <asp:TemplateField HeaderText="แก้ไข">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="stdEdit" 
                                    CommandArgument='<%# Eval("Std_Campus_Code") %>' CommandName="stdEdit" 
                                    ToolTip="stdEdit" 
                                    onclientclick="return confirm('ยืนยันการแก้ไขข้อมูล ! ')">แก้ไข</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ลบ">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnDelete" runat="server" AlternateText="stdDelete" 
                                    CommandArgument='<%# Eval("Std_Campus_Code") %>' CommandName="stdDelete" 
                                    ToolTip="stdDelete" onclientclick="return confirm('ยืนยันการลบข้อมูล ! ')">ลบ</asp:LinkButton>
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
        <HeaderStyle Height="30px" CssClass="GridViewHeader_ManageUseStudent" />
        <RowStyle Height="20px" CssClass="MyGridViewRow_ManageUseStudent" />
    </asp:GridView>

           <asp:HiddenField ID="HiddenTargetShow" runat="server" />

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
