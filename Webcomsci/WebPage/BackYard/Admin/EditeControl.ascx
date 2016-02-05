<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditeControl.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.EditeControl" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="HTMLEditor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />

   <p>
       &nbsp;</p>
    <div style="margin-left:790px;margin-top:-20px;">
        <asp:ImageButton ID="imgClose" runat="server" ImageUrl="~/image/close_button.png"  />
    </div>
    <p>
        &nbsp;</p>
    <table style="width:98%; text-align:left; margin-right: 0px; height: 548px;" >
        <tr>
            <td  colspan="2"><strong>&nbsp;ข่าวกิจกรรมนักศึกษา..</strong></td>
            <%-- <td class="auto-style27">&nbsp;</td> --%>
        </tr>
        <tr>
            <td class="auto-style33">ชื่อเรื่อง:</td>
            <td class="auto-style26">
                <asp:TextBox ID="txtPoPtitle" runat="server"></asp:TextBox>
            </td>
            <tr>
                <td class="auto-style32">รูปภาพ:</td>
                <td class="auto-style27">
                    <div id="test" runat="server" style="position:absolute;margin-left:400px;margin-top:-50px;">
                        <asp:ImageButton ID="imgPopPic" runat="server" Height="98px" Visible="False" Width="91px" />
                    </div>
                    <asp:FileUpload ID="FUCPic" runat="server" Height="27px" style="margin-left: 0px" Width="207px" />
                    &nbsp;
                  
                    <%--     <asp:Image ID="Img" runat="server" ControlStyle-Height="50" ControlStyle-Width="50" Height="107px" style="margin-left: 0px" Width="113px" />
                    <asp:Button ID="UploadButton" runat="server" Height="25px" text="Upload" Width="105px" />--%></td>
            </tr>
            <tr>
                <td class="auto-style33">สถานะ:</td>
                <td class="auto-style26">
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Value="active">เผยแพร่</asp:ListItem>
                        <asp:ListItem Value="unactive">ไม่เผยแพร่</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style32">วันหมดอายุ</td>
                <td class="auto-style27">
                    <asp:TextBox ID="txtPopdate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtPopdate" CssClass="MyCalendar"  Format="dd/MM/yyyy"/>
                </td>
                <caption style="background-color: #999999; font-weight: bold; color: #FFFFFF; margin-left: 14px;">
                    แก้ไขข้อมูล<tr>
                        <td class="auto-style32">รายละเอียด:</td>
                        <td class="auto-style27">
                            <table style="width:100%;">
                                <tr>
                                    <td class="auto-style19">&nbsp;</td>
                                </tr>
                            </table>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style27">
                                    <div style="width: 631px">
                                        <asp:UpdatePanel ID="updatePanel1" runat="server">
                                            <ContentTemplate>
                                                <HTMLEditor:Editor ID="editorPopup0" runat="server" AutoFocus="true" Height="300px" style="text-align: center" Width="100%" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                        </td>
                    </tr>
                </caption>
                <tr>
                    <td class="auto-style32">&nbsp;</td>
                    <td class="auto-style27">
                        <center>
                            
                            &nbsp;<asp:Button ID="btnsave" runat="server" Height="34px" OnClick="btnsave_Click" Text="บันทึกข้อมูล" Width="96px" />
&nbsp;<asp:Button ID="btnCancel" runat="server" Height="34px" OnClick="btnCancel_Click" Text="ยกเลิก" Width="66px" />
                        </center>
                    </td>
                </tr>
    </table>
    

