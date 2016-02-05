<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //int id = 20;
        //if (Request.QueryString["id"] != null)
        //    id = Convert.ToInt32(Request.QueryString["id"]);

        //string sb = "";
        //for (int i = id; i < id + 10; i++)
        //{

        //    sb += "<li><a href=''>Item" + i.ToString() + "></a><p>Lorem ipsum dolor sitamet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p></li>";
        //}
        //Response.Write(sb);<?php
        double count =0;
        if(Request.QueryString["id"]!=null)
            count = Convert.ToInt32(Request.QueryString["id"].ToString());
        //Response.Write(count);
        string sb = "";
        for (double i = count; i < count + 1000; i++)
        { 
                sb += "<div class='as_country_container' id=" + i + "> <!-- set the mysql row id or primary key value as div id here -->";
                sb += "   <table>";
                sb += "    <tr>";
                sb += "       <td style='width:300px;'>" + i + "</td>";
                sb += "      <td><img src='zw.png' alt='" + i + "' title='" + i + "' /></td>";
                sb += "  </tr>";
                sb += "  </table>";
                sb += " </div>";
     
        }
        Response.Write(sb);

    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </form>
</body>
</html>