<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddDetailTeachAfter.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddDetailTeachAfter" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style type="text/css">
        .style3
        {
            width: 550px;
        }
             .textbox_in_back
            {
                border: 1px solid #bfbfbf;
                padding-left: 3px;
            }

            .button
            {
                height: 28px;
                font-family: tahoma;
                font-size: small;
                padding-right: 10px;
                padding-left: 10px;
            }
            .button:hover
            {
                background-color: #737373;
                color: #FFFFFF;
            }

    </style>


</asp:Content>
 


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />





<link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
<div style="text-align:left; margin-bottom: 8px;"> &nbsp;&nbsp;&nbsp;&nbsp; <b>จัดการข้อมูลรายละเอียดผลการเรียนย้อนหลัง</b></div>



<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">ปีการศึกษา</div>
<div style="float: left; width: 86px;" align="left">
    <asp:DropDownList ID="DropDownListYear" runat="server" Height="22px" Width="65px" 
        CssClass="cropborder" AutoPostBack="True">
    </asp:DropDownList>

</div>
</div>


<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">ชั้นปี</div>
<div style="float: left; width: 86px;" align="left">
    <asp:DropDownList ID="DropDownListLevel" runat="server" Height="22px" Width="65px" 
        CssClass="cropborder" AutoPostBack="True">
        <asp:ListItem Value="0">--เลือก--</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
    </asp:DropDownList>
</div>
</div>

<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">เทอม</div>
<div style="float: left; width: 86px;" align="left">
    <asp:DropDownList ID="DropDownListTerm" runat="server" Height="22px" Width="65px" 
        CssClass="cropborder" AutoPostBack="True">
        <asp:ListItem Value="0">--เลือก--</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>

        <asp:ListItem>3</asp:ListItem>

    </asp:DropDownList>
</div>
</div>


<div style="width: 244px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">
    กลุ่ม</div>
<div style="float: left; width: 86px;" align="left">
    <asp:DropDownList ID="DropDownListGroup" runat="server" Height="22px" Width="65px" 
        CssClass="cropborder" AutoPostBack="True">
        <asp:ListItem Value="N">--เลือก--</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>

        <asp:ListItem>3</asp:ListItem>

        <asp:ListItem>4</asp:ListItem>

    </asp:DropDownList>
</div>
</div>

<div style="width: 415px; height: 30px; margin-bottom: 8px;">
<div style="float: left; width: 86px; text-align: right; margin-right: 10px; font-family: tahoma; font-size: 15px; color: #000000;">
    รายวิชา</div>
<div style="float: left; width: 86px;" align="left">
    <asp:TextBox ID="txtsubject" runat="server"></asp:TextBox>
</div>

    <asp:Button ID="btnsearchsubject" runat="server" Text="ค้นหารายวิชา" 
        CssClass="button_in_admin" 
        onclick="btnsearchsubject_Click" />



</div>



<div align="right" style="width: 885px">
        &nbsp;&nbsp;<asp:Button ID="btnAddDetailTeach" runat="server" Text="เพิ่มรายละเอียดการสอน" 
        CssClass="textbox_in_back" onclick="btnAddDetailTeach_Click" /> 

        &nbsp;&nbsp;</div>



    <div align="center" style="width: 80%">
       
        <asp:GridView ID="GridViewShowDetailTeach" runat="server" 
            AutoGenerateColumns="False" Width="80%"
            CellPadding="4" DataKeyNames="DetailTech_ID" 
            DataSourceID="SqlDataSourceShowDetailTeach" ForeColor="#333333" 
            GridLines="None" onrowcommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>

             <asp:TemplateField HeaderText="ดึงรายวิชา">
                                                        <ItemTemplate>
                                                            <table border="0" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td align="center" style="height: 18px;">
                                                                        <asp:LinkButton ID="btnEdit" runat="server" AlternateText="ลบข้อมูลรายวิชา" 
                                                                            CommandArgument='<%# Eval("DetailTech_ID") %>' CommandName="del" 
                                                                            ToolTip="ลบข้อมูลรายวิชา">ลบข้อมูล</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                 </asp:TemplateField>

                <asp:BoundField DataField="DetailTeach_Year" HeaderText="ปีการศึกษา" 
                    SortExpression="DetailTeach_Year" />

                <asp:BoundField DataField="DetailTech_Term" HeaderText="เทอม" 
                    SortExpression="DetailTech_Term" />
                   <asp:BoundField DataField="DetailTech_Level" HeaderText="ชั้นปี" 
                    SortExpression="DetailTech_Level" />
                <asp:BoundField DataField="DetailTech_Class" HeaderText="กลุ่ม" 
                    SortExpression="DetailTech_Class" />
                <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสวิชา" 
                    SortExpression="StructSub_Code" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSourceShowDetailTeach" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
            SelectCommand="SELECT * FROM [DetailTech] WHERE (([DetailTeach_Year] = @DetailTeach_Year) AND ([DetailTech_Level] = @DetailTech_Level) AND ([DetailTech_Term] = @DetailTech_Term) AND ([DetailTech_Class] = @DetailTech_Class))">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListYear" Name="DetailTeach_Year" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownListLevel" Name="DetailTech_Level" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListTerm" Name="DetailTech_Term" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListGroup" Name="DetailTech_Class" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>


        <br />

        <p style="text-align:right">
                     <asp:Button ID="btnNext" runat="server" CssClass="textbox_in_back" 
                Text="ยกเลิก" PostBackUrl="~/WebPage/BackYard/Admin/ManageDetailTeach.aspx" />
                 </p>

    </div>



   
<div style="width: 95%; height: auto">
  


     <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" ></ajaxToolkit:ToolkitScriptManager>
    
    <ajaxToolkit:ModalPopupExtender ID="mdlpopup" BackgroundCssClass="modalbackground" runat="server" TargetControlID="HiddenTargetShow" 
     PopupControlID="pnl" OkControlID="btnCancel" Y="100" ></ajaxToolkit:ModalPopupExtender>
       
     <asp:HiddenField ID="HiddenTargetShow" runat="server" />
       
    <asp:Panel ID="pnl" runat="server"  CssClass="modalpopupNews" 
        BorderColor="ActiveBorder" BorderStyle="Solid" BorderWidth="3px" Height="475px" 
        Width="807px">
        <div style="margin-left:790px;margin-top:-20px;">
            <asp:ImageButton ID="imgClose" runat="server" 
                ImageUrl="~/image/close_button.png" OnClick="imgClose_Click" Height="33px" /></div>

        <table style="width:98%; text-align:left; margin-right: 0px; height: 80%;" >
        

            <tr>
                <td class="style3" >ปีการศึกษาที่ปรับปรุงหลักสูตร</td>
                <td >

                   <asp:DropDownList ID="ddlYear" 
                    runat="server" DataSourceID="SqlDataSourceYearEdu" 
                    DataTextField="Curri_Year" DataValueField="Curri_Year"  
                        CssClass="textbox_in_back" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceYearEdu" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Curri_Year] FROM [Curriculum]"></asp:SqlDataSource>




                    &nbsp;</td>

                
                <td>
                   
                    &nbsp;
                    <%--     <asp:Image ID="Img" runat="server" ControlStyle-Height="50" ControlStyle-Width="50" Height="107px" style="margin-left: 0px" Width="113px" />
                    <asp:Button ID="UploadButton" runat="server" Height="25px" text="Upload" Width="105px" />--%>
                </td>

                
                <td 
                    <asp:FileUpload ID="FUCPic" runat="server" Height="27px" 
                        style="margin-left: 0px" Width="207px" />
                &nbsp;</td>

                
            </tr>
            <tr>
                <td class="style3">
                    หมวดวิชา</td>
                <td class="auto-style26">


  <asp:DropDownList ID="ddlCourses" runat="server" Height="27px" Width="153px" DataSourceID="SqlDataSourceCourse" 
                    DataTextField="Curri_Course" DataValueField="Curri_Course" 
                        CssClass="textbox_in_back">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                
                    
                    
                    SelectCommand="SELECT DISTINCT [Curri_Course] FROM [Curriculum] WHERE ([Curri_Year] = @Curri_Year)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlYear" 
                            Name="Curri_Year" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>





                    &nbsp;</td>
                <td class="auto-style26">
                    กลุ่มวิชา</td>
                <td class="auto-style26">

                        <asp:DropDownList ID="ddlGroup" runat="server" DataSourceID="SqlDataGroup" 
                              DataTextField="Curri_Group" DataValueField="Curri_Group" 
                            CssClass="textbox_in_back">
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

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    รหัสวิชา:</td>
                <td class="auto-style27">
                    <asp:TextBox ID="txtcode" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    ชือวิชาภาษาไทย:</td>
                <td class="auto-style27">
                    <asp:TextBox ID="txtNameThai" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                </td>
                <caption style="background-color: #999999; font-weight: bold; color: #FFFFFF; margin-left: 14px;">
                    ค้นหาข้อมูลรายวิชา<tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td colspan="3" style="text-align:right" >
                        
                                    <asp:Button ID="searchSubjectpopup" runat="server" CssClass="button_in_admin" 
                                        onclick="searchSubjectpopup_Click" 
                                        Text="ค้นหารายวิชา" />
                                    &nbsp;
                                    <asp:Button ID="btncancel0" runat="server" CssClass="button_in_admin" 
                                        onclick="btnCancel_Click" Text="ยกเลิก" />
                                    &nbsp;<tr>
                                <td class="style3">
                                    &nbsp;</td>
                                <td colspan="3">
                                    <tr>
                                        <td colspan="4">
                                            <span class="wrap">
                                            <asp:GridView ID="gvSubject" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" CssClass="MyGridView_SearchSubject" 
                                                DataKeyNames="StructSub_Code" EmptyDataText="ไม่พบข้อมูลที่คุณค้นหา" 
                                                onpageindexchanging="gvSubject_PageIndexChanging" 
                                                onrowcommand="gvSubject_RowCommand" PageSize="5" Width="95%">
                                                <AlternatingRowStyle CssClass="MyGridViewAlt_SearchSubject" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ดึงรายวิชา">
                                                        <ItemTemplate>
                                                            <table border="0" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td align="center" style="height: 18px;">
                                                                        <asp:LinkButton ID="btnEdit" runat="server" AlternateText="ดึงรายวิชา" 
                                                                            CommandArgument='<%# Eval("StructSub_Code") %>' CommandName="getsubject" 
                                                                            ToolTip="ดึงรายวิชา">ดึงข้อมูล</asp:LinkButton>
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
                                                    <asp:BoundField DataField="StructSub_NameEn" 
                                                        HeaderText="ชื่อรายวิชาภาษาอังกฤษ" />
                                                    <asp:BoundField DataField="StructSub_Credit" HeaderText="หน่วยกิต" />
                                                </Columns>
                                                <HeaderStyle CssClass="GridViewHeader_SearchSubject" Height="30px" />
                                                <RowStyle CssClass="MyGridViewRow_SearchSubject" Height="20px" />
                                            </asp:GridView>
                                            </span>
                                        </td>
                                    </tr>
                                </td>
                            </tr>
                        </td>
                        </td>
                    </tr>
                </caption>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="auto-style27">
                        &nbsp;</td>
                    <td class="auto-style27">
                        <center>
                            &nbsp;&nbsp;</center>
                    </td>
                    <td class="auto-style27">
                        &nbsp;</td>
                </tr>
            </tr>
            </tr>
        </table>
        <br />
        <br />

        <br />
    </asp:Panel>

    
        


    <br /><br />



   
    
</div>


</asp:Content>
