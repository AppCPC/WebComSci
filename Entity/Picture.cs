using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class Picture
    {
        private string _id = "";
        public string Picture_ID
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _albumID = "";
        public string Album_ID
        {
            get { return _albumID; }
            set { _albumID = value; }
        }

        private string _picname = "";
        public string Picture_Name
        {
            get { return _picname; }
            set { _picname = value; }
        }

        private string _picdetail = "";
        public string Picture_Detail
        {
            get { return _picdetail; }
            set { _picdetail = value; }
        }

        private string _picturePath = "";
        public string Picture_Path
        {
            get { return _picturePath; }
            set { _picturePath = value; }
        }

        
    }
}
