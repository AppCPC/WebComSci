<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Plan.Master" AutoEventWireup="true"
    CodeBehind="EducationPage2.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Plane.EducationPage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //            $(".page_link").remove();
            $(".page_link").addClass("page_link")
            $("#PageId2_1").addClass("page_active");
            $("#PageId2_2").addClass("page_active");
            $("#AshowSubjectStudy").addClass("button_nav_menu_tree_Active");

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
    <%-- <script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript"></script>
 <script src="../../../chosen/chosen.proto.js" type="text/javascript"></script>--%>
    <script src="../../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <p align="left" style="font-size: medium; font-weight: bold; padding-left: 40px;
        padding-top: 10px;">
        ชั้นปีที่ 4-6</p>
    <div style="background-color: #ececec; padding-top: 20px;">
        <div style="background-position: center; width: 109px; background-image: url('../../../image/Edu/Circle/Gray2Hover.png');
            background-repeat: no-repeat; height: 64px; text-shadow: 0.1em 0.1em 0.05em #fff;">
            <p style="padding-top: 22px; font-weight: bold; color: #000;">
                แผนการศึกษา</p>
        </div>
        <div class="line_one_treeview_edu">
        </div>
        <div style="float: left; width: 100%;">
            <div class="class_tree" style="margin-left: 97px;">
                <p class="class_name">
                    ชั้นปี 4</p>
            </div>
            <div class="class_tree" style="margin-left: 217px;">
                <p class="class_name">
                    ชั้นปี 5</p>
            </div>
            <div class="class_tree" style="margin-left: 217px;">
                <p class="class_name">
                    ชั้นปี 6</p>
            </div>
        </div>
        <div class="line_two_treeview_edu">
        </div>
        <div class="year1_term1">
            <div class="term">
                <p class="term_name">
                    เทอม 1</p>
            </div>
            <div id="id111" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode111" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt111" runat="server" visible="false">
                        <asp:Label ID="subName111" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id112" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode112" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt112" runat="server" visible="false">
                        <asp:Label ID="subName112" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id113" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode113" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt113" runat="server" visible="false">
                        <asp:Label ID="subName113" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id114" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode114" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt114" runat="server" visible="false">
                        <asp:Label ID="subName114" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id115" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode115" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt115" runat="server" visible="false">
                        <asp:Label ID="subName115" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id116" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode116" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt116" runat="server" visible="false">
                        <asp:Label ID="subName116" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id117" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode117" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt117" runat="server" visible="false">
                        <asp:Label ID="subName117" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id118" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode118" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt118" runat="server" visible="false">
                        <asp:Label ID="subName118" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year1_term2">
            <!-- <div class="term">
                <p class="term_name">
                    เทอม 2</p>
            </div>-->
            <div id="headterm112" runat="server">
                <p id="termname112" runat="server" class="term_name">
                </p>
            </div>
            <div id="id121" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode121" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt121" runat="server" visible="false">
                        <asp:Label ID="subName121" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id122" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode122" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt122" runat="server" visible="false">
                        <asp:Label ID="subName122" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id123" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode123" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt123" runat="server" visible="false">
                        <asp:Label ID="subName123" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id124" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode124" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt124" runat="server" visible="false">
                        <asp:Label ID="subName124" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id125" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode125" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt125" runat="server" visible="false">
                        <asp:Label ID="subName125" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id126" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode126" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt126" runat="server" visible="false">
                        <asp:Label ID="subName126" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id127" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode127" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt127" runat="server" visible="false">
                        <asp:Label ID="subName127" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id128" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode128" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt128" runat="server" visible="false">
                        <asp:Label ID="subName128" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year1_term3">
            <!-- <div class="term">
                <p class="term_name">
                    เทอม 3</p>
            </div>-->
            <div id="headterm113" runat="server">
                <p id="termname113" runat="server" class="term_name">
                </p>
            </div>
            <div id="id131" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode131" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt131" runat="server" visible="false">
                        <asp:Label ID="subName131" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id132" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode132" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt132" runat="server" visible="false">
                        <asp:Label ID="subName132" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id133" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode133" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt133" runat="server" visible="false">
                        <asp:Label ID="subName133" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id134" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode134" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt134" runat="server" visible="false">
                        <asp:Label ID="subName134" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id135" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode135" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt135" runat="server" visible="false">
                        <asp:Label ID="subName135" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id136" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode136" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt136" runat="server" visible="false">
                        <asp:Label ID="subName136" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id137" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode137" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt137" runat="server" visible="false">
                        <asp:Label ID="subName137" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id138" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode138" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt138" runat="server" visible="false">
                        <asp:Label ID="subName138" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year2_term1">
            <div class="term">
                <p class="term_name">
                    เทอม 1</p>
            </div>
            <div id="id211" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode211" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt211" runat="server" visible="false">
                        <asp:Label ID="subName211" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id212" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode212" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt212" runat="server" visible="false">
                        <asp:Label ID="subName212" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id213" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode213" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt213" runat="server" visible="false">
                        <asp:Label ID="subName213" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id214" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode214" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt214" runat="server" visible="false">
                        <asp:Label ID="subName214" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id215" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode215" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt215" runat="server" visible="false">
                        <asp:Label ID="subName215" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id216" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode216" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt216" runat="server" visible="false">
                        <asp:Label ID="subName216" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id217" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode217" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt217" runat="server" visible="false">
                        <asp:Label ID="subName217" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id218" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode218" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt218" runat="server" visible="false">
                        <asp:Label ID="subName218" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year2_term2">
            <div id="headterm222" runat="server">
                <p id="termname222" runat="server" class="term_name">
                </p>
            </div>
            <div id="id221" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode221" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt221" runat="server" visible="false">
                        <asp:Label ID="subName221" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id222" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode222" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt222" runat="server" visible="false">
                        <asp:Label ID="subName222" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id223" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode223" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt223" runat="server" visible="false">
                        <asp:Label ID="subName223" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id224" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode224" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt224" runat="server" visible="false">
                        <asp:Label ID="subName224" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id225" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode225" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt225" runat="server" visible="false">
                        <asp:Label ID="subName225" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id226" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode226" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt226" runat="server" visible="false">
                        <asp:Label ID="subName226" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id227" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode227" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt227" runat="server" visible="false">
                        <asp:Label ID="subName227" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id228" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode228" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt228" runat="server" visible="false">
                        <asp:Label ID="subName228" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year2_term3">
            <div id="headterm223" runat="server">
                <p id="termname223" runat="server" class="term_name">
                </p>
            </div>
            <div id="id231" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode231" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt231" runat="server" visible="false">
                        <asp:Label ID="subName231" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id232" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode232" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt232" runat="server" visible="false">
                        <asp:Label ID="subName232" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id233" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode233" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt233" runat="server" visible="false">
                        <asp:Label ID="subName233" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id234" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode234" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt234" runat="server" visible="false">
                        <asp:Label ID="subName234" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id235" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode235" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt235" runat="server" visible="false">
                        <asp:Label ID="subName235" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id236" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode236" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt236" runat="server" visible="false">
                        <asp:Label ID="subName236" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id237" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode237" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt237" runat="server" visible="false">
                        <asp:Label ID="subName237" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id238" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode238" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt238" runat="server" visible="false">
                        <asp:Label ID="subName238" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year3_term1">
            <div class="term">
                <p class="term_name">
                    เทอม 1</p>
            </div>
            <div id="id311" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode311" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt311" runat="server" visible="false">
                        <asp:Label ID="subName311" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id312" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode312" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt312" runat="server" visible="false">
                        <asp:Label ID="subName312" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id313" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode313" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt313" runat="server" visible="false">
                        <asp:Label ID="subName313" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id314" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode314" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt314" runat="server" visible="false">
                        <asp:Label ID="subName314" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id315" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode315" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt315" runat="server" visible="false">
                        <asp:Label ID="subName315" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id316" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode316" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt316" runat="server" visible="false">
                        <asp:Label ID="subName316" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id317" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode317" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt317" runat="server" visible="false">
                        <asp:Label ID="subName317" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id318" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode318" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt318" runat="server" visible="false">
                        <asp:Label ID="subName318" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year3_term2">
            <div id="headterm322" runat="server">
                <p id="termname322" runat="server" class="term_name">
                </p>
            </div>
            <div id="id321" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode321" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt321" runat="server" visible="false">
                        <asp:Label ID="subName321" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id322" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode322" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt322" runat="server" visible="false">
                        <asp:Label ID="subName322" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id323" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode323" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt323" runat="server" visible="false">
                        <asp:Label ID="subName323" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id324" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode324" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt324" runat="server" visible="false">
                        <asp:Label ID="subName324" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id325" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode325" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt325" runat="server" visible="false">
                        <asp:Label ID="subName325" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id326" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode326" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt326" runat="server" visible="false">
                        <asp:Label ID="subName326" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id327" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode327" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt327" runat="server" visible="false">
                        <asp:Label ID="subName327" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id328" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode328" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt328" runat="server" visible="false">
                        <asp:Label ID="subName328" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year3_term3">
            <div id="headterm333" runat="server">
                <p id="termname333" runat="server" class="term_name">
                </p>
            </div>
            <div id="id331" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode331" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt331" runat="server" visible="false">
                        <asp:Label ID="subName331" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id332" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode332" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt332" runat="server" visible="false">
                        <asp:Label ID="subName332" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id333" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode333" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt333" runat="server" visible="false">
                        <asp:Label ID="subName333" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id334" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode334" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt334" runat="server" visible="false">
                        <asp:Label ID="subName334" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id335" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode335" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt335" runat="server" visible="false">
                        <asp:Label ID="subName335" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id336" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode336" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt336" runat="server" visible="false">
                        <asp:Label ID="subName336" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id337" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode337" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt337" runat="server" visible="false">
                        <asp:Label ID="subName337" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id338" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode338" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt338" runat="server" visible="false">
                        <asp:Label ID="subName338" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div style="clear: both; height: 60px;">
        </div>
    </div>
</asp:Content>