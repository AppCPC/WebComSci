using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Webcomsci.WebPage.BackYard.Plane
{
    public partial class TreeSearchNodeSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //        TreeNode newnode = new TreeNode() { Text = "ข้อมูลหลัก", Value = "ข้อมูลจ้าา" };
        //        TreeView1.Nodes.Add(newnode);
           
            

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

            DataTable dt = new DataTable();
            dt = BLL.Curriculum.searchSubject(code);
            PopulateNodes(dt, TreeView1.Nodes);
        }

        private void PopulateSubLevel(string code, TreeNode parentNode)
        {
            DataTable dt = new DataTable();
            dt = BLL.Curriculum.searchSubject(code);
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

                tn.Text = dr["StructSub_Code"].ToString(); //+ "<br/> วิชา : " + namethai.Substring(0,5)+"..";
                tn.Value = dr["StructSub_Code"].ToString();
                nodes.Add(tn);
                //If node has child nodes, then enable on-demand populating
                tn.PopulateOnDemand = ((int)(dr["childnodecount"]) > 0);
            }
        }

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {

        }

        protected void TreeView1_SelectedNodeChanged1(object sender, EventArgs e)
        {
          //  string mess = "You selected: " + TreeView1.SelectedNode.Value.ToString();

            //ShowMessageWeb(mess);
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            TreeView1.Nodes.Clear();
            PopulateRootLevel(txtSearch.Text.ToString());

        }


    }
}