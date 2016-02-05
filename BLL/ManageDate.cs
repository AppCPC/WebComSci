using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
   public class ManageDate
    {
        public static System.Data.DataTable manageYear()
        {
            return DAL.ManageDate.manateYear();
        }
    }
}
