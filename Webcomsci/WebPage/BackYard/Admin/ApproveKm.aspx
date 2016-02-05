<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true"
    CodeBehind="ApproveKm.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ApproveKm" %>
    
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="HTMLEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />

    <style type="text/css">



        .modalpopupNews
    {
        margin-top:-60px;
     border: 2px solid Black;
        background-color: White;
        padding: 3px;
    }
        .auto-style24 {
            width: 113px;
        }
        
        .auto-style27 {
            width: 468px;
        }

        .auto-style25 {
            width: 113px;
            height: 25px;
        }
        .auto-style26 {
            width: 468px;
            height: 25px;
        }
        
        .style1
        {
            width: 171px;
            height: 22px;
        }
        .style2
        {
            width: 468px;
            height: 22px;
        }

        .auto-style19 {
            width: 185px;
        }
        .modalpopup{
   /* background-color:White;
    padding:6px 6px 6px 6px;
    margin-top:-35px;*/
         border: 2px solid Black;
        background-color: White;
        padding: 3px;
        
    }


        .style4
        {
            width: 468px;
            height: 24px;
        }
                
        
        .textbox_in_back
        {
            border: 1px solid #bfbfbf;
            padding-left: 3px;
        }

        .button_in_back
        {
            border: 1px solid #bfbfbf;
            padding-right: 15px;
            padding-left: 15px;
            border-radius: 4px;
            padding-bottom: 3px;
            background-color: #dedede;
            background-image: url('../../image/Back/Bg_Button_in_back.png');
            background-repeat: repeat-x;
            text-shadow: 0.1em 0.1em #fff;
            cursor: pointer;
        }

        .button_in_back:active
        {
            cursor: pointer;
            box-shadow: inset 0 0 1px #000;
        }

        .button_in_back:hover
        {
            background-color: #D1D1D1;
        }


        #TextArea1
        {
            height: 182px;
            width: 384px;
        }


        .style9
        {
            width: 171px;
            height: 25px;
        }
        .style10
        {
            width: 171px;
            height: 24px;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />

       
    <%--    <asp:DynamicField DataField="BranchNews_Status" HeaderText="สถานะ" />--%><%--    <asp:DynamicField DataField="BranchNews_Status" HeaderText="สถานะ" />--%>
                
                <div style="width: 500px; height: 50px; padding-top: 15px;">

                 
                <p style="text-align:left;"> <strong>จัดการองค์ความรู้<asp:ScriptManager 
                        ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    </strong>


                    </p>
                    <p style="text-align:left;"> &nbsp;</p>

                 <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">ค้นหาจากชื่อเรื่อง </div>
                    <div style="float: left; width: 148px;"> 
                        <asp:TextBox ID="txttitle" runat="server" 
                            Width="132px" CssClass="textbox_in_back"></asp:TextBox> </div>
                    <div style="width: 32px; float: left">  
                       </div>
                    <div class="Crop_AddData_searchBranchNews">
                       </div>


                       
                         <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">
                             ค้นหาจากสถานะ </div>
                    <div style="float: left; width: 148px;"> 
                        <asp:DropDownList ID="ddlStatus" runat="server" Height="31px" Width="132px">
                            <asp:ListItem Value="N">ยังไม่ได้อนุมัติ</asp:ListItem>
                            <asp:ListItem Value="Y">อนุมัติแล้ว</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="width: 32px; float: left">  
                       </div>
                    <div class="Crop_AddData_searchBranchNews">
                       </div>




                         
                         <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">
                             ค้นหาวันที่ </div>
                    <div style="float: left; width: 148px;"> 
                    
             <asp:TextBox ID="txtdateStart" runat="server" Height="22px" Width="130px" 
                            CssClass="textbox_in_back"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                            TargetControlID="txtdateStart" CssClass="MyCalendar" Format="dd/MM/yyyy"/>
                    
                     </div>
                    <div style="width: 32px; float: left">  
                       <asp:ImageButton ID="butSearch" runat="server" 
                            ImageUrl="/image/Back/ButtonSearch.jpg" OnClick="ImageButton1_Click" 
                            Height="22px" /></div>
                    <div class="Crop_AddData_searchBranchNews">
                       </div>

                       
                
                   
                </div>
               




               <br />
                    <br />
    <br />
    <br />
    <Br />

    <asp:GridView ID="gvAppoveKm" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="KmPost_ID" 
        EmptyDataText="ไม่พบข้อมูลที่ค้นหา" Width="90%" 
        OnPageIndexChanging="gvAppoveKm_PageIndexChanging" 
        OnRowCommand="gvAppoveKm_RowCommand" 
        OnRowDataBound="gvAppoveKm_RowDataBound" PageSize="20" 
        CssClass="MyGridView_searchBranchNews">
        <AlternatingRowStyle CssClass="MyGridViewAlt_searchBranchNews" />
        <RowStyle CssClass="MyGridViewRow_searchBranchNews" HorizontalAlign="Center" 
            VerticalAlign="Middle" />
        <Columns>
                      <%--    <asp:DynamicField DataField="BranchNews_Status" HeaderText="สถานะ" />--%> 
             <%--<asp:BoundField DataField="BranchNews_Status" HeaderText="สถานะของรายการ" /> --%>
     
       

                            <asp:TemplateField HeaderText="ดูรายละเอียด">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnshow" runat="server" AlternateText="ดูรายละเอียด" 
                                    CommandArgument='<%# Eval("KmPost_ID") %>' CommandName="showDetail" 
                                    ToolTip="subjectGet"><img src="../../../image/find.png" style="border:0" /></asp:LinkButton>
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
                                <asp:LinkButton ID="btndeleteBranch" runat="server" AlternateText="ลบข้อมูล" 
                                    CommandArgument='<%# Eval("KmPost_ID") %>' CommandName="deleteKm" 
                                    ToolTip="subjectGet" 
                                    onclientclick="return confirm('คุณต้องการลบข้อมูลองค์ความรู้นี้หรือไม่ ! ');"><img src="../../../image/delete.png" style="border:0" /></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

            <%-- 
          <asp:CommandField ButtonType="Image" HeaderText="แก้ไข" ItemStyle-Width="7%" 
                          ShowCancelButton="False" ShowSelectButton="True" 
                          SelectImageUrl="~/image/edit.png" SelectText="SelectMod"  >
<ItemStyle Width="7%"> </ItemStyle>
            </asp:CommandField>


            <asp:CommandField ButtonType="Image" HeaderText="ลบ" ItemStyle-Width="7%" ShowCancelButton="False" ShowDeleteButton="True" DeleteImageUrl="~/image/delete.png" >
<ItemStyle Width="7%"></ItemStyle>
            </asp:CommandField>--%>

            <asp:HyperLinkField DataTextField="KmPost_Name" HeaderText="ชื่อเรื่อง" />


         <asp:BoundField HeaderText="สถานะ" DataField="KmPost_Status" />
        
        <%--    <asp:BoundField DataField="Emp_FName" HeaderText="ผู้สร้าง" />--%> 
            <asp:BoundField DataField="KmPost_date" HeaderText="วันที่สร้าง" />
      
        </Columns>
        <EmptyDataRowStyle CssClass="GridViewEmptyData" />
        <HeaderStyle CssClass="GridViewHeader_searchBranchNews" />
    </asp:GridView>


    <br /></br>
    
     <asp:HiddenField ID="HiddenTargetShow" runat="server" />
       
    <ajaxToolkit:ModalPopupExtender ID="mdlpopup" BackgroundCssClass="modalbackground" runat="server" TargetControlID="HiddenTargetShow" 
     PopupControlID="pnl" OkControlID="btnCancel" Y="100" ></ajaxToolkit:ModalPopupExtender>
       
    <asp:Panel ID="pnl" runat="server"  CssClass="modalpopupNews" 
        BorderColor="ActiveBorder" BorderStyle="Solid" BorderWidth="3px"
        Width="807px">
        <div style="margin-left:790px;margin-top:-20px;">
            <asp:ImageButton ID="imgClose" runat="server" 
                ImageUrl="~/image/close_button.png" OnClick="imgClose_Click" Height="33px" /></div>

        <table style="width:98%; text-align:left; margin-right: 0px;  >
        

            <tr>
                <td class="auto-style25">
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <tr>
                    <td class="style10">
                        <strong>รายละเอียดองค์ความรู้</strong></td>
                    <td class="style4">
                        <div ID="test" runat="server" 
                            style="position:absolute;margin-left:400px;margin-top:-30px;">
                        </div>
                        &nbsp;
                        <%--<asp:ImageButton ID="imgPopPic" runat="server" Height="98px" Visible="False" 
                            Width="91px" />--%>
                        <asp:Label ID="lblid" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="lblstatus" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        ชื่อเรือง</td>
                    <td class="style4">
                        <asp:Label ID="lbltitle" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        ลิงค์ที่เกี่ยวข้อง</td>
                    <td class="auto-style26">
                
               
                 
                        <asp:Label ID="lbllink" runat="server" Text="Label"></asp:Label>

                    </td>
                 
                </tr>
                <caption style="background-color: #999999; font-weight: bold; color: #FFFFFF; margin-left: 14px;">
                    อนุมัติองค์ความรู้<tr>
                        <td class="style9">
                            วันที่สร้าง</td>
                        <td class="auto-style26">
                            <asp:Label ID="lblcreateDate" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            รายละเอียด:</td>
                        <td>
                        <div >
                            <%--<asp:Label ID="lbldetail" runat="server" Text="Label"></asp:Label>--%>
                            <HTMLEditor:Editor ID="editor" runat="server" AutoFocus="true" Height="350px" 
                                OnContentChanged="ContentChanged" style="text-align: center" Width="100%" />
                            
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            &nbsp;</td>
                        <td class="style2">
                            <table style="width:100%;">
                                <tr>
                                    <td >
                                        
                                            &nbsp;<asp:Button ID="btnAppove" runat="server" Height="34px" 
                                                OnClick="btnAppove_Click" onclientclick="return confirm('ยืนยันการอนุมัติ! ');" 
                                                Text="อนุมัติองค์ความรู้" Width="98px" CssClass="button_in_back" />
                                            &nbsp;<asp:Button ID="btnCancel" runat="server" Height="34px" 
                                                OnClick="btnCancel_Click" Text="ยกเลิก" Width="79px"   
                                                CssClass="button_in_back" />
                                       
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </caption>
            </tr>
                </table>

        <br />
    </asp:Panel>

    
    <br /><br />

   
  
    

</asp:Content>