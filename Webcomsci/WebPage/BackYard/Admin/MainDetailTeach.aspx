<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="MainDetailTeach.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.mainDetailTeach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style3
        {
            width: 73px;
            text-align: left;
        }
        .style14
        {
            width: 192px;
            text-align: left;
        }
        .style4
        {
            width: 25%;
            text-align: left;
        }
        .style16
        {
            width: 72px;
        }
        .style9
        {
            width: 73px;
            text-align: left;
            height: 24px;
        }
        .style15
        {
            width: 192px;
            text-align: left;
            height: 24px;
        }
        .style11
        {
            width: 25%;
            text-align: left;
            height: 24px;
        }
        .style21
        {
            width: 72px;
            text-align: left;
            height: 24px;
        }
        .style22
        {
            width: 73px;
            text-align: left;
            height: 26px;
        }
        .style23
        {
            width: 92px;
            text-align: left;
            height: 26px;
        }
        .style24
        {
            width: 25%;
            text-align: left;
            height: 26px;
        }
        .style25
        {
            width: 72px;
            height: 26px;
        }
        .styleLeft
        {
            
            text-align:left;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
    <div style="text-align:left;"> &nbsp;&nbsp;&nbsp;&nbsp; <b>
        หน้าหลักจัดการรายละเอียดการสอน</b></div>
    <table style="width:100%;">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style14" 
                style="font-family: tahoma; font-size: 15px; color: #000000" >
                ปีการศึกษาที่ปรับปรุงหลักสูตร</td>
        <td class="style4">
                <asp:DropDownList ID="ddlYear" 
                    runat="server" DataSourceID="SqlDataSourceYearEdu" 
                    DataTextField="Curri_Year" DataValueField="Curri_Year" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceYearEdu" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Curri_Year] FROM [Curriculum]"></asp:SqlDataSource>
                </td>
                      <td class="style16">
                          &nbsp;</td>

        </tr>
        <tr>
            <td class="style22">
                &nbsp;</td>
            <td class="style23" style="font-family: tahoma; font-size: 15px; color: #000000">
                ชั้นปี</td>
            <td class="style24">
                <asp:DropDownList ID="ddlclassYear" runat="server" Height="26px" Width="124px"> 
                    <asp:ListItem Value="N">-- เลือก --</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
            </td>
                      <td class="style25">
                          &nbsp;</td>
        </tr>
        <tr>
            <td class="style22">
                </td>
            <td class="style23" style="font-family: tahoma; font-size: 15px; color: #000000">
                เทอม</td>
            <td class="style24">
                <asp:DropDownList ID="ddlterm" runat="server" Height="26px" Width="124px"> 
                    <asp:ListItem Value="N">-- เลือก --</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:DropDownList>
            </td>
                      <td class="style25">
                          </td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style14" style="font-family: tahoma; font-size: 15px; color: #000000">
                รหัสวิชา</td>
            <td class="style4">
                <asp:TextBox ID="txtcode" runat="server" ></asp:TextBox>
                    </td>
                      <td class="style16">
                          &nbsp;</td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style14" style="font-family: tahoma; font-size: 15px; color: #000000">
                ชือวิชาภาษาไทย</td>
            <td class="style4">
                <asp:TextBox ID="txtNameThai" runat="server"></asp:TextBox>
                    </td>
                      <td class="style16">
                          &nbsp;</td>
        </tr>
                <tr>
            <td class="style9">
                    </td>
            <td class="style15" style="font-family: tahoma; font-size: 15px; color: #000000">
                      ชื่อวิชาภาษาอังกฤษ</td>
            <td class="style11">
                          <asp:TextBox ID="txtNameEn" runat="server"></asp:TextBox>
                    </td>
                      <td class="style21">
                          </td>
        </tr>

                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
                      <td class="style16">
                     <span class="wrap">
 
                          </span></td>
        </tr>

                </table>
      <div style="text-align:right">
       <asp:Button ID="btnSearch" runat="server" Text="ค้นหา" ValidationGroup="valid"     
              Width="80px" onclick="btnSearch_Click" 
              CssClass="http://localhost:53055/WebPage/BackYard/Admin/SearchSubject.aspx" />
       <asp:Button   ID="btnAdd" runat="server" Text="เพิ่มข้อมูลหลักสูตรExcell" 
              Width="147px"  
              PostBackUrl="~/WebPage/BackYard/Admin/ImportExcellCreateDetailTeach.aspx" 
              CssClass="http://localhost:53055/WebPage/BackYard/Admin/SearchSubject.aspx" />&nbsp;
          <br />
       &nbsp;</div>
       <span class="wrap">
    <asp:GridView ID="gvSubject" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="StructSub_Code" 
        Width="95%" onpageindexchanging="gvSubject_PageIndexChanging" EmptyDataText="ไม่พบข้อมูลที่คุณค้นหา"
        onrowcommand="gvSubject_RowCommand" CssClass="MyGridView_MainDetailTeach">
        <AlternatingRowStyle CssClass="MyGridViewAlt_MainDetailTeach" />
        <Columns>
            <asp:TemplateField HeaderText="สร้างรายละเอียดการสอน">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="EditeSubject" 
                                    CommandArgument='<%# Eval("StructSub_Code") %>' CommandName="EditeSubject" 
                                    ToolTip="EditeSubject">สร้างรายละเอียด</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" />
            <asp:HyperLinkField DataTextField="StructSub_NameTha" 
                ControlStyle-CssClass="styleLeft"  HeaderText="ชื่อรายวิชา" >
<ControlStyle CssClass="styleLeft"></ControlStyle>
            </asp:HyperLinkField>
            <asp:BoundField HeaderText="ชื่อรายวิชาภาษาอังกฤษ" 
                ControlStyle-CssClass="styleLeft"  DataField="StructSub_NameEn" >
<ControlStyle CssClass="styleLeft"></ControlStyle>
            </asp:BoundField>
            <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" />

        </Columns>
        <HeaderStyle Height="30px" CssClass="GridViewHeader_MainDetailTeach" />
        <RowStyle Height="20px" CssClass="MyGridViewRow_MainDetailTeach" />
    </asp:GridView>
    </span>
       <br />
   
    
       <br /></br></br></br>
</asp:Content>
