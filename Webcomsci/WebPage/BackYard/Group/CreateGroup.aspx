<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/BackGroup.Master" AutoEventWireup="true" CodeBehind="CreateGroup.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Group.CreateGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 136px;
        }
        .style3
        {
            width: 144px;
        }
        .style4
        {
        }
        .style5
        {
            width: 240px;
        }
        .style6
        {
            width: 136px;
            height: 22px;
        }
        .style7
        {
            width: 144px;
            height: 22px;
        }
        .style8
        {
            width: 137px;
            height: 22px;
        }
        .style9
        {
            height: 22px;
        }
        .style11
        {
            width: 136px;
            height: 160px;
        }
        .style12
        {
            width: 144px;
            height: 160px;
        }
        .style13
        {
            height: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
      <link rel="Stylesheet" href="../../../css/skins/TabGroup.css" />
<div class="AreaCropCreateGroup_CreateGroup2">
</div>
 <table style="width:100%; font-family: tahoma; font-size: 15px; font-weight: bold; color: #000000; float: left;">
        <tr>
            <td class="style6" align="center">
                &nbsp;</td>
            <td class="style7">
                </td>
            <td class="style8">
                </td>
                   <td class="style9">
                       </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3" style="font-family: tahoma; font-size: 13px; color: #333333">
                ผู้สร้าง</td>
            <td class="style4">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3" style="font-family: tahoma; font-size: 13px; color: #333333">
                ชือกลุ่ม</td>
            <td class="style4">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
                <td>
                &nbsp;</td>
        </tr>
                <tr>
            <td class="style11">
                    </td>
            <td class="style12" style="font-family: tahoma; font-size: 13px; color: #333333">
                รูปกลุ่ม</td>
            <td class="style13" align="left" colspan="2">
           
                      
                       <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/Timeline1.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton1" runat="server" Text="Timeline" />
                           </div>
                        </div>

                         <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/Timeline2.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton2" runat="server" Text="Timeline2" />
                           </div>
                        </div>

                         <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/Timeline3.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton3" runat="server" Text="Timeline3" />
                           </div>
                        </div>

                         <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/Timeline4.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton4" runat="server" Text="Timeline4" />
                           </div>
                        </div>

                         <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/Timeline5.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton5" runat="server" Text="Timeline5" />
                           </div>
                        </div>

                         <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/Timeline6.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton6" runat="server" Text="Timeline6" />
                           </div>
                        </div>

                       <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/Timeline7.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton7" runat="server" Text="Timeline7" />
                           </div>
                        </div>

                       <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/Timeline8.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton8" runat="server" Text="Timeline8" />
                           </div>
                        </div>

                       <div class="Alltimeline">
                       <div class="Areaselecttimeline">
                           <img alt="" class="Areaselecttimeline" 
                               src="PhotoGroup/TimelineGroup.png" /></div>
                           <div class="fontselecttimeline">
                               <asp:RadioButton ID="RadioButton9" runat="server" Text="Timeline9" />
                           </div>
                        </div>

                    </td>
        </tr>
                      <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3" style="font-family: tahoma; font-size: 13px; color: #333333">
               ค้นหารายชื่อสมาชิก</td>
            <td class="style4">
               
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
               
                    </td>
                   <td>
                 <%--  <div class="ButtonSearch_CreateGroup"></div>--%>
                       <asp:Button ID="btnSearch" runat="server" Text="ค้นหา" CssClass="button_in_back" />
                          </td>
        </tr>

              </tr>
                      <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3" style="font-family: tahoma; font-size: 13px; color: #333333">
                รายชื่อที่ค้นหา&nbsp;</td>
            <td class="style4">
                    </td>
                   <td>
                          </td>
        </tr>

    </table><span class="wrap">
    <asp:GridView ID="gvList" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Emp_ID" 
        Width="70%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ดึง">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnEdit" runat="server" AlternateText="employeeEdit" 
                                    CommandArgument='<%# Eval("Emp_ID") %>' CommandName="employeeEdit" 
                                    ToolTip="employeeEdit">ดึง</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ชื่อสมาชิก"></asp:TemplateField>
            <asp:BoundField HeaderText="ชื่อเล่น">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle BackColor="White" Height="30px" />
        <PagerStyle BackColor="White" />
        <RowStyle Height="20px" />
    </asp:GridView>
    </span>
    <br />
    <table style="width:100%; font-family: tahoma; font-size: 14px; font-weight: bold; color: #000000;">
        <tr>
            <td class="style5" align="center">
                รายชื่อสมาชิกในกลุ่ม</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <span class="wrap">
    <asp:GridView ID="gvList0" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Emp_ID" 
        Width="70%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ลบ">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnDelete0" runat="server" AlternateText="Delete" 
                                    CommandArgument='<%# Eval("Emp_ID") %>' CommandName="Delete" 
                                    ToolTip="Delete">ลบข้อมูล</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ชื่อสมาชิก"></asp:TemplateField>
            <asp:BoundField HeaderText="ชื่อเล่น">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle BackColor="White" Height="30px" />
        <PagerStyle BackColor="White" />
        <RowStyle Height="20px" />
    </asp:GridView>
    </span>
    <br />
<%--    <div style="width: 100%; height: 35px; padding-left: 30%;">
    <div class="ButtonOK_CreateGroup"></div>
    <div class="ButtonCancel_CreateGroup"></div> </div>--%>
    <asp:Button ID="btnOK" runat="server" onclick="btnOK_Click" Text="ตกลง" 
        CssClass="button_in_back" />
    <asp:Button ID="btnCancel" runat="server" 
        PostBackUrl="~/WebPage/BackYard/ClassRoom/mainClassroom.aspx" 
        Text="ยกเลิก" CssClass="button_in_back" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
