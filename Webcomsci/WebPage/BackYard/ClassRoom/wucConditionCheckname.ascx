<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucConditionCheckname.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.ClassRoom.wucConditionCheckname" %>
      <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>  
        
           <style type="text/css">
               .style1
               {
                   height: 58px;
               }
               .style2
               {
                   height: 58px;
                   width: 13px;
               }
               .style3
               {
                   height: 58px;
                   width: 1046px;
               }
               .style4
               {
                   width: 1046px;
               }
           .regu
    {
        
        color:Red;
        }
           </style>
            <link href="../../../css/skins/Back.css" rel="stylesheet" type="text/css" />


           <asp:UpdatePanel id="test" runat="server">
   <ContentTemplate>


    <table style="width:100%;">

     <tr>
            
            <td class="style2" >
              </td>
              <td class="style3"> <p style="text-align:left; ">
              <img src="../../../image/classroom/chck_icon.ico"  /> <strong>&nbsp;&nbsp;&nbsp; 
                  กรอกรายละเอียดคะแนนเช็คชือ..</strong></p>
             &nbsp;&nbsp;&nbsp;
              <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
        
        </tr>

        <tr>
            <td class="style2">
                </td>
            <td class="style4">

             &nbsp; &nbsp;   <fieldset > <legend> เงือนไข </legend> 

                 &nbsp; &nbsp;     <p >

                            <asp:RadioButton ID="rbtncon1" runat="server" AutoPostBack="true"
                                oncheckedchanged="rbtncon1_CheckedChanged" />
                            &nbsp;&nbsp; เข้าเรียนสาย&nbsp; 
                        <asp:TextBox ID="txtlate" runat="server" CssClass="textbox_in_back" ></asp:TextBox>
                            &nbsp;ครั้ง นับเป็นขาด 1&nbsp;ครั้ง

                        </p>

                 &nbsp; &nbsp;        
                  <p><span class="wrap"><asp:RadioButton ID="rbtncon2" runat="server"   AutoPostBack="true"
                                oncheckedchanged="rbtncon2_CheckedChanged" />
                            </span>&nbsp; คิดเฉพาะวันที่เข้าเรียนตรงเวลา </p>

                        <p>
                            &nbsp;</p>
                    <p>
                        <span class="wrap">
                        <asp:RadioButton ID="rbtncon3" runat="server" AutoPostBack="true" 
                            oncheckedchanged="rbtncon3_CheckedChanged" />
                        &nbsp; นับวันที่มีการเข้าเรียน</span></p>
                    <p>
                        &nbsp;</p>
                    <p><asp:Label ID="lblAlert" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        &nbsp;</p>
                 
                    <p>
                        &nbsp;</p>

                        </fieldset>


                      &nbsp; &nbsp;        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ต้องการให้คะแนนคิดเป็นร้อยละ&nbsp;<asp:TextBox ID="txtscore" runat="server" CssClass="textbox_in_back" ></asp:TextBox> 
                    &nbsp;&nbsp; ของผลการเรียน<asp:RequiredFieldValidator ID="RegFiCheckLname" runat="server" 
                        ControlToValidate="txtscore" CssClass="regu" 
                        ErrorMessage="**กรุณากรอกข้อมูลคะแนน" SetFocusOnError="true" 
                        ValidationGroup="Reg1"></asp:RequiredFieldValidator>
                    </p>

                    <br />
                    <br />
                    <div style="text-align:right">
                    <asp:Button ID="btnokMessage" Text="ตกลง" runat="server" ValidationGroup="Reg1"  CssClass="button_in_back" OnClick="btnokMessage_Click" />
                    <asp:Button ID="Button1" Text="ยกเลิก" runat="server" ValidationGroup="Reg1"  
                            CssClass="button_in_back" onclick="Button1_Click" />
                    </div>
                </div>

                </td>
                    <td class="style1">
                        </td>

        </tr>
        </tr>

         </tr>

         </tr>
          </table>

          </ContentTemplate>
          </asp:UpdatePanel>

  

          
