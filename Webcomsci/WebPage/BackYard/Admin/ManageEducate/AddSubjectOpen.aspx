<%--<%@ Page Title"" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddSubjectOpen.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManageEducate.AddSubjectOpen" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddSubjectOpen.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddSubjectOpen" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


   .className
{
    /*background: url('../image/Admin/book_open.png') no-repeat 0 0;
    border: 0;
    height: 61px;
    width: 60px;
    background-color: #C0C0C0;*/
    background-position: left top;
    border: 1px solid #bfbfbf;
    padding-right: 30px;
    padding-left: 10px;
    border-radius: 4px;
    padding-bottom: 5px;
    background-color: #dedede;
    background-image: url('../../../../image/Admin/book_open.png');
    background-repeat: no-repeat;
    text-shadow: 0.1em 0.1em #fff;
    cursor: pointer;
}


        .className
        {
            /*background: url('../image/Admin/book_open.png') no-repeat 0 0;
    border: 0;
    height: 61px;
    width: 60px;
    background-color: #C0C0C0;*/
            text-align: right;
            background-position: left top;
            border: 1px solid #bfbfbf;
            padding-right: 30px;
            padding-left: 10px;
            border-radius: 4px;
            padding-bottom: 5px;
            background-color: #dedede;
            background-image: url('../../image/Admin/book_open.png');
            background-repeat: no-repeat;
            text-shadow: 0.1em 0.1em #fff;
            cursor: pointer;
            width: 100px;
            height: 40px;
        }
    
   
        .className
{
    /*background: url('../image/Admin/book_open.png') no-repeat 0 0;
    border: 0;
    height: 61px;
    width: 60px;
    background-color: #C0C0C0;*/
    background-position: left top;
    border: 1px solid #bfbfbf;
    padding-right: 30px;
    padding-left: 10px;
    border-radius: 4px;
    padding-bottom: 5px;
    background-color: #dedede;
    background-image: url('../../../../image/Admin/book_open.png');
    background-repeat: no-repeat;
    text-shadow: 0.1em 0.1em #fff;
    cursor: pointer;
}


        .iconswap
{
    background-position: left top;
    border: 1px solid #bfbfbf;
    padding-right: 30px;
    padding-left: 10px;
    border-radius: 4px;
    padding-bottom: 5px;
    background-color: #dedede;
    background-image: url('../../../../image/Admin/switch.png');
    background-repeat: no-repeat;
    text-shadow: 0.1em 0.1em #fff;
    cursor: pointer;
}


 .textbox_in_back
    {
        border: 1px solid #bfbfbf;
        padding-left: 3px;
    }

        .textbox_in_back
        {
            border: 1px solid #bfbfbf;
            padding-left: 3px;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   
      <link href="../../../../css/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
       <link href="../../../../css/bootstrap/css/bootstrap-responsive.min.css" type="text/css" />
       <link href="../../../../css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
      <link href="../../../../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script src="../../../../css/bootstrap/js/bootstrap.js" type="text/jscript"></script>
    <script src="../../../../css/bootstrap/js/bootstrap.min.js" type="text/jscript"></script>

        <link href="../../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
    <link href="../../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />





<div style="width: 95%; height: auto; text-align:left;">
    <ul class="nav nav-list">
        <li class="active"><a href="#">เพิ่มรายวิชาที่เปิดสอน</a></li>
        
        <br />
        <br />
        <div style="text-align: center;">

         ปีการศึกษาที่เปิด&nbsp; 
            <asp:DropDownList ID="ddlYearEdu" runat="server" Height="30px" Width="150px" CssClass="btn dropdown-toggle"
                AutoPostBack="True" >
            </asp:DropDownList>

            <br />
            <br />
            นักศึกษารหัส&nbsp;&nbsp;&nbsp; &nbsp; 
            <asp:DropDownList ID="ddlYear" runat="server" Height="30px" Width="150px" CssClass="btn dropdown-toggle"
                AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
             &nbsp;ชั้นปี&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="150px" CssClass="btn dropdown-toggle"
                AutoPostBack="True" >
                <asp:ListItem Value="N">--เลือกชั้นปี--</asp:ListItem>
                <asp:ListItem Value="1">ปี 1</asp:ListItem>
                <asp:ListItem Value="2">ปี 2</asp:ListItem>
                <asp:ListItem Value="3">ปี 3</asp:ListItem>
                <asp:ListItem Value="4">ปี 4</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            เทอม&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  
            <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="150px" CssClass="btn dropdown-toggle"
                AutoPostBack="True">
                <asp:ListItem Value="N">--เลือกเทอม--</asp:ListItem>
                <asp:ListItem Value="1">เทอม 1</asp:ListItem>
                <asp:ListItem Value="2">เทอม 2</asp:ListItem>
                <asp:ListItem Value="3">เทอม 3</asp:ListItem>
            </asp:DropDownList>
            <br />
        </div>

       <div style="text-align: right;" class="form-actions">
  
                        <span >
                            <asp:GridView ID="dgVdetailDetailTeach1" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="subcode" ForeColor="#333333" 
                            GridLines="None" Width="100%" 
                            onpageindexchanging="dgVdetailDetailTeach1_PageIndexChanging" 
                            Visible="False">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="no" HeaderText="ลำดับที่" />
                                    <asp:BoundField DataField="subcode" HeaderText="รหัสวิชา" />
                                    <asp:BoundField DataField="subThai" HeaderText="ชือวิชา" />
                                    <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" />

                                     

                                    <asp:TemplateField HeaderText="ยืนยันเปิดสอน">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">
                                                        <asp:Button ID="btnConfirmOpenSubjec" runat="server" CommandArgument='<%# Eval("subcode") + ","+Eval("subThai") + ","+Eval("dchid")+ ",1" %>'  
                                                            Text="  ยืนยันเปิดสอน" CssClass="className" Height="36px" OnClick="btnConfirmOpenSubjec_Click"
                                                            Width="162px" />


                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="สลับรายวิชา">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">
                                                        <asp:Button ID="btnSwapSubject" runat="server" CommandArgument='<%# Eval("curi")+ ","+Eval("subcode")+ ","+Eval("subThai")+ ",1"+ ","+Eval("dchid") %>'
                                                            Text="       สลับรายวิชา" CssClass="iconswap" Height="36px" OnClick="btnSwapSubject_Click"
                                                            Width="162px" />


                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>

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
                        </span>
                      
                        <br />
            <br />

                         <fieldset style="width: 95%">


                         

                        <div style="text-align:right;">


                     <asp:Button ID="btnchotsub1" runat="server" CssClass="textbox_in_back" CommandArgument="1"
                         onclick="btnchotsub1_Click" Text="เลือกรายวิชาเพิ่ม" Height="43px" 
                                Visible="False" />

                           <br />


                         </div>

                             <br />

                        <span >
                             <%--  <asp:TemplateField HeaderText="แก้ไข">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">

                                                        <asp:LinkButton ID="lbtnUpdate1" 
                                                            
                                                            CommandArgument='<%# Eval("subcode") + ","+Eval("subThai")+ ","+Eval("curri")+ ","+Eval("tchid")  + ","+Eval("classid")+ ","+Eval("dchid")   %>' 
                                                            onclientclick="return confirm('คุณต้องการจะสลับรายวิชานี้ ?')"  runat="server" 
                                                            onclick="lbtnUpdate1_Click">แก้ไข</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>--%>
                        <span class="wrap" __designer:mapid="208">
                            <asp:GridView ID="gvManageDetailTeach1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="4" DataKeyNames="subcode" ForeColor="Black" 
                            GridLines="Vertical" Width="100%" 
                            DataSourceID="SqlDataSourceShowdtch1" BackColor="White" BorderColor="#DEDFDE" 
                                 BorderStyle="None" BorderWidth="1px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                              <asp:TemplateField HeaderText="ลบข้อมูล">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">
                                                        <asp:LinkButton ID="lbtndeleteDch1" runat="server"  
                                                            CommandArgument='<%# Eval("subcode")+ ","+Eval("tchid")+ ","+Eval("dchid")  %>'  
                                                            onclick="lbtndeleteDch1_Click" onclientclick="return confirm('คุณต้องการจะลบข้อมูลรายละเอียดการสอนนี้ ?')" >ลบข้อมูล</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>


                                  <%--  <asp:TemplateField HeaderText="แก้ไข">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">

                                                        <asp:LinkButton ID="lbtnUpdate1" 
                                                            
                                                            CommandArgument='<%# Eval("subcode") + ","+Eval("subThai")+ ","+Eval("curri")+ ","+Eval("tchid")  + ","+Eval("classid")+ ","+Eval("dchid")   %>' 
                                                            onclientclick="return confirm('คุณต้องการจะสลับรายวิชานี้ ?')"  runat="server" 
                                                            onclick="lbtnUpdate1_Click">แก้ไข</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>--%>
                                     <asp:BoundField DataField="ye" HeaderText="ปีการศึกษา" />
                                    <asp:BoundField DataField="vel" HeaderText="ชั้นปี" />
                                    <asp:BoundField DataField="gro" HeaderText="กลุ่ม" />
                                    <asp:BoundField DataField="subcode" HeaderText="รหัสวิชา" />
                                    <asp:BoundField DataField="subThai" HeaderText="ชือวิชา" />
                                <%--    <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" />--%>
                                    <asp:BoundField DataField="tea" HeaderText="อาจารย์ผู้สอน" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </span>
                      
                        </span>
                      


                        
&nbsp;<br />
</fieldset></div>
            <asp:Button ID="btn" runat="server" Text="ยืนยันการเปิดรายวิชา" class="btn btn-primary"
                PostBackUrl="~/WebPage/BackYard/Admin/ManinChooseDetailTeach.aspx" 
                onclick="btn_Click"  />

      

        </ul>
    <p>
        &nbsp;</p>



           <asp:HiddenField ID="HiddenField1" runat="server" />


                        
                        <ajaxtoolkit:modalpopupextender ID="mdlshowSwap" 
        runat="server" DynamicServicePath=""
                            Enabled="True" TargetControlID="HiddenField1" 
        PopupControlID="panel1" BackgroundCssClass="modalbackground">
                        </ajaxtoolkit:modalpopupextender>


                        <asp:Panel ID="Panel1"  CssClass="modalpopup" runat="server" Style=" width: 60%;"><%--display: none;--%>
                            <%--<uc1:PopupAddsubject ID="popupDetailTeach" runat="server" />--%>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div style="text-align: right; background-color: #999999;">
                                        <asp:ImageButton ID="imgbtnSwap" runat="server" ImageUrl="~/image/close_button.png"
                                            AlternateText="ปิด" OnClick="imgbtnSwap_Click"/>
                                    </div>
                                    <table style="width: 100%; text-align: left; margin-right: 0px; height: 80%;">
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                               
                                                  <div style="width: 500px; height: 50px; padding-top: 15px;">
                                                      รายวิชาที่คุณต้องการสลับ
                                                      <br />
                                                      รหัสวิชา
                                                      <asp:Label ID="lblcode" runat="server"></asp:Label>
                                                      &nbsp;ชื่อวิชา
                                                      <asp:Label ID="lblnameThai" runat="server"></asp:Label>
                                                      <asp:Label ID="lbldetailTeach" runat="server" Visible="False"></asp:Label>
                                                </div>

                                            </td>
                                            <td class="auto-style26">
                                               
                                            </td>
                                            <td class="auto-style26">
                                                
                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;
                                            </td>
                                        </tr>


                                        </caption style="font-weight: bold; margin-left: 14px;">
                                        <caption>
                                            <strong>เลือกรายวิชาที่จะสลับ</strong><caption>
                                                &nbsp;<tr>
                                                    <td colspan="5" style="text-align: right">
                                                        <span class="wrap">
                                                        <br />

                                                        <center>
                                                        <asp:GridView ID="gvShowSubjectSwap" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                                                            CellPadding="4" DataKeyNames="subcode" ForeColor="#333333" 
                                                            GridLines="None" Width="90%" 
                                                            PageSize="5" onpageindexchanging="gvShowSubjectSwap_PageIndexChanging1" 
                                                                style="margin-right: 1px">
                                                            <AlternatingRowStyle BackColor="White" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="เลือกรายวิชา">
                                                                    <ItemTemplate>
                                                                        <table border="0" cellpadding="1" cellspacing="1">
                                                                            <tr>
                                                                                <td align="center" style="height: 18px;">
                                                                                    <asp:LinkButton ID="linkpoupupSwap" runat="server" AlternateText="เลือกรายวิชาที่ต้องการสลับ"  onclientclick="return confirm('ยืนยันการสลับวิชา ?')"
                                                                                        CommandArgument='<%# Eval("subcode") + ","+Eval("subThai")+",1"   %>' onclick="lbtnChoose_Click" 
                                                                                        ToolTip="เลือรายวิชาที่ต้องการสลับ">เลือก</asp:LinkButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="subcode" HeaderText="รหัสรายวิชา" 
                                                                    SortExpression="code" />
                                                                <asp:BoundField DataField="subThai" HeaderText="ชือวิชา" 
                                                                    SortExpression="nameTha" />
                                                                <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" 
                                                                    SortExpression="credit" />
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
                                                        </center>
                                                        </span>
                                                        <tr>
                                                            <td colspan="3">
                                                                &nbsp;<tr>
                                                                    <td colspan="4">
                                                                        <span class="wrap">
                                                                        <center>
                                                                            <asp:Label ID="lblAlertSubject" runat="server" ForeColor="Red"></asp:Label>
                                                                            <br />
                                                                        </center>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </td>
                                                        </tr>
                                                    </td>
                                                    </td>
                                                </tr>
                                            </caption>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    &nbsp;
                                                </td>
                                                <td class="auto-style27">
                                                    &nbsp;
                                                </td>
                                                <td class="auto-style27">
                                                    <center>
                                                        &nbsp;&nbsp;</center>
                                                </td>
                                                <td style="text-align: right">
                                                    &nbsp;</td>
                                                <td style="text-align: right">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            </tr>
                                            </tr>
                                        </caption>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>

                    <%--  <asp:TemplateField HeaderText="แก้ไข">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="height: 18px;">

                                                        <asp:LinkButton ID="lbtnUpdate1" 
                                                            
                                                            CommandArgument='<%# Eval("subcode") + ","+Eval("subThai")+ ","+Eval("curri")+ ","+Eval("tchid")  + ","+Eval("classid")+ ","+Eval("dchid")   %>' 
                                                            onclientclick="return confirm('คุณต้องการจะสลับรายวิชานี้ ?')"  runat="server" 
                                                            onclick="lbtnUpdate1_Click">แก้ไข</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                    </asp:TemplateField>--%>


                     <asp:HiddenField ID="HiddenField2" runat="server" />


                        
                        <ajaxtoolkit:modalpopupextender ID="mdlSubject" 
        runat="server" DynamicServicePath=""
                            Enabled="True" TargetControlID="HiddenField1" 
        PopupControlID="panelsubject" BackgroundCssClass="modalbackground">
                        </ajaxtoolkit:modalpopupextender>


                        <asp:Panel ID="panelsubject"  CssClass="modalpopup" runat="server" Style=" width: 60%;"><%--display: none;--%>
                            <%--<uc1:PopupAddsubject ID="popupDetailTeach" runat="server" />--%>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div style="text-align: right; background-color: #999999;">
                                        <asp:ImageButton ID="ibtnCloseSubject" runat="server" ImageUrl="~/image/close_button.png"
                                            AlternateText="ปิด" OnClick="ibtnCloseSubject_Click"/>
                                    </div>
                                    <table style="width: 100%; text-align: left; margin-right: 0px; height: 80%;">
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                               
                                                  ปีการศึกษา
                                                  <asp:Label ID="lblyear" runat="server" Text="0" Visible="False"></asp:Label>
                                                  &nbsp;<asp:Label ID="lblyearCur" runat="server" Text="0"></asp:Label>
                                                  ชั้นปีที่ศึกษา 
                                                  <asp:Label ID="lbllevel" runat="server" Text="0"></asp:Label>

                                            </td>
                                            <td class="auto-style26">
                                               
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                        </tr>


                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                หมวด
                                                <asp:DropDownList ID="ddlCourses" runat="server" AutoPostBack="True" 
                                                    DataSourceID="SqlDataSourceCourse" DataTextField="Curri_Course" 
                                                    DataValueField="Curri_Course" Height="27px" Width="153px">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                                                    SelectCommand="SELECT DISTINCT Curri_Course  FROM [Curriculum] WHERE ([Curri_Year] = @Curri_Year)">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblyear" Name="Curri_Year" 
                                                            PropertyName="Text" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td class="auto-style26">
                                                หมู่วิชา
                                                <asp:DropDownList ID="ddlGroup" runat="server" AutoPostBack="True" 
                                                    DataSourceID="SqlDataGroup" DataTextField="Curri_Group" 
                                                    DataValueField="Curri_Group">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataGroup" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                                                    
                                                    SelectCommand="SELECT Curri_Group FROM [Curriculum] WHERE (([Curri_Year] = @Curri_Year) AND ([Curri_Course] = @Curri_Course))">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblyear" Name="Curri_Year" 
                                                            PropertyName="Text" Type="String" />
                                                        <asp:ControlParameter ControlID="ddlCourses" Name="Curri_Course" 
                                                            PropertyName="SelectedValue" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                ชื่อวิชา
                                                <asp:TextBox ID="txtnameSubject" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="text-align:right;">
                                                <asp:Button ID="btnSearchSubject" runat="server" CssClass="textbox_in_back" 
                                                    Text="ค้นหารายวิชา &gt;&gt;" onclick="btnSearchSubject_Click" 
                                                    Height="43px" Width="142px" />
                                            </td>
                                            <td class="auto-style26">
                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;
                                            </td>
                                        </tr>


                                        </caption style="font-weight: bold; margin-left: 14px;">
                                        <caption>
                                            <strong>ค้นหารายวิชา</strong><caption>
                                                &nbsp;<tr>
                                                    <td colspan="5" style="text-align: right">
                                                        <span class="wrap">
                                                        <br />

                                                        <center>
                                                        <asp:GridView ID="gvSearchSubject" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                                                            CellPadding="4" DataKeyNames="subcode" ForeColor="#333333" 
                                                            GridLines="None" Width="90%" 
                                                            PageSize="5" onpageindexchanging="gvSearchSubject_PageIndexChanging" 
                                                                style="margin-right: 1px">
                                                            <AlternatingRowStyle BackColor="White" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="เลือกรายวิชา">
                                                                    <ItemTemplate>
                                                                        <table border="0" cellpadding="1" cellspacing="1">
                                                                            <tr>
                                                                                <td align="center" style="height: 18px;">
                                                                                    <asp:LinkButton ID="lblinsertSubjec" runat="server" AlternateText="เลือกวิชา"  onclientclick="return confirm('คุณต้องการเลือกวิชานี้หรือไม่ ?')"
                                                                                        CommandArgument='<%# Eval("subcode") + ","+Eval("subThai")   %>' onclick="lblinsertSubjec_Click" 
                                                                                        ToolTip="เลือกวิชา">เลือก</asp:LinkButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="subcode" HeaderText="รหัสรายวิชา" 
                                                                    SortExpression="code" />
                                                                <asp:BoundField DataField="subThai" HeaderText="ชือวิชา" 
                                                                    SortExpression="nameTha" />
                                                                <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" 
                                                                    SortExpression="credit" />
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
                                                        </center>
                                                        </span>
                                                        <tr>
                                                            <td colspan="3">
                                                                &nbsp;<tr>
                                                                    <td colspan="4">
                                                                        <span class="wrap">
                                                                        <center>
                                                                            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                                                ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                                                                                SelectCommand="SELECT * FROM [DetailTech] WHERE (([DetailTeach_Year] = @DetailTeach_Year) AND ([DetailTech_Term] = @DetailTech_Term) AND ([DetailTech_Level] = @DetailTech_Level))">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="lblyear" Name="DetailTeach_Year" 
                                                                                        PropertyName="Text" Type="String" />
                                                                                    <asp:ControlParameter ControlID="lblterm" Name="DetailTech_Term" 
                                                                                        PropertyName="Text" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="lbllevel" Name="DetailTech_Level" 
                                                                                        PropertyName="Text" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>--%>
                                                                            <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                                                                            <br />
                                                                        </center>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </td>
                                                        </tr>
                                                    </td>
                                                    </td>
                                                </tr>
                                            </caption>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    &nbsp;
                                                </td>
                                                <td class="auto-style27">
                                                    &nbsp;
                                                </td>
                                                <td class="auto-style27">
                                                    <center>
                                                        &nbsp;&nbsp;</center>
                                                </td>
                                                <td style="text-align: right">
                                                    &nbsp;</td>
                                                <td style="text-align: right">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            </tr>
                                            </tr>
                                        </caption>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>

                        
                       <%--    <asp:BoundField DataField="credite" HeaderText="หน่วยกิต" />--%>

                         <asp:HiddenField ID="HiddenField3" runat="server" />


                        
                        <ajaxtoolkit:modalpopupextender ID="mdlOpenSubject" 
        runat="server" DynamicServicePath=""
                            Enabled="True" TargetControlID="HiddenField1" 
        PopupControlID="panelAddGroup" BackgroundCssClass="modalbackground">
                        </ajaxtoolkit:modalpopupextender>


                        <asp:Panel ID="panelAddGroup"  CssClass="modalpopup" runat="server" Style=" width: 60%;"><%--display: none;--%>
                            <%--<uc1:PopupAddsubject ID="popupDetailTeach" runat="server" />--%>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div style="background-color: #999999;" class="style11">
                                        <br />
                                        <strong>เปิดรายวิชา<br /> </strong></div>
                                    <table style="width: 100%; text-align: left; margin-right: 0px; height: 80%;">
                                        <tr>
                                            <td class="style6" >
                                                &nbsp;</td>
                                            <td colspan="2">
                                               
                                                  ปีการศึกษา
                                                  <asp:Label ID="lblyearOpenHide" runat="server" Text="0" Visible="False"></asp:Label>
                                                  &nbsp;<asp:Label ID="lblYearOpensub" runat="server" Text="0"></asp:Label>

                                            </td>
                                            <td class="style7">
                                                
                                                ชั้นปีที่ศึกษา
                                                <asp:Label ID="lbllevelOpen" runat="server" Text="0"></asp:Label>
                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                        </tr>


                                        <tr>
                                            <td class="style8">
                                                </td>
                                            <td  colspan="2" class="style9">
                                                รหัสวิชา&nbsp;
                                                <asp:Label ID="lblcodeSubjectOpenSubject" runat="server" Text="0"></asp:Label>
                                                &nbsp;<asp:Label ID="lblDtchOpenSubject" runat="server" Text="0" 
                                                    Visible="False"></asp:Label>
                                            </td>
                                            <td class="style7">
                                                ชื่อวิชา
                                                <asp:Label ID="lblSubnameThaiSubjectOpenSubject" runat="server" Text="0"></asp:Label>
                                                </td>
                                            <td class="style10">
                                                </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td colspan="3">
                                            <div id="open1" runat="server">
                                                จำนวนกลุ่มที่ต้องการเปิดรายวิชา<asp:TextBox ID="txtopenSubjectGroup" runat="server" 
                                                    Width="87px" CssClass="textbox_in_back"></asp:TextBox>
                                                    </div>

                                                   <div id="openGroup" runat="server" visible=false>
                                                กลุ่มเรียน 
                                                       <asp:DropDownList ID="ddlGroupstd" runat="server">
                                                       </asp:DropDownList>

                                                    </div>


                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                        </tr>


                                       <%-- <tr>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td colspan="3">
                                            <div id="divShowClass" runat="server" visible="false">
                                                ชั้นปี&nbsp;
                                                <asp:DropDownList ID="ddlLevelOpenSubject" runat="server" AutoPostBack="True" 
                                                    onselectedindexchanged="ddlLevelOpenSubject_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">ชั้นปีที่ 1</asp:ListItem>
                                                    <asp:ListItem Value="2">ชั้นปีที่ 2</asp:ListItem>
                                                    <asp:ListItem Value="3">ชั้นปีที่ 3</asp:ListItem>
                                                    <asp:ListItem Value="4">ชั้นปีที่ 4</asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;&nbsp; ห้อง
                                                <asp:DropDownList ID="ddlclassOpenSubject" runat="server">
                                                </asp:DropDownList>
                                                </div>

                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                        </tr>--%>


                                       


                                        <tr>
                                            <td class="style6" >

                                                &nbsp;</td>
                                            <td colspan="3">
                                                <div style="width: 500px; height: 50px; padding-top: 15px;" id="showTch" runat="server" visible="false">
                                                    <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">
                                                        เลือกอาจารย์ผู้สอน</div>
                                                    <div style="float: left; width: 148px;">
                                                        <asp:TextBox ID="txtShowTeacher" runat="server" CssClass="textbox_in_back" 
                                                            Enabled="False" Width="154px"></asp:TextBox>
                                                    </div>
                                                    <div style="width: 92px; float: left">
                                                        <asp:ImageButton ID="imgbtnsearchTeacher" runat="server" 
                                                            ImageUrl="/image/Back/ButtonSearch.jpg" 
                                                            onclick="imgbtnsearchTeacher_Click" />
                                                        <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <div ID="divShowTeacher" runat="server" visible="false">
                                                    <table style="width:100%;">
                                                        <tr>
                                                            <td colspan="2">
                                                                <b>ค้นหาอาจารย์ผู้สอน</b></td>
                                                            <td class="style34">
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td class="style35">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style32">
                                                                &nbsp;</td>
                                                            <td class="style33">
                                                                ชืออาจารย์</td>
                                                            <td class="style34">
                                                                <asp:TextBox ID="txtNameTeacher" runat="server" AutoPostBack="True" 
                                                                    CssClass="textbox_in_back"></asp:TextBox>
                                                            </td>
                                                            <td class="textright">
                                                                สกุล</td>
                                                            <td class="style36">
                                                                <asp:TextBox ID="txtLnameTeacher" runat="server" AutoPostBack="True" 
                                                                    CssClass="textbox_in_back" Width="129px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style38">
                                                            </td>
                                                            <td class="style39">
                                                                ประเภทอาจารย์</td>
                                                            <td class="style40">
                                                                <asp:DropDownList ID="ddlTypeTeacher" runat="server" CssClass="textbox_in_back" 
                                                                    Height="29px" Width="133px">
                                                                    <asp:ListItem Value="N">--เลือก--</asp:ListItem>
                                                                    <asp:ListItem Value="TE">อาจารย์ประจำ</asp:ListItem>
                                                                    <asp:ListItem Value="TS">อาจารย์พิเศษ</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="style41">
                                                            </td>
                                                            <td class="textright">
                                                                <asp:Button ID="btnok" runat="server" CssClass="button_in_back" Height="27px" 
                                                                    onclick="btnok_Click" Text="ค้นหา" Width="77px" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <asp:GridView ID="gvShowTeacher" runat="server" AllowPaging="True" 
                                                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Tch_ID" 
                                                        ForeColor="#333333" GridLines="None" 
                                                        onpageindexchanging="gvShowTeacher_PageIndexChanging" 
                                                        onrowcommand="gvShowTeacher_RowCommand" PageSize="5" ShowFooter="True" 
                                                        Style="text-align: left" Width="97%">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="ดึงข้อมูลอาจารย์">
                                                                <ItemTemplate>
                                                                    <table border="0" cellpadding="1" cellspacing="1">
                                                                        <tr>
                                                                            <td align="center" style="height: 18px;">
                                                                                <asp:LinkButton ID="btnGetTeacher" runat="server" 
                                                                                    AlternateText="ดึงข้อมูลอาจารย์ที่ท่านต้องการ" 
                                                                                    CommandArgument='<%# Eval("Tch_ID") %>' CommandName="getTeacher" 
                                                                                    ToolTip="subjectGet">ดึงข้อมูล</asp:LinkButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="ชื่ออาจารย์">
                                                                <ItemTemplate>
                                                                    <table border="0" cellpadding="1" cellspacing="1">
                                                                        <tr>
                                                                            <td align="center" style="height: 18px;">
                                                                                <asp:Label ID="lblnameteach" runat="server" AlternateText="ชื่ออาจารย์" 
                                                                                    Text='<%# Eval("Tch_FName") %>'> </asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="นามสกุล">
                                                                <ItemTemplate>
                                                                    <table border="0" cellpadding="1" cellspacing="1">
                                                                        <tr>
                                                                            <td align="center" style="height: 18px;">
                                                                                <asp:Label ID="lbllnameTeach" runat="server" AlternateText="นามสกุลอาจารย์" 
                                                                                    Text='<%# Eval("Tch_LName") %>'> </asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <%--<asp:BoundField DataField="Tch_FName" HeaderText="ชื่ออาจารย์" 
                        ReadOnly="True" SortExpression="Tch_FName" />

                    <asp:BoundField DataField="Tch_LName" HeaderText="นามสกุลอาจารย์" 
                        SortExpression="Tch_LName" /> --%>
                                                            <asp:BoundField DataField="Tch_FNameEn" HeaderText="ชื่อภาษาอังกฤษ" 
                                                                SortExpression="Tch_FNameEn" />
                                                            <asp:BoundField DataField="Tch_LNameEn" HeaderText="นามสกุลภาษาอังกฤษ" 
                                                                SortExpression="Tch_LNameEn" />
                                                        </Columns>
                                                        <EditRowStyle BackColor="#7C6F57" />
                                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                        <RowStyle BackColor="#E3EAEB" />
                                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                    </asp:GridView>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                            <td class="style4" style="text-align:right;">
                                                <asp:Button ID="btnAddOpenDetailTeach" runat="server" CssClass="button_in_back" 
                                                    Height="27px" onclick="btnAddOpenDetailTeach_Click" Text="เปิดรายวิชา" 
                                                    Width="111px" Visible="False" 
                                                    onclientclick="return confirm('คุณต้องการเพิ่มข้อมูลรายละเอียดการสอนนี้ ?')" />
                                            </td>
                                            <td class="style7">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                รายวิชาที่เปิดสอน</td>
                                            <td class="style4" style="text-align:right;">
                                                &nbsp;</td>
                                            <td class="style7">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" >
                                                <span class="wrap">
                                               <asp:GridView ID="GridViewShowDetailTeach" runat="server" 
                                                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="dchid" ForeColor="#333333" 
                                                    GridLines="None" OnRowCommand="GridViewShowDetailTeach_RowCommand" 
                                                    Width="100%">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="ลบรายวิชา">
                                                            <ItemTemplate>
                                                                <table border="0" cellpadding="1" cellspacing="1">
                                                                    <tr>
                                                                        <td align="center" style="height: 18px;">
                                                                            <asp:LinkButton ID="btnDel" runat="server" AlternateText="ลบข้อมูลรายวิชา" 
                                                                                CommandArgument='<%# Eval("dchid") %>' CommandName="del" 
                                                                                ToolTip="ลบข้อมูลรายวิชา" 
                                                                                onclientclick="return confirm('คุณต้องการจะลบข้อมูลรายละเอียดการสอนนี้ ?')">ลบข้อมูล</asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="dchyear" HeaderText="ปีการศึกษา"  />
                                                        <asp:BoundField DataField="dchgroup" HeaderText="กลุ่ม"  />
                                                        <asp:BoundField DataField="codeSub" HeaderText="รหัสวิชา"  />
                                                         <asp:BoundField DataField="tchname" HeaderText="อาจารย์ผู้สอน"  />
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
                                                </span></td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td class="auto-style26">
                                                &nbsp;</td>
                                            
                                            <td colspan="3">
                                                &nbsp;<%--<asp:Button ID="btnOpenPrevious" runat="server" CssClass="textbox_in_back" 
                                                    Height="26px" onclick="btnOpenPrevious_Click" Text="&lt;&lt; ย้อนกลับ" 
                                                    Width="126px" Visible="False" />--%>&nbsp;<asp:Button ID="btnOpenNext" runat="server" CssClass="textbox_in_back" 
                                                    Height="26px" onclick="btnOpenNext_Click" Text="ถัดไป &gt;&gt;" Width="126px" />&nbsp;
                                                <asp:Button ID="btnOpenSubject" runat="server" CssClass="textbox_in_back" 
                                                    Height="26px" onclick="btnOpenSubject_Click" Text="ยืนยันเปิดรายวิชา" 
                                                    Visible="False" Width="126px" 
                                                    onclientclick="return confirm('ยืนยันรายละเอียดการสอนนี้ ?')" />
                                            </td>
                                        </tr>


                                        </caption style="font-weight: bold; margin-left: 14px;">
                                        <caption>
                                            <caption>
                                                &nbsp;</td></tr></td></td></tr></tr></tr></tr></caption>
                                        </caption>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>



    </div>
</asp:Content>
