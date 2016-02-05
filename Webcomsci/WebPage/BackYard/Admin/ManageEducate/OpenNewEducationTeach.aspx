<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="OpenNewEducationTeach.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManageEducate.OpenNewEducationTeach" %>
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
        <li class="active"><a href="#"><i class="icon-home icon-white"></i>เปิดรายวิชาปีการศึกษาใหม่</a></li>
        <br />
        <br />
        <div style="text-align: center;">
            ปีการศึกษาที่เปิด&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <%--<asp:DropDownList ID="ddlYearEdu" runat="server" Height="30px" Width="150px" CssClass="btn dropdown-toggle"
                AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
            </asp:DropDownList>--%>
            <asp:Label ID="lblYearEdu" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            หลักสูตรปีการศึกษา &nbsp;
            <asp:DropDownList ID="ddlYearEdu" runat="server" Height="30px" Width="150px" 
                CssClass="btn dropdown-toggle" 
                DataSourceID="SqlDataSourcYearCurri" DataTextField="Curri_Year" 
                DataValueField="Curri_Year">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourcYearCurri" runat="server" 
                ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                SelectCommand="SELECT distinct [Curri_Year] FROM [Curriculum]  order by  [Curri_Year] desc "></asp:SqlDataSource>
        </div>
       <div style="text-align: right;" class="form-actions">
            <asp:Button ID="btn" runat="server" Text="ยืนยันการเปิดแผนการศึกษานักศึกษาใหม่" class="btn btn-primary"
                PostBackUrl="~/WebPage/BackYard/Admin/ManageEducate/AddSubjectOpen.aspx" 
                onclick="btn_Click" 
                onclientclick="return confirm('คุณต้องการเปิดรายวิชาใหม่ ! ')"/>
            <br />
            <div style="text-align: left;">
                <asp:Label ID="lblDetail" runat="server" style="font-weight: 700;color:Red;"></asp:Label>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceYearEducate" runat="server" ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>"
            SelectCommand="SELECT  DISTINCT ' นักศึกษารหัสปีการศึกษา '+[EduStdYear] as edu FROM [EducationOfStudents]">
        </asp:SqlDataSource>

        </ul>
    </div>
</asp:Content>
