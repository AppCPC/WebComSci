<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cratekm.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.KM.Cratekm" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="HTMLEditor" %>

    


  <style type="text/css">
      .style1
      {
          text-align: left;
      }
      .style2
      {
          width: 122px;
      }
      .style4
      {
          width: 47px;
      }
  </style>

     <link href="../../../css/skins/Back.css" rel="stylesheet" type="text/css" />


  <asp:UpdatePanel id="test" runat="server">
   <ContentTemplate>

<table class="style1" style="width: 998px">
    <tr>
        <td class="style2">&nbsp;&nbsp; ชื่อกระทู้
        </td>
        <td class="style4">
            :</td>
        <td class="style6">
            <asp:TextBox ID="txtName" runat="server" Width="371px" 
                CssClass="textbox_in_back"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
           &nbsp;&nbsp; รายละเอียด
        </td>
        <td class="style4">
            :</td>
        <td class="style9">
        <%--  <asp:UpdatePanel ID="updatePanel1" runat="server">
              <ContentTemplate>--%>
                 <HTMLEditor:Editor ID="editor" runat="server" AutoFocus="true" Height="300px" OnContentChanged="ContentChanged" style="text-align: center" Width="80%" />
        <%--        </ContentTemplate>
            </asp:UpdatePanel>--%>
&nbsp;</td>
    </tr>
<%--    <tr>
        <td class="style2">&nbsp;&nbsp;&nbsp; รูปที่เกี่ยวข้อง
           
        </td>
        <td class="style4">
            :</td>
        <td class="style12">
            <asp:FileUpload ID="FileUpload"    CssClass="textbox_in_back"  runat="server" 
                ViewStateMode="Enabled" />
        </td>
    </tr>--%>
    <tr>
        <td class="style2">
            &nbsp;ลิ้งค์ที่เกี่ยวข้อง
        </td>
        <td class="style4">
            http : </td>
        <td class="style15">
            <asp:TextBox ID="TextBoxLink" runat="server" Width="373px" 
                CssClass="textbox_in_back"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
        <td class="style16">
            <asp:Button ID="btnconfirm" runat="server" Text="ตกลง" Width="69px" 
                onclick="btnconfirm_Click" CssClass="button_in_back" />
&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" 
                CssClass="button_in_back" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
    </tr>
</table>

          </ContentTemplate>
          </asp:UpdatePanel>
          




