using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace CommonClass
{
    public class MessageBox
    {
        private static Hashtable m_executingPages = new Hashtable();

        private MessageBox()
        {
        }

        public static void Show(string sMessage)
        {
            if (!m_executingPages.Contains(HttpContext.Current.Handler))
            {
                Page executingPage = HttpContext.Current.Handler as Page;
                if (executingPage != null)
                {
                    Queue messageQueue = new Queue();
                    messageQueue.Enqueue(sMessage);
                    m_executingPages.Add(HttpContext.Current.Handler, messageQueue);
                    executingPage.Unload += new EventHandler(ExecutingPage_Unload);
                }
            }
            else
            {
                Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];
                queue.Enqueue(sMessage);
            }
        }

        private static void ExecutingPage_Unload(object sender, EventArgs e)
        {
            Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];
            if (queue != null)
            {
                StringBuilder sb = new StringBuilder();
                int iMsgCount = queue.Count;
                sb.Append("<script language='javascript'>");
                string sMsg;
                while (iMsgCount-- > 0)
                {
                    sMsg = (string)queue.Dequeue();
                    sMsg = sMsg.Replace("\n", "\\n");
                    sMsg = sMsg.Replace("\"", "'");
                    sb.Append(@"alert( """ + sMsg + @""" );");
                }
                sb.Append(@"</script>");
                m_executingPages.Remove(HttpContext.Current.Handler);
                HttpContext.Current.Response.Write(sb.ToString());
            }
        }

        public static void AlertRedirect(string sMessage, string Url)
        {
            if (!m_executingPages.Contains(HttpContext.Current.Handler))
            {
                Page executingPage = HttpContext.Current.Handler as Page;
                if (executingPage != null)
                {
                    Queue messageQueue = new Queue();
                    messageQueue.Enqueue(sMessage + "&url=" + Url);
                    m_executingPages.Add(HttpContext.Current.Handler, messageQueue);
                    executingPage.Unload += new EventHandler(ExecutingPage_Unload_AlertRedirect);
                }
            }
            else
            {
                Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];
                queue.Enqueue(sMessage);
            }
        }

        private static void ExecutingPage_Unload_AlertRedirect(object sender, EventArgs e)
        {
            Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];
            if (queue != null)
            {
                StringBuilder sb = new StringBuilder();
                int iMsgCount = queue.Count;
                sb.Append("<script language='javascript'>");
                string sMsg;
                while (iMsgCount-- > 0)
                {
                    sMsg = (string)queue.Dequeue();
                    sMsg = sMsg.Replace("\n", "\\n");
                    sMsg = sMsg.Replace("\"", "'");
                    sb.Append(@"alert( """ + GeneralClass.spliteFun(sMsg.Replace("&url=", "#"), '#', 2) + @""" );");
                    sb.Append(@"window.location.href = '" + GeneralClass.spliteFun(sMsg.Replace("&url=", "#"), '#', 2) + "'");
                }
                sb.Append(@"</script>");
                m_executingPages.Remove(HttpContext.Current.Handler);
                HttpContext.Current.Response.Write(sb.ToString());
            }
        }
    }
}