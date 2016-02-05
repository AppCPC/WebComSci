<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CreateDetailTeacherTeach.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.CreateDetailTeacherTeach" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register Src="~/WebPage/BackYard/Admin/ucGetTeacher.ascx" TagName="PopupGetTeacher" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 16px;
            width: 18px;
        }
        .style2
        {
            width: 10px;
        }
        .style3
        {
            height: 16px;
            width: 10px;
        }
        .style4
        {
            height: 16px;
            width: 204px;
        }
        .style5
        {
            width: 204px;
        }
        .style6
        {
            width: 4px;
        }
        .style7
        {
            width: 18px;
        }
        .style15
        {
            width: 204px;
            font-weight: bold;
        }
        .style16
        {
            width: 53px;
        }
        .style17
        {
            width: 10px;
            height: 23px;
        }
        .style18
        {
            width: 204px;
            font-weight: bold;
            height: 23px;
        }
        .style19
        {
            width: 18px;
            height: 23px;
        }
        .style20
        {
            width: 53px;
            height: 23px;
        }
        .style21
        {
            width: 4px;
            height: 23px;
        }
        .style22
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
    <table style="width:100%;">
        <tr><td class="style3">
            </td>
            <td  style="text-align:left;">
                <b>สร้างรายละเอียดการสอน</b></td>
            <td class="style7">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
            </td>
            <td class="style4">
                ปีการศึกษา</td>
            <td class="style1">
                <asp:TextBox ID="txtYearEducate" runat="server"></asp:TextBox>
            </td>
            <td class="style16" >
                เทอม</td>
            <td class="style6" >
                <asp:DropDownList ID="ddlteamEducate" runat="server" Height="18px" 
                    Width="126px">
                    <asp:ListItem Value="N">--เลือกเทอมศึกษา--</asp:ListItem>
                    <asp:ListItem Value="1">เทอม 1</asp:ListItem>
                    <asp:ListItem Value="2">เทอม 2</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                ชั้นปีศึกษา</td>
            <td class="style7">
                <asp:DropDownList ID="ddlYearEducate" runat="server" Height="18px" 
                    Width="126px">
                    <asp:ListItem Value="N">--เลือกปีศึกษา--</asp:ListItem>
                    <asp:ListItem Value="1">ปี 1</asp:ListItem>
                    <asp:ListItem Value="2">ปี 2</asp:ListItem>
                    <asp:ListItem Value="3">ปี 3</asp:ListItem>
                    <asp:ListItem Value="4">ปี 4</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style16">
                ห้อง</td>
            <td class="style6">
                <asp:TextBox ID="txtRoom" runat="server" ></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                </td>
            <td class="style18">
                รายละเอียดอาจารย์ผู้สอน</td>
            <td class="style19">
                </td>
            <td class="style20">
                       </td>
            <td class="style21">
                </td>
            <td class="style22">
    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" >
    </ajaxToolkit:ToolkitScriptManager>
                </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                ชื่ออาจารย์</td>
            <td class="style7">
     
                <asp:TextBox ID="txtTchName" runat="server"></asp:TextBox>
                
            </td>
            <td class="style16">
                       สกุล</td>
            <td class="style6">
                <asp:TextBox ID="txtTchLastname" runat="server"></asp:TextBox>
            </td>
            <td style="text-align:left">
                       <asp:ImageButton ID="butSearchTeacher" runat="server" 
                    ImageUrl="/image/Back/ButtonSearch.jpg" onclick="butSearchTeacher_Click"  />
                    
                  
          <asp:HiddenField ID="HiddenTargetShow" runat="server" />

         <ajaxtoolkit:modalpopupextender ID="modalTeacher" runat="server" DynamicServicePath=""
                                                        Enabled="True" 
                           TargetControlID="HiddenTargetShow" CancelControlID="imgproClose" PopupControlID="pnl"
                                                        BackgroundCssClass="modalbackground">
                                                    </ajaxtoolkit:modalpopupextender>
            <asp:Panel ID="pnl" CssClass="modalpopup" runat="server" Style="display: none">
             
            <div style="text-align: right;background-color:Gray;" > 
              <asp:ImageButton ID="imgproClose" runat="server" ImageUrl="~/image/close_button.png" AlternateText="ปิด" />
               </div>
               <uc1:PopupGetTeacher ID="PopupGetTeacher" runat="server" />  

                 </asp:Panel> 
                    
               </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style16">
                       &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">


    <asp:GridView ID="gvShowTeacher" runat="server" ShowFooter="True" AutoGenerateColumns="False"
   
                CellPadding="3" 
                Width="97%" Style="text-align: left" 
           DataKeyNames="Tch_ID" BackColor="White" BorderColor="#CCCCCC" 
           BorderStyle="None" BorderWidth="1px" PageSize="3" AllowPaging="True" 
           AllowSorting="True">
                <Columns>
                <asp:TemplateField HeaderText="ดึงรายวิชา">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnGetSubject" runat="server" AlternateText="getTchName" 
                                    CommandArgument='<%# Eval("Tch_ID") %>' CommandName="getTchName" 
                                    ToolTip="getTchName">ดึงข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

                    <asp:BoundField DataField="Tch_FName" HeaderText="ชื่อ" 
                        ReadOnly="True" SortExpression="Tch_FName" />
                    <asp:BoundField DataField="Tch_LName" HeaderText="สกุล" 
                        SortExpression="Tch_LName" />
                    <asp:BoundField DataField="Tch_Nickname" HeaderText="ชื่อเล่น" 
                        SortExpression="Tch_Nickname" />
                    <asp:BoundField DataField="Tch_Tel" HeaderText="เบอร์โทร" 
                        SortExpression="Tch_Tel" />
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

                    </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style15">
                รายละเอียดรายวิชา</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                รหัสวิชา</td>
            <td class="style7">
                <asp:TextBox ID="txtCodeSubject" runat="server"></asp:TextBox>
            </td>
            <td class="style16">
                ชื่อวิชา</td>
            <td class="style6">
                <asp:TextBox ID="txtNameThaiSubject" runat="server"></asp:TextBox>
            </td>
            <td style="text-align:left">
                       <asp:ImageButton ID="butSearchSubject" runat="server" 
                    ImageUrl="/image/Back/ButtonSearch.jpg" onclick="butSearchSubject_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="6">


    <asp:GridView ID="gvShowSubject" runat="server" ShowFooter="True" AutoGenerateColumns="False"
   
                CellPadding="3" 
                Width="97%" Style="text-align: left" BackColor="White" BorderColor="#CCCCCC" 
           BorderStyle="None" BorderWidth="1px" PageSize="5" AllowPaging="True" 
           AllowSorting="True" onrowcommand="gvShowSubject_RowCommand">
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

            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style15">
                รายวิชาที่สอนทั้งหมด</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td  colspan="6">


    
    <asp:GridView ID="gvShowAllDetailSubject" runat="server" ShowFooter="True" AutoGenerateColumns="False"
   
                CellPadding="3" 
                Width="97%" Style="text-align: left" BackColor="White" BorderColor="#CCCCCC" 
           BorderStyle="None" BorderWidth="1px" PageSize="5" AllowPaging="True" 
           AllowSorting="True" onrowcommand="gvShowAllDetailSubject_RowCommand">
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

                    
    
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>


                    <br />
  


    
    <br />


        
</asp:Content>
