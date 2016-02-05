using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class StudentNews
    {

        public static System.Data.DataTable LoadAll(string search)
        {
            // DAL.BranchNews dal = new DAL.BranchNews();
            try
            {
                //return dal.LoadAll(search);
                return DAL.StudentNews.LoadAll(search);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool insertStdNews(Entity.StudentNewsInfo branch)
        {

            try
            {

                return DAL.StudentNews.insertStudent(branch);
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }

        }

        public static Entity.StudentNewsInfo selectShowPopup(string id)
        {
            try
            {
                return DAL.StudentNews.selectShowPopup(id);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static bool UpdateStdNews(Entity.StudentNewsInfo update)
        {
            try
            {
                return DAL.StudentNews.updateStudentNews(update);
            }
            catch (Exception)
            {

                return false;
            }

        }

        public static bool deleteStdNews(string branchID)
        {
            try
            {
                return DAL.StudentNews.deleteStdNews(branchID);
            }
            catch (Exception)
            {

                return false;
            }

        }

        public static string getPictreForDel(string setBranchIDdelete)
        {
            try
            {
                return DAL.StudentNews.selectPicturePath(setBranchIDdelete);
            }
            catch (Exception)
            {

                return null;
            }

        }



        public static Entity.StudentNewsInfo selectTrainingNewsShowDetailNewsPage(string query)
        {
            return DAL.StudentNews.selectTrainingNewsShowDetailNewsPage(query);
        }
    }
}
