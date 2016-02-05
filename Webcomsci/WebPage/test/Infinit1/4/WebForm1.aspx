<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Webcomsci.WebPage.test.Infinit1._4.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--  <script type="text/javascript" src="jquery-1.9.1.js"></script>--%>
    <script src="jquery-1.9.1.js" type="text/javascript"></script>
    <style>
        .as_wrapper
        {
            margin: 0 auto;
            width: 500px;
            font-family: Arial;
            color: #333;
            font-size: 14px;
        }
        .as_country_container
        {
            padding: 20px;
            border: 2px dashed #17A3F7;
            margin-bottom: 10px;
        }
        .auto-style1 {
            width: 16px;
            height: 16px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(window).scroll(function () { /* window on scroll run the function using jquery and ajax */
                var WindowHeight = $(window).height(); /* get the window height */
                if ($(window).scrollTop() + 1 >= $(document).height() - WindowHeight) { /* check is that user scrolls down to the bottom of the page */
                    $("#loader").html("<img src='loading_icon.gif' alt='loading' />"); /* displa the loading content */
                    var LastDiv = $(".as_country_container:last"); /* get the last div of the dynamic content using ":last" */
                    var LastId = $(".as_country_container:last").attr("id"); /* get the id of the last div */
                    var ValueToPass = "lastid=" + LastId; /* create a variable that containing the url parameters which want to post to getdata.php file */

                    $.ajax({ /* post the values using AJAX */
                        type: "POST",
                        url: "item.aspx?id=" + LastId,
                        data: ValueToPass,
                        cache: false,
                        success: function (html) {
                            $("#loader").html("");
                            if (html) {
                                LastDiv.after(html); /* get the out put of the getdata.php file and append it after the last div using after(), for each scroll this function will execute and display the results */
                            }
                        }
                    });
                    return false;
                }
                return false;
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="as_wrapper">
            <h1>
                Window on scroll load contents in php mysql jquery using simple jQuery bootstrap
                module</h1>
            <asp:Literal ID="ltlRolad" runat="server"></asp:Literal>
            <div id="loader">
            </div>
            <!-- here the rest of contents will display dynamically, after the 'as_country_container' class -->
        </div>
    </div>
    </form>
    <p> 
</body>
</html>