<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAddSubject.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.Admin.ucAddSubject" %>
<style type="text/css">



        .style3
        {
            width: 71px;
            text-align: left;
        }
        .style2
        {
            width: 199px;
            text-align:left;
        }
        .style7
        {
            width: 101px;
            text-align: left;
        }
        .style24
        {
            width: 61%;
            text-align: left;
        }
        .style20
        {
            width: 71px;
            text-align: left;
            height: 31px;
        }
        .style21
        {
            width: 199px;
            text-align: left;
            height: 31px;
        }
        .style22
        {
            width: 61%;
            text-align: left;
            height: 31px;
        }
        .style23
        {
            width: 101px;
            text-align: left;
            height: 31px;
        }
        .style17
        {
            width: 71px;
            text-align: left;
            height: 182px;
        }
        .style25
    {
        width: 199px;
        text-align: left;
        font-weight: bold;
    }
        .style26
    {
        height: 24px;
    }
    .style28
    {
        height: 182px;
    }
        </style>
   <!-- <table style="width:100%;">-->
   <asp:UpdatePanel id="test" runat="server">
   <ContentTemplate>
    <table style="width:100%;">
     <tr>
           
           
        
                   

        </tr>

     <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style25" colspan="2">
                เพิ่มรายวิชา</td>
        
                    <td class="style7">
                        &nbsp;</td>

        </tr>

        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                ปีการศึกษาที่ปรับปรุงหลักสูตร</td>
        <td class="style24">
                &nbsp;<asp:DropDownList ID="ddlYear" runat="server" 
                    DataSourceID="SqlDataSourceYearEdu" DataTextField="Curri_Year" 
                    DataValueField="Curri_Year">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceYearEdu" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Curri_Year] FROM [Curriculum]">
                </asp:SqlDataSource>
                </td>
                    <td class="style7">
                        &nbsp;</td>

        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                หมวดวิชา</td>
            <td class="style24">
                &nbsp;<asp:DropDownList ID="ddlCourses" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSourceCourse" DataTextField="Curri_Course" 
                    DataValueField="Curri_Course" Height="27px" Width="153px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [Curri_Course] FROM [Curriculum] WHERE ([Curri_Year] = @Curri_Year)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlYear" Name="Curri_Year" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                กลุ่มวิชา</td>
            <td class="style24">
                <asp:DropDownList ID="ddlGroup" runat="server" DataSourceID="SqlDataGroup" 
                    DataTextField="Curri_Group" DataValueField="Curri_Group">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataGroup" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEBCSDBConnectionString %>" 
                    SelectCommand="SELECT [Curri_Group] FROM [Curriculum] WHERE (([Curri_Course] = @Curri_Course) AND ([Curri_Year] = @Curri_Year))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCourses" Name="Curri_Course" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlYear" Name="Curri_Year" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
                <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
               <b> รายละเอียดรายวิชา</b></td>
            <td class="style24">
                &nbsp;</td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                รหัสวิชา</td>
            <td class="style24">
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                ชือวิชาภาษาไทย</td>
            <td class="style24">
                <asp:TextBox ID="txtNameThai" runat="server"></asp:TextBox>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                      ชื่อวิชาภาษาอังกฤษ</td>
            <td class="style24">
                          <asp:TextBox ID="TxtNameEn" runat="server"></asp:TextBox>
                    </td>
                  <td class="style7">
                      &nbsp;</td>
        </tr>
          <tr>
            <td class="style20">
                </td>
            <td class="style21" >
                หน่วยกิตรายวิชา</td>
            <td class="style22" 
                          &nbsp;</td>
                          <asp:TextBox ID="txtCredit" runat="server"></asp:TextBox>
                    <td class="style23">
                        </td>
        </tr>
          <tr>
            <td class="style17">
                </td>
            <td  colspan="2" class="style28" >
              <b > รายละเอียดรายวิชา  </b>
                <br />
                <br />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtArea" runat="server" Height="184px" 
                    TextMode="MultiLine" Width="84%"></asp:TextBox>
                        <br />
                <br />
       
       <div style="  text-align: right; height: 22px;">
                                 <asp:Button ID="btnSave" runat="server" Text="บันทึก" ValidationGroup="Reg1" 
                              Width="70px" onclick="btnSave_Click" />

                              <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" Width="70px" 
                                     onclick="btnCancel_Click" /></div>
              
                        <br />
              
                        </td>
           
        </tr>
        </tr>

         </tr>

         </tr>
          </table>

          </ContentTemplate>
          </asp:UpdatePanel>
          


          
