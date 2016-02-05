<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Back3.Master" AutoEventWireup="true" CodeBehind="RegisClassRoom.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.RegisClassRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   <table style="width: 100%;">
       
  
          
    <table cellpadding="0" cellspacing="0" id="example" class="table table-striped table-bordered"
        style="background-color: #FFF; border: 1px solid #CCCCCC;">
        <thead>
            <tr>
                <th style="text-align: center;">
                    ลำดับที่
                </th>
               <th style="text-align: center;">
                    รหัส
                </th>
                <th>
                    ชือวิชา
                </th>
                <th style="text-align: center;">
                    หน่วยกิต
                </th>
                  
                <th style="text-align: center;">
                     Action
                </th>
            </tr>
        </thead>
          
        <asp:Repeater ID="repResults" runat="server" OnItemCommand="repResults_ItemCommand">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                     <td style="text-align:center;">
                        <asp:Label ID="lblNo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Id") %>'></asp:Label>
                    </td>
                      <td style="text-align:center;">
                        <asp:Label ID="lblsubcode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "stSubCode")%>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblsubjectName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "stSubName")%>'></asp:Label>
                    </td>
                      <td style="text-align:center;">
                        <asp:Label ID="lblCredit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "curricerdit")%>'></asp:Label>
                    </td>
                     
                    <td style="text-align:center;">
                        <asp:LinkButton ID="lblDetail" runat="server" CommandName="update" ToolTip="Render Text file"
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'><i class="icon-check"></i> </asp:LinkButton>
                        </div>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
             
    </table>
              </asp:Content>
