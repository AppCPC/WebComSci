<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="CreateHomework.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.CreateHomework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
            <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
        <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <link href="../../../css/skins/Back.css" rel="stylesheet" type="text/css" />

     <div style="clear: both; background-repeat: no-repeat; height: 104px; width: 667px; padding-top: 13px;" 
        align="left">
   
       <img alt="" class="style3" 
             src="../../../image/Photo/HeaderCreatefilehomework.png" /></div>
    <div style="clear: both; padding-top: 5px;">
        <div class="uploadfile_detail_CreateHomework">
        <p align="left" 
                style="font-family: tahoma; font-size: medium; padding-top: 20px; padding-right: 10px; padding-left: 20px;">
            <img alt="" class="style4" src="../../../image/Back/add_file_icon.png" 
                style="width: 22px; height: 25px; margin-right: 10px;" />สร้างไฟล์การบ้าน</p>
           <br/><br/>
           
           <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" height="30" class="txtright" style="padding-right: 10px">
                    ชื่อไฟล์
                </td>
                <td class="txtleft">
               
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_in_back" 
                        Height="21px" Width="150px"></asp:TextBox>
                    
                </td>
            </tr>

                        <tr>
                <td height="60" class="txtright" style="padding-right: 10px">
                    รายละเอียดเพิ่มเติม
                </td>
                <td class="txtleft">
                    <asp:TextBox ID="txtdesciption" runat="server" Height="80px" TextMode="MultiLine"
                        Width="253px" Font-Names="tahoma" Font-Size="Small"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center" height="60" class="txtright">
                    <asp:Button ID="Button1" runat="server" Text="บันทึก" CssClass="button_in_back" />
                      <asp:Button ID="Button2" runat="server" Text="ยกเลิก" 
                        CssClass="button_in_back" PostBackUrl="~/WebPage/BackYard/Photo/Photos2.aspx" />       

                </td>
            </tr>
            </table>
        </div>
    </div>





</asp:Content>
