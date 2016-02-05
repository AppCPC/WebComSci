<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="AddEducateStudentInclass.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.AddEducateStudentInclass" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register Src="~/WebPage/BackYard/ClassRoom/wucConditionCheckname.ascx" TagName="Popupcheckname" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
  .modalpopup{
    background-color:White;
    padding:6px 6px 6px 6px;
    margin-top:-85px;
    text-align:left;
    float: left; font-family: tahoma; font-size: 13px; color: #000; margin-right: 5px; margin-top: 4px;
}
        
</style>
        <link href="../../../css/skins/Admin.css" rel="stylesheet" type="text/css" />
         <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />

    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
     <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
  <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>
    <div style="padding-top: 10px">
     <p align="left" 
         style="font-size: medium; font-weight: bold; margin-bottom: 10px; padding-left: 20px;">จัดการผลการเรียนของนักศึกษา<asp:ScriptManager 
             ID="ScriptManager1" runat="server">
         </asp:ScriptManager>
        </p>
     <p align="left" 
         style="font-size: medium; font-weight: bold; margin-bottom: 10px; padding-left: 20px;">


     </p>
    <span class="wrap">
    <div align="left" style="padding-left: 20px">

 <%--   <div class="grade_detail_box">--%>
           <%-- <asp:BoundField HeaderText="Total" SortExpression="total" >
                <ItemStyle Width="100px" />
                </asp:BoundField> 
            <div class="body_grade_detail_box">
                <div style="margin-top: 5px; margin-bottom: 10px; margin-right: 10px; float: right; width: 100%;">
                 <p><strong>&nbsp;&nbsp;&nbsp;&nbsp; รายละเอียดของช่วงคะแนนของเกรด</strong></p>

                        <div style="float: right; width: 230px;">
 <p style="float: left; color: #FFFFFF; margin-right: 5px; margin-top: 2px; height: 17px; width: 65px;">
                            <strong>ประเภท</strong></p>

                <asp:DropDownList ID="ddlTypeCheckGrad" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddlTypeCheckGrad_SelectedIndexChanged" >
                    <asp:ListItem Value="A">แบบอิงกลุ่ม</asp:ListItem>
                    <asp:ListItem Value="B">แบบอิงเกณฑ์</asp:ListItem>
                </asp:DropDownList>
                        </div>
                       
                    </div>

        <div align="center"  class="gridview_grade_detail_box">
    <span class="wrap">

    <br />
    <asp:GridView ID="dgvShowGrade" runat="server" Width="86%" AutoGenerateColumns="False" 
        DataKeyNames="id" onrowdatabound="dgvShowGrade_RowDataBound" 
        BorderStyle="Solid" CssClass="MyGridView_DetailHoneWorkTeacher" Height="250px" >
        <AlternatingRowStyle CssClass="Alt_DetailHoneWorkTeacher" />
        <Columns>
       
            
            <asp:BoundField DataField="id" HeaderText="ลำดับ" 
                InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="grade" HeaderText="เกรด" 
                SortExpression="grade" />
                     
            <asp:TemplateField HeaderText="ช่วงคะแนน" >
                <ItemTemplate>
                
                 <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' ></asp:Label>
                    <asp:Label ID="lblrange" runat="server" Text='<%# Eval("range") %>' ></asp:Label>

                    <asp:TextBox ID="txtvalue" runat="server" Text='<% #Eval("range")%>' Visible="false" Width="30px" ForeColor="#FFCCCC" BackColor="#FF5050" 
            Font-Bold="True" ></asp:TextBox>
             <asp:Label ID="lbltype" runat="server" Text='<%# Eval("type") %>' ></asp:Label>
            

                </ItemTemplate> 
            </asp:TemplateField>

                 
            <asp:TemplateField HeaderText="จัดการ" >
                <ItemTemplate>
               
               &nbsp;<asp:LinkButton ID="lbtnEdit" runat="server" onclick="lbntEdit_Click" >แก้ไข</asp:LinkButton>
                 &nbsp;<asp:LinkButton ID="lbtnOK" runat="server" Visible="false" 
                        onclick="lbtnOK_Click">ตกลง</asp:LinkButton><br />
               &nbsp;<asp:LinkButton ID="lbtnCancel" runat="server" Visible="false" 
                        onclick="lbtnCancel_Click">ยกเลิก</asp:LinkButton>

                </ItemTemplate> 
            </asp:TemplateField>

            
        </Columns>
        <HeaderStyle CssClass="GridViewHeader_DetailHoneWorkTeacher" />
        <RowStyle CssClass="row_DetailHoneWorkTeacher" />
    </asp:GridView>


    <br />


    </span>

                    </div>
            </div>
    </div>--%>

    <asp:GridView ID="gvListStudentCalGrade" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="Std_Campus_Code" Width="86%"  ShowFooter="True" 
        PageSize="20" CssClass="MyGridView_AddEducateStudentInclass" CellPadding="4" 
            ForeColor="#333333" GridLines="None" 
            ondatabound="gvListStudentCalGrade_DataBound"> 
        <AlternatingRowStyle CssClass="MyGridViewAlt_AddEducateStudentInclass" 
            BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Std_Campus_Code" HeaderText="รหัสนักศึกษา">
            <ItemStyle HorizontalAlign="Center" Width="100px"  />
            </asp:BoundField>

            <asp:BoundField DataField="Std_FName" HeaderText="ชื่อนักศึกษา">
            <ItemStyle HorizontalAlign="Center"  Width="100px"   />
            </asp:BoundField>

            <asp:BoundField DataField="Std_LName" HeaderText="ชื่อสกุล">
            <ItemStyle HorizontalAlign="Center"  Width="100px"   />
            </asp:BoundField>
            <%-- 
            <asp:BoundField DataField="Std_YearEducate" HeaderText="ปีที่เข้าศึกษา" />
            <asp:BoundField DataField="Std_Group" HeaderText="กลุ่ม" />--%>

             <asp:TemplateField HeaderText="คะแนนเช็คชื่อ">
                <ItemTemplate>
                <asp:Label ID="lblnum" runat="server" Text='<%# Eval("check_name_num") %>' Font-Bold="True" Font-Size="14px"></asp:Label>
               <%-- <asp:Label ID="lblAllText" runat="server" Text='<%# Eval("AllScoreCheckName") %>'></asp:Label>--%>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:BoundField DataField="AllScoreCheckName" > </asp:BoundField>


             

            <asp:TemplateField HeaderText="คะแนนเก็บ">
                <ItemTemplate><asp:TextBox ID="txtAll" Width="40px"   runat="server" 
                        ontextchanged="txtAll_TextChanged">0</asp:TextBox>
<%--                    <asp:Label ID="lblAllText" runat="server" Text='<%# Eval("AllSaveSore") %>'></asp:Label>--%>

                </ItemTemplate>
            </asp:TemplateField>

                   <asp:BoundField DataField="AllSaveSore" > </asp:BoundField>

             <asp:TemplateField HeaderText="กลางภาค">
                <ItemTemplate><asp:TextBox ID="txtTestMidterm" Width="40px" runat="server" 
                        ontextchanged="txtTestMidterm_TextChanged">0</asp:TextBox>
<%--             <asp:Label ID="lblTestMidterm" runat="server" Text='<%# Eval("AllScoreMidterm") %>'></asp:Label>--%>
                </ItemTemplate>
            </asp:TemplateField>

                <asp:BoundField DataField="AllScoreMidterm" > </asp:BoundField>

              <asp:TemplateField HeaderText="ปลายภาค">
                  <FooterTemplate>
                      คะแนนเฉลี่ย :
                  </FooterTemplate>
                <ItemTemplate><asp:TextBox ID="txtTestFinal" Width="40px" runat="server" 
                        ontextchanged="txtTestFinal_TextChanged">0</asp:TextBox>
<%--                  <asp:Label ID="lblTestFinal" runat="server" Text='<%# Eval("AllFinal") %>'></asp:Label>--%>
                </ItemTemplate>
            </asp:TemplateField>
               <asp:BoundField DataField="AllFinal" > </asp:BoundField>

               <asp:TemplateField HeaderText="คะแนนรวม">
                   <FooterTemplate>
                     <asp:Label ID="lblScoreAverage" runat="server" Font-Bold="True" Font-Size="14px">0.00</asp:Label>
                  <asp:Label ID="lblTaltal" runat="server" Text='<%# Eval("AllScore") %>'></asp:Label>
                   </FooterTemplate>
                   <ItemTemplate>
                      <asp:Label ID="lblResult" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
     
                   </ItemTemplate>
            </asp:TemplateField>
             
             <asp:BoundField DataField="AllScore" > </asp:BoundField>

            

              <asp:TemplateField HeaderText="ผลการเรียน">
                  <FooterTemplate>
                      <span class="wrap">
                      <asp:Button ID="btncheck" runat="server" CssClass="button_in_back" 
                          Height="29px" onclick="btncheck_Click" Text="ตรวจสอบ" Width="85px" />
                      </span>
                  </FooterTemplate>
                <ItemTemplate>
                   <div align="center">
                       <asp:Label ID="lblResultGrad" runat="server" BorderColor="#FF6666" 
                           Font-Bold="True" Font-Size="15px"></asp:Label>
                    </div> 
                </ItemTemplate>
            </asp:TemplateField>

            <%-- <asp:BoundField HeaderText="Total" SortExpression="total" >
                <ItemStyle Width="100px" />
                </asp:BoundField> --%>


        </Columns>
        <EditRowStyle BackColor="#999999" />
   <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle Height="30px" CssClass="GridViewHeader_AddEducateStudentInclass" 
            BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle Height="20px" CssClass="MyGridViewRow_AddEducateStudentInclass" 
            BackColor="#F7F6F3" ForeColor="#333333" />

        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceStudentInclass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
        SelectCommand="SELECT     EnrollIn.Enroll_ID, EnrollIn.DeEduStd, EnrollIn.Std_Campus_Code, Student.Std_FName, Student.Std_LName, Student.Std_FNameEn, Student.Std_Nickname, 
                      Student.Std_LNameEn, Student.Std_Campus_Code, Student.Std_YearEducate, Student.Std_Group
                      FROM  Student INNER JOIN
                      EnrollIn ON Student.Std_Campus_Code = EnrollIn.Std_Campus_Code WHERE ([DeEduStd] = @DeEduStd)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DeEduStd" QueryStringField="dchID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
       


    <div align="right" style="padding-top: 20px; width: 600px;">
     <span  style="padding-left: 400px;" >
         
        <%--<asp:Button ID="btnInsertCheckname" runat="server" Text="เพิ่มคะแนนการเช็คชื่อ" onclick="btnInsertCheckname_Click"
        Height="29px" Width="162px" CssClass="button_in_back"  />--%>

        
           <asp:HiddenField ID="HiddenTargetShow" runat="server"  />

                <br />
        <br />
        <br />

                <ajaxToolkit:ModalPopupExtender ID="mdlpopupmsg" runat="server" DynamicServicePath=""
                                                        Enabled="True" TargetControlID="HiddenTargetShow"  PopupControlID="pnl"  CancelControlID="imgBtnClose"
                                                        BackgroundCssClass="modalbackground">
                                                    </ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="pnl" CssClass="modalpopup" runat="server" Style="display: none;width:600px;">
             
            <div style="background-color:Gray;" > 
                          <p style="text-align: right;">
  <asp:ImageButton ID="imgBtnClose" runat="server" ImageUrl="~/image/close_button.png"  AlternateText="ปิด"  />
             </p>

               </div>
               <uc1:Popupcheckname ID="PopupAddsubject" runat="server" />  

                 </asp:Panel>


    </span>



    <br />
     <div class="content_box_curve" style="padding-top: 20px; width: 600px;">
    <%--  <p> <strong>บันทึกผลการเรียนนักศึกษา </strong> </p>
        <table style="width:100%;">
             <tr>
                 <td>
                     ปีการศึกษา&nbsp; </td>
                 <td style="text-align:left">
                     <asp:TextBox ID="txtyear" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
             <tr>
                 <td>
                     ชั้นปี</td>
                 <td style="text-align:left" >
    <span class="wrap">
                     <asp:TextBox ID="txtLevel" runat="server"></asp:TextBox>



    </span>

                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
             <tr>
                 <td>
                     เทอม</td>
                 <td style="text-align:left">
    <span class="wrap">
                     <asp:TextBox ID="txtterm" runat="server"></asp:TextBox>



    </span>

                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
         </table>
         <br />
         <br />--%>

         <center>
         <p style="text-align:left;"><strong>บันทึกข้อมูลผลการเรียนเข้าสู่ระบบ</strong></p>
             <br />
        <asp:Button ID="btnsave" runat="server" Text="บันทึก" onclick="btnsave_Click"  OnClientClick="return confirm('ยืนยันการบันทึกผลการเรียน \n เมื่อบันทึกระบบจะทำการลบห้องเรียนนี้ ! ');" 
        Height="29px" Width="76px" CssClass="button_in_back"  />
             <br />
             <br />
             หมายเหตุ : ถ้าทำการบันทึกระบบจะทำการปิดห้องเรียนนี้ 
        </center>

        </div>
            
    <br />
        <asp:ImageButton ID="imgback" runat="server" Height="55px" 
            ImageUrl="~/image/Detail/Icon_backward.png" onclick="imgback_Click" 
            Width="55px" />
           
        <br />
    <span class="wrap">
        



    </span>

        <br />
        <br />

     <%-- 
            <asp:BoundField DataField="Std_YearEducate" HeaderText="ปีที่เข้าศึกษา" />
            <asp:BoundField DataField="Std_Group" HeaderText="กลุ่ม" />--%>

    <span class="wrap">
            



        <br />
        <br />





    </span>

    </div>



    </span>

    <br /><br />
    </div>
</asp:Content>
