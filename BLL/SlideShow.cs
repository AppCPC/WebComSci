using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class SlideShow
    {
        public string abcde;
        public static System.Data.DataTable LoadAll(string search)
        {
            // DAL.BranchNews dal = new DAL.BranchNews();
            try
            {
                //return dal.LoadAll(search);
                return DAL.SlideShow.LoadAll(search);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool insertBranchNews(Entity.SlideShow branch)
        {

            try
            {
                //return dal.LoadAll(search);
                return DAL.SlideShow.insertBranch(branch);
                //   return true;

            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }

        }

        public static Entity.SlideShow selectShowPopup(string id)
        {
            try
            {
                return DAL.SlideShow.selectShowPopup(id);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static bool UpdateBranch(Entity.SlideShow update)
        {
            try
            {
                return DAL.SlideShow.updateBranch(update);
            }
            catch (Exception)
            {

                return false;
            }

        }

        public static bool deleteBranch(string branchID)
        {
            try
            {
                return DAL.SlideShow.deleteBranch(branchID);
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
                return DAL.SlideShow.selectPicturePath(setBranchIDdelete);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static Entity.SlideShow selectShowNews()
        {

            return DAL.SlideShow.selectShowNews();
        }



        public static Entity.SlideShow selectBranchNewsShowDetailNewsPage(string query)
        {
            return DAL.SlideShow.selectBranchNewsShowDetailNewsPage(query);
        }

        public static System.Data.DataTable selectShowSlideShowHomePage()
        {
            return DAL.SlideShow.selectShowSlideShowHomePage();
        }
    }
}
