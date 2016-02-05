<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true" CodeBehind="checkName.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.checkName" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style2
        {
            width: 107px;
        }
        .style3
        {
            width: 137px;
        }
        .style4
        {
            width: 93px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="Stylesheet" href="../../../css/skins/TabRoom.css" />
                <link href="../../../css/skins/TabGroup.css" rel="Stylesheet" />
 <div id='cssmenutab'>
<ul>
   <li><a href="CommentClassroom.aspx"><span>แสดงความคิดเห็น</span></a></li>
   <li><a href="fileMedia.aspx"><span>สื่อการสอน</span></a></li>
   <li><a href="MainHomework.aspx"><span>การบ้าน</span></a></li>
   <li><a href="checkName.aspx"><span>เช็คชื่อ</span></a></li>
</ul>
</div><br />

   <%-- <table style="width: 100%;">
        <tr>
            <td class="style2">
                &nbsp; การบ้าน</td>
            <td class="style3">
                &nbsp;
            </td>
            <td class="style4">
                &nbsp;
                </td>
        </tr>
        <tr>
            <td class="style2">
                สร้างชื่อไฟล์&nbsp;
            </td>
            <td class="style3">
                &nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="132px"></asp:TextBox>
            </td>
            <td class="style4">
                &nbsp;
                <asp:Button ID="btnCreate" runat="server" Text="สร้างไฟล์" />
            </td>
               <td>
                &nbsp;
            </td>
        </tr>

           <tr>
            <td class="style2">
               ครั้งที่เช็คชื่อ&nbsp;
            </td>
            <td class="style3">
                &nbsp;
                </td>
            <td class="style4">
                &nbsp;
            </td>
               <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
    

                <div id="cssmenu" align="left">
                    <ul>
                        <li><a href="#"><span>21/11/2555</span></a></li>
                        <li><a href="#"><span>22/11/2555</span></a></li>
                        <li><a href="#"><span>23/11/2555</span></a></li>
                        <li><a href="#"><span>24/11/2555</span></a>
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
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </li>
                    </ul>
                </div>


            </td>
            <td class="style4">
                &nbsp;
            </td>
               <td>
                &nbsp;
            </td>
        </tr>
    </table>--%>


    <div class="fontHead2">กรุณาเลือกห้องที่ต้องการเช็คชื่อ</div>
   
  
             <div id="cssmenu" align="left" style="padding-left: 50px">
                    <ul>
                        <li><a href="checkName2.aspx"><span>วคท 4/1</span></a></li>
                        <li><a href="checkName2.aspx"><span>วคท 4/2</span></a></li>
                        <li><a href="#"><span>วคท 3/1</span></a></li>
                        <li><a href="#"><span>วคท 3/2</span></a>
                        <li><a href="#"><span>สร้างใหม่</span></a>
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
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </li>
                    </ul>
                </div>
         

</asp:Content>
