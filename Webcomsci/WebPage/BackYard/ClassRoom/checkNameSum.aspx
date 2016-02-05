<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="checkNameSum.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.checkNameSum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link rel="Stylesheet" href="../../../css/skins/TabRoom.css" /> 
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

   
    <div>

        <div style="text-align: right; width: 668px;">
        <asp:ImageButton ID="btnExcel" runat="server" 
            ImageUrl="~/image/classroom/excel Icon.png" onclick="btnExcel_Click" />
    </div>
        <br />


        <asp:GridView ID="gvdetails" runat="server" AllowPaging="True" 
             AutoGenerateColumns="False" Width="80%" 
            CssClass="MyGridView_checkNameSum" onrowcreated="gvdetails_RowCreated"
            BorderColor="White" BorderStyle="Groove" >
            <Columns>
                <asp:BoundField DataField="no" HeaderText="ลำดับที่" 
                    SortExpression="no" />
                <asp:BoundField DataField="camCode" HeaderText="รหัสนักศึกษา" 
                    SortExpression="Std_Campus_Code" />
                <asp:BoundField DataField="Std_FName" HeaderText="ชื่อนักศึกษา" 
                    SortExpression="Std_FName" />
                <asp:BoundField DataField="Std_LName" HeaderText="นามสกุล" 
                    SortExpression="Std_LName" />
                <asp:BoundField DataField="student" HeaderText="มาเรียน" 
                    SortExpression="Std_LName" />
                   <asp:BoundField DataField="Late" HeaderText="มาสาย" 
                    SortExpression="Std_LName" />
                 <asp:BoundField DataField="nostd" HeaderText="ขาดเรียน" 
                    SortExpression="Std_LName" />
            </Columns>
            <HeaderStyle CssClass="GridViewHeader_checkNameSum" />
        </asp:GridView>
        <br />
        <br />


</div>
            
         
                  <a href='ListCheckName.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;stdClass=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;deEduStd=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["deEduStd"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
    <div style="background-position: center; width: 51px; height: 50px; float: right; padding-top: 8px; background-image: url('../../../image/Detail/Icon_backward.png'); background-repeat: no-repeat;"></div></a> 

   
</asp:Content>
