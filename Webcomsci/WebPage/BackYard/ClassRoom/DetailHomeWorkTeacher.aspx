<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/classRoom.Master" AutoEventWireup="true" CodeBehind="DetailHomeWorkTeacher.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.DetailHoneWorkTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
&nbsp;<link rel="Stylesheet" href="../../../css/skins/TabRoom.css" /><br />
 <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
 <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>

    <asp:GridView ID="dgvShowGrade" runat="server" Width="90%" AutoGenerateColumns="False" 
        DataKeyNames="id" onrowdatabound="dgvShowGrade_RowDataBound" 
        BorderStyle="Solid" CssClass="MyGridView_DetailHoneWorkTeacher" >
        <AlternatingRowStyle CssClass="Alt_DetailHoneWorkTeacher" />
        <Columns>
             <%--<asp:BoundField DataField="num" HeaderText="การบ้านครั้งที่" 
                SortExpression="num" /> --%>
            
            <asp:TemplateField HeaderText="โหลด" >
                <ItemTemplate>
               
               &nbsp;<asp:LinkButton ID="linkimage" runat="server" onclick="linkimage_Click" CommandArgument='<% #Eval("Homework_Path")%>' ><img  style="border:0px;" src="../../../image/classroom/downloadHw.ico" /></asp:LinkButton>

                    <br>

                </ItemTemplate> 
            </asp:TemplateField>
            
            <asp:BoundField DataField="id" HeaderText="ลำดับที่" 
                InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="ชื่อผู้ส่ง" 
                SortExpression="name" />
            <asp:BoundField DataField="level" HeaderText="ชั้นปี" 
                SortExpression="level" />
            <asp:BoundField DataField="roomid" HeaderText="ห้อง" 
                SortExpression="roomid" />
            <asp:BoundField DataField="senddate" HeaderText="วันที่ส่ง" 
                SortExpression="senddate" />
            
             <asp:BoundField DataField="sendtime" HeaderText="เวลาที่ส่ง" />
             <asp:BoundField HeaderText="หมายเหตุ" />
            
        </Columns>
        <HeaderStyle CssClass="GridViewHeader_DetailHoneWorkTeacher" />
        <RowStyle CssClass="row_DetailHoneWorkTeacher" />
    </asp:GridView>

    <br />
         <a href='MainHomework.aspx?classid=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["classid"])%>&amp;dchID=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["dchID"])%>&amp;subjectcode=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["subjectcode"])%>&amp;ShowPlan_Id=<%= HttpUtility.HtmlAttributeEncode(Request.QueryString["ShowPlan_Id"])%>'>
    <div style="background-position: center; width: 95px; height: 50px; float: right; background-image: url('../../../image/Detail/Icon_backward.png'); background-repeat: no-repeat;"></div></a> 


    <br />
    <br />
    
    


</asp:Content>
