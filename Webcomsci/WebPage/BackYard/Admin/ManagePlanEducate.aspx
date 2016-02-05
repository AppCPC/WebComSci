<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManagePlanEducate.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManagePlanEducate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style3
        {
            width: 87px;
            text-align: left;
        }
        .style2
        {
            width: 199px;
            text-align:left;
        }
        .style4
        {
            width: 16%;
            text-align: left;
        }
        .style7
        {
            width: 335px;
            text-align: left;
        }
        .style6
        {
            width: 35px;
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div style="text-align:left;"> <b>&nbsp;&nbsp; จัดการแผนการศึกษา</b></div>
    <table style="width:100%;">
     <%-- <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                ปีการศึกษาที่ปรับปรุงหลักสูตร</td>
        <td style="text-align: left; " class="style4">
                <asp:DropDownList ID="ddlYear" 
                    runat="server" DataSourceID="SqlDataSourceYearEdu" 
                    DataTextField="Curri_Year" DataValueField="Curri_Year">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceYearEdu" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Curri_Year] FROM [Curriculum]"></asp:SqlDataSource>
                </td>
                    <td class="style7">
                        &nbsp;</td>
                      <td class="style6">
                          &nbsp;</td>
                 <td>
                     &nbsp;</td>

        </tr> --%>  
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                ปีการศึกษา</td>
            <td class="style4">
                <asp:DropDownList ID="ddlCourses" runat="server" Height="27px" Width="127px" 
                    AutoPostBack="True">
                    <asp:ListItem>--กรุณาเลือก--</asp:ListItem>
                    <asp:ListItem Value="1">ปีการศึกษาที่ 1</asp:ListItem>
                    <asp:ListItem Value="2">ปีการศึกษาที่ 2</asp:ListItem>
                    <asp:ListItem Value="3">ปีการศึกษาที่ 3</asp:ListItem>
                    <asp:ListItem Value="4">ปีการศึกษาที่ 4</asp:ListItem>
                </asp:DropDownList>
            </td>
                  <td class="style7">
                      &nbsp; </td>
                      <td class="style6">
                          &nbsp;</td>
        </tr>

                        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                ภาคการศึกษาที่</td>
            <td class="style4">
                          <asp:DropDownList ID="ddlSemester" runat="server" Height="27px" 
                    Width="129px" AutoPostBack="True">
                              <asp:ListItem>--กรุณาเลือก--</asp:ListItem>
                              <asp:ListItem Value="1">ภาคการศึกษาที่ 1</asp:ListItem>
                              <asp:ListItem Value="2">ภาคการศึกษาที่ 2</asp:ListItem>
                </asp:DropDownList>
                            </td>
                  <td class="style7">
                      &nbsp;</td>
                      <td class="style6">
                          &nbsp;</td>
        </tr>

                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                รหัสวิชา</td>
            <td class="style4">
                <asp:TextBox ID="txtCodeSubject" runat="server"></asp:TextBox>
                            </td>
                  <td class="style7">
                      &nbsp;</td>
                      <td class="style6">
                          &nbsp;</td>
        </tr>

        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                      ชื่อวิชา</td>
            <td class="style4">
                          <asp:TextBox ID="txtSubNameThai" runat="server"></asp:TextBox>
                            </td>
                  <td class="style7">
                      &nbsp;</td>
                      <td class="style6">
                          &nbsp;</td>
        </tr>
           <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                      &nbsp;</td>
            <td class="style4">
                          &nbsp;</td>
                  <td class="style7">
                   <span class="wrap">
                     <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                         Text="ค้นหา" ValidationGroup="valid" Width="80px" />
                     &nbsp;
                     <asp:Button ID="btnReset" runat="server" onclick="btnReset_Click" 
                         Text="ตั้งค่าใหม่" Width="80px" />
                     &nbsp;
                     <asp:Button ID="btnADD" runat="server" Height="26px" 
                         PostBackUrl="~/WebPage/BackYard/Admin/AddPlanEducate.aspx" Text="เพิ่ม" 
                         Width="80px" />
                     </span>
                      &nbsp;</td>
                      <td class="style6">
                          &nbsp;</td>
        </tr>
    </table>
    <br />

       
       <asp:GridView ID="gvSubject" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataKeyNames="StructSub_Code" ForeColor="Black" GridLines="Vertical" 
        PageSize="20" Width="100%" 
        onpageindexchanging="gvSubject_PageIndexChanging" 
        onrowcommand="gvSubject_RowCommand">
           <AlternatingRowStyle BackColor="White" />
           <Columns>
               <asp:TemplateField HeaderText="แก้ไข">
                   <ItemTemplate>
                       <table border="0" cellpadding="1" cellspacing="1">
                           <tr>
                               <td align="center" style="height: 18px;">
                                   <asp:LinkButton ID="btnEdit" runat="server" AlternateText="EditeSubject" 
                                       CommandArgument='<%# Eval("ShowPlan_Id") %>' CommandName="EditeSubject" 
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
                                       CommandArgument='<%# Eval("ShowPlan_Id") %>' CommandName="DeleteSubject" 
                                       ToolTip="DeleteSubject">ลบข้อมูล</asp:LinkButton>
                               </td>
                           </tr>
                       </table>
                   </ItemTemplate>
                   <ItemStyle HorizontalAlign="Center" />
                   <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
               </asp:TemplateField>
               <asp:BoundField DataField="ShowPlan_Year" HeaderText="ปีการศึกษา" />
               <asp:BoundField DataField="ShowPlan_Semester" HeaderText="ภาคการศึกษา" />
               <asp:BoundField DataField="Curri_Group" HeaderText="กลุ่มวิชา" />
               <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" />
               <asp:HyperLinkField DataTextField="StructSub_NameTha" 
                   HeaderText="ชื่อรายวิชา" />
               <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" />
           </Columns>
           <FooterStyle BackColor="#CCCC99" />
           <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" 
               Height="30px" />
           <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
           <RowStyle BackColor="#F7F7DE" Height="20px" />
           <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#FBFBF2" />
           <SortedAscendingHeaderStyle BackColor="#848384" />
           <SortedDescendingCellStyle BackColor="#EAEAD3" />
           <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
           
       
</asp:Content>
