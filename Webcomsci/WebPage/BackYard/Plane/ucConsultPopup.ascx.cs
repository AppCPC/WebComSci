using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Plane
{
    public partial class ucConsultPopup : System.Web.UI.UserControl
    {

        public static DataTable SelectDistinct(string[] pColumnNames, DataTable pOriginalTable)
        {

            DataTable distinctTable = new DataTable();

            int numColumns = pColumnNames.Length;

            for (int i = 0; i < numColumns; i++)
            {

                distinctTable.Columns.Add(pColumnNames[i], pOriginalTable.Columns[pColumnNames[i]].DataType);

            }

            Hashtable trackData = new Hashtable();

            foreach (DataRow currentOriginalRow in pOriginalTable.Rows)
            {

                StringBuilder hashData = new StringBuilder();

                DataRow newRow = distinctTable.NewRow();

                for (int i = 0; i < numColumns; i++)
                {

                    hashData.Append(currentOriginalRow[pColumnNames[i]].ToString());

                    newRow[pColumnNames[i]] = currentOriginalRow[pColumnNames[i]];

                }

                if (!trackData.ContainsKey(hashData.ToString()))
                {

                    trackData.Add(hashData.ToString(), null);

                    distinctTable.Rows.Add(newRow);

                }

            }

            return distinctTable;

        }

         DataTable dtsub = new DataTable();

        


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

          
                lblname.Text = Session["name"].ToString();
                string userid = Session["userid"].ToString();
                string yearedu = Session["yearEducate"].ToString();



            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();
            dt2.Columns.Add("year");
            dt2.Columns.Add("term");
            dt2.Columns.Add("code");
            dt2.Columns.Add("namethai");
            dt2.Columns.Add("grade");
            dt2.Columns.Add("status");
            /*select show All subject in PlanSubject*/
            dt = BLL.PlanEducate.selectShowAllPlanTree(yearedu);

            foreach (DataRow row in dt.Rows)
            {
                DataTable j = new DataTable();
                /*select show Subject for user */
                string sub = row[2].ToString();
                if (sub.Length > 0)
                {
                    j = BLL.PlanEducate.selectShowStudentSuject(sub, userid);
                }

                if (j.Rows.Count > 0)
                {
                    foreach (DataRow rowss in j.Rows)
                    {
                        //dt2.Rows.Add(rowss[0], rowss[1], rowss[2], rowss[3], rowss[4], "Y");
                        dt2.Rows.Add(row[0], row[1], rowss[2], rowss[3], rowss[4], "Y");
                    }
                }
                else
                {
                    dt2.Rows.Add(row[0], row[1], row[2], row[3], "N", "Y");

                }
            }
            string textSubject = "";
            foreach (DataRow roowsub in dt2.Rows)
            {
                if ((roowsub[4].ToString()).Equals("0"))
                {
                    textSubject += " <b> รหัสวิชา " + roowsub[2].ToString() + " วิชา " + roowsub[3].ToString() + "<b/> <br />";
                    lblsubjectF.Text = textSubject;
                }
            }


            //int i = 0;
            //foreach (DataRow row in dt2.Rows)
            //{
            //    foreach (DataColumn column in dt2.Columns)
            //    {
            //        Response.Write(row[column] + " ");

            //    }
            //    Response.Write("<br/>");
            //    i++;
            //}
            //Response.Write("count B " + i.ToString());

            string subjectFollow = "";
            DataTable dtShowChildNode = BLL.PlanEducate.ShowSubjectChildNodeConsult(dt2, yearedu);
            foreach (DataRow roowsub in dtShowChildNode.Rows)
            {
                    subjectFollow += "รหัสวิชา " + roowsub[2].ToString() + " วิชา " + roowsub[3].ToString() + "<br />";
                    lblsubjectFollow.Text = subjectFollow;

            }

            }
            catch (Exception)
            {
                
            }
            





           

        }

       

    }
}