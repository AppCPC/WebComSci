using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci
{
    public partial class Classroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            try
            {
                string userType = Session["userType"].ToString();
                string userId = Session["userid"].ToString();

                //if (userType.Equals("ST") )
                //{
                //    dt = BLL.ClassRoom.showSubjectMainPage(userId, "student");

                //}
                //else if (userType.Equals("TE") || userType.Equals("TS"))
                //{
                //    dt = BLL.ClassRoom.showSubjectMainPage(userId, "teacher");
                //}


                dt = BLL.ClassRoom.showSubjectMainPage(userId, userType);
                    //if (dt.Rows.Count > 0)
                    //{
                    //    int i = 0;
                    //    foreach (DataRow row in dt.Rows)
                    //    {
                    //        foreach (DataColumn column in dt.Columns)
                    //        {
                    //            Response.Write(row[column] + "  ");

                    //        }
                    //        Response.Write("<br/>");
                    //        i++;
                    //    }
                    //    Response.Write("count B " + i.ToString());
                    //}



                //DataTable resultdt = new DataTable();
                //resultdt.Columns.Add("subcode");
                //resultdt.Columns.Add("subthai");
                //resultdt.Columns.Add("classid");
                //resultdt.Columns.Add("detailid");
              
                //resultdt.Columns.Add("image");

               
                //foreach (DataRow  row in dt.Rows)
                //{
                //    string image="";
                //    if ((row[4].ToString()).Equals("กลุ่มวิชาภาษา"))
                //    {
                //        image = "~/image/Subject/Icon/iconLanguage.png";
                //    }
                //    else if ((row[4].ToString()).Equals("กลุ่มวิชาวิทยาศาสตร์กับคณิตศาสตร์"))
                //    {
                //        image = "~/image/Subject/Icon/iconMath.png";
                //    }
                //    else if ((row[4].ToString()).Equals("กลุ่มวิชาเลือกเสรี") || (row[4].ToString()).Equals("กลุ่มวิชาเลือก"))
                //    {
                //        image = "~/image/Subject/Icon/iconSci.png";
                //    }
                //    else if ((row[4].ToString()).Equals("กลุ่มวิชาพลศึกษา"))
                //    {
                //        image = "~/image/Subject/Icon/physical.png";
                //    }
                //    else if ((row[4].ToString()).Equals("วิชาสังคมศาสตร์") || (row[4].ToString()).Equals("กลุ่มวิชามนุษศาสตร์"))
                //    {
                //        image = "~/image/Subject/Icon/social.png";
                //    }
                //    else 
                //    {
                //        image = "~/image/Subject/Icon/iconCom.png";
                //    }
                //    string namesub=row[1].ToString();
                //    string name = "";
                //    if (namesub.Length > 28)
                //    {
                //        name = namesub.Substring(0, 25) + "..";
                //    }
                //    else name = namesub;
                //     resultdt.Rows.Add(row[0], name, row[2], row[5], image);
                //      //resultdt.Rows.Add(row[0], name, row[2], row[3], row[5],image);




                //}





                    ListViewShowSubjectRoom.DataSource = dt;
                    ListViewShowSubjectRoom.DataBind();


            }
            catch (Exception)
            {
                
            
            }

        }
    }
}