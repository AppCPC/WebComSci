<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Webcomsci.WebPage.test.Infinit1._3.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        *
        {
            padding: 0;
            margin: 0;
        }
        html
        {
            text-align: center;
        }
        body
        {
            width: 950px;
            margin: 0 auto;
            font-family: trebuchet ms;
            text-align: left;
            margin-top: 10px;
        }
        li
        {
            list-style: none;
        }
        #infinite_scroll
        {
            height: 500px;
            overflow-y: scroll;
            margin-top: 50px;
            border: 1px solid #ccc;
            padding: 10px;
        }
        #infinite_scroll a
        {
            font-weight: bold;
        }
        #infinite_scroll p
        {
            margin-bottom: 20px;
            width: 90%;
        }
        .loading
        {
            text-align: right;
            margin-top: -100px</style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="scroll.jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            var hdfvalue = "";
            if (document.getElementById('txtField').value === "") {
                hdfvalue = 10;

            }
            else if (document.getElementById('txtField').value === "10")
                hdfvalue = document.getElementById('txtField').value;
            //hdfvalue = document.getElementById('hdfValue').value;

            var url = "item.aspx?id=" + hdfvalue;

            $('#infinite_scroll').scrollLoad({

                url: url, //your ajax file to be loaded when scroll breaks ScrollAfterHeight

                getData: function () {
                    //you can post some data along with ajax request
                },

                start: function () {
                    $('<div class="loading"><img src="loader.GIF" /></div>').appendTo(this);
                    // you can add your effect before loading data
                },

                ScrollAfterHeight: 95, 		//this is the height in percentage after which ajax stars

                onload: function (data) {
                    $(this).append(data);
                    $('.loading').remove();
                }, // this event fires on ajax success

                continueWhile: function (resp) {
                    //                    if ($(this).children('li').length >= 100) { // stops when number of 'li' reaches 100
                    //                        return false;
                    //                    }
                    document.getElementById('txtField').value = $(this).children('li').length;
                    return true;
                }
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul id="infinite_scroll">
            <li><a href="">This is my some title and is at number 0</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 1</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 2</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 3</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 4</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 5</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 6</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 7</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 8</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
            <li><a href="">This is my some title and is at number 9</a><p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco.</p>
            </li>
        </ul>
    </div>
    </form>
    <p>
    </p>
    <p>
        <input id="hdfValue" value="" type="hidden" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <input id="txtField" type="text" /></p>
</body>
</html>