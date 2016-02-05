using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class Album
    {
        public static System.Data.DataTable LoadAll(string search)
        {
            // DAL.BranchNews dal = new DAL.BranchNews();
            try
            {
                //return dal.LoadAll(search);
                return DAL.Album.LoadAlbum(search);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static System.Data.DataTable CountAlbum()
        {
            // DAL.BranchNews dal = new DAL.BranchNews();
            try
            {
                //return dal.LoadAll(search);
                return DAL.Album.CountAlbum();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool insertAlbum(Entity.AlbumPicture album)
        {

            try
            {

                return DAL.Album.insertAlbum(album);
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
    }
}
