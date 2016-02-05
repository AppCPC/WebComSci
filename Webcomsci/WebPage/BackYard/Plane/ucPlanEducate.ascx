<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucPlanEducate.ascx.cs" Inherits="Webcomsci.WebPage.BackYard.Plane.ucPlanEducate" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<style type="text/css">


.TopBodyMenu
{
    width: 195px;
    height: 19px;
    background-image: url('../../../image/Edu/TopBodyMenu.png');
    background-repeat: repeat-y;
}

.BodyMenu
{
    width: 195px;
    background-image: url('../../../image/Edu/BodyMenu.png');
    background-repeat: repeat-y;
    padding-top: 20px;
    padding-bottom: 20px;
    font-family: tahoma;
    font-size: small;
    color: #CC0000;
}

.LEdu
{
    background-image: url('../../../image/Edu/LButton.png');
    background-repeat: no-repeat;
    float: left; 
    height: 49px;
    width: 7px;
}


.BodyEdu
{
    background-image: url('../../../image/Edu/BodyButton.png');
    background-repeat: repeat-x;
    float: left;
    height: 33px;
    width: 148px;
    padding-top: 18px;
    font-family: Tahoma, 'Times New Roman' , Times, serif;
    font-size: small;
    text-align: center;
}

.REdu
{
    background-image: url('../../../image/Edu/RButton.png');
    background-repeat: no-repeat;
    float: left; 
    height: 49px;
    width: 22px;
}


.Subject
{
    float: left; margin-right: 20px;
}

.LEdu2
{
    float: left; 
    background-image: url('../../../../image/Edu/LButton2.png'); 
    background-repeat: no-repeat; 
    width: 6px; 
    height: 40px;    
}


.BodyEdu2
{
    float: left; 
    height: 40px; 
    background-image: url('../../../../image/Edu/BodyButton2.png'); 
    background-repeat: repeat-x; 
    padding-top: 12px;
    font-family: tahoma; 
    font-size: small; 
    text-align: center; 
    padding-left: 3px;
    
}

.REdu2
{
    float: left;
    height: 40px;
    background-image: url('../../../image/Edu/RButton2.png');
    background-repeat: no-repeat;
    width: 23px;
}

    .style1
    {
        color: buttontext;
        border-style: none;
        border-color: inherit;
        border-width: medium;
        margin: 0;
        padding: 0;
        background-color: buttonface;
    }

</style>
    <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
    <asp:Panel ID="Panel1" runat="server" Height="693px" 
        Width="838px" ScrollBars="Auto">
        <div style="background-color: #FFFFFF; width: 1983px; height: 982px; margin-bottom: 0px;" 
            align="left">
            <div style="width: 288px; float: left;">
                <div style="width: 195px; margin-top: 200px; margin-left: 10px; float: left;" 
                    align="center">
                    <div style="background-image: url('../../../image/Edu/HeadMenu.png'); background-repeat: no-repeat; width: 195px; height: 30px; font-family: tahoma; font-size: medium; text-align: center; padding-top: 14px;">
                        ชื่อวิชา</div>
                    <div class="TopBodyMenu"></div>
                    <div class="BodyMenu">TEXT<br /> ข้อความ<br /> text<br /> ข้อความ<br /> TEXT</div>
                    <div style="width: 195px; height: 7px; background-image: url('../../../image/Edu/FooterMenu.png'); ">
                        &nbsp;</div>
                </div>
            </div>
            <div style="width: 240px; float: left; padding-top: 60px; margin-right: 0px;">
                <div style="height: 212px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ชั้นปีที่ 1</div>
                    <div class="REdu"></div>
                </div>
                <div style="height: 258px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ชั้นปีที่ 2</div>
                    <div class="REdu"></div>
                </div>
                <div style="height: 260px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ชั้นปีที่ 3</div>
                    <div class="REdu"></div>
                </div>
                <div style="height: 144px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ชั้นปีที่ 4</div>
                    <div class="REdu"></div>
                </div>
            </div>
            <div style="width: 256px; float: left; margin-top: 25px;">
                <div style="height: 63px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ภาคเรียนที่ 1</div>
                    <div class="REdu"></div>
                </div>
                <div style="height: 148px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ภาคเรียนที่ 2</div>
                    <div class="REdu"></div>
                </div>
                <div style="height: 73px;">
                    <div class="LEdu"></div>
                    <div 
                        class="BodyEdu">
                        ภาคเรียนที่ 1</div>
                    <div class="REdu"></div>
                </div>
                <div style="height: 148px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ภาคเรียนที่ 2</div>
                    <div class="REdu"></div>
                </div>
                <div style="height: 73px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ภาคเรียนที่ 1</div>
                    <div class="REdu"></div>
                </div>

                <div style="height: 73px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ภาคเรียนที่ 2</div>
                    <div class="REdu"></div>
                </div>

                <div style="height: 148px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ภาคเรียนที่ 3</div>
                    <div style="" class="REdu"></div>
                </div>
                <div style="height: 73px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ภาคเรียนที่ 1</div>
                    <div class="REdu"></div>
                </div>
                <div style="height: 92px;">
                    <div class="LEdu"></div>
                    <div class="BodyEdu">
                        ภาคเรียนที่ 2</div>
                    <div class="REdu"></div>
                </div>


            
            
            </div>
            
            
            <div style="float: left; width: 1165px; margin-top: 60px;">
            <div style="width: 1144px; height: 74px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1qqqqqqqqqqqqq</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 2</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 3</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 4</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 5</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 6</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 7</div>
                    <div class="REdu2"></div>
                </div>
                </div>

                <div style="width: 1144px; height: 136px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 2</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 3</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 4</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 5</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 6</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 7</div>
                    <div class="REdu2"></div>
                </div>
                </div>

                <div style="width: 1144px; height: 74px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 2</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 3</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 4</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 5</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 6</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 7</div>
                    <div class="REdu2"></div>
                </div>
                </div>

                <div style="width: 1144px; height: 156px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 2</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 3</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 4</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 5</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 6</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 7</div>
                    <div class="REdu2"></div>
                </div>
                </div>

                <div style="width: 1144px; height: 74px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 2</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 3</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 4</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 5</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 6</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 7</div>
                    <div class="REdu2"></div>
                </div>
                </div>

                <div style="width: 1144px; height: 73px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 2</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 3</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 4</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 5</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 6</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 7</div>
                    <div class="REdu2"></div>
                </div>
                </div>
                <div style="width: 1144px; height: 130px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1</div>
                    <div class="REdu2"></div>
                </div>
                </div>

                <div style="width: 1144px; height: 78px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 2</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 3</div>
                    <div class="REdu2"></div>
                </div>
                </div>
                <div style="width: 1144px; height: 78px;">
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 1</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 2</div>
                    <div class="REdu2"></div>
                </div>
                <div class="Subject">
                    <div class="LEdu2"></div>
                    <div class="BodyEdu2">
                        วิชาที่ 3</div>
                    <div class="REdu2"></div>
                </div>
                </div>

            </div>

            

         </div>
            </asp:Panel>

