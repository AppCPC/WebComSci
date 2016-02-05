<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Detail_Alumni.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.Detail_Alumni" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        #TextArea1
        {
            width: 309px;
            height: 81px;
        }
        #TextArea2
        {
            width: 309px;
            height: 81px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link rel="Stylesheet" href="../../../css/skins/Admin.css" />
<div style="border-style: groove; border-width: 1px; width: 662px; height: 475px; border-top-color: #999999;">

<div class="fontTitle_Detail_Alumni">รายละเอียดข้อมูล นักศึกษาศิษย์เก่า</div>
<div style="width: 211px; height: 249px; float: left; padding-top: 40px;">
    <asp:Image ID="Image1" runat="server" CssClass="Photo_Detail_Alumni" 
        ImageUrl="~/image/Alumni/550278.jpg" />
   </div>

   <div class="AreaContent_Detail_Alumni">

   <div class="Content_Detail_Alumni_smal">
   <div class="fontcontent_Detail_Alumni_left">ชื่อ</div>
   <div class="fontcontent_Detail_Alumni_right">
       <asp:TextBox ID="TextBox1" runat="server" Height="19px" Width="198px"></asp:TextBox>
   </div>
   </div>
  

     <div class="Content_Detail_Alumni_Big">
   <div class="fontcontent_Detail_Alumni_left">การศึกษา</div>
   <div class="fontcontent_Detail_Alumni_right">
       <textarea id="TextArea1"></textarea>

   </div>
   </div>

     <div class="Content_Detail_Alumni_Big">
   <div class="fontcontent_Detail_Alumni_left">การทำงาน</div>
   <div class="fontcontent_Detail_Alumni_right">
       <textarea id="TextArea2"></textarea>

   </div>
   </div>

    <div class="Content_Detail_Alumni_smal">
   <div class="fontcontent_Detail_Alumni_left2">วิทยาศาสตร์บัณฑิต รุ่นที่</div>
   <div class="fontcontent_Detail_Alumni_right">
       <asp:TextBox ID="TextBox2" runat="server" Height="19px" Width="35px"></asp:TextBox>
   </div>
   </div>
  </div>
  <div style="clear: both; padding-top: 25px;">
      <asp:Button ID="Button1" runat="server" Text="ตกลง" Height="27px" 
          Width="60px" />
      &nbsp;<asp:Button ID="Button2" runat="server" Text="ยกเลิก" Height="27px" 
          Width="60px" />
      &nbsp;<asp:Button ID="Button3" runat="server" Text="ย้อนกลับ" Height="27px" 
          Width="60px" />
    </div>

</div>
<br />

</asp:Content>
