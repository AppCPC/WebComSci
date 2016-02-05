using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Threading;
using System.Web.UI.HtmlControls;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddCurriculum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // Response.AppendHeader("Refresh", "4; url=AddCurriculum.aspx");

        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }



        #region ManageYear /insert/update/delete ==> Year

        protected void btnYearNew_Click(object sender, EventArgs e)
        {
            ListViewManageyear.Visible = true;
            btnCourse.Enabled = false;
            btncancelYear.Visible = true;
            btnGroup.Enabled = false;
            
        }


        protected void ListViewManageyear_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                TextBox txtInsertYear = (TextBox)e.Item.FindControl("txtNewYear");

                string insertCommand = "Insert into Curriculum (Curri_Year,Curri_Course,Curri_Group) Values('" + txtInsertYear.Text + "','','');";
               SqlDataSourceYearCurriculum.InsertCommand = insertCommand;

              
              // Thread.Sleep(5000);
               //Response.Redirect("AddCurriculum.aspx") ;
            
            }
            else if (e.CommandName == "Update")
            {
                TextBox txtyearmanage = (TextBox)e.Item.FindControl("txtYear");
               string yearlbl=((Label)e.Item.FindControl("lblsetyear")).Text.ToString();
               string updateCommand = "UPDATE Curriculum SET  [Curri_Year]='" + txtyearmanage.Text + "' where Curri_Year='" + yearlbl + "';";
               SqlDataSourceYearCurriculum.UpdateCommand = updateCommand;
            }
          
            else if (e.CommandName == "Delete")
            {
                try
                {

                    TextBox txtyearmanage = (TextBox)e.Item.FindControl("txtYear");
                    string deleteCommand = "delete from  Curriculum  where Curri_Year= '" + txtyearmanage.Text+"'"; 
                    SqlDataSourceYearCurriculum.DeleteCommand = deleteCommand;

                }
                catch (Exception ex)
                {

                    ShowMessageWeb(ex.ToString());
                }

            }
           
         
        }


        #endregion



       #region ManageCourse /insert/update/delete ==> Course

        protected void btnCourse_Click(object sender, EventArgs e)
            {
                ListViewManageCourse.Visible = true;
                btnYearNew.Enabled = false;
                btncancelCourse.Visible = true;
                btnGroup.Enabled = false;
            }

       protected void ListViewManageCourse_ItemCommand(object sender, ListViewCommandEventArgs e)
            {
                if (e.CommandName == "Insert")
                {
                    TextBox txtInsertCourse = (TextBox)e.Item.FindControl("txtNewCourse");

                    string insertCommand = "Insert into Curriculum (Curri_Year,Curri_Course,Curri_Group) Values('" + ddlYear.SelectedValue + "','" + txtInsertCourse.Text + "','');";
                    SqlDataSourceCourseCurriculum.InsertCommand = insertCommand;



                }
                else if (e.CommandName == "Update")
                {
                    TextBox txtCourse = (TextBox)e.Item.FindControl("txtCourse");
                    string lblCourse = ((Label)e.Item.FindControl("lblsetcourse")).Text.ToString();
                    string Id = BLL.Curriculum.selectIDAddcurriculumPage(ddlYear.SelectedValue.ToString(),lblCourse,"");
                    string updateCommand = "UPDATE Curriculum SET  [Curri_Course]='" + txtCourse.Text.ToString() + "' where Curri_Id='" + Id + "';"; ;
                    SqlDataSourceCourseCurriculum.UpdateCommand = updateCommand;
                }

                else if (e.CommandName == "Delete")
                {
                    try
                    {
                        string lblCourse = ((Label)e.Item.FindControl("lblsetcourse")).Text.ToString();
                        string Id = BLL.Curriculum.selectIDAddcurriculumPage(ddlYear.SelectedValue.ToString(), lblCourse,"");
                        string deleteCommand = "delete from  Curriculum  where Curri_Id =" + Convert.ToInt32(Id);
                        SqlDataSourceCourseCurriculum.DeleteCommand = deleteCommand;

                    }
                    catch (Exception ex)
                    {

                        ShowMessageWeb(ex.ToString());
                    }

                }
            }

    #endregion


       #region ManageGroup /insert/update/delete==>Group

       protected void btnGroup_Click(object sender, EventArgs e)
        {
            ListViewManageGroup.Visible = true;

            btnYearNew.Enabled = false;
            btncancelGroup.Visible = true;
            btnCourse.Enabled = false;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {

            Response.AppendHeader("Refresh", "0");
            
        }

        protected void ListViewManageGroup_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            if (e.CommandName == "Insert")
            {
                TextBox txtInsertGroup = (TextBox)e.Item.FindControl("txtNewGroup");

                string insertCommand = "Insert into Curriculum (Curri_Year,Curri_Course,Curri_Group) Values('" + ddlYear.SelectedValue + "','" + ddlCourses.SelectedValue + "','" + txtInsertGroup.Text + "');";
                SqlDataSourceGroupCurriculum.InsertCommand = insertCommand;



            }
            else if (e.CommandName == "Update")
            {
                TextBox txtGroup = (TextBox)e.Item.FindControl("txtGroup");
                string lblGroup = ((Label)e.Item.FindControl("lblsetGroup")).Text.ToString();
                string Id = BLL.Curriculum.selectIDAddcurriculumPage(ddlYear.SelectedValue.ToString(), ddlCourses.SelectedValue.ToString(),lblGroup);
                string updateCommand = "UPDATE Curriculum SET  [Curri_Group]='" + txtGroup.Text.ToString() + "' where Curri_Id='" + Id + "';"; ;
                SqlDataSourceGroupCurriculum.UpdateCommand = updateCommand;
            }

            else if (e.CommandName == "Delete")
            {
                try
                {
                    string lblGroup = ((Label)e.Item.FindControl("lblsetGroup")).Text.ToString();
                    string Id = BLL.Curriculum.selectIDAddcurriculumPage(ddlYear.SelectedValue.ToString(), ddlCourses.SelectedValue.ToString(), lblGroup);
                    string deleteCommand = "delete from  Curriculum  where Curri_Id =" + Convert.ToInt32(Id);
                    SqlDataSourceGroupCurriculum.DeleteCommand = deleteCommand;

                }
                catch (Exception ex)
                {

                    ShowMessageWeb(ex.ToString());
                }

            }
        }

       #endregion

        protected void btnSave_Click(object sender, EventArgs e)// confirm save because delete null value in Curriculum Table 
        {
            
            try{
               bool confirm= BLL.Curriculum.confirmSaveInAddcurriculum();
               if (confirm)
               {
                   Response.AppendHeader("Refresh", "0");
               }
               else {
                   ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถบันทึกผลการเปลี่ยนได้ ! ");
               }
            }
            catch (Exception)
            {
                
              
            }
        }

    

    }
}