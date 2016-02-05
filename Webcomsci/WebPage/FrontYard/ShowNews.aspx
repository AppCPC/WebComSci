<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Front.Master" AutoEventWireup="true" CodeBehind="ShowNews.aspx.cs" Inherits="Webcomsci.WebPage.FrontYard.ShowNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <asp:ListView ID="ListView1" runat="server" 
        DataSourceID="SqlDataSourceShowNews">
        <AlternatingItemTemplate>
            <li style="">BranchNews_Name:
                <asp:Label ID="BranchNews_NameLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Name") %>' />
                <br />
                BranchNews_Detail:
                <asp:Label ID="BranchNews_DetailLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Detail") %>' />
                <br />
                BranchNews_Path:
                <asp:Label ID="BranchNews_PathLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Path") %>' />
                <br />
                Update_user:
                <asp:Label ID="Update_userLabel" runat="server" 
                    Text='<%# Eval("Update_user") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="">BranchNews_Name:
                <asp:TextBox ID="BranchNews_NameTextBox" runat="server" 
                    Text='<%# Bind("BranchNews_Name") %>' />
                <br />
                BranchNews_Detail:
                <asp:TextBox ID="BranchNews_DetailTextBox" runat="server" 
                    Text='<%# Bind("BranchNews_Detail") %>' />
                <br />
                BranchNews_Path:
                <asp:TextBox ID="BranchNews_PathTextBox" runat="server" 
                    Text='<%# Bind("BranchNews_Path") %>' />
                <br />
                Update_user:
                <asp:TextBox ID="Update_userTextBox" runat="server" 
                    Text='<%# Bind("Update_user") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">BranchNews_Name:
                <asp:TextBox ID="BranchNews_NameTextBox" runat="server" 
                    Text='<%# Bind("BranchNews_Name") %>' />
                <br />
                BranchNews_Detail:
                <asp:TextBox ID="BranchNews_DetailTextBox" runat="server" 
                    Text='<%# Bind("BranchNews_Detail") %>' />
                <br />
                BranchNews_Path:
                <asp:TextBox ID="BranchNews_PathTextBox" runat="server" 
                    Text='<%# Bind("BranchNews_Path") %>' />
                <br />
                Update_user:
                <asp:TextBox ID="Update_userTextBox" runat="server" 
                    Text='<%# Bind("Update_user") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="">BranchNews_Name:
                <asp:Label ID="BranchNews_NameLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Name") %>' />
                <br />
                BranchNews_Detail:
                <asp:Label ID="BranchNews_DetailLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Detail") %>' />
                <br />
                BranchNews_Path:
                <asp:Label ID="BranchNews_PathLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Path") %>' />
                <br />
                Update_user:
                <asp:Label ID="Update_userLabel" runat="server" 
                    Text='<%# Eval("Update_user") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul ID="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="">BranchNews_Name:
                <asp:Label ID="BranchNews_NameLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Name") %>' />
                <br />
                BranchNews_Detail:
                <asp:Label ID="BranchNews_DetailLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Detail") %>' />
                <br />
                BranchNews_Path:
                <asp:Label ID="BranchNews_PathLabel" runat="server" 
                    Text='<%# Eval("BranchNews_Path") %>' />
                <br />
                Update_user:
                <asp:Label ID="Update_userLabel" runat="server" 
                    Text='<%# Eval("Update_user") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
    <p>
        <asp:SqlDataSource ID="SqlDataSourceShowNews" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
            SelectCommand="SELECT [BranchNews_Name], [BranchNews_Detail], [BranchNews_Path], [Update_user] FROM [BranchNews]">
        </asp:SqlDataSource>
    </p>
</asp:Content>
