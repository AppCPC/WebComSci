using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
   public  class Assurance
    {
        public static System.Data.DataTable LoadAll(string search)
        {
            // DAL.BranchNews dal = new DAL.BranchNews();
            try
            {
                //return dal.LoadAll(search);
                return DAL.Assurance.LoadAll(search);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool insertAssurance(Entity.AssuranceInfo branch)
        {

            try
            {

                return DAL.Assurance.insertAssurance(branch);
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }

        }

        public static Entity.AssuranceInfo selectShowPopup(string id)
        {
            try
            {
                return DAL.Assurance.selectShowPopup(id);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static bool UpdateAssurance(Entity.AssuranceInfo update)
        {
            try
            {
                return DAL.Assurance.updateAssurance(update);
            }
            catch (Exception)
            {

                return false;
            }

        }

        public static bool deleteAssurance(string assuranceID)
        {
            try
            {
                return DAL.Assurance.deleteAssurance(assuranceID);
            }
            catch (Exception)
            {

                return false;
            }

        }

        public static string getPictreForDel(string setDelete)
        {
            try
            {
                return DAL.Assurance.selectPicturePath(setDelete);
            }
            catch (Exception)
            {

                return null;
            }

        }
    }
}
