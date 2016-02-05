<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Plan.Master" AutoEventWireup="true"
    CodeBehind="Counsel.aspx.cs" Inherits="Webcomsci.WebPage.BackYard.Plane.Counsel" %>

<%@ Import Namespace="System.Drawing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Aconsult").addClass("button_nav_menu_tree_Active");
            $(".page_num_edu").css("display", "none");
            $(".notation").css("display", "none");
            loadDdlSubjectLoad();
            //loadColor();
            $('#tooltip_counsel_box').hide();
            $('#tooltip_alert').hide();
        });

        function getValListbox(sel) {
            var listValue = sel.value;
            var listText = sel.options[sel.selectedIndex].text;
            var classname = sel.options[sel.selectedIndex].className.toString();

            if (classname == "myListBox-green") {
                document.getElementById('<%=lblsubjectCode.ClientID%>').innerHTML = listValue;
                document.getElementById('<%=lblNameSubject.ClientID%>').innerHTML = listText;
                $("#tooltip_counsel_box").fadeIn(1000).delay(1000).fadeOut("slow");
            }
            else if (classname == "myListBox-red") {
                document.getElementById('<%=lblRedText.ClientID%>').innerHTML = listValue + "<br>" + listText;
                $("#tooltip_alert").fadeIn(1000).delay(1000).fadeOut("slow");
            }

        }
        function loadDdlSubjectLoad() {
            var studentCode = document.getElementById('<%=HiddenFieldStudentCode.ClientID%>').value;
            jQuery.ajax({
                url: "Counsel.aspx/getSelect",
                type: "POST",
                data: "{'studentCode':'" + studentCode + "'}",
                //  data: '',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#selectLeft").append(data.d);
                }
            });

        }
        function moveToRightOrLeft(side) {
            var listLeft = document.getElementById('selectLeft');
            var listRight = document.getElementById('selectRight');
         //  var listSemester = document.getElementById('selectSemester').value;
            var listSemester = document.getElementById('<%=selectSemester.ClientID%>').value;
            var LableCredit = parseInt(document.getElementById('<%=lblcredite.ClientID%>').innerHTML);
             
            if (side == 1) {
                if (listLeft.options.length == 0) {
                    alert('You have already moved all countries to Right');
                    return false;
                } else {

                    var selectedCountry = listLeft.options.selectedIndex;
                    var status = listLeft.options[selectedCountry].getAttribute("data-status").toString();
                    var lstclass = listLeft.options[selectedCountry].getAttribute("class").toString();
                    var credit = listLeft.options[selectedCountry].getAttribute("data-Credit").toString();

                    var creditphase = LableCredit + parseInt(credit);
                   // document.getElementById('<%=lblcredite.ClientID%>').innerHTML = creditphase;
                    if (creditphase > listSemester ) {
                        alert("sorry ,subject can't select "); 
                    } else { 
                         
                        if (status == "P") {

                            var lstLeftValue = listLeft.options[selectedCountry].value;
                            var lstLeftText = listLeft.options[selectedCountry].text;

                            document.getElementById('<%=lblsubjectCode.ClientID%>').innerHTML = lstLeftValue;
                            document.getElementById('<%=lblNameSubject.ClientID%>').innerHTML = lstLeftText;
                            document.getElementById('<%=lblcredite.ClientID%>').innerHTML = creditphase;
                            //$("#tooltip_counsel_box").fadeIn(1000).delay(1000).fadeOut("slow");
                            move(listRight, lstLeftValue, lstLeftText, status, lstclass, credit);
                            listLeft.remove(selectedCountry);
                        } else {
                            document.getElementById('<%=lblRedText.ClientID%>').innerHTML = "This subject isn't choose !  ";
                            $("#tooltip_alert").fadeIn(1000).delay(1000).fadeOut("slow");
                            // alert("This subject isn't choose !  ");
                        }

                        if (listLeft.options.length > 0) {
                            listLeft.options[0].selected = true;
                        }
                    }
                }
            } else if (side == 2) {
                if (listRight.options.length == 0) {
                    alert('You have already moved all countries to Left');
                    return false;
                } else {
                    var selectedCountry = listRight.options.selectedIndex;

                    var status = listRight.options[selectedCountry].getAttribute("data-status").toString();
                    var lstclass = listRight.options[selectedCountry].getAttribute("class").toString();

                    var credit = listRight.options[selectedCountry].getAttribute("data-Credit").toString();

                    var creditphase = LableCredit - parseInt(credit);
                    document.getElementById('<%=lblcredite.ClientID%>').innerHTML = creditphase;

                    if (status == "P") {
                        move(listLeft, listRight.options[selectedCountry].value, listRight.options[selectedCountry].text, status, lstclass, credit);
                        listRight.remove(selectedCountry);
                    } else {
                        alert("This subject isn't choose !  ");
                    }
                    if (listRight.options.length > 0) {
                        listRight.options[0].selected = true;
                    }
                }
            }
        }
        function move(listBoxTo, optionValue, optionDisplayText, optionStatus, optionClass, optionCredit) {
            var newOption = document.createElement("option");
            newOption.value = optionValue;
            newOption.text = optionDisplayText;
            newOption.setAttribute('data-status', optionStatus);
            newOption.setAttribute('class', optionClass);
            newOption.setAttribute('data-Credit', optionCredit);
            listBoxTo.add(newOption, null);
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../chosen/chosen.css" rel="stylesheet" type="text/css" />
    <script src="../../../Scripts/JScript1.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <div>
    </div>
    <div style="text-align: left">
        <div class="header_counsel" align="left">
            <img src="../../../image/Counsel/CounselHeader.png" /></div>
        <div class="counsel_box-all">
            <div class="counsel_box-big">
                <div class="content_in_counsel_box">
                    <div class="listbox_counsel_box">
                        <p class="headertxt">
                            รายวิชาทั้งหมด</p>
                        <select name="selectLeft" size="10" id="selectLeft" class="listbox_Counsel" onchange="getValListbox(this);">
                        </select>
                    </div>
                    <div class="send_counsel_box">
                        <div class="imgBtnrRight" style="margin-bottom: 7px">
                            <input name="btnRight" class="imgBtnrRight" type="button" id="btnRight" value="&gt;&gt;"
                                onclick="javaScript:moveToRightOrLeft(1);">
                            <br />
                        </div>
                        <div class="imgBtnrLeft">
                            <input name="btnLeft" class="imgBtnrLeft" type="button" id="btnLeft" value="&lt;&lt;"
                                onclick="javaScript:moveToRightOrLeft(2);">
                        </div>
                    </div>
                    <div class="listbox_counsel_box">
                        <p class="headertxt">
                            รายวิชาที่ต้องการลงทะเบียน</p>
                        <select name="selectRight" size="10" id="selectRight" class="listbox_Counsel">
                        </select>
                        <div class="tooltip_counsel_box" id="tooltip_counsel_box" align="left">
                            <div class="tooltip_counsel_box_green" id="tooltipShowDetailSub">
                                <%-- <asp:Label ID="lblstatus" runat="server" Text="" CssClass="tooltiptext"></asp:Label><br />--%>
                                <span>รหัส:</span>
                                <asp:Label ID="lblsubjectCode" runat="server" CssClass="tooltiptext"></asp:Label>
                                <br />
                                <span>วิชา:</span>
                                <asp:Label ID="lblNameSubject" runat="server" CssClass="tooltiptext"></asp:Label>
                            </div>
                            <div class="tooltip-arrow_counse_green" id="arrow_counse">
                            </div>
                        </div>
                    </div>
                </div>
                <div style="clear: both; color: White;">
                    <div style="text-align: center">
                        <br />
                        ภาคการเรียน &nbsp; &nbsp;&nbsp;
                        <%--<select id="selectSemester" onchange="document.location.reload(true)" name="D1" style="width: 69px; height: 29px">
                            <option value="24">ปกติ</option>
                            <option value="9">summer</option>
                            <option></option>
                        </select><br />--%>

                        <asp:DropDownList ID="selectSemester" runat="server" style="width: 69px; height: 29px" AutoPostBack="True">
                            <asp:ListItem Value="24">ปกติ</asp:ListItem>
                             <asp:ListItem Value="9">summer</asp:ListItem>
                        </asp:DropDownList>

                        <br />
                        หน่วยกิตที่เลือก &nbsp;
                        <asp:Label ID="lblcredite" runat="server" Text="0"></asp:Label>
                        &nbsp;&nbsp; หน่วยกิต</div>
                    <div>
                        <br />
                    </div>
                </div>
            </div>
            <div class="counsel_box-small">
                <div class="content_in_counsel_box">
                    <div class="listbox_counsel_box">
                        <p class="headertxt">
                            รายวิชาที่นักศึกษาเรียนแล้ว</p>
                        <asp:ListBox ID="ListBoxShowAllItem" Rows="10" CssClass="listbox_counsel" runat="server">
                        </asp:ListBox>
                        <div style="position: absolute; top: -25px; left: -332px;" align="left" class="tooltip_alert"
                            id="tooltip_alert">
                            <div class="tooltip-send_counsel_box" id="tooltipAlert">
                                <asp:Label ID="lblRedText" runat="server" CssClass="tooltiptext"></asp:Label>
                            </div>
                            <div class="tooltip-arrow-send_counse">
                            </div>
                        </div>
                        <div class="tooltip_add_subject">
                            <p class="text_tooltip_add_subject">
                                เพิ่มรายวิชา</p>
                            <img src="../../../image/Counsel/triangle_tooltip_add.png" style="position: relative;
                                top: 0px; left: 0px; width: 11px; height: 9px;" />
                        </div>
                        <div class="tooltip_remove_subject">
                            <img src="../../../image/Counsel/triangle_tooltip_remove.png" style="position: relative;
                                top: 0px; left: 0px; width: 11px; height: 9px;" />
                            <p class="text_tooltip_remove_subject">
                                ลบรายวิชา</p>
                        </div>
                    </div>
                </div>
                <div style="clear: both">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>
        <p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
            <asp:HiddenField ID="HiddenFieldStudentCode" runat="server" />
            <hr />
            <div style="margin-left: 30px;">
                <p style="float: left; font-size: medium; text-decoration: underline;">
                    <strong>หมายเหตุ </strong>
                </p>
                <br />
                <p>
                    สีเขียว : รายวิชาปกติ
                </p>
                <p>
                    สีแดง : รายวิชาที่ติด F
                </p>
                <p>
                    สีส้ม : รายวิชาที่ถอน (ตัวต่อรายวิชาที่ติด F )
                </p>
            </div>
    </div>
</asp:Content>