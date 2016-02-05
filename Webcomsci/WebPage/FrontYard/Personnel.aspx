<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true"
    CodeBehind="Personnel.aspx.cs" Inherits="Webcomsci.Personnel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style23
        {
            width: 139px;
            height: 175px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="Stylesheet" href="../../css/skins/blue.css" />
    <div class="fontTitle_Personnel">
        <p align="left" style="padding-left: 10px">
            บุคลากร</p>
            <p align="left" style="font-size: small; color: #fff;">อาจารย์ประจำ สาขาวิทยาการคอมพิวเตอร์</p>
    </div>
    <div class="tebcontent" align="center">
        <%-- <table cellpadding="0" cellspacing="0" class="style4" style="height: 711px">
        <tr>
            <td align="center" class="style16">
                <img alt="" class="style15" src="../../image/teacher/01.jpg" /></td>
            <td class="style20">
                <p>หัวหน้าสาขาวิชาวิทยาการคอมพิวเตอร์</p>
                   <p>อาจารย์สุธีรา   วงศ์อนันทรัพย์</p></td>
        </tr>
        <tr>
            <td align="center" class="style18" >
                <img alt="" class="style15" src="../../image/teacher/02.jpg" /></td>
            <td class="style19">
            <p>อาจารย์ประจำสาขาวิชาวิทยาการคอมพิวเตอร์</p>
                   <p>ผู้ช่วยศาสตราจารย์สมศักดิ์  รักเกียรติวินัย</p>
                </td>
        </tr>
        <tr>
            <td align="center" class="style22" >
                <img alt="" class="style15" src="../../image/teacher/03.jpg" /></td>
            <td class="style21">
                 <p>อาจารย์ประจำสาขาวิชาวิทยาการคอมพิวเตอร์</p>
                   <p>อาจารย์รัฐ  บุรีรัตน์</p></td>
        </tr>
    </table>--%>
        <div class="Areahilight_Personnel">
            <img alt="" class="style23" src="../../image/teacher/01.jpg" style="border-top-style: solid;
                border-left-style: solid; border-top-width: 5px; border-left-width: 5px; border-top-color: #FF9933;
                border-left-color: #FF9933;"  />
            <p class="fontnameOrange_Personnel">
                อาจารย์สุธีรา วงศ์อนันทรัพย์</p>
            <p class="fontPositionblue_Personnel">
                หัวหน้าสาขาวิชาวิทยาการคอมพิวเตอร์</p>
        </div>
        <div class="Area_Personnels">
            <div class="Areahilight_Personnel" align="center" style="float: left">
                <img alt="" class="style23" src="../../image/teacher/02.jpg" style="border-top-style: solid;
                    border-left-style: solid; border-top-width: 5px; border-left-width: 5px; border-top-color: #009933;
                    border-left-color: #009933" />
                <p class="fontnameOrange_Personnel">
                    ผู้ช่วยศาสตราจารย์สมศักดิ์ รักเกียรติวินัย</p>
                <p class="fontnameOrange_Personnel">
                    อาจารย์ประจำสาขาวิชาวิทยาการคอมพิวเตอร์</p>
            </div>
            <div class="Areahilight_Personnel" align="center" style="float: right">
                <img alt="" class="style23" src="../../image/teacher/03.jpg" style="border-top-style: solid;
                    border-left-style: solid; border-top-width: 5px; border-left-width: 5px; border-top-color: #009933;
                    border-left-color: #009933" />
                <p class="fontnameOrange_Personnel">
                    อาจารย์รัฐ บุรีรัตน์</p>
                <p class="fontnameOrange_Personnel">
                    อาจารย์ประจำสาขาวิชาวิทยาการคอมพิวเตอร์</p>
            </div>
        </div>
    </div>
</asp:Content>
