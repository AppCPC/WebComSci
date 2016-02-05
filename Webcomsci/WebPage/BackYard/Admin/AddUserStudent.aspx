<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddUserStudent.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddUserStudent" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    .style9
    {
        width: 157px;
        text-align: left;
    }
    .style10
    {
        width: 229px;
        text-align: left;
    }
    .style3
    {
        width: 201px;
         text-align:left;
    }
          
    .style5
    {
        width: 209px;
        text-align: left;
    }
    .style6
    {
        width: 157px;
        text-align: left;
        height: 58px;
    }
    .style7
    {
        width: 229px;
        text-align: left;
        height: 58px;
    }
    .style8
    {
        height: 58px;
    }
    .regu
    {
        
        color:Red;
        }
    </style>

       <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:UpdatePanel id="test" runat="server">
        <ContentTemplate>
            <div style="height: 504px">
                <table style="width:100%; height: 585px;">
                    <tr>
                        <td class="style9">
                            <strong>
                            <asp:Literal ID="ltrMode" runat="server"></asp:Literal>
                            </strong>
                        </td>
                        <td class="style10">
            &nbsp;</td>
                        <td class="style3">
            &nbsp;</td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
            &nbsp;</td>
                        <td class="style10">
            รหัสนักศึกษา</td>
                        <td class="style3">
                            <asp:TextBox ID="txtcodeStd" runat="server" Height="19px" Width="141px"></asp:TextBox>
                      

                     
                      <asp:RequiredFieldValidator ID="validCheckCodeName" runat="server" ControlToValidate="txtCodeStd" SetFocusOnError="true" ErrorMessage="กรุณากรอกข้อมูลรหัสนักศึกษา" ValidationGroup="Reg1" CssClass="regu">*</asp:RequiredFieldValidator>
                      
                        </td>
                        <td colspan="2" style="font-size:small">
                          <asp:RegularExpressionValidator ID="excode" runat="server" 
                                ControlToValidate="txtcodeStd" 
                                ErrorMessage="กรุณากรอกข้อมูลให้ถูกต้องตามรูปแบบที่ถูกต้อง ( 025230461xx-x )" 
                                CssClass="regu" ValidationGroup="Reg1" ValidationExpression="(02((\d){10})(\-)(\d))">กรุณากรอกข้อมูลให้ถูกต้องตามรูปแบบ( 025230461xx-x )</asp:RegularExpressionValidator>
                  &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
            &nbsp;</td>
                        <td class="style10">
            ชื่อ&nbsp;</td>
                        <td class="style3">
                            <asp:TextBox ID="txtNameStd" runat="server" Height="19px" Width="141px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="regCheckNameStd" runat="server" ControlToValidate="txtNameStd" SetFocusOnError="true" ErrorMessage="กรุณากรอกข้อมูลชื่อนักศึกษา" ValidationGroup="Reg1" CssClass="regu">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style5">     
            
                        </td>
                        <td>
                 &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
           
            &nbsp;</td>
                        <td class="style10">
                  สกุล</td>
                        <td class="style3">
                            <asp:TextBox ID="txtLnameStd" runat="server" Height="19px" Width="141px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RegFiCheckLname" runat="server" ControlToValidate="txtLnameStd" SetFocusOnError="true" ErrorMessage="กรุณากรอกข้อมูลนามสกุลนักศึกษา" ValidationGroup="Reg1" CssClass="regu">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                        </td>
                        <td class="style10">
            ชื่อเล่น</td>
                        <td class="style3">
                            <asp:TextBox ID="txtNickName" runat="server" Height="19px" Width="141px"></asp:TextBox>
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                        </td>
                        <td class="style10">
            วันเกิด</td>
                        <td class="style3">
                            <asp:TextBox ID="txtdate" runat="server" Height="19px" Width="141px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" 
                                TargetControlID="txtdate" CssClass="MyCalendar" Format="dd/MM/yyyy"/>
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                        </td>
                        <td class="style10">
            เบอร์โทร</td>
                        <td class="style3">
                            <asp:TextBox ID="txttel" runat="server" Height="19px" Width="141px"></asp:TextBox>
                          
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
            &nbsp;</td>
                        <td class="style10">
                 เพศ</td>
                        <td class="style3">
                            <asp:DropDownList ID="ddlSex" runat="server" Height="22px" Width="141px">
                                <asp:ListItem Value="N">--ระบุเพศ--</asp:ListItem>
                                <asp:ListItem Value="M">ชาย</asp:ListItem>
                                <asp:ListItem Value="F">หญิง</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
            &nbsp;</td>
                        <td class="style10">
                 ประเภท</td>
                        <td class="style3">
                            <asp:DropDownList ID="ddlTypeUser" runat="server" Height="22px" Width="141px">
                                <asp:ListItem Value="N">--ประเภทผู้ใช้งาน--</asp:ListItem>
                                <asp:ListItem Value="ST">นักศึกษา</asp:ListItem>
                                <asp:ListItem Value="AL">นักศึกษาศิษย์เก่า</asp:ListItem>
                            </asp:DropDownList>

                      <asp:RequiredFieldValidator ControlToValidate="ddlTypeUser" ID="regCheckType"
                        ValidationGroup="Reg1" CssClass="regu" ErrorMessage="กรุณาระบุประเภทของนักศึกษา"
                        InitialValue="N" runat="server"  Display="Dynamic">*
                        </asp:RequiredFieldValidator>

                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style10">
                            กลุ่มเรียน</td>
                        <td class="style3">
                            <asp:TextBox ID="txtGroup" runat="server" Height="22px" Width="141px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RegFiGroup" runat="server" 
                                ControlToValidate="txtGroup" CssClass="regu" 
                                ErrorMessage="กรุณากรอกข้อมูลกลุ่มนักศึกษา" SetFocusOnError="true" 
                                ValidationGroup="Reg1">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
            &nbsp;</td>
                        <td class="style10">
                 E-mail</td>
                        <td class="style3">
                            <asp:TextBox ID="txtEmail" runat="server" Height="22px" Width="141px"></asp:TextBox>
           
              <%--  <asp:RegularExpressionValidator ID="expEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="valid email address required" ValidationExpression="^([a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]){1,70}$">*</asp:RegularExpressionValidator>--%>
                         
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
            &nbsp;</td>
                        <td class="style10">
            ที่อยู่</td>
                        <td class="style3">
                    &nbsp;</td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                        </td>
                        <td class="style7">
                        </td>
                        <td  colspan="2" class="style8">
                            <asp:TextBox ID="txtAddress" runat="server" Height="127px" Width="393px" 
                TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td class="style8">
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                        </td>
                        <td class="style10">
            &nbsp;</td>
                        <td class="style3">
                        <br /> 
            &nbsp;<ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server">
                            </ajaxToolkit:ToolkitScriptManager>
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                            <br />
                            <asp:Button ID="btnSave" runat="server" Text="บันทึก" ValidationGroup="Reg1" 
                                 Width="70px" onclick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" Width="70px" 
                                 PostBackUrl="~/WebPage/BackYard/Admin/ManageUseStudent.aspx" />
                        </td>
                        
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:left;height:inherit">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="regu" 
                                DisplayMode="BulletList" HeaderText="กรุณากรอกข้อมูลตามรายละเอียดด้านล่างให้ครบ" 
                                ShowMessageBox="false" ShowSummary="true" ValidationGroup="Reg1" />
                      <br>
                        </td>
                    </tr>
                </table>
&nbsp;</div>
            <br />

            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
