<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddEducationStudent.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.AddEducationStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 229px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div style="padding-top: 20px">
     <table style="width:100%;">
         <tr>
             <td class="style1">
                 <strong>จัดการผลการเรียนของนักศึกษา</strong></td>
             <td>
                 &nbsp;</td>
             <td>
                 &nbsp;</td>
         </tr>
         <tr>
             <td class="style1">
                 &nbsp;</td>
             <td>
                 &nbsp;</td>
             <td>
                 &nbsp;</td>
         </tr>
         <tr>
             <td class="style1">
                 &nbsp;</td>
             <td>
                 &nbsp;</td>
             <td>
                 &nbsp;</td>
         </tr>
     </table>



    <span class="wrap">
    <asp:GridView ID="gvListStudentInclass" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Std_Campus_Code" Width="90%" CellPadding="4" 
        DataSourceID="SqlDataSourceStudentInclass" ForeColor="#333333" GridLines="None" 
        PageSize="20">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Std_Campus_Code" HeaderText="รหัสนักศึกษา">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Std_FName" HeaderText="ชื่อนักศึกษา" />
            <asp:BoundField DataField="Std_LName" HeaderText="ชื่อสกุล">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Std_YearEducate" HeaderText="ปีที่เข้าศึกษา" />
            <asp:BoundField DataField="Std_Group" HeaderText="กลุ่ม" />
            <asp:TemplateField HeaderText="ผลการเรียน">
                <ItemTemplate>
                    <asp:TextBox ID="txtgrad" runat="server"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Height="30px" Font-Bold="True" 
            ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle Height="20px" BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceStudentInclass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
        SelectCommand="SELECT     EnrollIn.Enroll_ID, EnrollIn.DetailTech_ID, EnrollIn.Std_Campus_Code, Student.Std_FName, Student.Std_LName, Student.Std_FNameEn, Student.Std_Nickname, 
                      Student.Std_LNameEn, Student.Std_Campus_Code, Student.Std_YearEducate, Student.Std_Group
                      FROM  Student INNER JOIN
                      EnrollIn ON Student.Std_Campus_Code = EnrollIn.Std_Campus_Code WHERE ([DetailTech_ID] = @DetailTech_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DetailTech_ID" QueryStringField="dchID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div style="text-align:right;">
        <asp:Button ID="btnsave" runat="server" Text="บันทึก" onclick="btnsave_Click" />
            <%-- onclientclick="return confirm('กรุณาตรวจสอบข้อมูลผลการเรียนที่คุณกรอกอีกครั้ง เพราะระบบจะลบข้อมูลห้องเรียนโดยอัตโนมัติ เมื่อคุณกดบันทึก ');"--%> 
            
    <br />
        <asp:ImageButton ID="imgback" runat="server" Height="55px" 
            ImageUrl="~/image/back.ico" onclick="imgback_Click" />
           
    </div>



    </span>

    <br />

    </div>
</asp:Content>
