<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="HomeWorkStudent.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.HomeWorkStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>

      <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
    <link rel="Stylesheet" href="../../../css/skins/TabRoom.css" />


        <script src="../../../js/jquery.min.js"  type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnhomework").addClass("button_nav_menu_tree_Active");
        });
        </script>

      <strong>การบ้านห้องเรียนนี้...</strong><br />

            <div class="content_box_curve">
    
   

    <asp:ListView runat="server" ID="ListViewShowfileMedia"
        DataSourceID="SqlDataSourceHomeworkStuden" >
        <LayoutTemplate>
            <table cellpadding="2" runat="server"
                   id="tblProducts" style="height:320px">
                <tr runat="server" id="groupPlaceholder">
                </tr>
            </table>
        </LayoutTemplate>
        <GroupTemplate>
            <tr runat="server" id="productRow"
                style="height:80px">
                <td runat="server" id="itemPlaceholder">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td id="Td1" valign="top" align="center" style="width:100" runat="server">
                <div class="AreaAll_FileMediaTeacher">
                    <div class="AreaPicture_FileMediaTeacher">
                        <div class="CropPicture_FileMediaTeacher">
                            <img alt="" class="style3" src="../../../image/classroom/calculatorSchool.png"/>
                        </div>
                    </div>
                    <div class="AreaContent_FileMediaTeacher">
                        <div class="fontTitle_FileMediaTeacher">
                           การบ้าน :  <%# Eval("Homework_Name")%>
                            </div>
                        <div class="fontDowload_FileMediaTeacher">
                            <asp:LinkButton ID="lnkbtnsendHomework" runat="server"
                                CommandArgument='<%# Eval("Homework_ID") +","+ Eval("Homework_Name") +","+Eval("Enroll_ID") %>'  
                                onclick="lnkbtnsendHomework_Click" >ส่งการบ้าน</asp:LinkButton>
                        </div>
                        <div class="AreaDetail_FileMediaTeacher">
                            <div class="fonttime_FileMediaTeacher">
                                วันที่ <%# Eval("Create_date")%>
                            </div>
                            <div class="fontsize_FileMediaTeacher">
                                ครั้งที่ <%# Eval("Homework_Num")%>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSourceHomeworkStuden" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
        
        SelectCommand="SELECT hom.Homework_ID,hom.Homework_Name,hom.Homework_ID,en.Enroll_ID,hom.Create_date,hom.Homework_Num
            FROM  DetailTech INNER JOIN   EnrollIn en ON DetailTech.DetailTech_ID = en.DetailTech_ID INNER JOIN
               Homework hom ON en.Enroll_ID = hom.Enroll_ID
                WHERE (en.[Std_Campus_Code] = @Std_Campus_Code) AND (hom.Homework_Status='N')">
        <SelectParameters>
            <asp:SessionParameter Name="Std_Campus_Code" SessionField="userid" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <asp:DataPager ID="DataPager" runat="server" PagedControlID="ListViewShowfileMedia" Visible="false"
            PageSize="15" >
        <Fields>
            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
    </div>

     <br />
    <br />

         <%--  <asp:UpdatePanel ID="updpanel" runat="server">
                <ContentTemplate>--%>
                    <asp:HiddenField ID="hidden_popupmsg" runat="server" />
                    <ajaxToolkit:ModalPopupExtender ID="mdlpopupmsg" runat="server" BackgroundCssClass="modalbackground" TargetControlID="hidden_popupmsg" 
                     PopupControlID="pnlprogress" >
                    </ajaxToolkit:ModalPopupExtender>
                    <asp:Panel ID="pnlprogress" runat="server" CssClass="modalpopup" Width="800px">

                      <div style="margin-left:758px; margin-top:-10px; width: 61px;">
                                                <asp:ImageButton ID="imgClose" runat="server" ImageUrl="~/image/close_button.png" OnClick="imgClose_Click" />
                                            </div>

                        <div id="donereg" runat="server" 
                            style="  background-color: #D3D3D3; width: 776px; height: 113px;" 
                            visible="true">

                       
                            <asp:Label ID="lblinfo" runat="server" Text="ดาว์โหลดไฟล์การบ้านที่คุณต้องการ"></asp:Label>
                            <asp:Label ID="lblhomework" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:FileUpload ID="FileUploadHomework" runat="server" 
                                ViewStateMode="Enabled" />
                            <br />
                            <br />
                            <asp:Button ID="btnSendHomework" Text="ส่งการบ้าน.." runat="server" 
                                onclick="btnSendHomework_Click" 
                                onclientclick="return confirm('คุณต้องการจะบันทึกข้อมูลส่งการบ้านจริงหรือไม่ ! ')" />
                            <br />
                        </div>
                        <br />
                    </asp:Panel>
                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
           
</asp:Content>