using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class AssuranceInfo
    {
        private string _id;
        public string Assurance_ID
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _name;
        public string Assurance_Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private string _detail;
        public string Assurance_Detail
        {
            get { return _detail; }
            set { _detail = value; }
        }

        private string _path;
        public string Assurance_Path
        {
            get { return _path; }
            set { _path = value; }
        }


        private string _status;
        public string Assurance_status
        {
            get { return _status; }
            set { _status = value; }
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

        private string _updatedate;
        public string Update_date
        {
            get { return _updatedate; }
            set { _updatedate = value; }
        }

        private string _updateUser;
        public string Update_user
        {
            get { return _updateUser; }
            set { _updateUser = value; }
        }




    }
}
