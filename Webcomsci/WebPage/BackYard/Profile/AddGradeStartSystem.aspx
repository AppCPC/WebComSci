<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Authen.Master" AutoEventWireup="true" CodeBehind="AddGradeStartSystem.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Profile.AddGradeStartSystem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: medium;
        }
        
        .textbox_in_back
        {
            border: 1px solid #bfbfbf;
            padding-left: 3px;
        }
        .regu
         {
        
        color:Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentAuthen" runat="server">
    <p style="text-align:left;" class="style1"><strong>&nbsp; กรุณากรอกข้อมูลผลการเรียนของนักศึกษา..
    </strong>
    </p>
    <p style="text-align:left;">&nbsp;</p>
    <p style="text-align:right;"><strong>(หมายเหตุ : กรุณากรอกเกรดเป็นตัวอักษร 
        A,B,C,D,F,W=ถอน)&nbsp;&nbsp;&nbsp; </strong></p>
    <p style="text-align:left;">&nbsp;</p>
    <p>

       <asp:GridView ID="gvListStudentInclass" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="StructSub_Code" Width="90%" CellPadding="4" 
         ForeColor="Black" GridLines="Vertical" 
        PageSize="100" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           <%-- <asp:BoundField DataField="Std_Campus_Code" HeaderText="ลำดับที่">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>--%>
            <asp:BoundField DataField="DetailTeach_Year" HeaderText="ปีการศึกษา" />
            <asp:BoundField DataField="DetailTech_Level" HeaderText="ภาคการศึกษา">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="DetailTech_Term" HeaderText="เทอม" />
            <asp:BoundField DataField="StructSub_Code" HeaderText="รหัสวิชา" />
             <asp:BoundField DataField="StructSub_NameTha" HeaderText="ชือวิชา" >
               <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>


            <asp:TemplateField HeaderText="ผลการเรียน">
                <ItemTemplate>
                    <asp:TextBox ID="txtgrad"   CssClass="textbox_in_back"  runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="validCheckCodeName" runat="server" ControlToValidate="txtgrad" SetFocusOnError="true"  ValidationGroup="Reg1" CssClass="regu">*</asp:RequiredFieldValidator>
                    <asp:Label ID="lblcheckgrade" runat="server" ForeColor="Red"></asp:Label>
                
                    <asp:Label ID="lbldetailTeach" Visible="false" Text='<% #Eval("DetailTech_ID")%>' runat="server"  ></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Height="30px" Font-Bold="True" 
            ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle Height="20px" BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>

    </p>
    <p>

        &nbsp;</p>
    <p style="text-align:right">

        <asp:Button ID="btncheck" runat="server" BorderColor="#999999" 
            BorderStyle="Solid"  ValidationGroup="Reg1"
            BorderWidth="1px" CssClass="button" onclick="btncheck_Click" 
            Text="ตรวจสอบ" />

        <asp:Button ID="btnok" runat="server" BorderColor="#999999" 
            BorderStyle="Solid"  ValidationGroup="Reg1"
            BorderWidth="1px" CssClass="button" onclick="btnok_Click" 
            Text="ยืนยัน &gt;&gt;" Visible="False" 
            onclientclick="return confirm('ยืนยันการบันทึกผลการเรียนนี้ ระบบจะนำผลการเรียนนี้เข้าไปใช้ในระบบ และนักศึกษาจะไม่สามารถแก้ไขข้อมูลผลการเรียนนี้ได้ ');" />
            <br />

    </p>'<br />
</asp:Content>
