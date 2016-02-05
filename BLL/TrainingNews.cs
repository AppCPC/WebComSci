using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class TrainingNews
    {

        public static System.Data.DataTable LoadAll(string search)
        {
            // DAL.BranchNews dal = new DAL.BranchNews();
            try
            {
                //return dal.LoadAll(search);
                return DAL.TrainingNews.LoadAll(search);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool insertTrainingNews(Entity.TrainingNewsInfo train)
        {

            try
            {

                return DAL.TrainingNews.insertTrainingNews(train);
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }

        }

        public static Entity.TrainingNewsInfo selectShowPopup(string id)
        {
            try
            {
                return DAL.TrainingNews.selectShowPopup(id);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static bool UpdateTrainingNews(Entity.TrainingNewsInfo update)
        {
            try
            {
                return DAL.TrainingNews.updateTraining(update);
            }
            catch (Exception)
            {

                return false;
            }

        }

        public static bool deleteTrainingNews(string trainID)
        {
            try
            {
                return DAL.TrainingNews.deleteTraining(trainID);
            }
            catch (Exception)
            {

                return false;
            }

        }

        public static string getPictreForDel(string setTrainIDdelete)
        {
            try
            {
                return DAL.TrainingNews.selectPicturePath(setTrainIDdelete);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static Entity.TrainingNewsInfo selectTrainingNewsShowDetailNewsPage(string query)
        {
            return DAL.TrainingNews.selectTrainingNewsShowDetailNewsPage(query);
        }
    }
}
