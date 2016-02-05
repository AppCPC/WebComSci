using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class BranchNews
    {

       public string abcde;
        public static System.Data.DataTable LoadAll(string search)
        {    
           // DAL.BranchNews dal = new DAL.BranchNews();
            try
            {
                //return dal.LoadAll(search);
                return DAL.BranchNews.LoadAll(search);
              
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool insertBranchNews(Entity.BranchNewsInfo branch) {

           try
            {
                //return dal.LoadAll(search);
            return DAL.BranchNews.insertBranch(branch);
             //   return true;

            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        
        }

        public static Entity.BranchNewsInfo selectShowPopup(string id)
        {
            try
            {
                 return DAL.BranchNews.selectShowPopup(id);
            }
            catch (Exception)
            {

                return null;
            }
    
        }

        public static bool UpdateBranch(Entity.BranchNewsInfo update)
        {
            try
            {
                return DAL.BranchNews.updateBranch(update);
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
                 return DAL.BranchNews.deleteBranch(branchID);
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
                  return DAL.BranchNews.selectPicturePath(setBranchIDdelete);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public static Entity.BranchNewsInfo selectShowNews()
        {

            return DAL.BranchNews.selectShowNews();
        }



        public static Entity.BranchNewsInfo selectBranchNewsShowDetailNewsPage(string query)
        {
            return DAL.BranchNews.selectBranchNewsShowDetailNewsPage(query);
        }
    }
}
