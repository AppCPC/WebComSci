<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucConsultPopup.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.Plane.ucConsultPopup" %>
 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
 <link href="../../../css/StyleSheetInAjaxControltoolkite.css" rel="stylesheet" type="text/css" />
   
   
            <ajaxToolkit:Accordion ID="MyAccordion" runat="server" SelectedIndex="0"
            HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
            ContentCssClass="accordionContent" FadeTransitions="false" FramesPerSecond="40" 
            TransitionDuration="250" AutoSize="None" RequireOpenedPane="false" 
            SuppressHeaderPostbacks="true" Height="300px" Width="650">
           <Panes>
            <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                <Header><a href="" class="accordionLink">คำปรึกษา</a></Header>
                <Content>

                   ยินดีต้อนรับคุณ &nbsp; <b> <asp:Label ID="lblname" runat="server" Text=""></asp:Label> </b>  &nbsp; สู่ระบบให้คำปรึกษา<br />
                   <div style="text-align:left;">
                   จากที่ทางระบบได้ตรวจสอบรายวิชาที่คุณติด F คือ <br />
                    <asp:Label ID="lblsubjectF" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblsubjectFollow" runat="server" Text=""></asp:Label><br />
                    
                    <br />
                    เทอมต่อไปรายวิชาที่คุณเรียนได้<br />
                    <asp:Label ID="lblsubNewTerm" runat="server" Text=""></asp:Label>
                  <br />
                  
                  ระบบให้คำปรึกษากับคุณในระดังหนึ่ง ที่เหลืออยู่ที่การตัดสินใจเพื่อจะลงทะเบียนเรียนต่อไป <br />
                  เราหวังว่าคำปรึกษานี้ จะเป็นประโยชน์กับคุณ ไม่มากก็น้อย ขอบคุณครับ ! <br />
                  </div>
                  
                </Content>
            </ajaxToolkit:AccordionPane>

            </Panes>
        </ajaxToolkit:Accordion>
       <%--</div> --%> 
    <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
        