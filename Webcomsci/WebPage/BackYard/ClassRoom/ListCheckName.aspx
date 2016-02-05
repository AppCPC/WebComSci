<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="ListCheckName.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.checkName2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            color: #FF3300;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link rel="Stylesheet" href="../../../css/skins/TabRoom.css" />
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
<%-- <div class="fontHead2" style="margin-top: 10px;">กรุณาเลือกรายการ</div>--%>
 <div class="Pictuefontselectmenu_ListCheckName"></div>
    <a href="ListCheckName.aspx"></a>
  



                <div style="width: 100%; height: 55px; float: left;">
                <a href='CheckNameStd.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;deEduStd=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>'><div class="Buttoncheckname_ListCheckName" id="chk" runat="server"></div></a>
                 <a href='DetailcheckName.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;deEduStd=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>'><div class="ButtondetailCheck_ListCheckName"></div></a>
                <a href='checkNameSum.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;deEduStd=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>'><div class="Buttonsummarize_ListCheckName"></div></a>
                <br />
                <br />
                <br />   
                <br />
                <br />
                    <span class="style2">**หมายเหตุ ทางระบบอนุญาติให้มีการเช็คชื่อได้ไม่เกิน 15 ครั้ง
                    <br />
                    ซึ่งขณะนี้ทางผู้ใช้มีการเช็คชือแล้วทั้งหมด<asp:Label ID="lblNumcheckname" runat="server" 
                        Text="Label"></asp:Label>
&nbsp;ครั้ง</span></div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
         <a href='MainCheckName.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
    <div style="background-position: right; width: 115px; height: 50px; float: right; background-image: url('../../../image/Detail/Icon_backward.png'); background-repeat: no-repeat;"></div></a> 

</asp:Content>
