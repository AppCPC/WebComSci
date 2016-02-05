using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddDetailTeachCase3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (!Page.IsPostBack)
            {
                try
                {
                    DataTable dttch1 = selectShowGridview(1);
                    DataTable dttch2 = selectShowGridview(2);
                    DataTable dttch3 = selectShowGridview(3);
                    DataTable dttch4 = selectShowGridview(4);
                    if (dttch1.Rows.Count > 0) { selectShowGrideSubjectTerm(1); }
                    if (dttch2.Rows.Count > 0) { selectShowGrideSubjectTerm(2); }
                    if (dttch3.Rows.Count > 0) { selectShowGrideSubjectTerm(3); }
                    if (dttch4.Rows.Count > 0) { selectShowGrideSubjectTerm(4); }
                }
                catch (Exception ex)
                {
                   

                }


            }
        }

        protected void btnSwapSubject_Click(object sender, EventArgs e)
        {
            Button objImage = (Button)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string curri = commandArgs[0];
            string code = commandArgs[1];
            string nameTha = commandArgs[2];

            int level = Convert.ToInt32(commandArgs[3].ToString());
            Session["levelSwap"] = level;
            lbldetailTeach.Text = commandArgs[4];

            lblcode.Text = code;
            lblnameThai.Text = nameTha;





            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            int term = Convert.ToInt32(Request.QueryString["term"].ToString());
            string yearEdu = "";


            switch (level)
            {
                case 1: yearEdu = year.ToString(); ; break;
                case 2: yearEdu = (year - 1).ToString(); ; break;
                case 3: yearEdu = (year - 2).ToString(); ; break;
                case 4: yearEdu = (year - 3).ToString(); ; break;
            }


           // DataTable dt = BLL.DetailTeach.selectShowSubjectSwap(yearEdu, year, level, term, curri);
            DataTable dt = BLL.DetailTeach.swapSubject(yearEdu, year, level, term, "","");

            if (dt.Rows.Count <= 0)
            {
                lblAlertSubject.Text = "ไม่พบรายวิชาที่อยู่ในหมวดวิชาเดียวกันที่คุณต้องการจะสลับ ! ";
            }
            else
            {
                lblAlertSubject.Text = "";

                this.Session["dgvbindSwap"] = dt;
                bindSwap(0);

            }

            mdlshowSwap.Show();



        }

        protected void btnSearchSwap_Click(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            int term = Convert.ToInt32(Request.QueryString["term"].ToString());
            string yearEdu = "";
            int level = Convert.ToInt32(Session["levelSwap"].ToString());
            string code = txtcodeSwap.Text;
            string subNamthai = txtNameThaiSwap.Text;


            switch (level)
            {
                case 1: yearEdu = year.ToString(); ; break;
                case 2: yearEdu = (year - 1).ToString(); ; break;
                case 3: yearEdu = (year - 2).ToString(); ; break;
                case 4: yearEdu = (year - 3).ToString(); ; break;
            }
            DataTable dt = BLL.DetailTeach.swapSubject(yearEdu, year, level, term, code, subNamthai);
            this.Session["dgvbindSwap"] = dt;
            bindSwap(0);
        }


        protected void btnConfirmOpenSubjec_Click(object sender, EventArgs e)
        {
            Button objImage = (Button)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string code = commandArgs[0];
            string nametha = commandArgs[1];
            lblDtchOpenSubject.Text = commandArgs[2];
            lbllevelOpen.Text = commandArgs[3];

            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            string yy = BLL.DetailTeach.selectYear(year.ToString());

            lblYearOpensub.Text = year.ToString();
            lblyearOpenHide.Text = yy;
            //lbllevelOpen.Text = "1";
            lblcodeSubjectOpenSubject.Text = code;
            lblSubnameThaiSubjectOpenSubject.Text = nametha;


            mdlOpenSubject.Show();
        }

        protected void lbtndeleteDch1_Click(object sender, EventArgs e)
        {
            /******* ลบรายวิชาที่มีการลงทะเบีย*****/
            try
            {
                LinkButton objImage = (LinkButton)sender;

                string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });

                string subcode = commandArgs[0];
                string tchID = commandArgs[1];
                string dchid = commandArgs[2];

               // bool deleteDch = BLL.DetailTeach.deleteDetailTeach(subcode, tchID);
                bool deleteDch = BLL.DetailTeach.deleteDetailTeach(dchid);

                gvManageDetailTeach1.DataBind();
                gvManageDetailTeach2.DataBind();
                gvManageDetailTeach3.DataBind();
                gvManageDetailTeach4.DataBind();


            }
            catch (Exception) { }
        }

        protected void lbtnUpdate1_Click(object sender, EventArgs e)
        {
            /************แก้ไขรายวิชาที่มีการลงทะเบียน*************/
            LinkButton objImage = (LinkButton)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string subcode = commandArgs[0];
            string subnameThai = commandArgs[1];
            string curi = commandArgs[2];
            string tchid = commandArgs[3];
            string classid = commandArgs[4];
            string dchid = commandArgs[5];

          

           
        }



        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
        }


        protected void btnGetSubjectLevel1_Click(Object sender, EventArgs e)
        {
            /***** ดึงรายวิชาจากแผนการเรียน *************/

            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            int term = Convert.ToInt32(Request.QueryString["term"].ToString());
            string yearEdu = "";

            int level = Convert.ToInt32(((Button)sender).CommandArgument);

            switch (level)
            {
                case 1: yearEdu = year.ToString(); ; break;
                case 2: yearEdu = (year - 1).ToString(); ; break;
                case 3: yearEdu = (year - 2).ToString(); ; break;
                case 4: yearEdu = (year - 3).ToString(); ; break;
            }


            BLL.DetailTeach.selectDtDatatableCase3(yearEdu, year.ToString(), level.ToString(), term.ToString());
            selectShowGrideSubjectTerm(level);

        }

        private DataTable selectShowGridview(int level) {

            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            int term = Convert.ToInt32(Request.QueryString["term"].ToString());
            string yearEdu = "";
            switch (level)
            {
                    //
                case 1: yearEdu = year.ToString(); break;
                case 2: yearEdu = (year - 1).ToString(); ; break;
                case 3: yearEdu = (year - 2).ToString(); ; break;
                case 4: yearEdu = (year - 3).ToString(); ; break;
            }
            
            Session["yearEduCas3"]=yearEdu;

            //DataTable dtt = BLL.DetailTeach.selectDTShowGrideViewCase3(year.ToString(), level.ToString(), term.ToString());
            DataTable dtt = BLL.DetailTeach.selectDTShowGrideViewOpenSubjec(yearEdu, level.ToString(), term.ToString());
            return dtt;

         
        
        }
        private void selectShowGrideSubjectTerm(int level)
        {

            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            int term = Convert.ToInt32(Request.QueryString["term"].ToString());
            string yearEdu = "";
            switch (level)
            {
                case 1: yearEdu = year.ToString(); ; break;
                case 2: yearEdu = (year - 1).ToString(); ; break;
                case 3: yearEdu = (year - 2).ToString(); ; break;
                case 4: yearEdu = (year - 3).ToString(); ; break;
            }

            DataTable dtt = BLL.DetailTeach.selectDTShowGrideViewOpenSubjec(yearEdu, level.ToString(), term.ToString());
          //DataTable dtt = BLL.DetailTeach.selectDTShowGrideViewCase3(year.ToString(), level.ToString(), term.ToString());

            switch (level)
            {
                case 1:
                    btnchotsub1.Visible = true;
                    //btnGetSubjectLevel1.Visible = false;
                    this.Session["dgvSearDetailTeach1"] = dtt;
                    bind1(0);
                    dgVdetailDetailTeach1.Visible = true;
                    ; break;

                case 2:
                    btnchotsub2.Visible = true;
                    //btnGetSubjectLevel2.Visible = false;
                    this.Session["dgvSearDetailTeach2"] = dtt;
                    bind2(0);
                    dgVdetailDetailTeach2.Visible = true;
                    ; break;

                case 3:
                    btnchotsub3.Visible = true;
                    //btnGetSubjectLevel3.Visible = false;
                    this.Session["dgvSearDetailTeach3"] = dtt;
                    bind3(0);
                    dgVdetailDetailTeach3.Visible = true;
                    ; break;

                case 4:
                    btnchotsub4.Visible = true;
                   // btnGetSubjectLevel4.Visible = false;
                    this.Session["dgvSearDetailTeach4"] = dtt;
                    bind4(0);
                    dgVdetailDetailTeach4.Visible = true;
                    ; break;
            }

        }

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

        protected void btnchotsub1_Click(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            string yy = BLL.DetailTeach.selectYear(year.ToString());

            lblyearCur.Text = year.ToString();
            lblyear.Text = yy;
            int level = Convert.ToInt32(((Button)sender).CommandArgument);
            lbllevel.Text = level.ToString();
            mdlSubject.Show();
        }

        protected void imgbtnSwap_Click(object sender, ImageClickEventArgs e)
        {
            mdlshowSwap.Hide();
            bind1(0);
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



        protected void lbtnChoose_Click(object sender, EventArgs e)
        {

            mdlshowSwap.Hide();

            LinkButton objImage = (LinkButton)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string code = commandArgs[0];
            string namethai = commandArgs[1];
            int level=Convert.ToInt32(commandArgs[2].ToString());

            string year = Session["yearEduCas3"].ToString();

            string eduID = lbldetailTeach.Text;
            string codeOld = lblcode.Text;
            bool upd = BLL.DetailTeach.updateDetailTeach(eduID,code,codeOld,year);
            selectShowGrideSubjectTerm(level);
            Response.Redirect(Request.Url.AbsoluteUri);

        }
        private void bindSwap(int pageindex)
        {
            this.gvShowSubjectSwap.DataSource = this.Session["dgvbindSwap"];
            this.gvShowSubjectSwap.PageIndex = pageindex;
            this.gvShowSubjectSwap.DataBind();

        }

        protected void gvShowSubjectSwap_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            bindSwap(e.NewPageIndex);
        }

        protected void btnSearchSubject_Click(object sender, EventArgs e)
        {

            // BLL.DetailTeach.selectShowSubjectSwap(yearEdu, year, level, term, curri);

            int year = Convert.ToInt32(lblyearCur.Text);
            string course = ddlCourses.SelectedValue;
            string group = ddlGroup.SelectedValue;
            string code = txtnameSubject.Text;


            int term = Convert.ToInt32(Request.QueryString["term"].ToString());
            int level = Convert.ToInt32(lbllevel.Text.ToString());
            string yearEdu = "";
            switch (level)
            {
                case 1: yearEdu = year.ToString(); ; break;
                case 2: yearEdu = (year - 1).ToString(); ; break;
                case 3: yearEdu = (year - 2).ToString(); ; break;
                case 4: yearEdu = (year - 3).ToString(); ; break;
            }

            DataTable dt = BLL.DetailTeach.searchSubject(year.ToString(), course, group, code, yearEdu, term.ToString());
            Session["dgvsearchSub"] = dt;
            bindSearchSubject(0);

        }
        private void bindSearchSubject(int pageindex)
        {
            this.gvSearchSubject.DataSource = this.Session["dgvsearchSub"];
            this.gvSearchSubject.PageIndex = pageindex;
            this.gvSearchSubject.DataBind();

        }

        protected void gvSearchSubject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bindSearchSubject(e.NewPageIndex);
        }

        protected void ibtnCloseSubject_Click(object sender, ImageClickEventArgs e)
        {
            mdlSubject.Hide();
        }

        protected void lblinsertSubjec_Click(object sender, EventArgs e)
        {
            LinkButton objImage = (LinkButton)sender;
            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string code = commandArgs[0];
            string yearCurri = lblyearCur.Text;
            string level = lbllevel.Text;
            string term = Request.QueryString["term"].ToString();

           

            bool checkAddSubject = BLL.DetailTeach.checkSubjectAdd(yearCurri,level,term,code);

            if (checkAddSubject)
            {
                mdlSubject.Hide();
                bool insert = BLL.DetailTeach.insertDetailTeachMdlSub(code, yearCurri, level, term);
                bindSearchSubject(0);
                selectShowGrideSubjectTerm(Convert.ToInt32(level));
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else {
                ShowMessageWeb("ระบบไม่อนุญาติให้คุณลงรายวิชาเกินในเทอม 1,2 เกิน 21 หน่วยกิต และ เทอม 3 เกิน 9 หน่วยกิต กรุณาตรวจสอบด้วย ! ");
            }
            
        }


        #region จัดการส่วนpoup ยินยันการลงทะเบียน

        protected void btnOpenNext_Click(object sender, EventArgs e)
        {
            /******** ปุ่มถัดไปของการเปิดรายวิชา ********************/

            try
            {
                if (txtopenSubjectGroup.Text.Equals(""))
                {
                    ShowMessageWeb("กรุณากรอกข้อมูลจำนวนกลุ่มนักศึกษาที่เปิดห้องเรียน");
                }else{
                        int numgroup = Convert.ToInt32(txtopenSubjectGroup.Text);
                

                        btnOpenSubject.Visible = true;
                        btnOpenNext.Visible = false;
                        open1.Visible = false;
                        openGroup.Visible = true;
                        showTch.Visible = true;
                        btnAddOpenDetailTeach.Visible = true;
                        //divShowClass.Visible = true;
                        //btnOpenPrevious.Visible = true;

                        ddlGroupstd.Items.Clear();  

                        for (int i = 1; i <= numgroup; i++)
                        {
                            ddlGroupstd.Items.Add(new ListItem("กลุ่มที่ "+i.ToString(), i.ToString()));
                        }
                }
            }
            catch (Exception) {
                ShowMessageWeb("กรุณากรอกข้อมูลทีเป็นตัวเลข ! ");
            }
        }

    
        protected void imgbtnsearchTeacher_Click(object sender, ImageClickEventArgs e)
        {
            divShowTeacher.Visible = true;
            searchTch();

        }
        protected void btnok_Click(object sender, EventArgs e)
        {
            searchTch();
        }

        private void searchTch() {

            DataTable dtshowTea = new DataTable();
            string fname = txtNameTeacher.Text.Trim();
            string lname = txtLnameTeacher.Text.Trim();
            string type = ddlTypeTeacher.Text.Trim();



            dtshowTea = BLL.Teacher.searchShowPageTchAdmin("", fname, lname, type);
            Session["tchShowGride"] = dtshowTea;
            bindteacher(0);
        
        }
        protected void gvShowTeacher_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            /********* ดึงรายวิชาขึ้น textbox *******************/
            try
            {
                DataTable dtshowTea = (DataTable)Session["tchShowGride"];

                if (e.CommandName == "getTeacher")
                {
                    string id = e.CommandArgument.ToString();
                    foreach (DataRow row in dtshowTea.Rows)
                    {
                        if ((row[0].ToString()).Equals(id))
                        {
                            lblid.Text = row[0].ToString();
                            txtShowTeacher.Text = "อาจารย์ " + row[1].ToString() + " " + row[2].ToString();
                            divShowTeacher.Visible = false;
                        }
                    }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
        }

        private void bindteacher(int pageindex)
        {
            this.gvShowTeacher.DataSource = this.Session["tchShowGride"];
            this.gvShowTeacher.PageIndex = pageindex;
            this.gvShowTeacher.DataBind();
        }

       


        protected void gvShowTeacher_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bindteacher(e.NewPageIndex);
        }

        protected void btnOpenPrevious_Click(object sender, EventArgs e)
        {
            btnOpenSubject.Visible = false;
            btnOpenNext.Visible = true;
            open1.Visible = true;
            openGroup.Visible = false;
            //showTch.Visible = false;
            //divShowClass.Visible = false;
            //btnOpenPrevious.Visible = false;
        }


        protected void ddlLevelOpenSubject_SelectedIndexChanged(object sender, EventArgs e)
        {/***************show dropdownlist ***********************/
         //   ddlclassOpenSubject.DataSource = "";
           // int level = Convert.ToInt32(ddlLevelOpenSubject.SelectedValue);
            int level = Convert.ToInt32(lbllevelOpen.Text);
            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            string yearEdu = "";

            switch (level)
            {
                case 1: yearEdu = year.ToString(); ; break;
                case 2: yearEdu = (year - 1).ToString(); ; break;
                case 3: yearEdu = (year - 2).ToString(); ; break;
                case 4: yearEdu = (year - 3).ToString(); ; break;
            }

          //  ddlclassOpenSubject.Items.Clear();  

            //int numClass = BLL.DetailTeach.selectNumClass(yearEdu);

            //for (int i = 1; i <= numClass; i++)
            //{
            //    ddlclassOpenSubject.Items.Add(new ListItem("ห้อง " + i.ToString(), i.ToString()));
            //}

        }

        #endregion

        protected void btnAddOpenDetailTeach_Click(object sender, EventArgs e)
        {

            int level = Convert.ToInt32(lbllevelOpen.Text);
            int year = Convert.ToInt32(Request.QueryString["year"].ToString());
            string group = ddlGroupstd.SelectedValue;
            string term = Request.QueryString["term"].ToString();
            string tchid = lblid.Text;
            string userid = Session["userid"].ToString();

            string codesubject = lblcodeSubjectOpenSubject.Text;

            if (txtShowTeacher.Text.Equals(""))
            {
                ShowMessageWeb("กรุณาเลือกอาจารย์ผู้สอน! ");
            }
            else
            {
                bool checkvalue = BLL.DetailTeach.checkValueDoubleShowgird(year.ToString(), level.ToString(), term, group, codesubject, userid, tchid);
                if (checkvalue)
                {

                    bool insertDetailTeach = BLL.DetailTeach.insertDetailTeach(year.ToString(), level.ToString(), term, group, codesubject, userid, tchid);
                    if (insertDetailTeach)
                    {
                        //ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น");
                        //GridViewShowDetailTeach.DataBind();
                        // showTitle.Visible = true;
                        searchShowGriddch();
                    }
                    else
                    {
                        ShowMessageWeb("ไม่สามารถบันทึกได้กรุณาตรวจสอบข้อมูลที่คุณบันทึก ! ");
                    }
                }
                else
                {
                    ShowMessageWeb("ข้อมูลมีอยู่แล้วไม่สามารถเพิ่มข้อมูลรายละเอียดการสอนนี้ได้");
                }
                searchShowGriddch();
            }


        }

        private void searchShowGriddch() {
            string code = lblcodeSubjectOpenSubject.Text;
            int year = Convert.ToInt32(Request.QueryString["year"].ToString())+543;
            string term = Request.QueryString["term"].ToString();
            DataTable dt = BLL.DetailTeach.searhShowdchOpenSubjectPopup(code,year,term);
            GridViewShowDetailTeach.DataSource = dt;
            GridViewShowDetailTeach.DataBind();
        }

        protected void GridViewShowDetailTeach_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "del")
            {
                    string dchId = e.CommandArgument.ToString();
                    bool del = BLL.DetailTeach.deleteDetailTeach(dchId);
                    if (del)
                    {
                        searchShowGriddch();
                    }

                }
        }

        protected void btnOpenSubject_Click(object sender, EventArgs e)
        {
           string dchid = lblDtchOpenSubject.Text;
           bool del = BLL.DetailTeach.deleteDetailTeach(dchid);
           if (del) {
               Response.Redirect(Request.Url.AbsoluteUri);
           }

        }


      
     
    
        



    }
}