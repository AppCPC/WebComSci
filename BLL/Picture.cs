using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class Picture
    {

        public static bool insertPicture(Entity.Picture picture)
        {

            try
            {

                return DAL.Picture.insertPicture(picture);
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }

        }
    }
}
