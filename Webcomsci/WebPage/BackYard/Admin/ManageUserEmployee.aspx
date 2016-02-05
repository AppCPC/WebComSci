<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUserEmployee.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManageUserEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 143px;
            text-align:left;
        }
        .style2
        {
            width: 66px;
                 text-align:left;
        }
        .style3
        {
            width: 130px;
                 text-align:left;
        }
        .style4
        {
            width: 104px;
                 text-align:left;
        }
        .style5
        {
            width: 141px;
                 text-align:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
                จัดการข้อมูลเจ้าที่</td>
            <td class="style2">
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
            <td class="style2">
                รหัสผู้ใช้</td>
            <td class="style3">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
                <td class="style4">
                    &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
             <td> &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                ชื่อ</td>
            <td class="style3">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
                <td class="style4">
                    นามสกุล&nbsp;&nbsp;</td>
            <td class="style5">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
                <td> &nbsp;</td>
        </tr>
            <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                ชื่อเล่น</td>
            <td class="style3">
              
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
              
            </td>
                <td class="style4">
                    ประเภท</td>
            <td class="style5">
             
                <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="126px">
                    <asp:ListItem>--กรุณาระบุุชื่อ--</asp:ListItem>
                    <asp:ListItem>ผู้ดูแลระบบ</asp:ListItem>
                    <asp:ListItem>พนักงาน</asp:ListItem>
                </asp:DropDownList>
             
            </td>
                <td> <span class="wrap">
                    <asp:Button ID="btnSearch" runat="server" Text="ค้นหา" ValidationGroup="valid" 
                        Width="80px" />
                    <asp:Button ID="btnReset" runat="server" Text="ตั้งค่าใหม่" Width="80px" />
                    <asp:Button ID="btnAdd" runat="server" Height="25px" Text="เพิ่ม" 
                        Width="80px" PostBackUrl="~/WebPage/BackYard/Admin/AddUserEmployee.aspx" />
                    </span></td>
        </tr>
    </table>
    <br />
    <span class="wrap">
    <asp:GridView ID="gvList" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Emp_ID" PageSize="20" 
        Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="แก้ไข">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="employeeEdit" 
                                    CommandArgument='<%# Eval("Emp_ID") %>' CommandName="employeeEdit" 
                                    ToolTip="employeeEdit">แก้ไข</asp:LinkButton>
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
                                <asp:LinkButton ID="btnDelete" runat="server" AlternateText="Delete" 
                                    CommandArgument='<%# Eval("Emp_ID") %>' CommandName="Delete" 
                                    ToolTip="Delete">แนบ</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="รหัสเจ้าหน้าที่">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ชื่อเจ้าหน้าที่">
               
            </asp:TemplateField>
            <asp:BoundField HeaderText="ชื่อเล่น">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ประเภท"></asp:TemplateField>
            <asp:TemplateField HeaderText="เบอร์โทร">
                
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="White" Height="30px" />
        <PagerStyle BackColor="White" />
        <RowStyle Height="20px" />
    </asp:GridView>
    </span>

</asp:Content>
