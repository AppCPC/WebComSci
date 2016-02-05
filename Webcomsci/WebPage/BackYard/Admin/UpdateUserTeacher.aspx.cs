using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class UpdateUserTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrMode.Text = "แก้ไขข้อมูลอาจารย์ ";
            if (!Page.IsPostBack) {
                showValue();
            }
        }
        private void showValue() {
            string userid = Request.QueryString["idupdate"];
            Entity.Teacher tea = new Entity.Teacher();
            tea=BLL.Teacher.selectShowProfileTch(userid);
            txtNameTch.Text= tea.Tch_FName.ToString();
            txtLnameTch.Text = tea.Tch_LName.ToString();
            txtNameTchEn.Text = tea.Tch_FNameEn.ToString();
            txtLnameEn.Text = tea.Tch_LNameEn.ToString();
            txtNickName.Text = tea.Tch_Nickname.ToString();
            txttel.Text = tea.Tch_Tel.ToString();
            ddlSex.SelectedValue = tea.Tch_Sex.ToString();
            ddlTypeUser.SelectedValue = tea.Tch_Type.ToString();
            txtEmail.Text = tea.Tch_email.ToString();
           txtAddress.Text=tea.Tch_Address.ToString();
               
            
        }

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        private void clearValue()
        {

            //   txtCodeTeacher.Text = "";
            txtNameTch.Text = "";
            txtLnameTch.Text = "";
            txtNickName.Text = "";
            //       txtdate.Text = "";
            txttel.Text = "";
            ddlSex.SelectedValue = "N";
            ddlTypeUser.SelectedValue = "N";
            txtEmail.Text = "";
            txtAddress.Text = "";
            txtNameTchEn.Text = "";
            txtLnameEn.Text = "";

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            Entity.Teacher teacher = new Entity.Teacher();
            teacher.Tch_ID=  Request.QueryString["idupdate"];
            // teacher.Tch_Campus_code = txtCodeTeacher.Text.ToString();
            teacher.Tch_FName = txtNameTch.Text.ToString();
            teacher.Tch_LName = txtLnameTch.Text.ToString();
            teacher.Tch_FNameEn = txtNameTchEn.Text.ToString();
            teacher.Tch_LNameEn = txtLnameEn.Text.ToString();
            teacher.Tch_Nickname = txtNickName.Text.ToString();
            //      teacher.Tch_Birth = txtdate.Text.ToString();
            teacher.Tch_Tel = txttel.Text.ToString();
            teacher.Tch_Sex = ddlSex.SelectedValue.ToString();
            teacher.Tch_Type = ddlTypeUser.SelectedValue.ToString();
            teacher.Tch_email = txtEmail.Text.ToString();
            teacher.Tch_Address = txtAddress.Text.ToString();
            teacher.Tch_username = "1";

             string type = ddlTypeUserTeacher.SelectedValue;

            if (showType.Visible)
            {
               
                if (type.Equals("N"))
                {

                        ShowMessageWeb("กรุณาเลือกประเภทของอาจารย์ผู้สอน ! ");

                }
                else
                {
                    teacher.Tch_TypeInSch = type;
                    
                }
            }


            if (type.Equals("A"))
            {
                string checkTeacher = BLL.Teacher.checkTeacher();
                if (checkTeacher.Length > 0) { ShowMessageWeb("ขณะนี้  " + checkTeacher + " เป็นอาจารย์หัวหน้าระดับไม่สามารถมีอาจารย์หัวหน้าระดับสองท่านได้ กรุณาตรวจสอบ ! "); }
                else
                {

                    bool update = BLL.Teacher.updateUserTeacher(teacher);
                    if (update)
                    {
                        // ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น ! ");
                        Response.Redirect("ManageUserTeacher.aspx");
                    }
                    else
                        ShowMessageWeb("เกิดข้อผิดพลาดบันทึกข้อมูลล้มเหลว! ");
                }
            }
            else {

                bool update = BLL.Teacher.updateUserTeacher(teacher);
                if (update)
                {
                    // ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น ! ");
                    Response.Redirect("ManageUserTeacher.aspx");
                }
                else
                    ShowMessageWeb("เกิดข้อผิดพลาดบันทึกข้อมูลล้มเหลว! ");
            }

        }

        protected void ddlTypeUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            string type = ddlTypeUser.SelectedValue;
            if (type.Equals("TE"))
            {
                showType.Visible = true;
            }
            else
            {
                showType.Visible = false;
            }
        }
    }
}