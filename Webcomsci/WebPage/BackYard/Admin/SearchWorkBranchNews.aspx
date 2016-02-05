<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="SearchWorkBranchNews.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.SearchWorkBranchNews" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="HTMLEditor" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/WebPage/BackYard/Admin/EditeControl.ascx" TagName="lookup_product" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />

            <%--    <asp:DynamicField DataField="BranchNews_Status" HeaderText="สถานะ" />--%>
    

            <%--<div class="headcontent" style="text-align: right; width: 633px;">
                <center>
                    <div style="float: right; width: 26px; margin-right:10px; margin-top: 8px;">
                        <asp:Button ID="btnAddNews" runat="server" Text="เพิ่มข้อมูล" Height="32px" OnClick="btnAddNews_Click" Width="76px" />
                        <br /></br>
                    </div>
                    <div align="left" style="width: 338px; margin-top: 20px;">
                        <div style="float: left; width: 116px;">
                    ค้นหาจากชื่อเรื่อง
                        </div>
                        <div style="float: left; width: 148px;">
                            <asp:TextBox ID="txtsearchStdNews" runat="server" Width="132px"></asp:TextBox>
                        </div>
                        <div style="width: 32px; float: left">
                            <asp:ImageButton ID="butSearch" runat="server" ImageUrl="/image/Back/ButtonSearch.jpg" OnClick="ImageButton1_Click" />
                        </div>
                    </div>
                </center>
            </div>--%>

              <div style="width: 500px; height: 50px; padding-top: 15px;">
                 <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">ค้นหาจากชื่อเรื่อง </div>
                    <div style="float: left; width: 148px;"> <asp:TextBox ID="txtsearchStdNews" runat="server" Width="132px"></asp:TextBox> </div>
                    <div style="width: 32px; float: left">  
                       <asp:ImageButton ID="butSearch" runat="server" ImageUrl="/image/Back/ButtonSearch.jpg" OnClick="ImageButton1_Click" />
                       
                       
                       </div>
                    <div class="Crop_AddData_searchBranchNews">
                       <a href="AddWorkBranchNews.aspx"><div class="AddData_searchBranchNews"></div></a></div>
                  
                </div>







            
            <div style="float: left; width: 192px; font-weight: 700; font-family: tahoma;">
                จัดการผลงานสาขา</div>
            <br />
            <br />


    <asp:GridView ID="gvWorkBranch" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="WorkBranchNews_ID" 
        EmptyDataText="ไม่พบข้อมูลที่ค้นหา" Width="90%" 
        OnPageIndexChanging="gvWorkBranch_PageIndexChanging" 
        OnRowCommand="gvWorkBranch_RowCommand" 
        OnRowDataBound="gvWorkBranch_RowDataBound" PageSize="20" 
                CssClass="MyGridView_SearchWorkBranchNews">
        <AlternatingRowStyle CssClass="MyGridViewAlt_SearchWorkBranchNews" />
        <RowStyle CssClass="MyGridViewRow_SearchWorkBranchNews" HorizontalAlign="Center" 
            VerticalAlign="Middle" />
        <Columns>
                      <%--    <asp:DynamicField DataField="BranchNews_Status" HeaderText="สถานะ" />--%> 
             <%--<asp:BoundField DataField="BranchNews_Status" HeaderText="สถานะของรายการ" /> --%>
     
       

                            <asp:TemplateField HeaderText="แก้ไข">
                <ItemTemplate>
                    <table border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="center" style="height: 18px;">
                                <asp:LinkButton ID="btnupdateBranch" runat="server" AlternateText="แก้ไข" 
                                    CommandArgument='<%# Eval("WorkBranchNews_ID") %>' CommandName="updateBranch" 
                                    ToolTip="subjectGet"><img src=../../../image/edit.png style="border:0" /></asp:LinkButton>
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
                                    CommandArgument='<%# Eval("WorkBranchNews_ID") %>' CommandName="deleteBranch" 
                                    ToolTip="subjectGet"><img src="../../../image/delete.png" style="border:0" /></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle CssClass="table_header" HorizontalAlign="Center" />
            </asp:TemplateField>

         

            <asp:HyperLinkField DataTextField="WorkBranchNews_Name" HeaderText="ชื่อเรื่อง" />


         <asp:BoundField HeaderText="สถานะ" DataField="WorkBranchNews_Status" />
        
            <asp:BoundField DataField="Emp_FName" HeaderText="ผู้สร้าง" />
            <asp:BoundField DataField="Update_date" HeaderText="วันที่สร้าง" />
            <%--<asp:BoundField DataField="Date_End" HeaderText="วันที่หมดอายุ" /> --%>
        </Columns>
        <EmptyDataRowStyle CssClass="GridViewEmptyData" />
        <HeaderStyle CssClass="GridViewHeader_SearchWorkBranchNews" />
    </asp:GridView>


            <br />
            <br/>
            <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" >
            </ajaxToolkit:ToolkitScriptManager>
            <asp:HiddenField ID="HiddenTargetShow" runat="server" />
            <ajaxToolkit:ModalPopupExtender ID="mdlpopup" BackgroundCssClass="modalbackground" runat="server" TargetControlID="HiddenTargetShow" 
     PopupControlID="pnl" OkControlID="btnCancel" Y="100" >
            </ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="pnl" runat="server" CssClass="modalpopupNews" 
                BorderColor="ActiveBorder" BorderStyle="Solid" BorderWidth="3px" Height="603px" 
                Width="807px">
                <div style="margin-left:790px;margin-top:-20px;">
                    <asp:ImageButton ID="imgClose" runat="server" ImageUrl="~/image/close_button.png" OnClick="imgClose_Click" />
                </div>
                <table style="width:98%; text-align:left; margin-right: 0px; height: 548px;" >
                    <tr>
                        <td  colspan="2"><strong>&nbsp;ข่าวกิจกรรมนักศึกษา..</strong></td>
                        <%-- <td class="auto-style27">&nbsp;</td> --%>
                    </tr>
                    <tr>
                        <td class="auto-style33">ชื่อเรื่อง:</td>
                        <td class="auto-style26">
                            <asp:TextBox ID="txtPoPtitle" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        </td>
                        <tr>
                            <td class="auto-style32">รูปภาพ:</td>
                            <td class="auto-style27">
                                <div id="test" runat="server" style="position:absolute;margin-left:400px;margin-top:-50px;">
                                    <asp:ImageButton ID="imgPopPic" runat="server" Height="98px" Visible="False" Width="91px" />
                                </div>
                                <asp:FileUpload ID="FUCPic" runat="server" Height="27px" 
                                    style="margin-left: 0px" Width="207px" CssClass="textbox_in_back" />
                    &nbsp;
                  
                    <%--     <asp:Image ID="Img" runat="server" ControlStyle-Height="50" ControlStyle-Width="50" Height="107px" style="margin-left: 0px" Width="113px" />
                    <asp:Button ID="UploadButton" runat="server" Height="25px" text="Upload" Width="105px" />--%></td>
                        </tr>
                        <tr>
                            <td class="auto-style33">สถานะ:</td>
                            <td class="auto-style26">
                                <asp:DropDownList ID="ddlStatus" runat="server">
                                    <asp:ListItem Value="active">เผยแพร่</asp:ListItem>
                                    <asp:ListItem Value="unactive">ไม่เผยแพร่</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style32">วันหมดอายุ</td>
                            <td class="auto-style27">
                                <asp:TextBox ID="txtPopdate" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtPopdate" CssClass="MyCalendar"  Format="dd/MM/yyyy"/>
                            </td>
                            <caption style="background-color: #999999; font-weight: bold; color: #FFFFFF; margin-left: 14px;">
                    แก้ไขข้อมูล<tr>
                                    <td class="auto-style32">รายละเอียด:</td>
                                    <td class="auto-style27">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="auto-style19">&nbsp;</td>
                                            </tr>
                                        </table>
                                        <tr>
                                            <td class="auto-style32">&nbsp;</td>
                                            <td class="auto-style27">
                                                <div style="width: 631px">
                                                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <HTMLEditor:Editor ID="editorPopup" runat="server" AutoFocus="true" Height="300px" style="text-align: center" Width="100%" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </td>
                                        </tr>
                                    </td>
                                </tr>
                            </caption>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style27">
                                    <center>
                            
                            &nbsp;<asp:Button ID="btnsave" runat="server" Height="34px" OnClick="btnsave_Click" 
                                            Text="บันทึกข้อมูล" Width="96px" CssClass="button_in_back" />
&nbsp;<asp:Button ID="btnCancel" runat="server" Height="34px" OnClick="btnCancel_Click" Text="ยกเลิก" Width="100px" 
                                            CssClass="button_in_back" />
                                    </center>
                                </td>
                            </tr>
                </table>
                <br />
                <br />
                <br />
            </asp:Panel>
            <br />
            <br />
            <asp:UpdatePanel ID="updpanel" runat="server">
                <ContentTemplate>
                    <asp:HiddenField ID="hidden_popupmsg" runat="server" OnValueChanged="hidden_popupmsg_ValueChanged" />
                    <ajaxToolkit:ModalPopupExtender ID="mdlpopupmsg" runat="server" BackgroundCssClass="modalbackground" TargetControlID="hidden_popupmsg" 
     PopupControlID="pnlprogress" OkControlID="btnCancelMessage" >
                    </ajaxToolkit:ModalPopupExtender>
                    <asp:Panel ID="pnlprogress" runat="server" CssClass="modalpopup">
                        <div id="donereg" runat="server" visible="true">
                            <asp:Label ID="lblinfo" runat="server" Text="คุณต้องการจะลบข้อมูลนี้ ใช่หรือไม่ ?"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="btnokMessage" Text="ตกลง" runat="server" 
                                OnClick="btnokMessage_Click" CssClass="button_in_back" />
                            <asp:Button ID="btnCancelMessage" runat="server" Text="ยกเลิก" 
                                OnClick="btnCancelMessage_Click" CssClass="button_in_back" />
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>

</asp:Content>
