﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Webcomsci
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
        }

        protected void Session_Start(object sender, EventArgs e)
        { 
            //Code that runs when a new session is started
            //try
            //{  
                //if (Request.Url.LocalPath.ToString() != "../../WebPage/Authen/Login.aspx" & Session["userid"] == null || Request.Url.LocalPath.ToString() != "../../WebPage/Authen/Login.aspx" & Session["userid"] == null)
                //{
                //    Response.Redirect("../../WebPage/Authen/Login.aspx");
                //}
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("../../WebPage/Authen/Login.aspx"); 
            //}
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Code that runs on application shutdown

            // Code that runs when a session ends.
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer
            // or SQLServer, the event is not raised.
        }

        protected void Application_End(object sender, EventArgs e)
        {
            // Code that runs on application shutdown
        }
    }
}