<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddUserTeacher.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddUserTeacher" %>
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
        .style15
        {
            width: 157px;
            text-align: left;
            height: 26px;
        }
        .style16
        {
            width: 229px;
            text-align: left;
            height: 26px;
        }
        .style17
        {
            width: 201px;
            text-align: left;
            height: 26px;
        }
        .style18
        {
            width: 209px;
            text-align: left;
            height: 26px;
        }
        .style19
        {
            height: 26px;
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
            ชื่อ&nbsp;</td>
                        <td class="style3">
                            <asp:TextBox ID="txtNameTch" runat="server" Height="19px" Width="141px" 
                                CssClass="textbox_in_back"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="regCheckNameStd" runat="server" ControlToValidate="txtNameTch" SetFocusOnError="true" ErrorMessage="กรุณากรอกข้อมูลชื่ออาจารย์" ValidationGroup="Reg1" CssClass="regu">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style5">     
            
                        </td>
                        <td>
                 &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style15">
           
                        </td>
                        <td class="style16">
                  สกุล</td>
                        <td class="style17">
                            <asp:TextBox ID="txtLnameTch" runat="server" Height="19px" Width="141px" 
                                CssClass="textbox_in_back"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RegFiCheckLname" runat="server" ControlToValidate="txtLnameTch" SetFocusOnError="true" ErrorMessage="กรุณากรอกข้อมูลนามสกุลอาจารย์" ValidationGroup="Reg1" CssClass="regu">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style18">
                        </td>
                        <td class="style19">
                             </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style16">
                            ชื่อภาษาอังกฤษ</td>
                        <td class="style17">
                            <asp:TextBox ID="txtNameTchEn" runat="server" Height="19px" Width="141px" 
                                CssClass="textbox_in_back"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="regCheckNameStd0" runat="server" 
                                ControlToValidate="txtNameTchEn" CssClass="regu" 
                                ErrorMessage="กรุณากรอกข้อมูลชื่อภาษาอังกฤษอาจารย์" SetFocusOnError="true" 
                                ValidationGroup="Reg1">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style18">
                            &nbsp;</td>
                        <td class="style19">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style16">
                            สกุลภาษาอังกฤษ</td>
                        <td class="style17">
                            <asp:TextBox ID="txtLnameEn" runat="server" Height="19px" Width="141px" 
                                CssClass="textbox_in_back"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="regCheckNameStd1" runat="server" 
                                ControlToValidate="txtLnameEn" CssClass="regu" 
                                ErrorMessage="กรุณากรอกข้อมูลสกุลภาษาอังกฤษอาจารย์" SetFocusOnError="true" 
                                ValidationGroup="Reg1">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style18">
                            &nbsp;</td>
                        <td class="style19">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                        </td>
                        <td class="style10">
            ชื่อเล่น</td>
                        <td class="style3">
                            <asp:TextBox ID="txtNickName" runat="server" Height="19px" Width="141px" 
                                CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <%--<td class="style9">
                        </td>
                        <td class="style10">
            วันเกิด</td>
                        <td class="style3">
                            <asp:TextBox ID="txtdate" runat="server" Height="19px" Width="141px" 
                                CssClass="textbox_in_back"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" 
                                TargetControlID="txtdate" CssClass="MyCalendar" Format="dd/MM/yyyy"/>
                        </td>
                        <td class="style5">
                 &nbsp;</td>
                        <td>
                             &nbsp;</td>--%>
                    </tr>
                    <tr>
                        <td class="style9">
                        </td>
                        <td class="style10">
            เบอร์โทร</td>
                        <td class="style3">
                            <asp:TextBox ID="txttel" runat="server" Height="19px" Width="141px" 
                                CssClass="textbox_in_back"></asp:TextBox>
                          
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
                            <asp:DropDownList ID="ddlSex" runat="server" Height="22px" Width="141px" 
                                CssClass="textbox_in_back">
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
                            ประเภทอาจารย์</td>
                        <td class="style3">
                            <asp:DropDownList ID="ddlTypeUser" runat="server" Height="22px" Width="141px" 
                                CssClass="textbox_in_back" AutoPostBack="True" 
                                onselectedindexchanged="ddlTypeUser_SelectedIndexChanged">
                                <asp:ListItem Value="N">--ประเภทผู้ใช้งาน--</asp:ListItem>
                                <asp:ListItem Value="TE">อาจารย์ประจำ</asp:ListItem>
                                <asp:ListItem Value="TS">อาจารย์พิเศษ</asp:ListItem>
                            </asp:DropDownList>

                      <asp:RequiredFieldValidator ControlToValidate="ddlTypeUser" ID="regCheckType"
                        ValidationGroup="Reg1" CssClass="regu" ErrorMessage="กรุณาระบุประเภทของอาจารย์"
                        InitialValue="N" runat="server"  Display="Dynamic">*
                        </asp:RequiredFieldValidator>

                        </td>
                        <td class="style5">
                        <div id="showType" runat="server" visible="false">
                            &nbsp;ประเภท&nbsp;<asp:DropDownList ID="ddlTypeUserTeacher" runat="server" 
                                CssClass="textbox_in_back" Height="22px" Width="141px">
                                <asp:ListItem Value="N">--ประเภทผู้ใช้งาน--</asp:ListItem>
                                <asp:ListItem Value="A">อาจารย์หัวหน้าสาขา</asp:ListItem>
                                <asp:ListItem Value="B">อาจารย์ประจำสาขา</asp:ListItem>
                                <asp:ListItem Value="C">อาจารย์นอกสาขา</asp:ListItem>
                            </asp:DropDownList>
                          </div>

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
                            <asp:TextBox ID="txtEmail" runat="server" Height="22px" Width="141px" 
                                CssClass="textbox_in_back"></asp:TextBox>
           
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
                TextMode="MultiLine" CssClass="textbox_in_back"></asp:TextBox>
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
                                 Width="70px" onclick="btnSave_Click" CssClass="button_in_back" />
                            <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" Width="70px" 
                                 PostBackUrl="~/WebPage/BackYard/Admin/ManageUserTeacher.aspx" 
                                CssClass="button_in_back" />
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
