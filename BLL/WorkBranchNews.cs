using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class WorkBranchNews
    {

        public static System.Data.DataTable LoadAll(string search)
        {
            try
            {
                return DAL.WorkBranchNews.LoadAll(search);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool insertWorkBranchNews(Entity.WorkBranchNewsInfo branch)
        {

            try
            {

                return DAL.WorkBranchNews.insertWorkBranchNews(branch);
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }

        }

        public static Entity.WorkBranchNewsInfo selectShowPopup(string id)
        {
            try
            {
                return DAL.WorkBranchNews.selectShowPopup(id);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static bool UpdateWorkBranchNews(Entity.WorkBranchNewsInfo update)
        {
            try
            {
                return DAL.WorkBranchNews.updateWorkBranchNews(update);
            }
            catch (Exception)
            {

                return false;
            }

        }

        public static bool deleteWorkBranchNews(string branchID)
        {
            try
            {
                return DAL.Assurance.deleteAssurance(branchID);
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
                return DAL.WorkBranchNews.selectPicturePath(setDelete);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static Entity.WorkBranchNewsInfo selectTrainingNewsShowDetailNewsPage(string query)
        {
            return DAL.WorkBranchNews.selectTrainingNewsShowDetailNewsPage(query);
        }
    }
}
