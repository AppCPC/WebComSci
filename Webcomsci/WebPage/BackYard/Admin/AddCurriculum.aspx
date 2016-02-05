<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddCurriculum.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddCurriculum" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/WebPage/BackYard/Admin/EditeControl.ascx" TagName="PopupLoginControl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
    <style type="text/css">

        .style1
        {
            text-align:left;
            width: 124px;
        }
        .style2
        {
            text-align: left;
            width: 199px;
        }
        .style3
        {
            text-align: left;
            width: 124px;
            height: 29px;
        }
        .style4
        {
            text-align: left;
            width: 199px;
            height: 29px;
        }
        .style5
        {
           text-align: left;
            height: 29px;
            width: 179px;
        }
        .style6
        {
           text-align: left;
            width: 179px;
        }
        

    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">



<asp:scriptmanager id="Scriptmanager1" runat="server" />
<ContentTemplate>

<%#Eval("Curri_Year")%>


    <table>
        <tr>
            <td class="style1" 
                style="font-family: tahoma; font-weight: bold; color: #000000; text-align: center">
                เพิ่มหลักสูตร</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
            </td>
            <td class="style4" style="font-family: tahoma; font-size: 15px; color: #000000">
                ปีการศึกษาที่ปรับปรุงหลักสูตร
                </td>
            <td class="style5">
                <asp:DropDownList ID="ddlYear" runat="server" 
                    DataSourceID="SqlDataSourceYearEdu" DataTextField="Curri_Year" 
                    DataValueField="Curri_Year" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceYearEdu" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Curri_Year] FROM [Curriculum]">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="btnYearNew" runat="server" Text="จัดการข้อมูลปีการศึกษา" 
                    onclick="btnYearNew_Click" CssClass="button_in_admin" /> &nbsp;
                <asp:Button ID="btncancelYear" runat="server" onclick="btnCancel_Click" Text="ยกเลิก" 
                    Width="56px" Visible="False" CssClass="button_in_admin" />
            </td>
                 <td >  &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
                <td  class="style2">
                &nbsp;</td>
                
            <td colspan="2">
        
        <asp:ListView ID="ListViewManageyear" runat="server" DataSourceID="SqlDataSourceYearCurriculum" 
           InsertItemPosition="LastItem" Visible="False" 
                    onitemcommand="ListViewManageyear_ItemCommand"  >
            <LayoutTemplate>
                <table border="0" cellpadding="1">
                    <tr style="background-color:#E5E5FE">
                       
                        <th align="left">
                        <asp:Label ID="lbtyear" runat="server"  CommandArgument="year">ปี</asp:Label></th>
                         <th align="left"><asp:Label ID="LinkButton1" runat="server"  >จัดการข้อมูล</asp:Label></th>
                        <th></th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
                <asp:DataPager ID="ItemDataPager" runat="server" PageSize="5">
                    <Fields>
                        <asp:NumericPagerField ButtonCount="2" />
                    </Fields>
                </asp:DataPager>    
            </LayoutTemplate>
            <ItemTemplate>
                    <tr> 
                        <td><asp:Label runat="server" ID="lblyear"><%#Eval("Curri_Year")%></asp:Label></td>

                        <td><asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>
                    </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                    <tr style="background-color:#EFEFEF">
                        <td><asp:Label runat="server" ID="lblyearEdit"><%#Eval("Curri_Year")%></asp:Label></td>
                        <td><asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>
                    </tr>
            </AlternatingItemTemplate>

            <EditItemTemplate>
                       
                    <td>
                        <asp:TextBox ID="txtYear" runat="server" Text='<%#Eval("Curri_Year") %>' Width="100px"></asp:TextBox>
                          <asp:Label ID="lblsetyear" runat="server" Text='<%#Eval("Curri_Year") %>' Visible="false"></asp:Label>
                    </td>
                    
                     <td>   
                          <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update">แก้ไข</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">ลบ</asp:LinkButton>
       
                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel">ยกเลิก</asp:LinkButton>
                    </td>
                    
                </tr>
            </EditItemTemplate>

            <InsertItemTemplate>
                <tr runat="server">
                    <td></td>
                    <td>
                        <asp:TextBox ID="txtNewYear" runat="server" Text='<%#Eval("Curri_Year") %>' Width="100px">First Name</asp:TextBox>
                        
                    </td>
                     <td>
                     <%-- <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                             Text="Insert" />--%>
                     <asp:LinkButton ID="lnkinsert" runat="server" CommandName="Insert">เพิ่มข้อมูล</asp:LinkButton>
                             
                             </td>
                    
                </tr>
            </InsertItemTemplate>
            
        </asp:ListView>
    
        
                &nbsp;<br />
                <asp:SqlDataSource ID="SqlDataSourceYearCurriculum" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="select   DISTINCT  Curri_Year  FROM Curriculum ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlYear" Name="Curri_Year" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
                <td >  &nbsp;</td>

               
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" style="font-family: tahoma; font-size: 15px; color: #000000">
                ชื่อหมวดวิชา
                </td>
            <td class="style6">
                <asp:DropDownList ID="ddlCourses" runat="server" Height="27px" Width="153px" 
                    AutoPostBack="True" DataSourceID="SqlDataSourceCourse" 
                    DataTextField="Curri_Course" DataValueField="Curri_Course">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    
                    SelectCommand="SELECT     DISTINCT  [Curri_Course] FROM [Curriculum] WHERE ([Curri_Year] = @Curri_Year)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlYear" Name="Curri_Year" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
                <td>
                    <asp:Button ID="btnCourse" runat="server" Text="จัดการข้อมูลหมวดวิชา" 
                        onclick="btnCourse_Click" CssClass="button_in_admin" />
            &nbsp;<asp:Button ID="btncancelCourse" runat="server" onclick="btnCancel_Click" Text="ยกเลิก" 
                    Width="56px" Visible="False" CssClass="button_in_admin" />
            </td>
                 <td >  &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2">
                
        <asp:ListView ID="ListViewManageCourse" runat="server" DataSourceID="SqlDataSourceCourseCurriculum" 
           InsertItemPosition="LastItem" Visible="False" 
                    onitemcommand="ListViewManageCourse_ItemCommand"  >
            <LayoutTemplate>
                <table border="0" cellpadding="1">
                    <tr style="background-color:#E5E5FE">
                       
                        <th align="left">
                        
                        <asp:Label ID="lbtmount" runat="server"  CommandArgument="year">หมวดวิชา</asp:Label></th>
                          <th align="left"><asp:Label ID="LinkButton" runat="server" >จัดการข้อมูล</asp:Label></th>
                       
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
                <asp:DataPager ID="ItemDataPager" runat="server" PageSize="5">
                    <Fields>
                        <asp:NumericPagerField ButtonCount="2" />
                    </Fields>
                </asp:DataPager>    
            </LayoutTemplate>
            <ItemTemplate>
                    <tr>
                         <td><asp:Label runat="server" ID="Label1"><%#Eval("Curri_Course")%></asp:Label></td>
                        <td><asp:LinkButton ID="lnkEdit0" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>
                    </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                    <tr style="background-color:#EFEFEF">
                         <td><asp:Label runat="server" ID="Label2"><%#Eval("Curri_Course")%></asp:Label></td>
                        <td><asp:LinkButton ID="lnkEdit1" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>
                    </tr>
            </AlternatingItemTemplate>

            <EditItemTemplate>
                    <td>
              
                    </td>
                    <td>
                        <asp:TextBox ID="txtCourse" runat="server" Text='<%#Eval("Curri_Course") %>' 
                            Width="100px"></asp:TextBox>
                          <asp:Label ID="lblsetcourse" runat="server" Text='<%#Eval("Curri_Course") %>' Visible="false"></asp:Label>
                    </td>
                    
                     <td>   
                            <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update">แก้ไข</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">ลบ</asp:LinkButton>
                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel">ยกเลิก</asp:LinkButton>
                    </td>
                    
                </tr>
            </EditItemTemplate>

            <InsertItemTemplate>
                <tr runat="server">
                    <td></td>
                    <td>
                        <asp:TextBox ID="txtNewCourse" runat="server" Text='<%#Eval("Curri_Course") %>' 
                            Width="100px"></asp:TextBox>
                        
                    </td>
                     <td>
                     <%-- <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                             Text="Insert" />--%>
                     <asp:LinkButton ID="lnkinsert" runat="server" CommandName="Insert">เพิ่มข้อมูล</asp:LinkButton>
                             
                             </td>
                    
                </tr>
            </InsertItemTemplate>
            
        </asp:ListView>


    
        
                <asp:SqlDataSource ID="SqlDataSourceCourseCurriculum" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    
                    SelectCommand="SELECT    DISTINCT  Curri_Course   FROM [Curriculum] WHERE ([Curri_Year] = @Curri_Year)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlYear" Name="Curri_Year" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>


    
        
                </td>
                 <td >  &nbsp;</td>
        </tr>
        <tr >
            <td class="style1">
                &nbsp;</td>
            <td class="style2" style="font-family: tahoma; font-size: 15px; color: #000000">
                ชื่อกลุ่มวิชา 
                </td>
            <td class="style6">
                <asp:DropDownList ID="ddlGroup" runat="server" Height="27px" Width="153px" DataSourceID="SqlDataGroup" 
                    DataTextField="Curri_Group" DataValueField="Curri_Group">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataGroup" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    
                    
                    SelectCommand="SELECT      DISTINCT  [Curri_Group] FROM [Curriculum] WHERE (([Curri_Year] = @Curri_Year) AND ([Curri_Course] = @Curri_Course))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlYear" Name="Curri_Year" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlCourses" Name="Curri_Course" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
                <td> 
                    <asp:Button ID="btnGroup" runat="server" Text="จัดการข้อมูลกลุ่มวิชา" 
                        onclick="btnGroup_Click" CssClass="button_in_admin" />
            &nbsp;<asp:Button ID="btncancelGroup" runat="server" onclick="btnCancel_Click" Text="ยกเลิก" 
                    Width="56px" Visible="False" CssClass="button_in_admin" />
            </td>
                 <td >  &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2">
                
        <asp:ListView ID="ListViewManageGroup" runat="server" DataSourceID="SqlDataSourceGroupCurriculum" 
           InsertItemPosition="LastItem" Visible="False" 
                    onitemcommand="ListViewManageGroup_ItemCommand"  >
            <LayoutTemplate>
                <table border="0" cellpadding="1">
                    <tr style="background-color:#E5E5FE">
                       
                        <th align="left">
                        
                        <asp:Label ID="lbtmount" runat="server"  CommandArgument="year">กลุ่มรายวิชา</asp:Label></th>
                          <th align="left"><asp:Label ID="LinkButton2" runat="server" >จัดการข้อมูล</asp:Label></th>
                       
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
                <asp:DataPager ID="ItemDataPager" runat="server" PageSize="5">
                    <Fields>
                        <asp:NumericPagerField ButtonCount="2" />
                    </Fields>
                </asp:DataPager>    
            </LayoutTemplate>
            <ItemTemplate>
                    <tr>
                         <td><asp:Label runat="server" ID="Label3"><%#Eval("Curri_Group")%></asp:Label></td>
                        <td><asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>
                    </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                    <tr style="background-color:#EFEFEF">
                         <td><asp:Label runat="server" ID="Label4"><%#Eval("Curri_Group")%></asp:Label></td>
                        <td><asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>
                    </tr>
            </AlternatingItemTemplate>

            <EditItemTemplate>
                    <td>
              
                    </td>
                    <td>
                        <asp:TextBox ID="txtGroup" runat="server" Text='<%#Eval("Curri_Group") %>'  Width="100px"></asp:TextBox>
                        <asp:Label ID="lblsetGroup" runat="server" Text='<%#Eval("Curri_Group") %>'  Visible="false"></asp:Label>
                            
                    </td>
                    
                     <td>   
                            <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update">แก้ไข</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">ลบ</asp:LinkButton>
                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel">ยกเลิก</asp:LinkButton>
                    </td>
                    
                </tr>
            </EditItemTemplate>

            <InsertItemTemplate>
                <tr runat="server">
                    <td></td>
                    <td>
                        <asp:TextBox ID="txtNewGroup" runat="server" Text='<%#Eval("Curri_Group") %>' 
                            Width="100px"></asp:TextBox>
                        
                    </td>
                     <td>
                     <%-- <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                             Text="Insert" />--%>
                     <asp:LinkButton ID="lnkinsert" runat="server" CommandName="Insert">เพิ่มข้อมูล</asp:LinkButton>
                             
                             </td>
                    
                </tr>
            </InsertItemTemplate>
            
        </asp:ListView>

       
                <asp:SqlDataSource ID="SqlDataSourceGroupCurriculum" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT * FROM [Curriculum] WHERE ([Curri_Course] = @Curri_Course)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCourses" Name="Curri_Course" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>


    
        
    
        
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                      <td >
                    &nbsp;</td> 
            <td>
                <span class="wrap">
                                                <asp:Button ID="btnSave" runat="server" 
                    Text="ยืนยันการเปลี่ยนแปลง" ValidationGroup="Reg1" 
                              Width="132px" onclick="btnSave_Click" 
                    CssClass="button_in_admin"/>

                               <asp:Button ID="btnCanCel" runat="server" Text="ยกเลิก" 
                    Width="80px" PostBackUrl="~/WebPage/BackYard/Admin/MainAdmin.aspx" 
                    CssClass="button_in_admin" />
                </span>&nbsp;
                  </td>
        </tr>
    </table>


      

</ContentTemplate>

</asp:UpdatePanel>

</asp:Content>

