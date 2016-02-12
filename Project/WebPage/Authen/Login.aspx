<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="WebPage_Authen_Login" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="../../css/skins/Login.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
  <form id="form1" runat="server">
<center>
    <body>
        <div class="login" align="left">

            <div align="left" class="top">
                <img alt="" class="style1" src="../../image/Login/User.png" 
                    style="float: left; margin-right: 17px;" />
                <p class="cstext" style="width: 171px">Computer Science</p>
                <p class="logintext" style="width: 57px" align="right">Login</p>
                <p style="width: 360px; font-family: tahoma; font-size: small; color: #FFF; float: left;" 
                    align="left">เข้าสู่ระบบโดยใช้ Username และ Password</p>
              </div>

              <div align="left" style="margin-top: 10px; padding-left: 70px;">
                  <asp:TextBox ID="txtusername" runat="server" BorderColor="#9F9F9F" BorderStyle="Solid" 
                      BorderWidth="1px" CssClass="textbox" Height="28px" Width="280px"></asp:TextBox>
                  <asp:TextBox ID="txtpassword" runat="server" BorderColor="#9F9F9F" BorderStyle="Solid" 
                      BorderWidth="1px" CssClass="textbox" Height="28px" Width="280px" 
                      TextMode="Password">ssss</asp:TextBox>
            </div>

            <div align="right" style="width: 280px; padding-left: 70px;">
                <a href="ForgotPassword.aspx" style="float: left; padding-top: 6px; ">ลืมรหัสผ่าน?</a>
                <asp:Button ID="btnLogin" runat="server" CssClass="button_in_login" Height="25px" 
                    Text="เข้าสู่ระบบ" onclick="btnLogin_Click"/>
            </div>
        </div>
        <div style="border-top: 1px solid #808080; background-color: #ECECEC; height: 25px; position: absolute; right: 0px; bottom: 0px; left: 0px; font-family: tahoma; font-size: small; color: #666666; padding-top: 7px; padding-left: 30px; padding-right: 10px; border-left-color: #808080; border-right-color: #808080; border-bottom-color: #808080;" align="left">
    <span id="uxp_ftr_link_trademark">© 2012 Com Sci</span>
            <a id="linkfooter" href="#">Link 1</a>
            <a id="linkfooter" href="#">Link 2</a>
            <a id="linkfooter" href="#">Link 3</a>
            <a id="linkfooter" href="#">Link 4</a>
    </div>

    </body>
</center>
</form>
</body>
</html>
