<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true" CodeBehind="Curriculum.aspx.cs" Inherits="Webcomsci.Curriculum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link rel="Stylesheet" href="../../css/skins/blue.css" />
<div class="tebcontent">
    <p class="fontHead2">โครงสร้างหลักสูตร</p>
   <p class="Title_Curriculum">หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ หลักสูตรปรับปรุง พ.ศ.<asp:Label 
           ID="lblyear" runat="server"></asp:Label>
&nbsp;องค์ประกอบของหลักสูตร แบ่งเป็นหมวดวิชาที่สอดคล้องกับที่กำหนดไว้ในเกณฑ์มาตรฐานหลักสูตรของกระทรวงศึกษาธิการ ดังนี้</p>
<br />
<div class="content_Curriculum">
    <p class="fontnumber">1. จำนวนหน่วยกิตรวมตลอดหลักสูตร</p>
    <p class="fontnumber2">&nbsp;<asp:Label ID="lblCrediteAll" runat="server"></asp:Label>
        หน่วยกิต</p>
</div>
    <div class="content_Curriculum">
    <p class="fontnumber">2. โครงสร้างหลักสูตร</p>
    <p class="fontnumber2"></p>
</div>
<%--<div class="content_Curriculum">
    <p class="fontnumber">1) หมวดวิชาศึกษาทั่วไป</p>
    <p class="fontnumber4">50 หน่วยกิต</p>
    <p class="fontnumber3">1.1 กลุ่มวิชาสังคมศาสตร์</p>
    <p class="fontnumber4">6 หน่วยกิต</p>
    <p class="fontnumber3">1.2 กลุ่มวิชามนุษยศาสตร์</p>
    <p class="fontnumber4">6 หน่วยกิต</p>
    <p class="fontnumber3">1.3 กลุ่มวิชาภาษา</p>
    <p class="fontnumber4">12 หน่วยกิต</p>
    <p class="fontnumber3">1.4 กลุ่มวิชาวิทยาศาสตร์กับคณิตศาสตร์</p>
    <p class="fontnumber4">24 หน่วยกิต</p>
    <p class="fontnumber3">1.5 กลุ่มวิชาพลศึกษาหรือนันทนาการหรือกิจกรรม</p>
    <p class="fontnumber4">2 หน่วยกิต</p>
</div>
<div class="content_Curriculum">
    <p class="fontnumber">2) หมวดวิชาเฉพาะ</p>
    <p class="fontnumber4">90 หน่วยกิต</p>
    <p class="fontnumber3">2.1 กลุ่มวิชาพื้นฐานวิชาชีพ</p>
    <p class="fontnumber4">12 หน่วยกิต</p>
    <p class="fontnumber3">2.2 กลุ่มวิชาชีพบังคับ</p>
    <p class="fontnumber4">66 หน่วยกิต</p>
    <p class="fontnumber3">2.3 กลุ่มวิชาชีพเลือก </p>
    <p class="fontnumber4">12 หน่วยกิต</p>
</div>--%>

<div class="content_Curriculum" id="contentCurri" runat="server">
<%--    <p class="fontnumber">3) หมวดวิชาเลือกเสรี </p>
    <p class="fontnumber4">6 หน่วยกิต</p>
   
</p>--%>
</div>



</div>



</asp:Content>
