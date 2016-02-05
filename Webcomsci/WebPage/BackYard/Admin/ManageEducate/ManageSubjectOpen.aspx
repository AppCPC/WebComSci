<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManageSubjectOpen.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManageSubjectOpen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   
         <link href="../../../../css/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
       <link href="../../../../css/bootstrap/css/bootstrap-responsive.min.css" type="text/css" />
       <link href="../../../../css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
      <link href="../../../../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script src="../../../../css/bootstrap/js/bootstrap.js" type="text/jscript"></script>
    <script src="../../../../css/bootstrap/js/bootstrap.min.js" type="text/jscript"></script>





<div style="width: 95%; height: auto; text-align:left;">
    <ul class="nav nav-list">
        <li class="active"><a href="#"><i class="icon-home icon-white"></i>จัดการรายวิชาที่เปิดสอน</a></li>
        <br />
        <br />
        <div style="text-align: center;">
            ปีการศึกษา
            <asp:DropDownList ID="ddlYear" runat="server" Height="30px" Width="150px" CssClass="btn dropdown-toggle"
                AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
       <div style="text-align: right;" class="form-actions">
     <%--        <asp:Button ID="btnsearch" runat="server" Text="ค้นหา" CssClass="btn btn-success" OnClick="btnsearch_Click" />--%>
            &nbsp;
            <%--<asp:Button ID="btnmanage" runat="server" Text="จัดการข้อมูลย้อนหลัง" 
        CssClass="button_in_admin" 
        PostBackUrl="~/WebPage/BackYard/Admin/AddDetailTeachAfter.aspx" />--%>
            <asp:Button ID="btn" runat="server" Text="เปิดรายวิชาใหม่" class="btn btn-primary"
                PostBackUrl="~/WebPage/BackYard/Admin/ManageEducate/AddSubjectOpen.aspx"/>
            <br />
            <div style="text-align: left;">
                <asp:Repeater ID="SubRepeater" runat="server">
                    <ItemTemplate>
                        <span>
                            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;<li class="icon-book"></li>
                                <%# " นักศึกษารหัสปีการศึกษา " + DataBinder.Eval(Container.DataItem, "edu")%>
                            </a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceYearEducate" runat="server" ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>"
            SelectCommand="SELECT  DISTINCT ' นักศึกษารหัสปีการศึกษา '+[EduStdYear] as edu FROM [EducationOfStudents]">
        </asp:SqlDataSource>

        </ul>
    </div>
</asp:Content>
