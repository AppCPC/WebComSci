<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Plan.Master" AutoEventWireup="true"
    CodeBehind="Education2.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Plane.Education2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/WebPage/BackYard/Plane/ucConsultPopup.ascx" TagName="popupconsult"
    TagPrefix="uc1" %>
<%@ Register Src="~/WebPage/BackYard/Plane/ucPlanEducate.ascx" TagName="popup" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#AshowSubjectStudy").addClass("button_nav_menu_tree_Active");

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../css/skins/Back.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/ajaxtoolkiteSyle.css" rel="stylesheet" type="text/css" />
    <asp:HiddenField ID="HiddenTargetShow" runat="server" />
    <ajaxToolkit:ModalPopupExtender ID="mdlconsult" runat="server" DynamicServicePath=""
        Enabled="True" TargetControlID="HiddenTargetShow" CancelControlID="imgproClose"
        PopupControlID="pnl" BackgroundCssClass="modalbackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnl" CssClass="modalpopup" runat="server" Style="display: none">
        <%--<div style="text-align: right;background-color:Gray;" >  --%>
        <div style="text-align: right; background-color: Gray;">
            <div style="text-align: right">
                <asp:ImageButton ID="imgproClose" runat="server" ImageUrl="~/image/close_button.png"
                    AlternateText="ปิด" />
            </div>
        </div>
        <uc1:popupconsult ID="popupconsult" runat="server" />
    </asp:Panel>
    <div style="background-color: #ececec; padding-top: 20px;">
        <div style="background-position: center; width: 109px; background-image: url('../../../image/Edu/Circle/Gray2Hover.png'); background-repeat: no-repeat; height: 64px; text-shadow: 0.1em 0.1em 0.05em #fff;">
            <p style="padding-top: 22px; font-weight: bold; color: #000;">
                แผนการศึกษา
            </p>
        </div>
        <div style="background-position: center; height: 59px; background-image: url('../../../image/Edu/Line/Line1-2.png'); background-repeat: no-repeat;">
        </div>
        <div style="float: left; width: 100%;">
            <div class="class_tree" style="margin-left: 97px;">
                <p class="class_name">
                    ชั้นปี 1
                </p>
            </div>
            <div class="class_tree" style="margin-left: 125px;">
                <p class="class_name">
                    ชั้นปี 2
                </p>
            </div>
            <div class="class_tree" style="margin-left: 114px;">
                <p class="class_name">
                    ชั้นปี 3
                </p>
            </div>
            <div class="class_tree" style="margin-left: 125px;">
                <p class="class_name">
                    ชั้นปี 4
                </p>
            </div>
        </div>
        <div style="background-position: center top; clear: both; background-image: url('../../../image/Edu/Line/Line2-2.png'); background-repeat: no-repeat; height: 67px; width: 700px;">
        </div>
        <div class="year1_term1_tree4Year">
            <div class="term">
                <p class="term_name">
                    เทอม 1
                </p>
            </div>
            <div id="id11" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode11" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt11" runat="server" visible="false">
                        <asp:Label ID="subName11" runat="server" Text="tt"></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id12" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode12" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt12" runat="server" visible="false">
                        <asp:Label ID="subName12" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id13" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode13" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt13" runat="server" visible="false">
                        <asp:Label ID="subName13" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id14" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode14" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt14" runat="server" visible="false">
                        <asp:Label ID="subName14" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id15" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode15" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt15" runat="server" visible="false">
                        <asp:Label ID="subName15" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id16" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode16" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt16" runat="server" visible="false">
                        <asp:Label ID="subName16" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id17" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode17" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt17" runat="server" visible="false">
                        <asp:Label ID="subName17" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id18" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode18" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt18" runat="server" visible="false">
                        <asp:Label ID="subName18" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="year1_term2_tree4Year">
            <div class="term">
                <p class="term_name">
                    เทอม 2
                </p>
            </div>
            <div id="id21" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode21" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt21" runat="server" visible="false">
                        <asp:Label ID="subName21" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id22" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode22" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt22" runat="server" visible="false">
                        <asp:Label ID="subName22" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id23" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode23" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt23" runat="server" visible="false">
                        <asp:Label ID="subName23" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id24" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode24" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt24" runat="server" visible="false">
                        <asp:Label ID="subName24" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id25" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode25" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt25" runat="server" visible="false">
                        <asp:Label ID="subName25" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id26" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode26" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt26" runat="server" visible="false">
                        <asp:Label ID="subName26" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id27" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode27" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt27" runat="server" visible="false">
                        <asp:Label ID="subName27" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id28" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode28" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt28" runat="server" visible="false">
                        <asp:Label ID="subName28" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="year2_term1_tree4Year">
            <div class="term">
                <p class="term_name">
                    เทอม 1
                </p>
            </div>
            <div id="id31" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode31" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt31" runat="server" visible="false">
                        <asp:Label ID="subName31" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id32" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode32" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt32" runat="server" visible="false">
                        <asp:Label ID="subName32" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id33" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode33" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt33" runat="server" visible="false">
                        <asp:Label ID="subName33" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id34" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode34" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt34" runat="server" visible="false">
                        <asp:Label ID="subName34" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id35" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode35" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt35" runat="server" visible="false">
                        <asp:Label ID="subName35" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id36" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode36" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt36" runat="server" visible="false">
                        <asp:Label ID="subName36" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id37" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode37" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt37" runat="server" visible="false">
                        <asp:Label ID="subName37" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id38" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode38" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt38" runat="server" visible="false">
                        <asp:Label ID="subName38" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="year2_term2_tree4Year">
            <div class="term">
                <p class="term_name">
                    เทอม 2
                </p>
            </div>
            <div id="id41" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode41" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt41" runat="server" visible="false">
                        <asp:Label ID="subName41" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id42" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode42" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt42" runat="server" visible="false">
                        <asp:Label ID="subName42" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id43" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode43" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt43" runat="server" visible="false">
                        <asp:Label ID="subName43" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id44" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode44" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt44" runat="server" visible="false">
                        <asp:Label ID="subName44" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id45" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode45" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt45" runat="server" visible="false">
                        <asp:Label ID="subName45" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id46" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode46" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt46" runat="server" visible="false">
                        <asp:Label ID="subName46" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id47" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode47" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt47" runat="server" visible="false">
                        <asp:Label ID="subName47" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id48" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode48" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt48" runat="server" visible="false">
                        <asp:Label ID="subName48" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="year3_term1_tree4Year">
            <div class="term">
                <p class="term_name">
                    เทอม 1
                </p>
            </div>
            <div id="id51" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode51" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt51" runat="server" visible="false">
                        <asp:Label ID="subName51" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id52" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode52" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt52" runat="server" visible="false">
                        <asp:Label ID="subName52" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id53" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode53" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt53" runat="server" visible="false">
                        <asp:Label ID="subName53" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id54" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode54" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt54" runat="server" visible="false">
                        <asp:Label ID="subName54" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id55" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode55" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt55" runat="server" visible="false">
                        <asp:Label ID="subName55" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id56" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode56" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt56" runat="server" visible="false">
                        <asp:Label ID="subName56" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id57" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode57" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt57" runat="server" visible="false">
                        <asp:Label ID="subName57" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id58" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode58" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt58" runat="server" visible="false">
                        <asp:Label ID="subName58" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="year3_term2_tree4Year">
            <div class="term">
                <p class="term_name">
                    เทอม 2
                </p>
            </div>
            <div id="id61" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode61" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt61" runat="server" visible="false">
                        <asp:Label ID="subName61" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id62" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode62" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt62" runat="server" visible="false">
                        <asp:Label ID="subName62" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id63" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode63" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt63" runat="server" visible="false">
                        <asp:Label ID="subName63" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id64" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode64" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt64" runat="server" visible="false">
                        <asp:Label ID="subName64" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id65" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode65" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt65" runat="server" visible="false">
                        <asp:Label ID="subName65" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id66" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode66" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt66" runat="server" visible="false">
                        <asp:Label ID="subName66" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id67" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode67" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt67" runat="server" visible="false">
                        <asp:Label ID="subName67" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id68" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode68" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt68" runat="server" visible="false">
                        <asp:Label ID="subName68" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="year4_term1_tree4Year">
            <div class="term">
                <p class="term_name">
                    เทอม 1
                </p>
            </div>
            <div id="id71" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode71" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt71" runat="server" visible="false">
                        <asp:Label ID="subName71" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id72" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode72" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt72" runat="server" visible="false">
                        <asp:Label ID="subName72" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id73" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode73" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt73" runat="server" visible="false">
                        <asp:Label ID="subName73" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id74" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode74" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt74" runat="server" visible="false">
                        <asp:Label ID="subName74" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id75" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode75" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt75" runat="server" visible="false">
                        <asp:Label ID="subName75" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id76" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode76" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt76" runat="server" visible="false">
                        <asp:Label ID="subName76" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id77" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode77" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt77" runat="server" visible="false">
                        <asp:Label ID="subName77" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id78" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode78" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt78" runat="server" visible="false">
                        <asp:Label ID="subName78" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="year4_term2_tree4Year">
            <div class="term">
                <p class="term_name">
                    เทอม 2
                </p>
            </div>
            <div id="id81" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode81" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt81" runat="server" visible="false">
                        <asp:Label ID="subName81" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id82" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode82" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt82" runat="server" visible="false">
                        <asp:Label ID="subName82" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id83" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode83" runat="server" Text=""></asp:Label>
                    <div class="tooltipLeft" id="tt83" runat="server" visible="false">
                        <asp:Label ID="subName83" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id84" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode84" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt84" runat="server" visible="false">
                        <asp:Label ID="subName84" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id85" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode85" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt85" runat="server" visible="false">
                        <asp:Label ID="subName85" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id86" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode86" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt86" runat="server" visible="false">
                        <asp:Label ID="subName86" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id87" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode87" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt87" runat="server" visible="false">
                        <asp:Label ID="subName87" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="id88" runat="server">
                <div class="subject_name">
                    <asp:Label ID="subcode88" runat="server" Text=""></asp:Label>
                    <div class="tooltip" id="tt88" runat="server" visible="false">
                        <asp:Label ID="subName88" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div style="clear: both">
        </div>
        <%--ดิฟเปล่า--%>
    </div>
    <%--end_All--%>
</asp:Content>