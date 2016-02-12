<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Webcomsci.Home" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <link rel="Stylesheet" href="../../css/skins/slideshow.css" />
    <div class="main" align="center">
     <script type="text/javascript" language="javascript">

         Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoadedHandler) 
         function pageLoadedHandler(sender, args) { 
             window.scrollTo(0, 0); 
         }
            </script>
        <div class="rss-container">
            <div id="slideshow" class="rs-slideshow">

            <div class="slide-container">
                <%--  <img src="../../image/slideshow/mail_pic.png" />--%>
                <asp:Image ID="imgSlideShow" runat="server" />
                </div>
             <ol class="slides">

                <asp:repeater id="rptbind" runat="server">
                <ItemTemplate>

                  <li>

                    <a href='<%# Eval("path")  %>'>'></a>
                <%--  <div class="captclass="caption">--%>
                    <div class="caption">
								<p style="text-align:right;"> <a href='showDetailNews.aspx?id=5<%# Eval("id")%>' <b>ดูรายละเอียด..</b></a></p>
					</div>
				  </li>
                  </ItemTemplate>
            </asp:repeater>
                </ol>
            </div>
        </div>
    </div>

<script src="../../js/jquery.rs.slideshow.js"></script>
	<script src="../../js/html-captions-bootstrap.js"></script>

    <%--
                                <img alt="" class="style17" src="../../image/New.gif" /></span></p></div>

                         Training_Detail:
                          <asp:Label ID="Training_DetailLabel" runat="server"
                              Text='<%# Eval("Training_Detail") %>' />
                          <br />
                          Training_Path:
                          <asp:Label ID="Training_PathLabel" runat="server"
                              Text='<%# Eval("Training_Path") %>' />--%>   <%--  <img alt="" border="2" class="style16" src="../../image/Detail/3.jpg" /> --%>

<br />

  <div style="margin-left: 30px">
      <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
      </ajaxToolkit:ToolkitScriptManager>
      <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1"
          Width="630px" CssClass="Tab1">
          <ajaxToolkit:TabPanel runat="server" HeaderText="ข่าวสาขา" ID="TabPanel1">
              <ContentTemplate><div align="right" class="tab_color_Gray"><br /></div><asp:DataList ID="DataList2" runat="server" BackColor="White"
                      BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                      DataSourceID="SqlDataSourceBranchNews" GridLines="Vertical"
                      CssClass="set_Datalist"><AlternatingItemStyle BackColor="#9ABFCA" /><FooterStyle BackColor="#0066FF" ForeColor="Black" /><HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" /><ItemStyle BackColor="#9ABFCA" ForeColor="Black" /><%--ตรงนี้--%><ItemTemplate><div class="content_all"><div class="pic1"><div class="pic2"><asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("BranchNews_Path") %>' CssClass=style16 /></div></div><div class="text_content"><p class="fontblue2"><a href="showDetailNews.aspx?id=1<%# Eval("BranchNews_ID")%>" style="text-decoration:none;" ><b><asp:Label ID="Label1" runat="server" Text='<%# Eval("BranchNews_Name") %>' /></b><br /><asp:Label runat="server" ID="lblId"><%#Eval("BranchNews_Detail").ToString().Replace("&nbsp;", " ").Replace("<br />", " ").Substring(0, 128) + "..."%></asp:Label><br /></a><span class="fontred"><asp:Label ID="Label2" runat="server" Text='<%# Eval("Update_date") %>' /></span></p></div></div></ItemTemplate><SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" /></asp:DataList><div align="right" class="show_all"><a href="showAllBranchNews.aspx" style="text-decoration:none;" >Show All</a><br /> </div><asp:SqlDataSource ID="SqlDataSourceBranchNews" runat="server"
                      ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>"
                      SelectCommand="SELECT TOP 5  [BranchNews_ID],[BranchNews_Name], [BranchNews_Detail], [BranchNews_Path], [Update_date] FROM [BranchNews] order by [Update_date] desc"></asp:SqlDataSource></ContentTemplate>
</ajaxToolkit:TabPanel>

          <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="ข่าวฝึกอบรม">
              <HeaderTemplate>ฝึกอบรม</HeaderTemplate>

<ContentTemplate></span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span class="fontred"><span
        class="fontred"><span
        class="fontred"><span class="fontred">
    <span class="fontred"><span class="fontred">
    <asp:DataList ID="DataList1" runat="server" BackColor="White"
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        CssClass="set_Datalist" DataSourceID="SqlDataSourceTrainningNews"
        GridLines="Vertical">
        <AlternatingItemStyle BackColor="#9ABFCA" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#9ABFCA" ForeColor="Black" />
        <ItemTemplate>
            <div class="content_all">
                <div class="pic1">
                    <div class="pic2">
                        <%--  <img alt="" border="2" class="style16" src="../../image/Detail/3.jpg" /> --%>
                        <asp:Image ID="Image1" runat="server" CssClass="style16"
                            ImageUrl='<%# Eval("Training_Path") %>' />
                    </div>
                </div>
                <div class="text_content">
                    <p class="fontblue2">
                        <a href='showDetailNews.aspx?id=2<%# Eval("Training_ID")%>'
                            style="text-decoration:none;"><b>
                        <asp:Label ID="Training_NameLabel" runat="server"
                            Text='<%# Eval("Training_Name") %>' />
                        </b><span class="fontred">&nbsp;
                        <asp:Label ID="Create_dateLabel" runat="server"
                            Text='<%# Eval("Update_date") %>' />
                        &nbsp;
                        <p style="color:Black;">
                            <asp:Label ID="Training_DetailLabel" runat="server"
                                Text='<%# Eval("Training_Detail").ToString().Replace("&nbsp;", " ").Replace("<br />", " ").Substring(0, 128) + "..." %>' />
                        </p>
                        </span></a>
                    </p>
                </div>
            </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <span class="fontred"></span><span class="fontred"></span><span class="fontred">
    </span>
    <div align="right" class="show_all">
        <a href="showAllTrainningNews.aspx" style="text-decoration:none;">Show All</a><br />
    </div>
    <asp:SqlDataSource ID="SqlDataSourceTrainningNews" runat="server"
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>"
        SelectCommand="SELECT  TOP 5  [Training_ID],[Training_Name], [Training_Detail], [Training_Path], [Update_date] FROM [TrainingNews] order by   [Update_date] desc ">
    </asp:SqlDataSource>
    </span></span>
    </span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></ContentTemplate>
</ajaxToolkit:TabPanel>
      </ajaxToolkit:TabContainer>
  </div>
  <br />

<%--=======================================================================--%>

     <div style="margin-left: 30px">
         <ajaxToolkit:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="0"
             Width="630px" CssClass="Tab2">
             <ajaxToolkit:TabPanel runat="server" HeaderText="ผลงานสาขา" ID="TabPanel3">
                 <ContentTemplate><div align="right" class="tab_color_Gray"><br /></div><asp:DataList ID="DataList6" runat="server" BackColor="White"
                         BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                         DataSourceID="SqlDataSourceWorkbranchNews" GridLines="Vertical" CssClass="set_Datalist"><AlternatingItemStyle BackColor="#9ABFCA" /><FooterStyle BackColor="#CCCCCC" ForeColor="Black" /><HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" /><ItemStyle BackColor="#9ABFCA" ForeColor="Black" /><ItemTemplate><div class="content_all"><div class="pic1"><div class="pic2"><asp:Image ID="Image4" runat="server" CssClass="style16"
                                             ImageUrl='<%# Eval("WorkBranchNews_Path") %>' /></div></div><div class="text_content"><p class="fontWhite"><b><a href="showDetailNews.aspx?id=3<%# Eval("WorkBranchNews_ID")%>" style="text-decoration:none;" ><asp:Label ID="Label7" runat="server"
                                             Text='<%# Eval("WorkBranchNews_Name") %>' /></b><br /><asp:Label ID="BranchNews_DetailLabel2" runat="server"
                                             Text='<%# Eval("WorkBranchNews_Detail").ToString().Replace("&nbsp;", " ").Replace("<br />", " ").Substring(0, 128) + "..." %>' /></a><span class="fontorange"><br></br><asp:Label ID="Label8" runat="server" Text='<%# Eval("Update_date") %>' /></span></p></div></div></ItemTemplate><SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" /></asp:DataList><asp:SqlDataSource ID="SqlDataSourceWorkbranchNews" runat="server"
                         ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>"
                         SelectCommand="SELECT TOP 5  [WorkBranchNews_ID],[WorkBranchNews_Name], [WorkBranchNews_Detail], [WorkBranchNews_Path], [Update_date] FROM [WorkBranchNews]  order by   [Update_date] desc "></asp:SqlDataSource><div class="show_all" align="right"><a href="showAllWorkBranchNews.aspx" style="text-decoration:none;" >Show All</a><br /> </div></ContentTemplate>
             </ajaxToolkit:TabPanel>

             <ajaxToolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="กิจกรรมนักศึกษา">
                 <ContentTemplate><div align="right" class="tab_color_Gray"><br /></div><asp:DataList ID="DataList4" runat="server" BackColor="White"
                             BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                             DataSourceID="SqlDataSourceStudentNews" GridLines="Vertical"
                             CssClass="set_Datalist"><AlternatingItemStyle BackColor="#9ABFCA" /><FooterStyle BackColor="#CCCCCC" ForeColor="Black" /><HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" /><ItemStyle BackColor="#9ABFCA" ForeColor="Black" /><ItemTemplate>
                                                      <div class="content_all"><div class="pic1"><div class="pic2"><asp:Image ID="Image2" runat="server" CssClass="style16"
                                                         ImageUrl='<%# Eval("StudentNews_Path") %>' /></div></div><div class="text_content"><p class="fontWhite"><b><a href="showDetailNews.aspx?id=4<%# Eval("StudentNews_ID")%>" style="text-decoration:none;">
                                                         <asp:Label ID="Label3" runat="server" Text='<%# Eval("StudentNews_Name") %>' /></b><br>
                                                         <asp:Label ID="BranchNews_DetailLabel0" runat="server"
                                                           Text='<%# Eval("StudentNews_Detail").ToString().Replace("&nbsp;", " ").Replace("<br />", " ").Substring(0, 128) + "..." %>' />
                                                           <span class="fontorange"></a></br>
                                                           <asp:Label ID="Label4" runat="server" Text='<%# Eval("Update_date") %>' /></span></p></div>
                                                        </div>
                                                 </ItemTemplate><SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" /></asp:DataList><div align="right" class="show_all"><a href="showAllStudentNews.aspx" style="text-decoration:none;" >Show All</a> </div><asp:SqlDataSource ID="SqlDataSourceStudentNews" runat="server"
                         ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>"
                         SelectCommand="SELECT TOP 5 [StudentNews_ID],[StudentNews_Name], [StudentNews_Detail], [StudentNews_Path], [Update_date] FROM [StudentNews]  order by   [Update_date] desc "></asp:SqlDataSource></ContentTemplate>
             </ajaxToolkit:TabPanel>
         </ajaxToolkit:TabContainer>
     </div>

<%--=======================================================================--%>

     <br />

     <div style="margin-left: 30px">
         <%--<ajaxToolkit:TabContainer ID="TabContainer3" runat="server" ActiveTabIndex="0"
             Width="630px" CssClass="Tab3">
             <ajaxToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="องค์ความรู้">
                 <ContentTemplate><div class="content_all2"><div class="p0" style="float: left"><div style="width: 24px; float: left;" class="p1"><img alt="" class="style18"
                     src="../../image/Detail/55.png" /></div><div style="width: 49px; float: left;" class="p2"><p class="fontorange">13.00 น.</p></div></div><div class="text_content2"><p class="fontblack">รับสมัครนักศึกษาโควตา ประจำปีการศึกษา 2556<span
                        class="fontred"> เเผนกเเนะเเนว [05 พย. 2555] <img alt="" class="style17" src="../../image/New.gif" /></span></p></div></div><div class="content_all2"><div class="p0" style="float: left"><div style="width: 24px; float: left;" class="p1"><img alt="" class="style18"
                     src="../../image/Detail/55.png" /></div><div style="width: 49px; float: left;" class="p2"><p class="fontorange">13.00 น.</p></div></div><div class="text_content2"><p class="fontblack">ผู้สำเร็จการศึกษา ประจำปีการศึกษา ๒๕๕๔ ที่ยังไม่ได้กรอก ระบบภาวะการมีงานทำของบัณฑิต<span
                        class="fontred"> เเผนกเเนะเเนว [05 พย. 2555] <img alt="" class="style17" src="../../image/New.gif" /></span></p></div></div><div class="content_all2"><div class="p0" style="float: left"><div style="width: 24px; float: left;" class="p1"><img alt="" class="style18"
                     src="../../image/Detail/55.png" /></div><div style="width: 49px; float: left;" class="p2"><p class="fontorange">13.00 น.</p></div></div><div class="text_content2"><p class="fontblack">ประกาศมหาวิทยาลัยเทคโนโลยีราชมงคลตะวันออกเรื่องพิธีพระราชทานปริญญาบัตร <span
                        class="fontred">เเผนกเเนะเเนว [05 พย. 2555] <img alt="" class="style17" src="../../image/New.gif" /></span></p></div></div><div class="content_all2"><div class="p0" style="float: left"><div style="width: 24px; float: left;" class="p1"><img alt="" class="style18"
                     src="../../image/Detail/55.png" /></div><div style="width: 49px; float: left;" class="p2"><p class="fontorange">13.00 น.</p></div></div><div class="text_content2"><p class="fontblack">บัญชีรายชื่อนักศึกษาวิชาทหารเเละผลการสอบ<span
                        class="fontred"> เเผนกเเนะเเนว [05 พย. 2555] <img alt="" class="style17" src="../../image/New.gif" /></span></p></div></div><div class="content_all2"><div class="p0" style="float: left"><div style="width: 24px; float: left;" class="p1"><img alt="" class="style18"
                     src="../../image/Detail/55.png" /></div><div style="width: 49px; float: left;" class="p2"><p class="fontorange">13.00 น.</p></div></div><div class="text_content2"><p class="fontblack">รับสมัครคัดเลือกบุคคลเพื่อบรรจุเเละเเต่งตั้งเป็นลูกจ้างชั่วคราว<span
                        class="fontred"> เเผนกเเนะเเนว [05 พย. 2555] <img alt="" class="style17" src="../../image/New.gif" /></span></p></div></div><div align="right" class="show_all"><a href="../FrontYard/AllDetail.aspx?id=5">Show All</a><br /></div></ContentTemplate>
</ajaxToolkit:TabPanel>
         </ajaxToolkit:TabContainer>--%>
     </div>
     <script type="text/javascript" language="javascript">

         Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoadedHandler)

         function pageLoadedHandler(sender, args) {

             window.scrollTo(0, 0);

         }
</script>

<br />
</asp:Content>