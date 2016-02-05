using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class UpdateUserStudent1 : System.Web.UI.Page
    {
        private string setID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrMode.Text = "แก้ไขข้อมูล";

            try
            {
               setID = Request["idupdate"].ToString();
                if (!IsPostBack)
                {
                    //   id = Session["stdid"].ToString();
                  
                    ShowTextinPage();
                }

            }
            catch (Exception)
            {


            }
        }

        private void ShowTextinPage()
        {
            Entity.Student student = new Entity.Student();
            student = BLL.Student.selectShowText(setID);

            txtcodeStd.Text = student.Std_Campus_Code.ToString();
            txtNameStd.Text = student.Std_FName.ToString();
            txtLnameStd.Text = student.Std_LName.ToString();
            txtNickName.Text = student.Std_Nickname.ToString();
            txtdate.Text = student.Std_Birth.ToString();
            txttel.Text = student.Std_Tel.ToString();
            ddlSex.SelectedValue = student.Std_Sex.ToString();
            ddlTypeUser.SelectedValue = student.Std_Type.ToString();
            txtEmail.Text = student.Std_email.ToString();
            txtAddress.Text = student.Std_Address.ToString();
            txtGroup.Text = student.Std_Group.ToString();

        }

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            Entity.Student studentUpdate = new Entity.Student();

            studentUpdate.Std_ID = setID;
            studentUpdate.Std_Campus_Code = txtcodeStd.Text.ToString();
            studentUpdate.Std_FName = txtNameStd.Text.ToString();
            studentUpdate.Std_LName = txtLnameStd.Text.ToString();
            studentUpdate.Std_Nickname = txtNickName.Text.ToString();
            studentUpdate.Std_Birth = txtdate.Text.ToString();
            studentUpdate.Std_Tel = txttel.Text.ToString();
            studentUpdate.Std_Sex = ddlSex.SelectedValue.ToString();
            studentUpdate.Std_Type = ddlTypeUser.SelectedValue.ToString();
            studentUpdate.Std_email = txtEmail.Text.ToString();
            studentUpdate.Std_Address = txtAddress.Text.ToString();
            studentUpdate.Std_Group = txtGroup.Text.ToString();

            bool insert = BLL.Student.updateUserStudent(studentUpdate);
            if (insert)
            {
                ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น ! ");
                ShowTextinPage();
                Response.Redirect("ManageUseStudent.aspx");
            }
            else
                ShowMessageWeb("เกิดข้อผิดพลาดบันทึกข้อมูลล้มเหลว! ");
        }

    }
}