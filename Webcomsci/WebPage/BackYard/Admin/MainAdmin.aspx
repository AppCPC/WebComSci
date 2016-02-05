<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="MainAdmin.aspx.cs" Inherits="Webcomsci.Admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div style="border-style: none; border-color: inherit; border-width: medium; width: 930px; margin-top: 5px; padding-top: 10px; margin-bottom: 20px; height: 471px;">
      <br />
        <div style="width: 817px; padding-left: 5px; display: table; margin-bottom: 10px; padding-bottom: 5px; height: 320px; margin-left: 0px;" 
            align="left">
            <div style="border-style: none; border-color: inherit; border-width: medium; width: 756px; background-color: #F3F3F3;">

            
          <a href=searchBranchNews.aspx> <div class="ListMenu" >
                <img alt=""  class="ImgListMenu" 
                    src="../../../image/Admin/Menu/file_document_paper_green_g14314.png" /><br />
                การจัดการบทความข่าวสาขา</div></a>

            <a href=SearchTrainning.aspx> <div class="ListMenu">
              <img alt="" class="ImgListMenu" 
                    src="../../../image/Admin/Menu/file_document_paper_orange_g11822.png" /><br />
                การจัดการบทความข่าวฝึกอบรม</div></a>


             <a href=SearchStudentNews.aspx> <div class="ListMenu">
              <img alt="" class="ImgListMenu" 
                    src="../../../image/Admin/Menu/file_document_paper_green_g21743.png" /><br />
                การจัดการข่าวกิจกรรมนักศึกษา</div></a>

            <a href="ApproveKm.aspx"><div class="ListMenu">
                <img alt="" class="ImgListMenu" 
                    src="../../../image/Admin/Menu/file_document_paper_blue_g38802.png" /><br />
                การจัดการองค์ความรู้</div></a>



           <a href=SearchAssurance.aspx><div class="ListMenu">
                <img alt="" class="ImgListMenu" 
                    src="../../../image/Admin/Menu/file_document_paper_blue_g11856.png" /><br />
                ประกันคุณภาพ</div></a> 

                  <a href=ManageUserEmployee.aspx><div class="ListMenu">
                <img alt="" class="ImgListMenu" 
                    src="../../../image/Admin/Menu/file_document_paper_blue_g11856.png" /><br />
                จัดการข้อมูลพนักงาน</div></a> 

                   <a href=ManageUserTeacher.aspx><div class="ListMenu">
                <img alt="" class="ImgListMenu" 
                    src="../../../image/Admin/Menu/file_document_paper_blue_g11856.png" /><br />
                จัดการข้อมูลอาจารย์</div></a> 

                   <a href=ManageUseStudent.aspx><div class="ListMenu">
                <img alt="" class="ImgListMenu" 
                    src="../../../image/Admin/Menu/file_document_paper_blue_g11856.png" /><br />
                จัดการข้อมูลนักศึกษา</div></a> 
         
        </div>
   </div>
    
</asp:Content>
