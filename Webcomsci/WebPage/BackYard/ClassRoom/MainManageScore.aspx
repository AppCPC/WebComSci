<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="MainManageScore.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.MainManageScore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script type="text/javascript">
     document.forms[0]["txtCheckname"].focus();
   </script>
 
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <link rel="Stylesheet" href="../../../css/skins/TabGroup.css" />
    <div align="left">
        </div>
    <p align="left" style="margin-top: 20px;font-size:18px; margin-left: 20px">
        <b>กำหนดขอบเขตของคะแนน</b></p><br />
       
         <div class="content_box_curve">

  
  
        <div align="right" class="Area_PictureUpload_FileMediaTeacher">
            <div align="left" >
            <p><strong>จัดการขอบเขตคะแนน</strong>&nbsp;
                </p>

                <div id="pGran">
                    <p><strong>กรอกขอบเขตคะแนน..</strong></p>

                <table style="width: 100%;">
                    <tr>
                        <td>
                            คะแนนเก็บ</td>
                        <td><asp:TextBox ID="txtsaveScore" runat="server" CssClass="textbox_in_back">0</asp:TextBox>&nbsp;</td>
                        <td>
                            คะแนน</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;<asp:CheckBox ID="CheckBoxCheckName" 
                                runat="server" Text="คะแนนเช็คชือ" 
                                oncheckedchanged="CheckBoxCheckName_CheckedChanged" AutoPostBack="True" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtCheckname" runat="server" CssClass="textbox_in_back" >0</asp:TextBox>
                        </td>
                        <td>
                            คะแนน</td>
                    </tr>

                               <tr>
                        <td colspan="3">
                            <div id="divconditionID" runat="server" visible="false">
                                <fieldset>
                                    <legend>เงือนไข </legend>
                                    <p id="pinclass" runat="server" visible="false">
                                        เข้าเรียน&nbsp;&nbsp; &nbsp;
                                        <asp:TextBox ID="txtlate" runat="server" CssClass="textbox_in_back">0</asp:TextBox>
                                        &nbsp;ครั้ง นับเป็นขาด 1&nbsp;ครั้ง
                                    </p>
                                    &nbsp;
                                    <p>
                                        <asp:RadioButtonList ID="RadioButtonListCondition" runat="server" 
                                            AutoPostBack="True" 
                                            onselectedindexchanged="RadioButtonListCondition_SelectedIndexChanged">
                                            <asp:ListItem Value="A">เข้าเรียนสาย</asp:ListItem>
                                            <asp:ListItem Value="B">คิดเฉพาะวันที่เข้าเรียนตรงเวลา </asp:ListItem>
                                            <asp:ListItem Value="C">นับวันที่มีการเข้าเรียน</asp:ListItem>
                                            <asp:ListItem Value="N">ไม่มีเงือนไข</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </p>
                                    <p>
                                        <asp:Label ID="lblAlert" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        &nbsp;</p>
                                    <p>
                                        &nbsp;</p>
                                </fieldset>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            คะแนนสอบกลางภาค</td>
                        <td>
                            <asp:TextBox ID="txtMidterm" runat="server" CssClass="textbox_in_back">0</asp:TextBox>
                        </td>
                        <td>
                            คะแนน</td>
                    </tr>
                    <tr>
                        <td>
                            คะแนนสอบปลายภาค</td>
                        <td>
                            <asp:TextBox ID="txtfinal" runat="server" CssClass="textbox_in_back" >0</asp:TextBox>
                        </td>
                        <td>
                            คะแนน</td>
                    </tr>
                    <tr>
                        <td>
                            รวม</td>
                        <td>
                            <asp:Label ID="lblAllscore" runat="server" Text="100"></asp:Label>
                        </td>
                        <td>
                            คะแนน</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                  <%--   <tr>
                        <td>
                            เกรด F คะแนนน้อยกว่า</td>
                        <td>
                            <asp:TextBox ID="txtF" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblF" runat="server"></asp:Label>
                        </td>
                    </tr>--%>
                </table>
            </div>
            </div>
            <br />
            <%--   <a href='CreateMediafile.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
      </a>
     <div id="upload" class="PictureUpload_FileMediaTeacher" runat="server"></div>--%><%--             <input id="btncomfirm" type="button" value="+ ตกลง" class="button_in_back"   onClick="location.href='AddEducateStudentInclass.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>' " />
                    --%>

            <asp:Button ID="btnsaveDetailGrade" class="button_in_back" runat="server" 
                Text="ถัดไป&gt;&gt;" onclick="btnsaveDetailGrade_Click" />

        
            
    </div>

         
        </div>

</asp:Content>
