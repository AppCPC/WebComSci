using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class updateCheckNameStd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //foreach (GridViewRow row in gvCheckName.Rows)
            //{
            //    ((RadioButtonList)row.FindControl("RadioButtonList1")).SelectedIndex = 1;

            //}


        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void ListViewEditeCheckname_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
           if (e.CommandName == "Update")
            {

                DropDownList ddlstatus = (DropDownList)e.Item.FindControl("ddlStatusInclass");
                string lblcheckid = ((Label)e.Item.FindControl("lblcheckid")).Text.ToString();
                if (!ddlstatus.SelectedValue.Equals("U"))
                {
                    string updateCommand = "UPDATE  CheckName SET   CheckName_Status='" + ddlstatus.SelectedValue + "' where CheckName_ID= '" + lblcheckid + "'";
                    sqlCheck.UpdateCommand = updateCommand;
                }
                else {
                    ShowMessageWeb("กรุณาระบุสถานะการเข้าห้องเรียนที่ท่านต้องการแก้ไข ! ");
                    string sql = @" SELECT   CheckName.CheckName_ID as checkid,Student.Std_Campus_Code AS stdCode, Student.Std_FName AS fname, Student.Std_LName AS lname, EnrollIn.Enroll_ID AS enroll,  
                                           CASE CheckName.CheckName_Status 
					                        WHEN 'S' THEN 'เข้าเรียน'
					                        WHEN 'L' THEN 'สาย'
					                        WHEN 'N' THEN 'ขาดเรียน'
                                            ELSE 'ยังไม่ได้เช็คชื่อ'
					                        END as status 
                                            FROM Student INNER JOIN
                                            EnrollIn ON Student.Std_Campus_Code = EnrollIn.Std_Campus_Code INNER JOIN
                                             CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID
                                             WHERE ([DetailTech_ID] = '" + Request.QueryString["dchID"] + "')  AND ([CheckName_Num] = '" + Request.QueryString["checknum"] + "')";

                    sqlCheck.UpdateCommand = sql;
                }
            }
        }

       

    }
}