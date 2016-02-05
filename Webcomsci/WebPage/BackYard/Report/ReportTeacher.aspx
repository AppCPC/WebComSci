<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true" CodeBehind="ReportTeacher.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Report.ReportTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

        <div align="left">
        <img src="../../../image/Title/Report.png" /></div>


        <div style="width: 58%; margin-left: 90px; margin-top: 20px; float: left; height: 400px;">
       
        <div style="width: 100%" align="left">
        <div class="fontHead2" style="margin-bottom: 15px">กรุณาเลือกรายการที่ต้องการ</div></div>

         <div class="content_box_curve_smail" style="clear: both; float: left;">

           <div style="width: 354px; float: left;">
            <ul>
                <li class="button_checkName">
                    <a href='#'
                        class="button_checkName">
                        <div align="left" class="RoomName_checkName">
                            <asp:Label ID="Label1" runat="server" Text="สรุปการส่งการบ้าน"></asp:Label>
                            </div>
                    </a>
                </li>
            </ul>
        
        </div>


                      <div style="width: 354px; float: left;">
            <ul>
                <li class="button_checkName">
                    <a href='#'
                        class="button_checkName">
                        <div align="left" class="RoomName_checkName">
                            <asp:Label ID="Label2" runat="server" Text="สรุปการเช็คชื่อ"></asp:Label>
                            </div>
                    </a>
                </li>
            </ul>
        
        </div>


                      <div style="width: 354px; float: left;">
            <ul>
                <li class="button_checkName">
                    <a href='#'
                        class="button_checkName">
                        <div align="left" class="RoomName_checkName">
                            <asp:Label ID="Label3" runat="server" Text="สรุปเกรดนักศึกษา"></asp:Label>
                            </div>
                    </a>
                </li>
            </ul>
        
        </div>


        
        </div>

        </div>
        <a href="SelectRoomReport.aspx">
         <div style="background-position: right; width: 115px; height: 50px; float: right; background-image: url('../../../image/Detail/Icon_backward.png'); background-repeat: no-repeat; clear: both;"></div></a>

</asp:Content>
