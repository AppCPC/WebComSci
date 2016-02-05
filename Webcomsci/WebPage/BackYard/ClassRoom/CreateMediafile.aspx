<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true"
    CodeBehind="CreateMediafile.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.CreateMediafile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .txtleft
        {
            text-align: left;
        }
        
        .txtright
        {
            text-align: right;
        }
        .txtcolor
        {
            color: Red;
        }
        .style3
        {
            width: 641px;
            height: 97px;
        }
        .style4
        {
            width: 100px;
            height: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <%--<div class="Picture_UploadfileMediaTeacher">
    </div>--%>
    <%--<div class="AreaIcon_UploadfileMediaTeacher">
        <div class="CropIcon_UploadfileMediaTeacher">
            <div class="AreaPicture_UploadfileMediaTeacher">
                <div class="CropPicture_UploadfileMediaTeacher">
                    <img alt="" class="style2" src="../../../image/Back/Classroom/ms_word_2.png" /></div>
            </div>
        </div>
        <div class="CropIcon_UploadfileMediaTeacher">
            <div class="AreaPicture_UploadfileMediaTeacher">
                <div class="CropPicture_UploadfileMediaTeacher">
                    <img alt="" class="style2" src="../../../image/Back/Classroom/powerpoint.png" /></div>
            </div>
        </div>
        <div class="CropIcon_UploadfileMediaTeacher">
            <div class="AreaPicture_UploadfileMediaTeacher">
                <div class="CropPicture_UploadfileMediaTeacher">
                    <img alt="" class="style2" src="../../../image/Back/Classroom/excel.png" /></div>
            </div>
        </div>
        <div class="CropIcon_UploadfileMediaTeacher">
            <div class="AreaPicture_UploadfileMediaTeacher">
                <div class="CropPicture_UploadfileMediaTeacher">
                    <img alt="" class="style2" src="../../../image/Back/Classroom/notepad.png" /></div>
            </div>
        </div>
        <div class="CropIcon_UploadfileMediaTeacher">
            <div class="AreaPicture_UploadfileMediaTeacher">
                <div class="CropPicture_UploadfileMediaTeacher">
                    <img alt="" class="style2" src="../../../image/Back/Classroom/filetype_pdf.png" /></div>
            </div>
        </div>
        <div class="CropIcon_UploadfileMediaTeacher">
            <div class="AreaPicture_UploadfileMediaTeacher">
                <div class="CropPicture_UploadfileMediaTeacher">
                    <img alt="" class="style2" src="../../../image/Back/Classroom/Other.png" /></div>
            </div>
        </div>
    </div>--%>
    <%--<div style="float: left; background-color: #99CCFF; margin-left: 30px; padding-left: 20px;
        width: 609px;">
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" align="center" height="60">
                    <b>สร้างไฟล์สื่อการสอน</b>
                </td>
            </tr>
            <tr>
                <td align="center" height="30" class="txtright">
                    ชื่อไฟล์ &nbsp;
                </td>
                <td class="txtleft">
                    <asp:TextBox ID="txtfilename" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtfilename" ID="regCheckType" CssClass="txtcolor"
                        ErrorMessage="กรุณาระบุชื่อไฟล์" InitialValue="N" runat="server" Display="Dynamic">* </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="60" class="txtright">
                    เลือกไฟล์สื่อการสอน &nbsp;
                </td>
                <td class="txtleft">
                    <asp:FileUpload ID="FileUploadMedia" runat="server" />
                    <asp:RequiredFieldValidator ControlToValidate="FileUploadMedia" ID="RequiredFieldValidator1"
                        CssClass="txtcolor" ErrorMessage="กรุณาเลือกไฟล์ที่คุณต้องการ" InitialValue="N"
                        runat="server" Display="Dynamic">* </asp:RequiredFieldValidator>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td height="60" class="txtright">
                    รายละเอียดเพิ่มเติม &nbsp;
                </td>
                <td class="txtleft">
                    <asp:TextBox ID="txtdesciption" runat="server" Height="55px" TextMode="MultiLine"
                        Width="253px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" height="60" class="txtright">
                     <asp:Button ID="btnsave" runat="server" Height="22px" onclick="UploadFile" 
                    Text="บันทึก" Width="71px" ValidationGroup="Reg1" />&nbsp;
                             
                <asp:Button ID="btncancel" runat="server" Text="ยกเลิก" 
                    PostBackUrl="~/WebPage/BackYard/ClassRoom/fileMedia.aspx" />&nbsp;

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="txtcolor" 
                    DisplayMode="BulletList" 
                    HeaderText="กรุณากรอกข้อมูลตามรายละเอียดด้านล่างให้ครบ" ShowMessageBox="false" 
                    ShowSummary="true" ValidationGroup="Reg1" />
                    <div style="float: left; clear: both; width: 298px; margin-top: 30px; margin-left: 15%;">
                        <asp:LinkButton ID="lbtnsave" runat="server" CssClass="Buttonsave_UploadfileMediaTeacher"
                            OnClick="UploadFile"></asp:LinkButton>
                        <a href='FileMediaTeacher.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
                            <div class="ButtonCancel_UploadfileMediaTeacher">
                            </div>
                        </a>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" height="60">
                    &nbsp;
                </td>
            </tr>
        </table>
   </div>--%>
   <div style="clear: both; background-repeat: no-repeat; height: 104px; width: 667px; padding-top: 20px;" 
        align="left">
   
       <img alt="" class="style3" src="../../../image/Back/HeaderPageUpload.png" /></div>
    <div style="clear: both; padding-top: 5px;">
        <div class="uploadfile_detail_box">
        <p align="left" 
                style="font-family: tahoma; font-size: medium; padding-top: 20px; padding-right: 10px; padding-left: 20px;">
            <img alt="" class="style4" src="../../../image/Back/add_file_icon.png" 
                style="width: 22px; height: 25px; margin-right: 10px;" />สร้างไฟล์สื่อการสอน</p>
           <br/><br/>
           
           <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" height="30" class="txtright" style="padding-right: 10px">
                    ชื่อไฟล์
                </td>
                <td class="txtleft">
                    <asp:TextBox ID="txtfilename" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtfilename" ID="regCheckType" CssClass="txtcolor"
                        ErrorMessage="กรุณาระบุชื่อไฟล์" InitialValue="N" runat="server" Display="Dynamic">* </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="60" class="txtright" style="padding-right: 10px">
                    เลือกไฟล์สื่อการสอน
                </td>
                <td class="txtleft">
                    <asp:FileUpload ID="FileUploadMedia" runat="server" 
                        CssClass="textbox_in_back" />
                    <asp:RequiredFieldValidator ControlToValidate="FileUploadMedia" ID="RequiredFieldValidator1"
                        CssClass="txtcolor" ErrorMessage="กรุณาเลือกไฟล์ที่คุณต้องการ" InitialValue="N"
                        runat="server" Display="Dynamic">* </asp:RequiredFieldValidator>
                    &nbsp;
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
                     <asp:Button ID="btnsave" runat="server" onclick="UploadFile" 
                    Text="บันทึก" ValidationGroup="Reg1" CssClass="button_in_back" />
                             
                <asp:Button ID="btncancel" runat="server" Text="ยกเลิก" 
                    PostBackUrl="~/WebPage/BackYard/ClassRoom/fileMedia.aspx" 
                         CssClass="button_in_back" />

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="txtcolor" 
                    DisplayMode="BulletList" 
                    HeaderText="กรุณากรอกข้อมูลตามรายละเอียดด้านล่างให้ครบ" ShowMessageBox="false" 
                    ShowSummary="true" ValidationGroup="Reg1" />
                </td>
            </tr>
            </table>
        </div>
    </div>
</asp:Content>
