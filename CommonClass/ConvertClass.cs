using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CommonClass
{
    public class ConvertClass
    {
        #region convertClass

        public static double ConvertToDouble(object pObj)
        {
            string strTemp = ConvertToString(pObj);

            if (strTemp != "")
            {
                try
                {
                    return double.Parse(pObj.ToString());
                }
                catch
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        public static string ConvertToString(object pObj)
        {
            if (pObj == null)
            {
                return string.Empty;
            }
            else
            {
                return Convert.ToString(pObj).Trim();
            }
        }

        public static int ConvertToInt(object pObj)
        {
            string strTemp = ConvertToString(pObj);

            if (strTemp != "")
            {
                try
                {
                    return int.Parse(pObj.ToString());
                }
                catch
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        #endregion convertClass

        #region checknull

        public static string CheckNull(Object obj)
        {
            try
            {
                if (obj == null)
                {
                    return string.Empty;
                }
                return obj.ToString();
            }
            catch
            {
                return string.Empty;
            }
        }

        public static string CheckNull(Object obj, string strIfNullReturn)
        {
            try
            {
                if (obj == null)
                {
                    return strIfNullReturn;
                }
                else
                {
                    if (obj.ToString() == "")
                        return strIfNullReturn;
                }
                return obj.ToString();
            }
            catch
            {
                return strIfNullReturn;
            }
        }

        #endregion checknull
    }
}