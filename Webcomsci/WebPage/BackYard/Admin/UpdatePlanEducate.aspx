<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="UpdatePlanEducate.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.UpdatePlanEducate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style8
        {
            width: 42px;
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
        .style9
        {
            width: 42px;
            text-align: left;
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; margin-right: 0px;">
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2">
                แ<b>ก้ไขแผนการศึกษา</b> </td>
        <td style="text-align: left; " class="style4">
                &nbsp;</td>

        </tr>
        <tr>
            <td class="style8">
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

        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2">
                ปีการศึกษาที่</td>
            <td class="style4">
                <asp:DropDownList ID="ddlCourses" runat="server" Height="27px" Width="153px" 
                    AutoPostBack="True">
                    <asp:ListItem>--กรุณาเลือกปีการศึกษา--</asp:ListItem>
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
                <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2">
                ภาคการศึกษาที่</td>
            <td class="style4">
                          <asp:DropDownList ID="ddlGroup" runat="server" Height="16px" Width="97px">
                              <asp:ListItem>--กรุณาเลือก--</asp:ListItem>
                              <asp:ListItem>1</asp:ListItem>
                              <asp:ListItem>2</asp:ListItem>
                </asp:DropDownList>
                    </td>
        </tr>

        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2">
                </td>
            <td class="style4">
                        
                    </td>
        </tr>

                <tr>
            <td class="style8">
                &nbsp;</td>
            <td style="text-align:right">
               <b> ค้นหาจากรหัสวิชา</b></td>
            <td class="style4">
                <asp:TextBox ID="txtSearchSubCode" runat="server" Height="22px"></asp:TextBox>
                     <span class="wrap">
                     <asp:Button ID="btnSearch" runat="server" Text="ค้นหา" Width="80px" 
                         Height="26px" onclick="btnSearch_Click" />
                     </span>
                    </td>
        </tr>
                <tr>
            <td class="style9">
                    </td>
            <td colspan="2">
       <span class="wrap">
  
    <asp:GridView ID="gvSubject" runat="server" ShowFooter="True" AutoGenerateColumns="False"
                CellPadding="3" 
                Width="97%" Style="text-align: left"
                    DataSourceID="SqlDataSourceShowGride" 
           DataKeyNames="StructSub_Code" BackColor="White" BorderColor="#CCCCCC" 
           BorderStyle="None" BorderWidth="1px" PageSize="5" AllowPaging="True" 
           AllowSorting="True" onrowcommand="gvSubject_RowCommand1">
                <Columns>
                <asp:TemplateField HeaderText="ลบข้อมูล">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnSubjectGet" runat="server" AlternateText="subjectGet" 
                                    CommandArgument='<%# Eval("StructSub_Code") %>' CommandName="subjectGet" 
                                    ToolTip="subjectGet">ดึงข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

                    <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" 
                        ReadOnly="True" SortExpression="StructSub_Code" />
                    <asp:BoundField DataField="StructSub_NameTha" HeaderText="ชื่อวิชา" 
                        SortExpression="StructSub_NameTha" />
                    <asp:BoundField DataField="StructSub_NameEn" HeaderText="ชื่อวิชาภาษาอังกฤษ" 
                        SortExpression="StructSub_NameEn" />
                    <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิตวิชา" 
                        SortExpression="StructSub_Credit" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceShowGride" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    
                    
           SelectCommand="SELECT [StructSub_Code], [StructSub_NameTha], [StructSub_NameEn], [StructSub_Credit] FROM [StructSubject] WHERE ([StructSub_Code] LIKE @StructSub_Code + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtSearchSubCode" Name="StructSub_Code" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

    </span>
                    </td>
         
        </tr>
                <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="2" style="text-align:left">
                     <b> รายวิชาทั้งหมด<br />
       <span class="wrap">
  
    <asp:GridView ID="gvSubjectShow" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="StructSub_Code" 
        Width="100%" onpageindexchanging="gvSubject_PageIndexChanging" 
        onrowcommand="gvSubject_RowCommand" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ลบข้อมูล">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnDelete" runat="server" AlternateText="DeleteSubject" 
                                    CommandArgument='<%# Eval("FollowSubject_ID") %>' CommandName="DeleteSubject" 
                                    ToolTip="DeleteSubject">ลบข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
                    <%--    <asp:BoundField DataField="Curri_Group" HeaderText="กลุ่มวิชา" />--%>
            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสรายวิชา" />
            <asp:HyperLinkField DataTextField="StructSub_NameTha" 
                HeaderText="ชื่อรายวิชา" />
            <asp:BoundField HeaderText="ชื่อรายวิชาภาษาอังกฤษ" 
                DataField="StructSub_NameEn" />
            <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" />

        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Height="30px" Font-Bold="True" 
            ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle Height="20px" BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    </span>
                     </b></td>
        </tr>

        </tr>
                <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="2"style="text-align:right">
                &nbsp;
                     <span >
                     <asp:Button ID="btnCanCel" runat="server" Text="ยกเลิก" Width="80px" />
                     </span></td>
        </tr>
    </table>
    </asp:Content>
