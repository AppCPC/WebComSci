<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="SearchSubject.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.SearchSubject" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            width: 73px;
            text-align: left;
        }
        .style4
        {
            width: 25%;
            text-align: left;
        }
        .style9
        {
            width: 73px;
            text-align: left;
            height: 24px;
        }
        .style11
        {
            width: 25%;
            text-align: left;
            height: 24px;
        }
        .style14
        {
            width: 153px;
            text-align: left;
        }
        .style15
        {
            width: 153px;
            text-align: left;
            height: 24px;
        }
        .style16
        {
            width: 72px;
        }
        .style21
        {
            width: 72px;
            text-align: left;
            height: 24px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
    <div style="text-align:left;"> &nbsp;&nbsp;&nbsp;&nbsp; <b>จัดการรายวิชา</b></div>
    <table style="width:100%;">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style14">
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
            <td class="style3">
                &nbsp;</td>
            <td class="style14">
                หมวดวิชา</td>
            <td class="style4">
                <asp:DropDownList ID="ddlCourses" runat="server" Height="27px" Width="153px" 
                    AutoPostBack="True" DataSourceID="SqlDataSourceCourse" 
                    DataTextField="Curri_Course" DataValueField="Curri_Course">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT DISTINCT [Curri_Course] FROM [Curriculum] WHERE ([Curri_Year] = @Curri_Year)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlYear" 
                            Name="Curri_Year" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
                      <td class="style16">
                          &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style14">
                กลุ่มวิชา</td>
            <td class="style4">
                          <asp:DropDownList ID="ddlGroup" runat="server" DataSourceID="SqlDataGroup" 
                              DataTextField="Curri_Group" DataValueField="Curri_Group" 
                              AutoPostBack="True">
                </asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataGroup" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                              
                              
                              SelectCommand="SELECT [Curri_Group] FROM [Curriculum] WHERE (([Curri_Course] = @Curri_Course) AND ([Curri_Year] = @Curri_Year))">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="ddlCourses" Name="Curri_Course" 
                                      PropertyName="SelectedValue" Type="String" />
                                  <asp:ControlParameter ControlID="ddlYear" Name="Curri_Year" 
                                      PropertyName="SelectedValue" Type="String" />
                              </SelectParameters>
                          </asp:SqlDataSource>
            </td>
                      <td class="style16">
                          &nbsp;</td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style14">
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
            <td class="style14">
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
            <td class="style15">
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

        </tr>
                </table>
      <div style="text-align:right">
       <asp:Button ID="btnSearch" runat="server" Text="ค้นหา" ValidationGroup="valid"     
              Width="80px" onclick="btnSearch_Click" CssClass="button_in_admin" />
      <asp:Button ID="btnReset" runat="server" Text="ตั้งค่าใหม่" Width="80px"   
              onclick="btnReset_Click" CssClass="button_in_admin" />
       <asp:Button   ID="btnAdd" runat="server" Text="เพิ่ม" Width="80px"  
              PostBackUrl="~/WebPage/BackYard/Admin/AddSubject.aspx" 
              CssClass="button_in_admin" />
          <br />
       &nbsp;</div>
       <span class="wrap">
    <asp:GridView ID="gvSubject" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="StructSub_Code" 
        Width="95%" onpageindexchanging="gvSubject_PageIndexChanging" EmptyDataText="ไม่พบข้อมูลที่คุณค้นหา"
        onrowcommand="gvSubject_RowCommand" CssClass="MyGridView_SearchSubject">
        <AlternatingRowStyle CssClass="MyGridViewAlt_SearchSubject" />
        <Columns>
            <asp:TemplateField HeaderText="แก้ไข">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="EditeSubject" 
                                    CommandArgument='<%# Eval("StructSub_Code") %>' CommandName="EditeSubject" 
                                    ToolTip="EditeSubject">แก้ไข</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ลบข้อมูล">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnDelete" runat="server" AlternateText="DeleteSubject" 
                                    CommandArgument='<%# Eval("StructSub_Code") %>' CommandName="DeleteSubject" 
                                    ToolTip="DeleteSubject">ลบข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
                        <asp:BoundField DataField="Curri_Group" HeaderText="กลุ่มวิชา" />
            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" />
            <asp:HyperLinkField DataTextField="StructSub_NameTha" 
                HeaderText="ชื่อรายวิชา" />
            <asp:BoundField HeaderText="ชื่อรายวิชาภาษาอังกฤษ" 
                DataField="StructSub_NameEn" />
            <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" />

        </Columns>
        <HeaderStyle Height="30px" CssClass="GridViewHeader_SearchSubject" />
        <RowStyle Height="20px" CssClass="MyGridViewRow_SearchSubject" />
    </asp:GridView>
    </span>
       <br />
       <%--
    <asp:GridView ID="gvSubject" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="StructSub_ID" 
        EmptyDataText="ไม่พบข้อมูลที่ค้นหา" PageSize="5" Width="100%" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" 
        onpageindexchanging="gvSubject_PageIndexChanging" 
        onrowcommand="gvSubject_RowCommand">
        <AlternatingRowStyle CssClass="GridViewRowAlternate" BackColor="White" />
        <RowStyle CssClass="GridViewRow" HorizontalAlign="Center" 
            VerticalAlign="Middle" BackColor="#F7F7DE" />
        <Columns>
         
             
            <asp:CommandField ButtonType="Image" HeaderText="แก้ไข" ItemStyle-Width="7%"  ShowCancelButton="False" ShowSelectButton="True" SelectImageUrl="~/image/edit.png"   >
            <ItemStyle Width="7%"></ItemStyle>
            </asp:CommandField>


            <asp:CommandField ButtonType="Image" HeaderText="ลบ" ItemStyle-Width="7%" ShowCancelButton="False" ShowDeleteButton="True" DeleteImageUrl="~/image/delete.png" >
            <ItemStyle Width="7%"></ItemStyle>
            </asp:CommandField>
            <asp:BoundField DataField="Curri_Group" HeaderText="กลุ่มวิชา" />
            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" />
            <asp:HyperLinkField DataTextField="StructSub_NameTha" 
                HeaderText="ชื่อรายวิชา" />
            <asp:BoundField HeaderText="ชื่อรายวิชาภาษาอังกฤษ" 
                DataField="StructSub_NameEn" />
            <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" />
        </Columns>
        <EmptyDataRowStyle CssClass="GridViewEmptyData" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle CssClass="GridViewHeader" BackColor="#6B696B" Font-Bold="True" 
            ForeColor="White" />
        <PagerStyle HorizontalAlign="Right" BackColor="#F7F7DE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>

    --%>
    
       <br /></br></br></br>
</asp:Content>
