<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucGetTeacher.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ucGetTeacher" %>
<style type="text/css">

        .style2
        {
            width: 10px;
        }
        .style5
        {
            width: 204px;
        }
        .style7
        {
            width: 18px;
        }
        .style16
        {
            width: 53px;
        }
        .style6
        {
            width: 4px;
        }
        </style>

<asp:UpdatePanel id="test" runat="server">
<ContentTemplate>

<table style="width:100%;">
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <b>ดึงข้อมูลอาจารย์</b></td>
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
                    ImageUrl="/image/Back/ButtonSearch.jpg" onclick="butSearchTeacher_Click" /></td>
        </tr>
    <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                    ประเภท</td>
            <td class="style7">
     
                            <asp:DropDownList ID="ddlTypeUser" runat="server" Height="22px" 
                    Width="141px">
                                <asp:ListItem Value="N">--ประเภทผู้ใช้งาน--</asp:ListItem>
                                <asp:ListItem Value="TE">อาจารย์ประจำ</asp:ListItem>
                                <asp:ListItem Value="TS">อาจารย์พิเศษ</asp:ListItem>
                            </asp:DropDownList>

            </td>
            <td class="style16">
                       &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td style="text-align:left">
                       &nbsp;</td>
        </tr>
    <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="5">


    <asp:GridView ID="gvShowTeacher" runat="server" ShowFooter="True" AutoGenerateColumns="False"
   
                CellPadding="3" 
                Width="97%" Style="text-align: left" 
           DataKeyNames="Tch_ID" BackColor="White" BorderColor="#CCCCCC" 
           BorderStyle="None" BorderWidth="1px" PageSize="3" AllowPaging="True" 
           AllowSorting="True" 
                    onpageindexchanging="gvShowTeacher_PageIndexChanging" 
                    onselectedindexchanging="gvShowTeacher_SelectedIndexChanging">
                <Columns>
                <%-- 
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
            </asp:TemplateField>--%>
               <asp:CommandField
                                                    ShowCancelButton="False" ItemStyle-Width="7%" SelectText="เลือก" 
                                                    ShowSelectButton="True" >
                                                <ItemStyle Width="7%" />
                                                </asp:CommandField>

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
</table>

 </ContentTemplate>
 </asp:UpdatePanel>
<p>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
</p>
