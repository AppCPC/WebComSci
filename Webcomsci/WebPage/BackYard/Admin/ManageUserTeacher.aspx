<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUserTeacher.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManageUserTeacher" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1
        {
            width: 174px;
            text-align: left;
        }
        .style3
        {
            width: 130px;
                 text-align:left;
        }
        .style4
        {
            width: 52px;
            text-align: left;
        }
        .style5
        {
            width: 321px;
            text-align: left;
        }
        .style6
        {
            width: 122px;
            text-align: left;
        }
        .style7
        {
            width: 174px;
            text-align: left;
            font-weight: bold;
        }
    </style>
       <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
    <table style="width:100%;">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <tr>
            <td class="style7" style="text-align: center">
                จัดการข้อมูลอาจารย์</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                    &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
            </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
       <%--     <td class="style6" style="font-family: tahoma; font-size: 15px; color: #000000">
                รหัสผู้ใช้</td>
            <td class="style3">
                <asp:TextBox ID="txtcodeTeacher" runat="server" CssClass="textbox_in_back"></asp:TextBox>
            </td>--%>
            <td class="style4">
                    &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style6" style="font-family: tahoma; font-size: 15px; color: #000000">
                ชื่อ</td>
            <td class="style3">
                <asp:TextBox ID="txtNameTch" runat="server" CssClass="textbox_in_back"></asp:TextBox>
            </td>
            <td class="style4">
                    &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style6" style="font-family: tahoma; font-size: 15px; color: #000000">
                    นามสกุล&nbsp;&nbsp;&nbsp;</td>
            <td class="style3">
                <asp:TextBox ID="txtLnameTch" runat="server" CssClass="textbox_in_back"></asp:TextBox>
            </td>
            <td class="style4">
                    &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style6" style="font-family: tahoma; font-size: 15px; color: #000000">
                    ประเภท</td>
            <td class="style3">
                            <asp:DropDownList ID="ddlTypeUser" runat="server" Height="22px" 
                    Width="141px" CssClass="textbox_in_back">
                                <asp:ListItem Value="N">--ประเภทผู้ใช้งาน--</asp:ListItem>
                                <asp:ListItem Value="TE">อาจารย์ประจำ</asp:ListItem>
                                <asp:ListItem Value="TS">อาจารย์พิเศษ</asp:ListItem>
                            </asp:DropDownList>

            </td>
            <td class="style4">
                    &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
               
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                    &nbsp;</td>
            <td class="style5">
                <span class="wrap">
                <asp:Button ID="btnSearch" runat="server" Text="ค้นหา" ValidationGroup="valid" 
                    Width="80px" onclick="btnSearch_Click" CssClass="button_in_back" />
                <%--<asp:Button ID="btnReset" runat="server" Text="เพิ่มข้อมูล import Excel" 
                    Width="162px" onclick="btnInsertExcell_Click" 
                    PostBackUrl="~/WebPage/BackYard/Admin/ImportUserTeacher.aspx" 
                    CssClass="button_in_back" />--%>
                <asp:Button ID="btnAdd" runat="server" Height="25px" 
                    PostBackUrl="~/WebPage/BackYard/Admin/AddUserTeacher.aspx" Text="เพิ่ม" 
                    Width="68px" CssClass="button_in_back" />
                </span></td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br /><span class="wrap">
    


    <asp:GridView ID="gvListTeacher" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Tch_ID" PageSize="20" 
        Width="100%" onpageindexchanging="gvListTeacher_PageIndexChanging" 
        onrowcommand="gvListTeacher_RowCommand" 
        CssClass="MyGridView_ManageUserTeacher" 
        onrowdatabound="gvListTeacher_RowDataBound">
        <AlternatingRowStyle CssClass="MyGridViewAlt_ManageUserTeacher" />
        <Columns>
            <asp:TemplateField HeaderText="แก้ไข">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="editeTch" 
                                    CommandArgument='<%# Eval("Tch_ID") %>' CommandName="editeTch" 
                                    ToolTip="editeTch" 
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
                                <asp:LinkButton ID="btnDelete" runat="server" AlternateText="deleteTch" 
                                    CommandArgument='<%# Eval("Tch_ID") %>' CommandName="deleteTch" 
                                    ToolTip="deleteTch" onclientclick="return confirm('ยืนยันการลบข้อมูล ! ')">ลบข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
       <%--     <asp:BoundField HeaderText="รหัสอาจารย์" DataField="Tch_Campus_code">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>--%>
            <asp:BoundField HeaderText="ชื่ออาจารย์" DataField="Tch_FName">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Tch_LName" HeaderText="นามสกุล" />
            <asp:BoundField DataField="Tch_Type" HeaderText="ประเภท" />
        </Columns>
        <HeaderStyle Height="30px" CssClass="GridViewHeader_ManageUserTeacher" />
        <RowStyle Height="20px" CssClass="MyGridViewRow_ManageUserTeacher" />
    </asp:GridView>
    </span>
</asp:Content>
