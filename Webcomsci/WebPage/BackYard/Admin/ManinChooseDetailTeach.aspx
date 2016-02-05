<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ManinChooseDetailTeach.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ManinChooseDetailTeach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <style type="text/css">
    
     .textbox_in_back
     {
         border: 1px solid #bfbfbf;
         padding-left: 3px;
     }
     
     </style>

     <br />
     <fieldset style="width:75%;height:80%;text-align:left;" > <legend> 
         -ลงทะเบียนรายวิชาที่เปิดสอน </legend> 
         <br />

           <div id="divalert" runat="server"> <asp:Label ID="lblAlert" runat="server" Text="" Visible="false"></asp:Label> </div>
         <div id="divdetail" runat="server" >

         <table style="width:100%;" >
             <tr>
                 <td>
                     ปีการศึกษา</td>
                 <td>
                     <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" 
                         onselectedindexchanged="ddlYear_SelectedIndexChanged">
                     </asp:DropDownList>
                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
             <tr>
                 <td>
                     ภาคการศึกษา</td>
                 <td>
                     <asp:DropDownList ID="ddlTerm" runat="server">
                     </asp:DropDownList>
                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
             <tr>
                 <td>
                     &nbsp;</td>
                 <td>
                     &nbsp;</td>
                 <td>
                    <%-- <asp:Button ID="btnNext" runat="server" CssClass="textbox_in_back" 
                         onclick="btnNext_Click" Text="ถัดไป &gt;&gt;" Height="38px" />
                     <br />
                     <asp:Button ID="btnNextCase2" runat="server" CssClass="textbox_in_back" 
                         onclick="btnNextCase2_Click" Text="สร้างรายวิชาที่เปิดสอน&gt;&gt;" 
                         Height="35px" />--%>
                     <br />
                     <asp:Button ID="btnNextCase3" runat="server" CssClass="textbox_in_back" 
                         onclick="btnNextCase3_Click" Text="สร้างรายวิชาที่เปิดสอน&gt;&gt;" 
                         Height="43px" />
                 </td>
             </tr>
         </table>
         </div>
      </fieldset><br />
     <br />
     <br />


      <br />
     <%--<asp:Button ID="btnSwap" runat="server" CssClass="textbox_in_back" 
                         onclick="btnSwap_Click" Text="จัดการรายวิชา &gt;&gt;" />--%>
                     <%--<asp:Button ID="btnSwap" runat="server" CssClass="textbox_in_back" 
                         onclick="btnSwap_Click" Text="จัดการรายวิชา &gt;&gt;" />--%>
                 <br />
     <br />
</asp:Content>
