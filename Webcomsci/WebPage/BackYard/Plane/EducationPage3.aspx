<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Plan.Master" AutoEventWireup="true"
    CodeBehind="EducationPage3.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Plane.EducationPage3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //            $(".page_link").remove();
            $(".page_link").addClass("page_link")
            $("#PageId3_1").addClass("page_active");
            $("#PageId3_2").addClass("page_active");
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
        ชั้นปีที่ 7-8</p>
    <div style="background-color: #ececec; padding-top: 20px;">
        <div style="background-position: center; width: 109px; background-image: url('../../../image/Edu/Circle/Gray2Hover.png');
            background-repeat: no-repeat; height: 64px; text-shadow: 0.1em 0.1em 0.05em #fff;">
            <p style="padding-top: 22px; font-weight: bold; color: #000;">
                แผนการศึกษา</p>
        </div>
        <div style="background-image: url('../../../image/Edu/Line/Line3.png');" class="line_one_treeview_edu">
        </div>
        <div style="float: left; width: 100%;">
            <div class="class_tree" style="margin-left: 97px;">
                <p class="class_name">
                    ชั้นปี 7</p>
            </div>
            <div class="class_tree" style="margin-left: 504px;">
                <p class="class_name">
                    ชั้นปี 8</p>
            </div>
        </div>
        <div style="background-image: url('../../../image/Edu/Line/Line4.png');" class="line_two_treeview_edu">
        </div>
        <div class="year1_term1">
            <div class="term">
                <p class="term_name">
                    เทอม 1</p>
            </div>
            <div id="id711" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode711" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt711" runat="server" visible="false">
                        <asp:Label ID="subName711" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id712" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode712" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt712" runat="server" visible="false">
                        <asp:Label ID="subName712" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id713" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode713" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt713" runat="server" visible="false">
                        <asp:Label ID="subName713" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id714" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode714" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt714" runat="server" visible="false">
                        <asp:Label ID="subName714" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id715" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode715" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt715" runat="server" visible="false">
                        <asp:Label ID="subName715" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id716" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode716" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt716" runat="server" visible="false">
                        <asp:Label ID="subName716" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id717" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode717" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt717" runat="server" visible="false">
                        <asp:Label ID="subName717" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id718" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode718" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt718" runat="server" visible="false">
                        <asp:Label ID="subName718" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year1_term2">
            <div id="headterm712" runat="server">
                <p id="termname712" runat="server" class="term_name">
                </p>
            </div>
            <div id="id721" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode721" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt721" runat="server" visible="false">
                        <asp:Label ID="subName721" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id722" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode722" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt722" runat="server" visible="false">
                        <asp:Label ID="subName722" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id723" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode723" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt723" runat="server" visible="false">
                        <asp:Label ID="subName723" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id724" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode724" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt724" runat="server" visible="false">
                        <asp:Label ID="subName724" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id725" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode725" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt725" runat="server" visible="false">
                        <asp:Label ID="subName725" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id726" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode726" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt726" runat="server" visible="false">
                        <asp:Label ID="subName726" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id727" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode727" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt727" runat="server" visible="false">
                        <asp:Label ID="subName727" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id728" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode728" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt728" runat="server" visible="false">
                        <asp:Label ID="subName728" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year1_term3">
            <div id="headterm713" runat="server">
                <p id="termname713" runat="server" class="term_name">
                </p>
            </div>
            <div id="id731" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode731" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt731" runat="server" visible="false">
                        <asp:Label ID="subName731" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id732" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode732" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt732" runat="server" visible="false">
                        <asp:Label ID="subName732" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id733" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode733" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt733" runat="server" visible="false">
                        <asp:Label ID="subName733" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id734" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode734" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt734" runat="server" visible="false">
                        <asp:Label ID="subName734" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id735" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode735" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt735" runat="server" visible="false">
                        <asp:Label ID="subName735" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id736" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode736" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt736" runat="server" visible="false">
                        <asp:Label ID="subName736" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id737" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode737" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt737" runat="server" visible="false">
                        <asp:Label ID="subName737" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id738" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode738" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt738" runat="server" visible="false">
                        <asp:Label ID="subName738" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year8_term1">
            <div class="term">
                <p class="term_name">
                    เทอม 1</p>
            </div>
            <div id="id811" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode811" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt811" runat="server" visible="false">
                        <asp:Label ID="subName811" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id812" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode812" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt812" runat="server" visible="false">
                        <asp:Label ID="subName812" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id813" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode813" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt813" runat="server" visible="false">
                        <asp:Label ID="subName813" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id814" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode814" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt814" runat="server" visible="false">
                        <asp:Label ID="subName814" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id815" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode815" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt815" runat="server" visible="false">
                        <asp:Label ID="subName815" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id816" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode816" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt816" runat="server" visible="false">
                        <asp:Label ID="subName816" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id817" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode817" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt817" runat="server" visible="false">
                        <asp:Label ID="subName817" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id818" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode818" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt818" runat="server" visible="false">
                        <asp:Label ID="subName818" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year8_term2">
            <div id="headterm822" runat="server">
                <p id="termname822" runat="server" class="term_name">
                </p>
            </div>
            <div id="id821" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode821" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt821" runat="server" visible="false">
                        <asp:Label ID="subName821" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id822" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode822" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt822" runat="server" visible="false">
                        <asp:Label ID="subName822" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id823" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode823" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt823" runat="server" visible="false">
                        <asp:Label ID="subName823" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id824" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode824" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt824" runat="server" visible="false">
                        <asp:Label ID="subName824" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id825" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode825" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt825" runat="server" visible="false">
                        <asp:Label ID="subName825" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id826" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode826" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt826" runat="server" visible="false">
                        <asp:Label ID="subName826" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id827" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode827" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt827" runat="server" visible="false">
                        <asp:Label ID="subName827" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id828" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode828" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt828" runat="server" visible="false">
                        <asp:Label ID="subName828" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div class="year8_term3">
            <div id="headterm823" runat="server">
                <p id="termname823" runat="server" class="term_name">
                </p>
            </div>
            <div id="id831" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode831" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt831" runat="server" visible="false">
                        <asp:Label ID="subName831" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id832" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode832" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt832" runat="server" visible="false">
                        <asp:Label ID="subName832" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id833" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode833" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt833" runat="server" visible="false">
                        <asp:Label ID="subName833" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id834" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode834" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt834" runat="server" visible="false">
                        <asp:Label ID="subName834" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id835" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode835" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt835" runat="server" visible="false">
                        <asp:Label ID="subName835" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id836" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode836" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt836" runat="server" visible="false">
                        <asp:Label ID="subName836" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id837" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode837" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt837" runat="server" visible="false">
                        <asp:Label ID="subName837" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
            <div id="id838" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode838" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt838" runat="server" visible="false">
                        <asp:Label ID="subName838" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
        <div style="clear: both; height: 60px;">
        </div>
    </div>
</asp:Content>