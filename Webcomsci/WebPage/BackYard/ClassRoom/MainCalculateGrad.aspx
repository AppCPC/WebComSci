<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="MainCalculateGrad.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.MainCalculateGrad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <link rel="Stylesheet" href="../../../css/skins/TabGroup.css" />
    <div align="left">
        </div>
    <p align="left" style="margin-top: 20px;font-size:18px; margin-left: 20px">
        <b>เลือกประเภทผลการเรียนเพื่อต้องการให้ประมวลผลการเรียน</b></p><br />
       
         <div class="content_box_curve">

  
  
        <div align="right" class="Area_PictureUpload_FileMediaTeacher">
            <div align="left" >
            <p><strong>ประเภทผลการเรียน</strong>  &nbsp;
                <asp:DropDownList ID="ddlTypeCheckGrad" runat="server" 
                    onselectedindexchanged="ddlTypeCheckGrad_SelectedIndexChanged" 
                    AutoPostBack="True">
                    <asp:ListItem Value="N">--เลือก--</asp:ListItem>
                    <asp:ListItem Value="A">แบบอิงกลุ่ม</asp:ListItem>
                    <asp:ListItem Value="B">แบบอิงเกณฑ์</asp:ListItem>
                   <%--  <asp:ListItem Value="C">แบบ T-Score</asp:ListItem>--%>
                </asp:DropDownList></p>

                <div id="pGran" runat="server" visible="false">
                    <p><strong>กรอกคะแนนที่ใช้ในการเปรียบเทียบ..</strong></p>

                <table style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp;เกรด A คะแนนมากกว่า  
                        </td>
                        <td><asp:TextBox ID="txtA" runat="server" CssClass="textbox_in_back"></asp:TextBox>&nbsp;</td>
                        <td>
                            <asp:Label ID="lblA" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        &nbsp;เกรด B+ คะแนนมากกว่า</td>
                        <td>
                            <asp:TextBox ID="txtBpus" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblBpus" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;เกรด B คะแนนมากกว่า</td>
                        <td>
                            <asp:TextBox ID="txtB" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblB" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;เกรด C+ คะแนนมากกว่า</td>
                        <td>
                            <asp:TextBox ID="txtCpus" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblCpus" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            เกรด C คะแนนมากกว่า</td>
                        <td>
                            <asp:TextBox ID="txtC" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblC" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            เกรด D+ คะแนนมากกว่า</td>
                        <td>
                            <asp:TextBox ID="txtDpus" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblDpus" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            เกรด D คะแนนมากกว่า</td>
                        <td>
                            <asp:TextBox ID="txtD" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblD" runat="server"></asp:Label>
                        </td>
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
