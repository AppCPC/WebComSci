using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ucManageUserStudent : System.Web.UI.UserControl
    {
     
       
        protected void Page_Load(object sender, EventArgs e)
        { 
            ltrMode.Text = "แก้ไขข้อมูล";
            
            try
            {   
               

             //   id = Session["stdid"].ToString();
         // ShowMessageWeb(setID.ToString());

                  ShowTextinPage();
              
            }
            catch (Exception)
            {

               
            }
        }

        private void ShowTextinPage() {
            Entity.Student student = new Entity.Student();
          //  student = BLL.Student.selectShowText(setID);

            txtcodeStd.Text = student.Std_Campus_Code.ToString();
            txtNameStd.Text = student.Std_FName.ToString();
            txtLnameStd.Text = student.Std_LName.ToString();
            txtNickName.Text = student.Std_Nickname.ToString();
            txtdate.Text = student.Std_Birth.ToString();
            txttel.Text = student.Std_Tel.ToString();
            ddlSex.SelectedValue = student.Std_Sex.ToString() ;
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

        private void clearValue()
        {

            txtcodeStd.Text = "";
            txtNameStd.Text = "";
            txtLnameStd.Text = "";
            txtNickName.Text = "";
            txtdate.Text = "";
            txttel.Text = "";
            ddlSex.SelectedValue = "N";
            ddlTypeUser.SelectedValue = "N";
            txtEmail.Text = "";
            txtAddress.Text = "";
            txtGroup.Text = "";

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            Entity.Student student = new Entity.Student();

            //student.Std_ID = Session["stdid"].ToString();
            student.Std_Campus_Code = Session["stdid"].ToString();
            student.Std_FName = txtNameStd.Text.ToString();
            student.Std_LName = txtLnameStd.Text.ToString();
            student.Std_Nickname = txtNickName.Text.ToString();
            student.Std_Birth = txtdate.Text.ToString();
            student.Std_Tel = txttel.Text.ToString();
            student.Std_Sex = ddlSex.SelectedValue.ToString();
            student.Std_Type = ddlTypeUser.SelectedValue.ToString();
            student.Std_email = txtEmail.Text.ToString();
            student.Std_Address = txtAddress.Text.ToString();
            student.Std_Group = txtGroup.Text.ToString();

            bool insert = BLL.Student.updateUserStudent(student);
            if (insert)
            {
                ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น ! ");
                clearValue();
            }
            else
                ShowMessageWeb("เกิดข้อผิดพลาดบันทึกข้อมูลล้มเหลว! ");
        }
    }
}