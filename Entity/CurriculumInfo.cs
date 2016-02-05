using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class CurriculumInfo
    {
        /* subject */
        private string _subID="";
        public string StructSub_Code
        {
            get { return _subID; }
            set { _subID = value; }
        }
        private string _subpass;
        public string StructSub_CodePass
        {
            get { return _subpass; }
            set { _subpass = value; }
        }

        private string _subNameTha = "";
        public string StructSub_NameTha
        {
            get { return _subNameTha; }
            set { _subNameTha = value; }
        }
        private string _subNameEn;
        public string StructSub_NameEn
        {
            get { return _subNameEn; }
            set { _subNameEn = value; }
        }

        private string _subCredit;
        public string StructSub_Credit
        {
            get { return _subCredit; }
            set { _subCredit = value; }
        }

        private string _detail;
        public string StructSub_Detail
        {
            get { return _detail; }
            set { _detail = value; }
        }


        /**Curiculum*/

         private string _curiID;
         public string Curri_Id
        {
            get { return _curiID; }
            set { _curiID = value; }
        }

         private string _curiYear;
         public string Curri_Year
         {
             get { return _curiYear; }
             set { _curiYear = value; }
         }

         private string _curiCourse;
         public string Curri_Course
         {
             get { return _curiCourse; }
             set { _curiCourse = value; }
         }

         private string _curiGroup;
         public string Curri_Group
         {
             get { return _curiGroup; }
             set { _curiGroup = value; }
         }

         private string _curiCredit;
         public string Curri_Credit
         {
             get { return _curiCredit; }
             set { _curiCredit = value; }
         }



        /*ShowPlanEducation*/

       
         private string _showPlanID;
         public string ShowPlan_Id
         {
             get { return _showPlanID; }
             set { _showPlanID = value; }
         }


         private string _ShowPlanYearUpdate;
         public string ShowPlan_YearUpdate
         {
             get { return _ShowPlanYearUpdate; }
             set { _ShowPlanYearUpdate = value; }
         }

         private string _showPlanYear;
         public string ShowPlan_Year
         {
             get { return _showPlanYear; }
             set { _showPlanYear = value; }
         }


         private string _ShowPlanSemester;
        public string ShowPlan_Semester
         {
             get { return _ShowPlanSemester; }
             set { _ShowPlanSemester = value; }
         }




        private string _createdate;
        public string Create_date
        {
            get { return _createdate; }
            set { _createdate = value; }
        }

        private string _endDate;
        public string Date_End
        {
            get { return _endDate; }
            set { _endDate = value; }
        }

        private string _createUser;
        public string Create_user
        {
            get { return _createUser; }
            set { _createUser = value; }
        }


    }
}
