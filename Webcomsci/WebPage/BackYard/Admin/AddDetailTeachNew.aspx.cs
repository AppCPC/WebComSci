using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddDetailTeachNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //popupDetailTeach.RowselectedProType += new BackYard.Admin.ucAddDetailTeach1.RowselectedEventHandler(lookup_product_type1_RowselectedProType);

            if (!Page.IsPostBack) {

                this.Session["dgvSearDetailTeach1"] = showAllDateGride(1);
               bind1(0);

                this.Session["dgvSearDetailTeach2"] = showAllDateGride(2);
                bind2(0);

                this.Session["dgvSearDetailTeach3"] = showAllDateGride(3);
                 bind3(0);

                  this.Session["dgvSearDetailTeach4"] = showAllDateGride(4);
                bind4(0);

             
            }

        }


        #region จัดการข้อมูลหลักของหน้านี้
        private void bind1(int pageindex)
        {
            this.dgVdetailDetailTeach1.DataSource = this.Session["dgvSearDetailTeach1"];
            this.dgVdetailDetailTeach1.PageIndex = pageindex;
            this.dgVdetailDetailTeach1.DataBind();
        }
        private void bind2(int pageindex)
        {
            this.dgVdetailDetailTeach2.DataSource = this.Session["dgvSearDetailTeach2"];
            this.dgVdetailDetailTeach2.PageIndex = pageindex;
            this.dgVdetailDetailTeach2.DataBind();
        }


        private void bind3(int pageindex)
        {
            this.dgVdetailDetailTeach3.DataSource = this.Session["dgvSearDetailTeach3"];
            this.dgVdetailDetailTeach3.PageIndex = pageindex;
            this.dgVdetailDetailTeach3.DataBind();
        }

        private void bind4(int pageindex)
        {
            this.dgVdetailDetailTeach4.DataSource = this.Session["dgvSearDetailTeach4"];
            this.dgVdetailDetailTeach4.PageIndex = pageindex;
            this.dgVdetailDetailTeach4.DataBind();
        }



        protected void dgVdetailDetailTeach1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind1(e.NewPageIndex);
        }

        protected void dgVdetailDetailTeach2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind2(e.NewPageIndex);
        }

        protected void dgVdetailDetailTeach3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind3(e.NewPageIndex);
        }

        protected void dgVdetailDetailTeach4_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind4(e.NewPageIndex);
        }

        private void lookup_product_type1_RowselectedProType(object sender, string e)
        {
            if (e.Length > 0) {

                ModalPopupExtender.Hide();
            }
        }

        private DataTable  showAllDateGride(int level) {


            int year = Convert.ToInt32( Request.QueryString["year"].ToString())+543;
            int term = Convert.ToInt32( Request.QueryString["term"].ToString());
            string yearEdu = "";
            if (level == 1) {
                yearEdu = year.ToString();
            }
            else if (level == 2) {
                yearEdu =( year - 1).ToString();
            }
            else if (level == 3)
            {
                yearEdu = (year - 2).ToString();
            }
            else if (level == 4)
            {
                yearEdu = (year - 3).ToString();
            }


            DataTable dtgride = BLL.DetailTeach.selectShowDetailTeachInNewTerm(yearEdu,year.ToString(),level.ToString(),term.ToString());

            //Response.Write("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx Year" + level.ToString() + "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx <br />");
            //if (dtgride.Rows.Count > 0)
            //{
            //    int i = 0;
            //    foreach (DataRow row in dtgride.Rows)
            //    {
            //        foreach (DataColumn column in dtgride.Columns)
            //        {
            //            Response.Write(row[column] + "  ");

            //        }
            //        Response.Write("<br/>");
            //        i++;
            //    }
            //    Response.Write("count B " + i.ToString());
            //}

           return dtgride;

        }


        protected void btnConfirmOpenSubjec_Click(object sender, EventArgs e)
        {
            Button objImage = (Button)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string subcode = commandArgs[0];
            string subnameThai = commandArgs[1];

            lblsubcode.Text = subcode;
            lblnameSubjec.Text = subnameThai;
            lblyear.Text = (Convert.ToInt32(Request.QueryString["year"].ToString())).ToString();
            lblterm.Text = (Convert.ToInt32(Request.QueryString["term"].ToString())).ToString();
            lbllevel.Text = "1";

            ModalPopupExtender.Show();




        }

        protected void btnConfirmOpenSubjec2_Click(object sender, EventArgs e)
        {
            Button objImage = (Button)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string subcode = commandArgs[0];
            string subnameThai = commandArgs[1];

            lblsubcode.Text = subcode;
            lblnameSubjec.Text = subnameThai;
            lblyear.Text = (Convert.ToInt32(Request.QueryString["year"].ToString())).ToString();
            lblterm.Text = (Convert.ToInt32(Request.QueryString["term"].ToString())).ToString();
            lbllevel.Text = "2";

            ModalPopupExtender.Show();

        }

        protected void btnConfirmOpenSubjec3_Click(object sender, EventArgs e)
        {
            Button objImage = (Button)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string subcode = commandArgs[0];
            string subnameThai = commandArgs[1];

            lblsubcode.Text = subcode;
            lblnameSubjec.Text = subnameThai;
            lblyear.Text = (Convert.ToInt32(Request.QueryString["year"].ToString())).ToString();
            lblterm.Text = (Convert.ToInt32(Request.QueryString["term"].ToString())).ToString();
            lbllevel.Text = "3";

            ModalPopupExtender.Show();
        }

        protected void btnConfirmOpenSubjec4_Click(object sender, EventArgs e)
        {
            Button objImage = (Button)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string subcode = commandArgs[0];
            string subnameThai = commandArgs[1];

            lblsubcode.Text = subcode;
            lblnameSubjec.Text = subnameThai;
            lblyear.Text = (Convert.ToInt32(Request.QueryString["year"].ToString())).ToString();
            lblterm.Text = (Convert.ToInt32(Request.QueryString["term"].ToString())).ToString();
            lbllevel.Text = "4";
            ModalPopupExtender.Show();
        }

        #endregion

        #region PopUpShowDetailTeach  แสดง poup ที่ทำการเลือกเมื่อคลิกปุ่ม

        protected void btnSaveDetailTeach_Click(object sender, EventArgs e)
        {

            string year = lblyear.Text;
            string level = lbllevel.Text;
            string term = lblterm.Text;
            string group = DropDownListClass.SelectedValue;
            string subject = lblsubcode.Text;
            string teacher = lblid.Text;
            string userid = Session["userid"].ToString();


            if (subject.Equals("")) { ShowMessageWeb("กรุณากรอกชือรายวิชา ! "); }
            else
            {
                if (group.Equals("N")) { ShowMessageWeb("กรุณากลุ่มของนักศึกษา ! "); }
                else if (teacher.Equals("")) { ShowMessageWeb("กรุณาระบุชื่ออาจารย์ผู้สอน"); }
                else
                {
                    bool checkvalue = BLL.DetailTeach.checkValueDoubleShowgird(year, level, term, group, subject, userid, teacher);
                    if (checkvalue)
                    {

                        bool insertDetailTeach = BLL.DetailTeach.insertDetailTeach(year, level, term, group, subject, userid, teacher);
                        if (insertDetailTeach)
                        {
                            ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น");
                            GridViewShowDetailTeach.DataBind();

                            showTitle.Visible = true;
                        }
                        else
                        {
                            ShowMessageWeb("ไม่สามารถบันทึกได้กรุณาตรวจสอบข้อมูลที่คุณบันทึก ! ");
                        }
                    }
                    else
                    {
                        ShowMessageWeb("ข้อมูลมีอยู่แล้วไม่สามารถเพิ่มข้อมูลนี้ได้");
                    }

                }
            }

        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        protected void btnok_Click(object sender, EventArgs e)
        {
            string fname = txtNameTeacher.Text.Trim();
            string lname = txtLnameTeacher.Text.Trim();
            string type = ddlTypeTeacher.SelectedValue.Trim();

            DataTable dt = BLL.Teacher.searchShowPageTchAdmin("", fname, lname, type);
            Session["sSearchTch"] = dt;
            bindteacher(0);
        }
        private void bindteacher(int pageindex)
        {
            this.gvShowTeacher.DataSource = this.Session["sSearchTch"];
            this.gvShowTeacher.PageIndex = pageindex;
            this.gvShowTeacher.DataBind();

        }

        protected void imgbtnSeachTeacher_Click(object sender, ImageClickEventArgs e)
        {
            showSearch.Visible = true;



        }
 
        protected void gvShowTeacher_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "getTeacher")
                {
                    DataTable dt = (DataTable)Session["sSearchTch"];
                    string id = e.CommandArgument.ToString();
                    foreach (DataRow row in dt.Rows)
                    {
                        if ((row[0].ToString()).Equals(id))
                        {
                            lblid.Text = row[0].ToString();
                            txtfullNameTeacher.Text = "อาจารย์ " + row[1].ToString() + " " + row[2].ToString();
                            showSearch.Visible = false;
                        }
                    }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {


                if (e.CommandName == "del")
                {
                    string dchID = e.CommandArgument.ToString();
                    bool del = BLL.DetailTeach.deleteDetailTeach(dchID);
                    if (del)
                    {

                        GridViewShowDetailTeach.DataBind();
                    }
                }


            }
            catch (Exception ex)
            {


            }
        }
        protected void imgproClose_Click(object sender, ImageClickEventArgs e)
        {
            gvShowSubject1.DataBind();
            gvShowSubject2.DataBind();
            gvShowSubject3.DataBind();
            gvShowSubject4.DataBind();

            ModalPopupExtender.Hide();
           

        }
        #endregion

        protected void btnSearchSubject_Click(object sender, EventArgs e)
        {
            string code = txtsubcode.Text;
            string year = ddlYear.SelectedValue;
            string nameThai = txtnameThai.Text;

            Session["ssubjectinAddDetailTeach"] = BLL.DetailTeach.selectShowSubjectShowpoup(year,code,nameThai);
            bindsearcsubject(0);
        }

      
        private void bindsearcsubject(int pageindex)
        {
            this.gvShowSubject.DataSource = this.Session["ssubjectinAddDetailTeach"];
            this.gvShowSubject.PageIndex = pageindex;
            this.gvShowSubject.DataBind();
        }

        protected void gvShowSubject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bindsearcsubject(e.NewPageIndex);
        }

        protected void gvShowSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "getSubject")
                {
                    DataTable dt = (DataTable)Session["ssubjectinAddDetailTeach"];
                    string code = e.CommandArgument.ToString();
                    foreach (DataRow row in dt.Rows)
                    {
                        if ((row[0].ToString()).Equals(code))
                        {
                            txtcodeSub.Text = row[0].ToString();
                            lblsubcode.Text = row[0].ToString(); 
                            lblnameSubjec.Text=row[1].ToString();
                            showSearchSubject.Visible = false;
                        }
                    }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
        }

        protected void imgbtnsearchSubject_Click(object sender, ImageClickEventArgs e)
        {
            showSearchSubject.Visible = true;

        }

        protected void btnchotsub1_Click(object sender, EventArgs e)
        {
            lblsubcode.Text = "";
            lblnameSubjec.Text = "";
            lblyear.Text = (Convert.ToInt32(Request.QueryString["year"].ToString())).ToString();
            lblterm.Text = (Convert.ToInt32(Request.QueryString["term"].ToString())).ToString();
            lbllevel.Text = "1";

            lblSearchsubject.Visible = true;
            ModalPopupExtender.Show();

        }


        protected void btnchotsub2_Click(object sender, EventArgs e)
        {
            lblsubcode.Text = "";
            lblnameSubjec.Text = "";
            lblyear.Text = (Convert.ToInt32(Request.QueryString["year"].ToString())).ToString();
            lblterm.Text = (Convert.ToInt32(Request.QueryString["term"].ToString())).ToString();
            lbllevel.Text = "2";

            lblSearchsubject.Visible = true;
            ModalPopupExtender.Show();

        }


        protected void btnchotsub3_Click(object sender, EventArgs e)
        {
            lblsubcode.Text = "";
            lblnameSubjec.Text = "";
            lblyear.Text = (Convert.ToInt32(Request.QueryString["year"].ToString())).ToString();
            lblterm.Text = (Convert.ToInt32(Request.QueryString["term"].ToString())).ToString();
            lbllevel.Text = "3";

            lblSearchsubject.Visible = true;
            ModalPopupExtender.Show();

        }


        protected void btnchotsub4_Click(object sender, EventArgs e)
        {
            lblsubcode.Text = "";
            lblnameSubjec.Text = "";
            lblyear.Text = (Convert.ToInt32(Request.QueryString["year"].ToString())).ToString();
            lblterm.Text = (Convert.ToInt32(Request.QueryString["term"].ToString())).ToString();
            lbllevel.Text = "4";

            lblSearchsubject.Visible = true;
            ModalPopupExtender.Show();

        }

        protected void btnAddDetailTeach_Click(object sender, EventArgs e)
        {
            gvShowSubject1.DataBind();
            gvShowSubject2.DataBind();
            gvShowSubject3.DataBind();
            gvShowSubject4.DataBind();

            ModalPopupExtender.Hide();
        }

        protected void btnSwap1_Click(object sender, EventArgs e)
        {
            Button objImage = (Button)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string subcode = commandArgs[0];
            string subnameThai = commandArgs[1];
            string curi = commandArgs[2];
            Labelcode.Text = subcode;
            lblNameThai.Text = subnameThai;
            lblcurri.Text = curi;





            //DataTable dt = BLL.DetailTeach.selectShowSwap1(curi,);  
          DataTable dt=showSelectShowSwap1(1,curi);
          if (dt.Rows.Count > 0)
          {
              ModalPopupExtender1.Show();

          }
          else {
              ShowMessageWeb("ไม่สามารถสลับรายวิชาได้ ! ");
          }

        }

        private DataTable showSelectShowSwap1(int level,string curri) {


            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            int term = Convert.ToInt32(Request.QueryString["term"].ToString());
            string yearEdu = "";
            if (level == 1)
            {
                yearEdu = year.ToString();
            }
            else if (level == 2)
            {
                yearEdu = (year - 1).ToString();
            }
            else if (level == 3)
            {
                yearEdu = (year - 2).ToString();
            }
            else if (level == 4)
            {
                yearEdu = (year - 3).ToString();
            }


            DataTable dtgride = BLL.DetailTeach.selectShowSwap1(yearEdu, year.ToString(), level.ToString(), term.ToString(),curri);
            Session["bindSwap"] = dtgride;
            bindSwap(0);

            //gvShowSubjectSwap.DataSource = dtgride;
            //gvShowSubjectSwap.DataBind();

            return dtgride;
        
        }

        protected void lbtnSwap_Click(object sender, EventArgs e)
        {
           
            LinkButton objImage = (LinkButton)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });

            string subcode = commandArgs[0];
            string oldcode = Labelcode.Text;


            DataTable dt = (DataTable)Session["dgvSearDetailTeach1"];

            foreach (DataRow item in dt.Rows)
            {
                if (item[1].Equals(oldcode))
                {

                    item[1] = subcode;
                    break;
                    ModalPopupExtender1.Hide();


                }
            }

            

            this.Session["dgvSearDetailTeach1"] = dt;
            bind1(0);

        }

        private void bindSwap(int pageindex)
        {
            this.gvShowSubjectSwap.DataSource = this.Session["bindSwap"];
            this.gvShowSubjectSwap.PageIndex = pageindex;
            this.gvShowSubjectSwap.DataBind();
        }

        protected void gvShowSubjectSwap_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bindSwap(e.NewPageIndex);
        }

        protected void btnSwap_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPage/BackYard/Admin/swapSubject.aspx?year=" + Request.QueryString["year"].ToString() + "&term=" + Request.QueryString["term"].ToString());
        }

       





    }

}