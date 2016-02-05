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
    public partial class Education2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                showAllCurricullumTree();
            //  getPlanTree();
            //showAllCurricullumTree();
        }

        //private void getPlanTree()
        //{
        //    DataTable dt = new DataTable();
        //    string yearedu = Session["yearEducate"].ToString();
        //    dt = BLL.PlanEducate.selectShowAllPlanTree(yearedu);
        //    int id1 = 1;
        //    int id2 = 1;
        //    foreach (DataRow row in dt.Rows)
        //    {
        //    }
        //}

        private void RenderNode(System.Web.UI.HtmlControls.HtmlGenericControl idNode, System.Web.UI.HtmlControls.HtmlGenericControl toolTipControl, Label textSubjectCode, Label textSubjectName, string subjectCode, string subjectName)
        {
            idNode.Attributes["Class"] = "subject_blue";
            textSubjectCode.Text = subjectCode;
            textSubjectName.Text = subjectName;
            toolTipControl.Visible = true;
        }

        private void showAllCurricullumTree()
        {
            int num1 = 1;
            int num2 = 1;
            int num3 = 1;
            int num4 = 1;
            int num5 = 1;
            int num6 = 1;
            int num7 = 1;
            int num8 = 1;
            try
            {
                DataTable dt = new DataTable();
                string yearedu = Session["yearEducate"].ToString();

                dt = BLL.PlanEducate.selectShowAllPlanTree(yearedu);
                foreach (DataRow row in dt.Rows)
                {
                    if ((row[0].ToString() + row[1].ToString()).Equals("11"))
                    {
                        #region callstylesheet css tree  1/1

                        if (num1 == 1)
                        {
                            //id11.Attributes["Class"] = "subject_blue";
                            //subcode11.Text = (row[2].ToString());
                            //subName11.Text = (row[3].ToString());
                            //tt11.Visible = true;
                            RenderNode(id11, tt11, subcode11, subName11, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num1 == 2)
                        {
                            //id12.Attributes["Class"] = "subject_blue";
                            //subcode12.Text = (row[2].ToString());
                            //subName12.Text = (row[3].ToString());
                            //tt12.Visible = true;
                            RenderNode(id12, tt12, subcode12, subName12, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num1 == 3)
                        {
                            //id13.Attributes["Class"] = "subject_blue";
                            //subcode13.Text = (row[2].ToString());
                            //subName13.Text = (row[3].ToString());
                            //tt13.Visible = true;
                            RenderNode(id13, tt13, subcode13, subName13, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num1 == 4)
                        {
                            //id14.Attributes["Class"] = "subject_blue";
                            //subcode14.Text = (row[2].ToString());
                            //subName14.Text = (row[3].ToString());
                            //tt14.Visible = true;
                            RenderNode(id14, tt14, subcode14, subName14, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num1 == 5)
                        {
                            //    id15.Attributes["Class"] = "subject_blue";
                            //    subcode15.Text = (row[2].ToString());
                            //    subName15.Text = (row[3].ToString());
                            //    tt15.Visible = true;
                            RenderNode(id15, tt15, subcode15, subName15, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num1 == 6)
                        {
                            //id16.Attributes["Class"] = "subject_blue";
                            //subcode16.Text = (row[2].ToString());
                            //subName16.Text = (row[3].ToString());
                            //tt16.Visible = true;
                            RenderNode(id16, tt16, subcode16, subName16, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num1 == 7)
                        {
                            //id17.Attributes["Class"] = "subject_blue";
                            //subcode17.Text = (row[2].ToString());
                            //subName17.Text = (row[3].ToString());
                            //tt17.Visible = true;
                            RenderNode(id17, tt17, subcode17, subName17, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num1 == 8)
                        {
                            //id18.Attributes["Class"] = "subject_blue";
                            //subcode18.Text = (row[2].ToString());
                            //subName18.Text = (row[3].ToString());
                            //tt18.Visible = true;
                            RenderNode(id18, tt18, subcode18, subName18, row[2].ToString(), (row[3].ToString()));
                        }

                        num1++;

                        #endregion callstylesheet css tree  1/1
                    }
                    else if ((row[0].ToString() + row[1].ToString()).Equals("12"))
                    {
                        #region callstylesheet css tree  1/2

                        if (num2 == 1)
                        {
                            //id21.Attributes["Class"] = "subject_blue";
                            //subcode21.Text = (row[2].ToString());
                            //subName21.Text = (row[3].ToString());
                            //tt21.Visible = true;
                            RenderNode(id21, tt21, subcode21, subName21, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num2 == 2)
                        {
                            //id22.Attributes["Class"] = "subject_blue";
                            //subcode22.Text = (row[2].ToString());
                            //subName22.Text = (row[3].ToString());
                            //tt22.Visible = true;
                            RenderNode(id22, tt22, subcode22, subName22, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num2 == 3)
                        {
                            //id23.Attributes["Class"] = "subject_blue";
                            //subcode23.Text = (row[2].ToString());
                            //subName23.Text = (row[3].ToString());
                            //tt23.Visible = true;
                            RenderNode(id23, tt23, subcode23, subName23, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num2 == 4)
                        {
                            //id24.Attributes["Class"] = "subject_blue";
                            //subcode24.Text = (row[2].ToString());
                            //subName24.Text = (row[3].ToString());
                            //tt24.Visible = true;
                            RenderNode(id24, tt24, subcode24, subName24, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num2 == 5)
                        {
                            //id25.Attributes["Class"] = "subject_blue";
                            //subcode25.Text = (row[2].ToString());
                            //subName25.Text = (row[3].ToString());
                            //tt25.Visible = true;
                            RenderNode(id25, tt25, subcode25, subName25, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num2 == 6)
                        {
                            //    id26.Attributes["Class"] = "subject_blue";
                            //    subcode26.Text = (row[2].ToString());
                            //    subName26.Text = (row[3].ToString());
                            //    tt26.Visible = true;
                            RenderNode(id26, tt26, subcode26, subName26, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num2 == 7)
                        {
                            //id27.Attributes["Class"] = "subject_blue";
                            //subcode27.Text = (row[2].ToString());
                            //subName27.Text = (row[3].ToString());
                            //tt27.Visible = true;
                            RenderNode(id27, tt27, subcode27, subName27, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num2 == 8)
                        {
                            //id28.Attributes["Class"] = "subject_blue";
                            //subcode28.Text = (row[2].ToString());
                            //subName28.Text = (row[3].ToString());
                            //tt28.Visible = true;
                            RenderNode(id28, tt28, subcode28, subName28, row[2].ToString(), (row[3].ToString()));
                        }

                        num2++;

                        #endregion callstylesheet css tree  1/2
                    }

                    else if ((row[0].ToString() + row[1].ToString()).Equals("21"))
                    {
                        #region callstylesheet css tree  2/1

                        if (num3 == 1)
                        {
                            //id31.Attributes["Class"] = "subject_blue";
                            //subcode31.Text = (row[2].ToString());
                            //subName31.Text = (row[3].ToString());
                            //tt31.Visible = true;
                            RenderNode(id31, tt31, subcode31, subName31, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num3 == 2)
                        {
                            //id32.Attributes["Class"] = "subject_blue";
                            //subcode32.Text = (row[2].ToString());
                            //subName32.Text = (row[3].ToString());
                            //tt32.Visible = true;
                            RenderNode(id32, tt32, subcode32, subName32, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num3 == 3)
                        {
                            //id33.Attributes["Class"] = "subject_blue";
                            //subcode33.Text = (row[2].ToString());
                            //subName33.Text = (row[3].ToString());
                            //tt33.Visible = true;
                            RenderNode(id33, tt33, subcode33, subName33, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num3 == 4)
                        {
                            //id34.Attributes["Class"] = "subject_blue";
                            //subcode34.Text = (row[2].ToString());
                            //subName34.Text = (row[3].ToString());
                            //tt34.Visible = true;
                            RenderNode(id34, tt34, subcode34, subName34, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num3 == 5)
                        {
                            //id35.Attributes["Class"] = "subject_blue";
                            //subcode35.Text = (row[2].ToString());
                            //subName35.Text = (row[3].ToString());
                            //tt35.Visible = true;
                            RenderNode(id35, tt35, subcode35, subName35, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num3 == 6)
                        {
                            //id36.Attributes["Class"] = "subject_blue";
                            //subcode36.Text = (row[2].ToString());
                            //subName36.Text = (row[3].ToString());
                            //tt36.Visible = true;
                            RenderNode(id36, tt36, subcode36, subName36, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num3 == 7)
                        {
                            //id37.Attributes["Class"] = "subject_blue";
                            //subcode37.Text = (row[2].ToString());
                            //subName37.Text = (row[3].ToString());
                            //tt37.Visible = true;
                            RenderNode(id37, tt37, subcode37, subName37, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num3 == 8)
                        {
                            //id38.Attributes["Class"] = "subject_blue";
                            //subcode38.Text = (row[2].ToString());
                            //subName38.Text = (row[3].ToString());
                            //tt38.Visible = true;
                            RenderNode(id38, tt38, subcode38, subName38, row[2].ToString(), (row[3].ToString()));
                        }

                        num3++;

                        #endregion callstylesheet css tree  2/1
                    }

                    else if ((row[0].ToString() + row[1].ToString()).Equals("22"))
                    {
                        #region callstylesheet css tree  2/2

                        if (num4 == 1)
                        {
                            //id41.Attributes["Class"] = "subject_blue";
                            //subcode41.Text = (row[2].ToString());
                            //subName41.Text = (row[3].ToString());
                            //tt41.Visible = true;
                            RenderNode(id41, tt41, subcode41, subName41, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num4 == 2)
                        {
                            //id42.Attributes["Class"] = "subject_blue";
                            //subcode42.Text = (row[2].ToString());
                            //subName42.Text = (row[3].ToString());
                            //tt42.Visible = true;
                            RenderNode(id42, tt42, subcode42, subName42, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num4 == 3)
                        {
                            //id43.Attributes["Class"] = "subject_blue";
                            //subcode43.Text = (row[2].ToString());
                            //subName43.Text = (row[3].ToString());
                            //tt43.Visible = true;
                            RenderNode(id43, tt43, subcode43, subName43, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num4 == 4)
                        {
                            //id44.Attributes["Class"] = "subject_blue";
                            //subcode44.Text = (row[2].ToString());
                            //subName44.Text = (row[3].ToString());
                            //tt44.Visible = true;
                            RenderNode(id44, tt44, subcode44, subName44, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num4 == 5)
                        {
                            //id45.Attributes["Class"] = "subject_blue";
                            //subcode45.Text = (row[2].ToString());
                            //subName45.Text = (row[3].ToString());
                            //tt45.Visible = true;
                            RenderNode(id45, tt45, subcode45, subName45, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num4 == 6)
                        {
                            //id46.Attributes["Class"] = "subject_blue";
                            //subcode46.Text = (row[2].ToString());
                            //subName46.Text = (row[3].ToString());
                            //tt46.Visible = true;
                            RenderNode(id46, tt46, subcode46, subName46, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num4 == 7)
                        {
                            //id47.Attributes["Class"] = "subject_blue";
                            //subcode47.Text = (row[2].ToString());
                            //subName47.Text = (row[3].ToString());
                            //tt47.Visible = true;
                            RenderNode(id47, tt47, subcode47, subName47, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num4 == 8)
                        {
                            //id48.Attributes["Class"] = "subject_blue";
                            //subcode48.Text = (row[2].ToString());
                            //subName48.Text = (row[3].ToString());
                            //tt48.Visible = true;
                            RenderNode(id48, tt48, subcode48, subName48, row[2].ToString(), (row[3].ToString()));
                        }

                        num4++;

                        #endregion callstylesheet css tree  2/2
                    }
                    else if ((row[0].ToString() + row[1].ToString()).Equals("31"))
                    {
                        #region callstylesheet css tree  3/1

                        if (num5 == 1)
                        {
                            //id51.Attributes["Class"] = "subject_blue";
                            //subcode51.Text = (row[2].ToString());
                            //subName51.Text = (row[3].ToString());
                            //tt51.Visible = true;
                            RenderNode(id51, tt51, subcode51, subName51, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num5 == 2)
                        {
                            //id52.Attributes["Class"] = "subject_blue";
                            //subcode52.Text = (row[2].ToString());
                            //subName52.Text = (row[3].ToString());
                            //tt52.Visible = true;
                            RenderNode(id52, tt52, subcode52, subName52, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num5 == 3)
                        {
                            //id53.Attributes["Class"] = "subject_blue";
                            //subcode53.Text = (row[2].ToString());
                            //subName53.Text = (row[3].ToString());
                            //tt53.Visible = true;
                            RenderNode(id53, tt53, subcode53, subName53, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num5 == 4)
                        {
                            //id54.Attributes["Class"] = "subject_blue";
                            //subcode54.Text = (row[2].ToString());
                            //subName54.Text = (row[3].ToString());
                            //tt54.Visible = true;
                            RenderNode(id54, tt54, subcode54, subName54, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num5 == 5)
                        {
                            //id55.Attributes["Class"] = "subject_blue";
                            //subcode55.Text = (row[2].ToString());
                            //subName55.Text = (row[3].ToString());
                            //tt55.Visible = true;
                            RenderNode(id55, tt55, subcode55, subName55, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num5 == 6)
                        {
                            //id56.Attributes["Class"] = "subject_blue";
                            //subcode56.Text = (row[2].ToString());
                            //subName56.Text = (row[3].ToString());
                            //tt56.Visible = true;
                            RenderNode(id56, tt56, subcode56, subName56, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num5 == 7)
                        {
                            //id57.Attributes["Class"] = "subject_blue";
                            //subcode57.Text = (row[2].ToString());
                            //subName57.Text = (row[3].ToString());
                            //tt57.Visible = true;
                            RenderNode(id57, tt57, subcode57, subName57, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num5 == 8)
                        {
                            //id58.Attributes["Class"] = "subject_blue";
                            //subcode58.Text = (row[2].ToString());
                            //subName58.Text = (row[3].ToString());
                            //tt58.Visible = true;
                            RenderNode(id58, tt58, subcode58, subName58, row[2].ToString(), (row[3].ToString()));
                        }

                        num5++;

                        #endregion callstylesheet css tree  3/1
                    }
                    else if ((row[0].ToString() + row[1].ToString()).Equals("32"))
                    {
                        #region callstylesheet css tree  3/2

                        if (num6 == 1)
                        {
                            //id61.Attributes["Class"] = "subject_blue";
                            //subcode61.Text = (row[2].ToString());
                            //subName61.Text = (row[3].ToString());
                            //tt61.Visible = true;
                            RenderNode(id61, tt61, subcode61, subName61, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num6 == 2)
                        {
                            //id62.Attributes["Class"] = "subject_blue";
                            //subcode62.Text = (row[2].ToString());
                            //subName62.Text = (row[3].ToString());
                            //tt62.Visible = true;
                            RenderNode(id62, tt62, subcode62, subName62, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num6 == 3)
                        {
                            //id63.Attributes["Class"] = "subject_blue";
                            //subcode63.Text = (row[2].ToString());
                            //subName63.Text = (row[3].ToString());
                            //tt63.Visible = true;
                            RenderNode(id63, tt63, subcode63, subName63, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num6 == 4)
                        {
                            //id64.Attributes["Class"] = "subject_blue";
                            //subcode64.Text = (row[2].ToString());
                            //subName64.Text = (row[3].ToString());
                            //tt64.Visible = true;
                            RenderNode(id64, tt64, subcode64, subName64, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num6 == 5)
                        {
                            //id65.Attributes["Class"] = "subject_blue";
                            //subcode65.Text = (row[2].ToString());
                            //subName65.Text = (row[3].ToString());
                            //tt65.Visible = true;
                            RenderNode(id65, tt65, subcode65, subName65, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num6 == 6)
                        {
                            //id66.Attributes["Class"] = "subject_blue";
                            //subcode66.Text = (row[2].ToString());
                            //subName66.Text = (row[3].ToString());
                            //tt66.Visible = true;
                            RenderNode(id66, tt66, subcode66, subName66, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num6 == 7)
                        {
                            //id67.Attributes["Class"] = "subject_blue";
                            //subcode67.Text = (row[2].ToString());
                            //subName67.Text = (row[3].ToString());
                            //tt67.Visible = true;
                            RenderNode(id67, tt67, subcode67, subName67, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num6 == 8)
                        {
                            //id68.Attributes["Class"] = "subject_blue";
                            //subcode68.Text = (row[2].ToString());
                            //subName68.Text = (row[3].ToString());
                            //tt68.Visible = true;
                            RenderNode(id68, tt68, subcode68, subName68, row[2].ToString(), (row[3].ToString()));
                        }

                        num6++;

                        #endregion callstylesheet css tree  3/2
                    }
                    else if ((row[0].ToString() + row[1].ToString()).Equals("41"))
                    {
                        #region callstylesheet css tree  4/1

                        if (num7 == 1)
                        {
                            //id71.Attributes["Class"] = "subject_blue";
                            //subcode71.Text = (row[2].ToString());
                            //subName71.Text = (row[3].ToString());
                            //tt71.Visible = true;
                            RenderNode(id71, tt71, subcode71, subName71, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num7 == 2)
                        {
                            //id72.Attributes["Class"] = "subject_blue";
                            //subcode72.Text = (row[2].ToString());
                            //subName72.Text = (row[3].ToString());
                            //tt72.Visible = true;
                            RenderNode(id72, tt72, subcode72, subName72, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num7 == 3)
                        {
                            //id73.Attributes["Class"] = "subject_blue";
                            //subcode73.Text = (row[2].ToString());
                            //subName73.Text = (row[3].ToString());
                            //tt73.Visible = true;
                            RenderNode(id73, tt73, subcode73, subName73, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num7 == 4)
                        {
                            //id74.Attributes["Class"] = "subject_blue";
                            //subcode74.Text = (row[2].ToString());
                            //subName74.Text = (row[3].ToString());
                            //tt74.Visible = true;
                            RenderNode(id74, tt74, subcode74, subName74, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num7 == 5)
                        {
                            //id75.Attributes["Class"] = "subject_blue";
                            //subcode75.Text = (row[2].ToString());
                            //subName75.Text = (row[3].ToString());
                            //tt75.Visible = true;
                            RenderNode(id75, tt75, subcode75, subName75, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num7 == 6)
                        {
                            //id76.Attributes["Class"] = "subject_blue";
                            //subcode76.Text = (row[2].ToString());
                            //subName76.Text = (row[3].ToString());
                            //tt76.Visible = true;
                            RenderNode(id76, tt76, subcode76, subName76, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num7 == 7)
                        {
                            //id77.Attributes["Class"] = "subject_blue";
                            //subcode77.Text = (row[2].ToString());
                            //subName77.Text = (row[3].ToString());
                            //tt77.Visible = true;
                            RenderNode(id77, tt77, subcode77, subName77, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num7 == 8)
                        {
                            //id78.Attributes["Class"] = "subject_blue";
                            //subcode78.Text = (row[2].ToString());
                            //subName78.Text = (row[3].ToString());
                            //tt78.Visible = true;
                            RenderNode(id78, tt78, subcode78, subName78, row[2].ToString(), (row[3].ToString()));
                        }

                        num7++;

                        #endregion callstylesheet css tree  4/1
                    }
                    else if ((row[0].ToString() + row[1].ToString()).Equals("42"))
                    {
                        #region callstylesheet css tree  4/2

                        if (num8 == 1)
                        {
                            //id81.Attributes["Class"] = "subject_blue";
                            //subcode81.Text = (row[2].ToString());
                            //subName81.Text = (row[3].ToString());
                            //tt81.Visible = true;
                            RenderNode(id81, tt81, subcode81, subName81, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num8 == 2)
                        {
                            //id82.Attributes["Class"] = "subject_blue";
                            //subcode82.Text = (row[2].ToString());
                            //subName82.Text = (row[3].ToString());
                            //tt82.Visible = true;
                            RenderNode(id82, tt82, subcode82, subName82, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num8 == 3)
                        {
                            //id83.Attributes["Class"] = "subject_blue";
                            //subcode83.Text = (row[2].ToString());
                            //subName83.Text = (row[3].ToString());
                            //tt83.Visible = true;
                            RenderNode(id83, tt83, subcode83, subName83, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num8 == 4)
                        {
                            //id84.Attributes["Class"] = "subject_blue";
                            //subcode84.Text = (row[2].ToString());
                            //subName84.Text = (row[3].ToString());
                            //tt84.Visible = true;
                            RenderNode(id84, tt84, subcode84, subName84, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num8 == 5)
                        {
                            //id85.Attributes["Class"] = "subject_blue";
                            //subcode85.Text = (row[2].ToString());
                            //subName85.Text = (row[3].ToString());
                            //tt85.Visible = true;
                            RenderNode(id85, tt85, subcode85, subName85, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num8 == 6)
                        {
                            //id86.Attributes["Class"] = "subject_blue";
                            //subcode86.Text = (row[2].ToString());
                            //subName86.Text = (row[3].ToString());
                            //tt86.Visible = true;
                            RenderNode(id86, tt86, subcode86, subName86, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num8 == 7)
                        {
                            //id87.Attributes["Class"] = "subject_blue";
                            //subcode87.Text = (row[2].ToString());
                            //subName87.Text = (row[3].ToString());
                            //tt87.Visible = true;
                            RenderNode(id87, tt87, subcode87, subName87, row[2].ToString(), (row[3].ToString()));
                        }
                        else if (num8 == 8)
                        {
                            //id88.Attributes["Class"] = "subject_blue";
                            //subcode88.Text = (row[2].ToString());
                            //subName88.Text = (row[3].ToString());
                            //tt88.Visible = true;
                            RenderNode(id88, tt88, subcode88, subName88, row[2].ToString(), (row[3].ToString()));
                        }

                        num8++;

                        #endregion callstylesheet css tree  4/2
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        private void clearFunction()
        {
            id11.Attributes["Class"] = "";
            subcode11.Text = "";
            subName11.Text = "";

            id12.Attributes["Class"] = "";
            subcode12.Text = "";
            subName12.Text = "";

            id13.Attributes["Class"] = "";
            subcode13.Text = "";
            subName13.Text = "";

            id14.Attributes["Class"] = "";
            subcode14.Text = "";
            subName14.Text = "";

            id15.Attributes["Class"] = "";
            subcode15.Text = "";
            subName15.Text = "";

            id16.Attributes["Class"] = "";
            subcode16.Text = "";
            subName16.Text = "";

            id17.Attributes["Class"] = "";
            subcode17.Text = "";
            subName17.Text = "";

            id18.Attributes["Class"] = "";
            subcode18.Text = "";
            subName18.Text = "";

            id21.Attributes["Class"] = "";
            subcode21.Text = "";
            subName21.Text = "";

            id22.Attributes["Class"] = "";
            subcode22.Text = "";
            subName22.Text = "";

            id23.Attributes["Class"] = "";
            subcode23.Text = "";
            subName23.Text = "";

            id24.Attributes["Class"] = "";
            subcode24.Text = "";
            subName24.Text = "";

            id25.Attributes["Class"] = "";
            subcode25.Text = "";
            subName25.Text = "";

            id26.Attributes["Class"] = "";
            subcode26.Text = "";
            subName26.Text = "";

            id27.Attributes["Class"] = "";
            subcode27.Text = "";
            subName27.Text = "";

            id28.Attributes["Class"] = "";
            subcode28.Text = "";
            subName28.Text = "";

            id31.Attributes["Class"] = "";
            subcode31.Text = "";
            subName31.Text = "";

            id32.Attributes["Class"] = "";
            subcode32.Text = "";
            subName32.Text = "";

            id33.Attributes["Class"] = "";
            subcode33.Text = "";
            subName33.Text = "";

            id34.Attributes["Class"] = "";
            subcode34.Text = "";
            subName34.Text = "";

            id35.Attributes["Class"] = "";
            subcode35.Text = "";
            subName35.Text = "";

            id36.Attributes["Class"] = "";
            subcode36.Text = "";
            subName36.Text = "";

            id37.Attributes["Class"] = "";
            subcode37.Text = "";
            subName37.Text = "";

            id38.Attributes["Class"] = "";
            subcode38.Text = "";
            subName38.Text = "";

            id41.Attributes["Class"] = "";
            subcode41.Text = "";
            subName41.Text = "";

            id42.Attributes["Class"] = "";
            subcode42.Text = "";
            subName42.Text = "";

            id43.Attributes["Class"] = "";
            subcode43.Text = "";
            subName43.Text = "";

            id44.Attributes["Class"] = "";
            subcode44.Text = "";
            subName44.Text = "";

            id45.Attributes["Class"] = "";
            subcode45.Text = "";
            subName45.Text = "";

            id46.Attributes["Class"] = "";
            subcode46.Text = "";
            subName46.Text = "";

            id47.Attributes["Class"] = "";
            subcode47.Text = "";
            subName47.Text = "";

            id48.Attributes["Class"] = "";
            subcode48.Text = "";
            subName48.Text = "";

            id51.Attributes["Class"] = "";
            subcode51.Text = "";
            subName51.Text = "";

            id52.Attributes["Class"] = "";
            subcode52.Text = "";
            subName52.Text = "";

            id53.Attributes["Class"] = "";
            subcode53.Text = "";
            subName53.Text = "";

            id54.Attributes["Class"] = "";
            subcode54.Text = "";
            subName54.Text = "";

            id55.Attributes["Class"] = "";
            subcode55.Text = "";
            subName55.Text = "";

            id56.Attributes["Class"] = "";
            subcode56.Text = "";
            subName56.Text = "";

            id57.Attributes["Class"] = "";
            subcode57.Text = "";
            subName57.Text = "";

            id58.Attributes["Class"] = "";
            subcode58.Text = "";
            subName58.Text = "";

            id61.Attributes["Class"] = "";
            subcode61.Text = "";
            subName61.Text = "";

            id62.Attributes["Class"] = "";
            subcode62.Text = "";
            subName62.Text = "";

            id63.Attributes["Class"] = "";
            subcode63.Text = "";
            subName63.Text = "";

            id64.Attributes["Class"] = "";
            subcode64.Text = "";
            subName64.Text = "";

            id65.Attributes["Class"] = "";
            subcode65.Text = "";
            subName65.Text = "";

            id66.Attributes["Class"] = "";
            subcode66.Text = "";
            subName66.Text = "";

            id67.Attributes["Class"] = "";
            subcode67.Text = "";
            subName67.Text = "";

            id68.Attributes["Class"] = "";
            subcode68.Text = "";
            subName68.Text = "";

            id71.Attributes["Class"] = "";
            subcode71.Text = "";
            subName71.Text = "";

            id72.Attributes["Class"] = "";
            subcode72.Text = "";
            subName72.Text = "";

            id73.Attributes["Class"] = "";
            subcode73.Text = "";
            subName73.Text = "";

            id74.Attributes["Class"] = "";
            subcode74.Text = "";
            subName74.Text = "";

            id75.Attributes["Class"] = "";
            subcode75.Text = "";
            subName75.Text = "";

            id76.Attributes["Class"] = "";
            subcode76.Text = "";
            subName76.Text = "";

            id77.Attributes["Class"] = "";
            subcode77.Text = "";
            subName77.Text = "";

            id78.Attributes["Class"] = "";
            subcode78.Text = "";
            subName78.Text = "";

            id81.Attributes["Class"] = "";
            subcode81.Text = "";
            subName81.Text = "";

            id82.Attributes["Class"] = "";
            subcode82.Text = "";
            subName82.Text = "";

            id83.Attributes["Class"] = "";
            subcode83.Text = "";
            subName83.Text = "";

            id84.Attributes["Class"] = "";
            subcode84.Text = "";
            subName84.Text = "";

            id85.Attributes["Class"] = "";
            subcode85.Text = "";
            subName85.Text = "";

            id86.Attributes["Class"] = "";
            subcode86.Text = "";
            subName86.Text = "";

            id87.Attributes["Class"] = "";
            subcode87.Text = "";
            subName87.Text = "";

            id88.Attributes["Class"] = "";
            subcode88.Text = "";
            subName88.Text = "";
        }
    }
}