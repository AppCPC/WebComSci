<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddPlanEducate.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddPlanEducate" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register Src="ucAddSubject.ascx" TagName="PopupAddsubject" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .style2
        {
            width: 199px;
            text-align:left;
        }
        .style4
        {
            width: 61%;
            text-align: left;
        }
        .style8
        {
            width: 92px;
            text-align: left;
        }
        .style11
        {
            width: 92px;
            text-align: left;
            height: 23px;
        }
        .style12
        {
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; margin-right: 0px;">
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2" style="background-color: #999999">
                <b>จัดการแผนการศึกษา</b> </td>
        <td style="background-color: #999999;" class="style4">
                &nbsp;</td>
                <td> &nbsp;</td>
        </tr>
        <%--    <asp:BoundField DataField="Curri_Group" HeaderText="กลุ่มวิชา" />--%>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2" style="background-color: #C0C0C0">
                ปีการศึกษาปรับปรุงหลักสูตร</td>
            <td class="style4" style="background-color: #C0C0C0">
                <asp:DropDownList ID="ddlYearMod" runat="server" 
                    DataSourceID="SqlDataSourceYearEdu" DataTextField="Curri_Year" 
                    DataValueField="Curri_Year" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceYearEdu" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Curri_Year] FROM [Curriculum]">
                </asp:SqlDataSource>
            </td>
               <td> &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2" style="background-color: #C0C0C0">
                ปีการศึกษาที่</td>
            <td class="style4" style="background-color: #C0C0C0">
                <asp:DropDownList ID="ddlYear" runat="server" Height="27px" Width="127px" 
                    AutoPostBack="True">
                    <asp:ListItem>--กรุณาเลือก--</asp:ListItem>
                    <asp:ListItem Value="1">ปีการศึกษาที่ 1</asp:ListItem>
                    <asp:ListItem Value="2">ปีการศึกษาที่ 2</asp:ListItem>
                    <asp:ListItem Value="3">ปีการศึกษาที่ 3</asp:ListItem>
                    <asp:ListItem Value="4">ปีการศึกษาที่ 4</asp:ListItem>
                </asp:DropDownList>
            </td>
               <td> &nbsp;</td>
        </tr>
                <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2" style="background-color: #C0C0C0">
                ภาคการศึกษาที่</td>
            <td class="style4" style="background-color: #C0C0C0">
                          <asp:DropDownList ID="ddlSemester" runat="server" Height="27px" 
                    Width="129px" AutoPostBack="True">
                              <asp:ListItem>--กรุณาเลือก--</asp:ListItem>
                              <asp:ListItem Value="1">ภาคการศึกษาที่ 1</asp:ListItem>
                              <asp:ListItem Value="2">ภาคการศึกษาที่ 2</asp:ListItem>
                </asp:DropDownList>
                    </td>
                       <td> &nbsp;</td>
        </tr>

        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2" style="background-color: #C0C0C0">
                </td>
            <td class="style4" style="background-color: #C0C0C0">
                        
                    </td>
                       <td> &nbsp;</td>
        </tr>

                <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="2" style="text-align:left">
                     <b> รายวิชาทั้งหมด<br />
       <span class="wrap">
  
    <asp:GridView ID="gvSubjectShow" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="StructSub_Code" 
        Width="100%" onpageindexchanging="gvSubjectShow_PageIndexChanging" 
        onrowcommand="gvSubjectShow_RowCommand" BackColor="White" 
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
                                    CommandArgument='<%# Eval("ShowPlan_Id") %>' CommandName="DeleteSubject" 
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
                        <td> &nbsp;</td>
        </tr>

        </tr>
                <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="2"style="text-align:right">
                &nbsp;
                     </td>
                        <td> &nbsp;</td>
        </tr>
                <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="2"style="background-color: #999999; text-align:left; font-weight: 700;">
                เพิ่มรายวิชาแผนการเรียน</td>
                        <td> &nbsp;</td>
        </tr>
                <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="2"style="background-color: #C0C0C0;text-align:left;">
                <span class="wrap">
  
               <b> ค้นหาจากรหัสวิชา </b>
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                     <asp:Button ID="btnSearch" runat="server" Text="ค้นหา" Width="80px" 
                         Height="26px" onclick="btnSearch_Click" />

                <asp:Button ID="btnAddNewSubject" runat="server" Text="เพิ่มรายวิชา" 
                              onclick="btnAddNewSubject_Click" Height="26px"  />

                                                     <asp:HiddenField ID="HiddenTargetShow" runat="server" />

    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" >
    </ajaxToolkit:ToolkitScriptManager>

                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" DynamicServicePath=""
                                                        Enabled="True" TargetControlID="HiddenTargetShow" CancelControlID="imgproClose" PopupControlID="pnl"
                                                        BackgroundCssClass="modalbackground">
                                                    </ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="pnl" CssClass="modalpopup" runat="server" Style="display: none">
             
            <div style="text-align: right;background-color:Gray;" > 
              <asp:ImageButton ID="imgproClose" runat="server" ImageUrl="~/image/close_button.png" AlternateText="ปิด" />
               </div>
               <uc1:PopupAddsubject ID="PopupAddsubject" runat="server" />  

                 </asp:Panel>


              <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" DynamicServicePath=""
                                                        Enabled="True" TargetControlID="HiddenTargetShow" CancelControlID="imgproClose" PopupControlID="pnl"
                                                        BackgroundCssClass="modalbackground">
                                                    </ajaxToolkit:ModalPopupExtender>
                                                    
                                                          


    <asp:GridView ID="gvSubject" runat="server" AutoGenerateColumns="False"
                CellPadding="3" 
                Width="97%" Style="text-align: left"
                    DataSourceID="SqlDataSourceShowGride" 
           DataKeyNames="StructSub_Code" BackColor="White" BorderColor="#CCCCCC" 
           BorderStyle="None" BorderWidth="1px" PageSize="5" AllowPaging="True" 
           AllowSorting="True" onrowcommand="gvSubject_RowCommand" GridLines="Horizontal">
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
                    <asp:BoundField DataField="StructSub_NameTha" HeaderText="รหัสวิชา" 
                        SortExpression="StructSub_NameTha" />
                    <asp:BoundField DataField="StructSub_NameEn" HeaderText="รหัสวิชาภาษาอังกฤษ" 
                        SortExpression="StructSub_NameEn" />
                    <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" 
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
                        <asp:ControlParameter ControlID="txtCode" Name="StructSub_Code" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                 <!--  <p style="text-align:right";> <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" Width="80px" 
                         Height="26px" 
                         PostBackUrl="~/WebPage/BackYard/Admin/ManagePlanEducate.aspx" /></p>-->

    </span>
                    </td>
                        <td> &nbsp;</td>
        </tr>
                <tr>
            <td class="style11">
                    </td>
            <td colspan="2" class="style12">
       <span class="wrap">
  
                

    </span>
                    </td>
                        <td class="style12"> </td>
        </tr>
                <tr>
            <td class="style8">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
                        <td> &nbsp;</td>
        </tr>
    </table>
    </asp:Content>
