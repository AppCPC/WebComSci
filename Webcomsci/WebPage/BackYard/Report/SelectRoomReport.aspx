<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true"
    CodeBehind="SelectRoomReport.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Report.SelectRoomReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js"
        type="text/javascript"></script>
    <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <div align="left">
        <img src="../../../image/Title/Report.png" /></div>
    <div class="fontHead2" style="margin-top: 5px; margin-bottom: 10px">
        กรุณาเลือกห้องที่ต้องการ</div>
    <div class="content_box_curve" style="clear: both; float: left; margin-left: 20px;">
        <div style="width: 354px; float: left;">
            <ul>
                <li class="button_roomMange"><a href='ReportTeacher.aspx' class="button_roomMange">
                    <div align="left" class="RoomName_roomMange">
                        <asp:Label ID="Label1" runat="server" Text="ห้อง ว.ค.ท. 1/1"></asp:Label></div>
                </a></li>
            </ul>
        </div>
        <div style="width: 354px; float: left;">
            <ul>
                <li class="button_roomMange"><a href='ReportTeacher.aspx' class="button_roomMange">
                    <div align="left" class="RoomName_roomMange">
                        <asp:Label ID="Label2" runat="server" Text="ห้อง ว.ค.ท. 1/2"></asp:Label></div>
                </a></li>
            </ul>
        </div>
        <div style="width: 354px; float: left;">
            <ul>
                <li class="button_roomMange"><a href='ReportTeacher.aspx' class="button_roomMange">
                    <div align="left" class="RoomName_roomMange">
                        <asp:Label ID="Label3" runat="server" Text="ห้อง ว.ค.ท. 2/1"></asp:Label></div>
                </a></li>
            </ul>
        </div>
        <div style="width: 354px; float: left;">
            <ul>
                <li class="button_roomMange"><a href='ReportTeacher.aspx' class="button_roomMange">
                    <div align="left" class="RoomName_roomMange">
                        <asp:Label ID="Label4" runat="server" Text="ห้อง ว.ค.ท. 2/2"></asp:Label></div>
                </a></li>
            </ul>
        </div>
    </div>
</asp:Content>
