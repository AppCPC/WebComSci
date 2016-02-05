<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testListbox.aspx.cs" Inherits="Webcomsci.WebPage.test.testListbox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javaScript">
        $(document).ready(function () {
            loadDdlSubjectLoad();
        });
        function loadDdlSubjectLoad() {
            var i
            for (i = 1; i < 20; i++) {
                var css = "lstGreen";
                var status = "P";
                var subweight = "3"
                if (i % 2 == 0) {
                    css = "lstRed";
                    status = "F";
                    subweight = "1";

                }
                var option = "<option class='" + css + "' value='1' data-status='" + status + "' data-Credit='" + subweight + "' >" + "Item  : " + i.toString() + "</option>";
                $("#selectLeft").append(option);
            }
        }
        function moveToRightOrLeft(side) {
            var listLeft = document.getElementById('selectLeft');
            var listRight = document.getElementById('selectRight');

            var LableCredit = parseInt(document.getElementById('<%=lblCredit.ClientID%>').innerHTML);
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
                    if (creditphase > 21) {
                        alert("sorry credit max 21 , can't select ");
                    } else {
                        document.getElementById('<%=lblCredit.ClientID%>').innerHTML = creditphase;
                        if (status == "P") {
                            move(listRight, listLeft.options[selectedCountry].value, listLeft.options[selectedCountry].text, status, lstclass, credit);
                            listLeft.remove(selectedCountry);
                        } else {
                            alert("This subject isn't choose !  ");
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
                    document.getElementById('<%=lblCredit.ClientID%>').innerHTML = creditphase;

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
    <style type="text/css">
        .lstGreen
        {
            background-color: Green;
            color: White;
            font-size: x-large;
        }
        .lstRed
        {
            background-color: Red;
            color: White;
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul>
            <li>
                <table border="0">
                    <tr>
                        <td colspan="4">
                            Example 1:
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Available Countries
                        </td>
                        <td colspan="2">
                            Your Selection
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3" align="right">
                            <label>
                                <select name="selectLeft" size="10" id="selectLeft">
                                    <%--<option class="lstGreen" data-status="P" value="AS" selected="selected">American Samoa</option>
                                    <option value="AR">Argentina</option>
                                    <option value="AM">Armenia</option>
                                    <option class="lstGreen" data-status="P" value="AD">Andorra</option>
                                    <option class="lstGreen" data-status="P" value="AO">Angola</option>
                                        <option class="lstGreen" data-status="P" value="AI">Anguilla</option>
                                    <option value="AQ">Antarctica</option>
                                    <option value="AG">Antigua And Barbuda</option>
                                    <option value="AR">Argentina</option>
                                    <option value="AM">Armenia</option>
                                    <option value="AW">Aruba</option>
                                    <option value="AU">Australia</option>
                                    <option value="AT">Austria</option>--%>
                                </select>
                            </label>
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td rowspan="3" align="left">
                            <select name="selectRight" size="10" id="selectRight">
                                <%--  <option value="AF" selected="selected">Afghanistan</option>
                                <option value="AX">&Atilde;&hellip;Land Islands</option>
                                <option value="AL">Albania</option>
                                <option value="DZ">Algeria</option>--%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            <label>
                                <input name="btnRight" type="button" id="btnRight" value="&gt;&gt;" onclick="javaScript:moveToRightOrLeft(1);">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            <label>
                                <input name="btnLeft" type="button" id="btnLeft" value="&lt;&lt;" onclick="javaScript:moveToRightOrLeft(2);">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; หน่วยกิต
                            <asp:Label ID="lblCredit" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </li>
            <li>
                <div>
                    <p>
                        Copy and paste above code and modify it to add string values
                        <br />
                        <br />
                        <strong>How to check option already exists or not?</strong><br />
                        <br />
                        function isOptionAlreadyExist(listBox,value){<br />
                        var exists=false;<br />
                        for(var x=0;x&lt;listBox.options.length;x++){<br />
                        if(listBox.options[x].value==value || listBox.options[x].text==value){
                        <br />
                        exists=true;<br />
                        break;<br />
                        }<br />
                        }<br />
                        return exists;<br />
                        }</p>
                </div>
            </li>
            <li class="code_right"></li>
        </ul>
    </div>
    </form>
</body>
</html>
<!--- url Ref: http://www.latestcode.net/2011/07/add-or-remove-list-box-items.html -->