<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true" CodeBehind="Set.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.setting.Setting" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style3
        {
            width: 389px;
            padding-left: 5px;
        }

        .style4
        {
            font-family: "Angsana New";
            font-size: 20pt;
        }
        #TextArea2
        {
            width: 275px;
            height: 58px;
        }

        .auto-style1 {
            text-align: left;
            width: 585px;
            font-size:16pt;
        }

        .style5
        {
            text-align: left;
            width: 1283px;
            font-size: 16pt;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
<div align="left">
    <img src="../../../image/Title/Setting.png" />
    </div>

<div align="center" style="margin-bottom: 60px; margin-top: 20px;">
    <div align="left" class="style4" 
        style="border-bottom: 2px solid #999999; height: 52px; width: 550px; margin-bottom: 20px;">
        <strong>ตั้งค่าข้อมูลผู้ใช้</strong></div>


    <table cellpadding="0" cellspacing="0" class="tablefontset" 
        style="margin-top: 10px; width: 541px; margin-right: 0px;">

               <tr>
            <td class="style5" id="Td1">
            </td>
            <td align="left" class="Column2" id="Td2">
            </td>
            <td class="style3" id="Td3">
                <asp:Image ID="ImageUser" runat="server" Height="109px" Width="100px" />
                   </td>
        </tr>


        <tr>
            <td class="style5" id="Cellset">
                <asp:Label ID="lblcodestda" runat="server" Text="รหัสนักศึกษา"></asp:Label>
                
            </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtSubCode" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblCodeStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                <asp:Label ID="lbtype" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblyear" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblgroup" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                ชื่อนักศึกษา </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtNameStd" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblNameStd" runat="server"></asp:Label>
                </td>
            <td class="style3" id="Cellset">
                </td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                นามสกุล </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtLname" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblLnameStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>


             <tr>
            <td class="style5" id="Cellset">
                ชื่อภาษาอังกฤษ </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtnameStdEn" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblnameStdEn" runat="server"></asp:Label>
                </td>
            <td class="style3" id="Cellset">
                </td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                นามสกุลภาษาอังกฤษ  </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtLnameEnStd" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblLnameEnstd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>



        <tr>
            <td class="style5" id="Cellset">
                ชื่อเล่น </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtNickName" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblNickNameStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                เพศ </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:RadioButtonList ID="RadioButtonListSex" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="M">ชาย</asp:ListItem>
                    <asp:ListItem Value="F">หญิง</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Label ID="lblSexStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>

          <tr>
            <td class="style5" id="Cellset">
                เพิ่มรูป </td>
            <td align="left" class="Column2" id="Cellset">

                <asp:FileUpload ID="FileUploadPicture" runat="server" 
                    CssClass="textbox_in_back" />

            </td>
            <td class="style3" id="Cellset">
                <asp:Label ID="lblpicturepath" runat="server" Visible="False"></asp:Label>
              </td>
        </tr>

        <tr>
            <td class="style5" id="Cellset">
                วัน/เดือน/ปี เกิด </td>
            <td align="left" class="Column2" id="Cellset">
             <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" ScriptMode="Debug" CombineScripts="false" />
               <asp:TextBox runat="server" ID="txtBirthDate" autocomplete="off" Width="172px" 
                    CssClass="textbox_in_back"  /><br />
        <ajaxToolkit:CalendarExtender ID="defaultCalendarExtender" runat="server"  
                    TargetControlID="txtBirthDate" />

                <asp:Label ID="lblBirthStd" runat="server"></asp:Label>

                </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                ที่อยู่ </td>
            <td align="left" class="Column2" id="Cellset">
            
                <textarea id="TextAreaAddress" runat="server" style="width:250px;height:100px;" name="S2"></textarea>
                <asp:Label ID="lblAddressStd" runat="server"></asp:Label>
                </td>
               
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                โทรศัพท์ </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txttel" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblTelStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                E-mail</td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblEmailStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                Username </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="textbox_in_back" 
                    Width="172px"></asp:TextBox>
                <asp:Label ID="lblUsernameStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" id="Cellset">
                Password </td>
            <td align="left" class="Column2" id="Cellset">
                <asp:TextBox ID="txtpassword" runat="server" CssClass="textbox_in_back" 
                    Width="172px" TextMode="Password"></asp:TextBox>
                <asp:Label ID="lblPasswordStd" runat="server"></asp:Label>
            </td>
            <td class="style3" id="Cellset">
                &nbsp;</td>
        </tr>
        </table>
    <br />
   <div style="width: 310px">

   <asp:Button ID="btnupdate" runat="server" Height="38px" Text="แก้ไข" 
           Width="79px"  CssClass="button_in_back" onclick="btnupdate_Click" /> &nbsp;

   
       <asp:Button ID="btnSave" runat="server" Height="38px" Text="บันทึก" 
           Width="79px" onclick="btnSave_Click" CssClass="button_in_back" />
   
   
   
   &nbsp;<asp:Button ID="btnCancel" runat="server" Height="38px" Text="ยกเลิก" 
           Width="87px" 
           CssClass="button_in_back" onclick="btnCancel_Click" />
   
   
   
       <br />
   
   
   
   </div>

</div>



</asp:Content>
