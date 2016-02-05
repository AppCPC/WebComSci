using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class AlbumPicture
    {
        private string _id = "";
        public string Album_ID
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _albumName = "";
        public string Album_Name
        {
            get { return _albumName; }
            set { _albumName = value; }
        }

        private string _createUser = "";
        public string Create_User
        {
            get { return _createUser; }
            set { _createUser = value; }
        }

        
    }
}
