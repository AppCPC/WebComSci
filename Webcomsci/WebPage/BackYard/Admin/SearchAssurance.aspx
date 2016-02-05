<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="SearchAssurance.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.SearchAssurance" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="HTMLEditor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    .modalpopup{
    background-color:White;
    padding:6px 6px 6px 6px;
    margin-top:-85px;
    
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
        
        .auto-style19 {
            width: 185px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
         <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
   
    <%--    <asp:DynamicField DataField="BranchNews_Status" HeaderText="สถานะ" />--%>
   

  <%--  <div class="headcontent" style="text-align: right; width: 633px;">
        <center>
            <div style="float: right; height: 22px; width: 26px; margin-right:10px; margin-top: 8px;">
                <asp:Button ID="btnAddNews" runat="server" Text="เพิ่มข้อมูล" Height="32px" OnClick="btnAddNews_Click" Width="76px" />
                <br /></br>
            </div>
            <div align="left" style="width: 338px; margin-top: 20px;">
                <div style="float: left; width: 116px;">
                    ค้นหาจากชื่อเรื่อง 
                </div>
                <div style="float: left; width: 148px;">
                    <asp:TextBox ID="txtsearchAssurance" runat="server" Width="132px"></asp:TextBox>
                </div>
                <div style="width: 32px; float: left">
                    <asp:ImageButton ID="butSearch" runat="server" 
                        ImageUrl="/image/Back/ButtonSearch.jpg" OnClick="butImgSearch_Click" />
                </div>
            </div>
        </center>
    </div>--%>

     <div style="width: 500px; height: 40px; padding-top: 15px;">
                 <div style="float: left; width: 116px; font-family: tahoma; font-size: 15px; color: #000000;">ค้นหาจากชื่อเรื่อง </div>
                    <div style="float: left; width: 148px;"> <asp:TextBox ID="txtsearchAssurance" runat="server" Width="132px"></asp:TextBox> </div>
                    <div style="width: 32px; float: left">  
                       <asp:ImageButton ID="butSearch" runat="server" ImageUrl="/image/Back/ButtonSearch.jpg" OnClick="butImgSearch_Click" />
                       
                       
                       </div>
                    <div class="Crop_AddData_searchBranchNews">
                       <a href="AddAssurance.aspx"><div class="AddData_searchBranchNews"></div></a></div>
                  
                </div>

    <br />
    <div style="float: left; width: 192px; font-weight: 700; margin-left: 10px;">
        จัดการการประกันคุณภาพ 
    </div>
    <br />
    <br />
    <asp:GridView ID="gvAssurance" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Assurance_ID" 
        EmptyDataText="ไม่พบข้อมูลที่ค้นหา" PageSize="20" Width="100%" CellPadding="4" 
        ForeColor="#333333" GridLines="None" 
        OnPageIndexChanging="gvAssurance_PageIndexChanging" 
        OnRowDeleting="gvAssurance_RowDeleting" 
        OnRowCommand="gvAssurance_RowCommand" 
        OnRowDataBound="gvAssurance_RowDataBound">
        <AlternatingRowStyle CssClass="GridViewRowAlternate" BackColor="White" ForeColor="#284775" />
        <RowStyle CssClass="GridViewRow" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <%--    <asp:DynamicField DataField="BranchNews_Status" HeaderText="สถานะ" />--%>
            <%--<asp:BoundField DataField="BranchNews_Status" HeaderText="สถานะของรายการ" /> --%>
            <asp:BoundField DataField="Assurance_ID" HeaderText="ID" Visible="False"/>
            <asp:BoundField HeaderText="ลำดับที่" />
            <asp:HyperLinkField DataTextField="Assurance_Name" HeaderText="ชื่อเรื่อง" />
            <asp:CommandField ButtonType="Image" HeaderText="แก้ไข" ItemStyle-Width="7%" ShowCancelButton="False" ShowSelectButton="True" SelectImageUrl="~/image/edit.png"  >
            <ItemStyle Width="7%"></ItemStyle>
            </asp:CommandField>
            <asp:CommandField ButtonType="Image" HeaderText="ลบ" ItemStyle-Width="7%" ShowCancelButton="False" ShowDeleteButton="True" DeleteImageUrl="~/image/delete.png" >
            <ItemStyle Width="7%"></ItemStyle>
            </asp:CommandField>
            <asp:BoundField HeaderText="สถานะ" DataField="Assurance_Status" />
            <asp:BoundField DataField="Create_user" HeaderText="ผู้สร้าง" />
            <asp:BoundField DataField="Create_date" HeaderText="วันที่สร้าง" />
            <asp:BoundField DataField="Date_End" HeaderText="วันที่หมดอายุ" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataRowStyle CssClass="GridViewEmptyData" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle CssClass="GridViewHeader" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br /></br>
    <ajaxToolkit:ToolkitScriptManager ID="toolkitscript1" runat="server" >
    </ajaxToolkit:ToolkitScriptManager>
    <asp:HiddenField ID="HiddenTargetShow" runat="server" />
    <ajaxToolkit:ModalPopupExtender ID="mdlpopup" BackgroundCssClass="modalbackground" runat="server" TargetControlID="HiddenTargetShow" 
     PopupControlID="pnl" OkControlID="btnCancel" Y="100" >
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnl" runat="server" CssClass="modalpopup" BorderColor="ActiveBorder" BorderStyle="Solid" BorderWidth="3px" Height="622px" Width="807px">
        <div style="margin-left:790px;margin-top:-20px;">
            <asp:ImageButton ID="imgClose" runat="server" ImageUrl="~/image/close_button.png" OnClick="imgClose_Click" />
        </div>
        <table style="width:98%; text-align:left; margin-right: 0px; height: 548px;" >
            <tr>
                <td class="auto-style24">
                    <strong>&nbsp;ข่าวสาขา..</strong></td>
                <td class="auto-style27">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
                    ชื่อเรื่อง:</td>
                <td class="auto-style26">
                    <asp:TextBox ID="txtPoPtitle" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                </td>
                <tr>
                    <td class="auto-style24">
                        รูปภาพ:</td>
                    <td class="auto-style27">
                        <div id="test" runat="server" style="position:absolute;margin-left:400px;margin-top:-50px;">
                            <asp:ImageButton ID="imgPopPic" runat="server" Height="98px" Visible="False" Width="91px" />
                        </div>
                        <asp:FileUpload ID="FUCPic" runat="server" Height="27px" 
                            style="margin-left: 0px" Width="207px" CssClass="textbox_in_back" />
                    &nbsp;
                  
                        <%--     <asp:Image ID="Img" runat="server" ControlStyle-Height="50" ControlStyle-Width="50" Height="107px" style="margin-left: 0px" Width="113px" />
                    <asp:Button ID="UploadButton" runat="server" Height="25px" text="Upload" Width="105px" />--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        สถานะ:</td>
                    <td class="auto-style26">
                        <asp:DropDownList ID="ddlStatus" runat="server">
                            <asp:ListItem Value="active">เผยแพร่</asp:ListItem>
                            <asp:ListItem Value="unactive">ไม่เผยแพร่</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">
                        วันหมดอายุ</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtPopdate" runat="server" CssClass="textbox_in_back"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" 
                            TargetControlID="txtPopdate" CssClass="MyCalendar"  Format="dd/MM/yyyy"/>
                    </td>
                    <caption style="background-color: #999999; font-weight: bold; color: #FFFFFF; margin-left: 14px;">
                    แก้ไขข้อมูล<tr>
                            <td class="auto-style24">
                                รายละเอียด:</td>
                            <td class="auto-style27">
                                <table style="width:100%;">
                                    <tr>
                                        <td class="auto-style19">
                                       
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <tr>
                                    <td class="auto-style24">
                                        &nbsp;</td>
                                    <td class="auto-style27">
                                        <div style="width: 631px">
                                            <asp:UpdatePanel ID="updatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <HTMLEditor:Editor ID="editorPopup" runat="server" AutoFocus="true" 
                                                        Height="300px" style="text-align: center" Width="100%" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </td>
                                </tr>
                            </td>
                        </tr>
                    </caption>
                    <tr>
                        <td class="auto-style24">
                            &nbsp;</td>
                        <td class="auto-style27">
                            <center>
                            
                            &nbsp;<asp:Button ID="btnsave" runat="server" Height="34px" OnClick="btnsave_Click" 
                                    Text="บันทึกข้อมูล" Width="96px" CssClass="button_in_back" />
&nbsp;<asp:Button ID="btnCancel" runat="server" Height="34px" OnClick="btnCancel_Click" Text="ยกเลิก" 
                                    Width="71px" CssClass="button_in_back" />
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
            <ajaxToolkit:ModalPopupExtender ID="mdlpopupmsg" runat="server" 
                BackgroundCssClass="modalbackground" TargetControlID="hidden_popupmsg" 
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
