using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.BackYard.Plane
{
    public partial class PlanTreeEducation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //    PopulateRootLevel();
        }

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
        }

        private void PopulateRootLevel(string code)
        {
            List<string> ListSubject = new List<string>();
            if (Session["listSubject"] != null)
                ListSubject = (List<string>)Session["listSubject"];
            DataTable dt = new DataTable();
            dt = BLL.PlanEducate.searchSubject(code, ListSubject);
            PopulateNodes(dt, treeviewSubject.Nodes);
        }

        private void PopulateSubLevel(string code, TreeNode parentNode)
        {
            List<string> ListSubject = new List<string>();
            if (Session["listSubject"] != null)
                ListSubject = (List<string>)Session["listSubject"];
            DataTable dt = new DataTable();
            dt = BLL.PlanEducate.searchSubject(code, ListSubject);
            PopulateNodes(dt, parentNode.ChildNodes);
        }

        protected void TreeView1_TreeNodePopulate(object sender, TreeNodeEventArgs e)
        {
            PopulateSubLevel(e.Node.Value.ToString(), e.Node);
        }

        private void PopulateNodes(DataTable dt, TreeNodeCollection nodes)
        {
            foreach (DataRow dr in dt.Rows)
            {
                TreeNode tn = new TreeNode();
                string namethai = BLL.Curriculum.renameThai(dr["StructSub_Code"].ToString());
                setSessionSubject(dr["StructSub_Code"].ToString());
                if (namethai.Length < 28)
                {
                    tn.Text = dr["StructSub_Code"].ToString() + " ( วิชา " + namethai + ")";
                    tn.Value = dr["StructSub_Code"].ToString();
                }
                else
                {
                    tn.Text = dr["StructSub_Code"].ToString() + " ( วิชา " + namethai.Substring(0, 28) + "...)";
                    tn.Value = dr["StructSub_Code"].ToString();
                }
                nodes.Add(tn);
                //If node has child nodes, then enable on-demand populating

                tn.PopulateOnDemand = ((int)(dr["childnodecount"]) > 0);
            }
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            string subjectSearch = txtSearch.Text.ToString();
            setSessionSubject(subjectSearch);
            treeviewSubject.Nodes.Clear();
            PopulateRootLevel(subjectSearch);
        }

        private void setSessionSubject(string subcode)
        {
            if (subcode.Length > 0)
            {
                List<string> ListSubject = new List<string>();
                if (Session["listSubject"] == null)
                    Session["listSubject"] = ListSubject;
                else
                    ListSubject = (List<string>)Session["listSubject"];

                if (!ListSubject.Contains(subcode))
                    ListSubject.Add(subcode);

                Session["listSubject"] = ListSubject;
            }
        }
    }
}