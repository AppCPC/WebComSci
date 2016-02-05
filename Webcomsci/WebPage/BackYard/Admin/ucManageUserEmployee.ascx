<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucManageUserEmployee.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ucManageUserEmployee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<style type="text/css">
    .style1
    {
        width: 97px;
        text-align:left;
    }
    .style2
    {
        width: 64px;
         text-align:left;
    }
    .style3
    {
        width: 201px;
         text-align:left;
    }
    .style4
    {
        width: 185px;
         text-align:left;
    }
    .style5
    {
        width: 88px;
         text-align:left;
    }
  
    #textAreaAddress
    {
        height: 92px;
        width: 195px;
    }
</style>
<div style="height: 455px">
<table style="width:100%; height: 284px;">
    <tr>
        <td class="style1">
            <asp:Label ID="lblTypeManage" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
             <td class="style5">
                 &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
                         <td>
                             &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td class="style2">
            รหัสผู้ใช้</td>
        <td class="style3">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </td>
              <td class="style5">
                  &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
             <td>
                 &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td class="style2">
            ชื่อ&nbsp;</td>
        <td class="style3">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
              <td class="style5">
                  สกุล</td>
        <td class="style4">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
             <td>
                 &nbsp;</td>
    </tr>
      <tr>
        <td class="style1">
           
        </td>
        <td class="style2">
            ชื่อเล่น</td>
        <td class="style3">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
          </td>
             <td class="style5">
                 เพศ</td>
        <td class="style4">
            <asp:DropDownList ID="ddlSex" runat="server" Height="20px" Width="154px">
                <asp:ListItem>--กรุณาระบุเพศ--</asp:ListItem>
                <asp:ListItem>ชาย</asp:ListItem>
                <asp:ListItem>หญิง</asp:ListItem>
            </asp:DropDownList>
          </td>
                         <td>
                             &nbsp;</td>
    </tr>

      <tr>
        <td class="style1">
       
        </td>
        <td class="style2">
            วันเกิด</td>
        <td class="style3">
                    <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
                       <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtdate" CssClass="MyCalendar" Format="dd/MM/yyyy"/>
                </td>
             <td class="style5">
                 ประเภท</td>
        <td class="style4">
            <asp:DropDownList ID="ddlTypeUser" runat="server" Height="20px" Width="155px">
                <asp:ListItem>--กรุณาประเภทผู้ใช้งาน--</asp:ListItem>
                <asp:ListItem>ผู้ดูแลระบบ</asp:ListItem>
                <asp:ListItem>พนักงาน</asp:ListItem>
            </asp:DropDownList>
          </td>
                         <td>
                             &nbsp;</td>
    </tr>
      <tr>
        <td class="style1">
        </td>
        <td class="style2">
            เบอร์โทร</td>
        <td class="style3">
                    <asp:TextBox ID="txttel" runat="server"></asp:TextBox>
                       <ajaxToolkit:CalendarExtender ID="txttel_CalendarExtender" 
                runat="server" TargetControlID="txttel" CssClass="MyCalendar" 
                Format="dd/MM/yyyy"/>
                </td>
             <td class="style5">
                 E-mail</td>
        <td class="style4">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                       <ajaxToolkit:CalendarExtender ID="txtEmail_CalendarExtender" 
                runat="server" TargetControlID="txtEmail" CssClass="MyCalendar" 
                Format="dd/MM/yyyy"/>
                </td>
                         <td>
                             &nbsp;</td>
    </tr>
         <tr>
        <td class="style1">
        </td>
        <td class="style2">
            ที่อยู่</td>
        <td class="style3">
            <textarea id="textAreaAddress" name="S1" runat=server></textarea></td>
             <td class="style5">
                 &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
                         <td>
                             &nbsp;</td>
    </tr>
          <tr>
        <td class="style1">
        </td>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
             <td class="style5">
                 &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
                         <td>
                   
             </td>
    </tr>

          <tr>
        <td class="style1">
        </td>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
             <td class="style5">
                 &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
                         <td>
                             
             </td>
    </tr>
          <tr>
        <td class="style1">
        </td>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
             <td class="style5">
                 &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
                         <td><br /><br /><br /><br />
                             <asp:Button ID="btnSave" runat="server" Text="บันทึก" ValidationGroup="Reg1" 
                                 Width="70px" />
                             <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" Width="70px" 
                                 PostBackUrl="~/WebPage/BackYard/Admin/ManageUserEmployee.aspx" />
             </td>
    </tr>
</table>
</div>
    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" ></ajaxToolkit:ToolkitScriptManager>




