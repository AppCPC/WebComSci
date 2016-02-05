<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 20;
        if (Request.QueryString["id"] != null)
            id = Convert.ToInt32(Request.QueryString["id"]);

        string sb = "";
        for (int i = id; i < id + 10; i++)
        {

            sb += "<li><a href=''>Item" + i.ToString() + "></a><p>Lorem ipsum dolor sitamet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p></li>";
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