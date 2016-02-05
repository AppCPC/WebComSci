using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;

namespace CommonClass
{
     public class timeFun
    {

       public  static string functionCheckDatePostComment(string ddate, string dtime)
         {

             DateTime dob = Convert.ToDateTime(ddate);
             string time = dtime;
             int year = Convert.ToInt32(dob.Year) + 543;
             string ddt = dob.Day + "/" + dob.Month + "/" + year + " " + time;
             DateTime date = Convert.ToDateTime(ddt);
             string da = ToTimeSinceString(date);
             return da;

         }

        public static string ToTimeSinceString(DateTime date)  
        {


            TimeSpan timeSince = DateTime.Now.Subtract(date);
            string time = date.ToString("H:mm:ss", CultureInfo.InvariantCulture);

            if (timeSince.TotalMilliseconds < 1)
                return "ไม่กี่วินาทีที่แล้ว";
            if (timeSince.TotalMinutes < 1)
                return "ไม่กี่วินาทีที่แล้ว";
            if (timeSince.TotalMinutes < 2)
                return "1 นาทีที่แล้ว";
            if (timeSince.TotalMinutes < 60)
                return string.Format("{0} นาทีที่แล้ว", timeSince.Minutes);
            if (timeSince.TotalMinutes < 120)
                return "1 ชั่วโมงที่แล้ว";
            if (timeSince.TotalHours < 24)
                return (string.Format("{0} ชัวโมงที่แล้ว", timeSince.Hours) + " เวลา  " + time+" น.");
            if (timeSince.TotalDays == 1)
                return ("1 วันที่แล้ว "+ "เวลา : " + time);
            if (timeSince.TotalDays < 7)
                return (string.Format("{0} วันที่แล้ว", timeSince.Days) + " เวลา  " + time + " น.");
            if (timeSince.TotalDays < 14)
                return (" สัปดาห์ที่แล้ว" + " เวลา  " + time + " น.");
            if (timeSince.TotalDays < 21)
                return ("2 สัปดาห์ที่แล้ว " + " เวลา  " + time + " น.");
            if (timeSince.TotalDays < 28)
                return ("3 สัปดาห์ที่แล้ว" + " เวลา  " + time + " น.");
            if (timeSince.TotalDays < 60)
                return ("เดือนที่แล้ว" + " เวลา  " + time + " น.");
            if (timeSince.TotalDays < 365)
                return (string.Format("{0} เดือนที่แล้ว", Math.Round(timeSince.TotalDays / 30)) + " เวลา  " + time + " น.");
            if (timeSince.TotalDays < 730)
                return ("ปีที่แล้ว" + " เวลา  " + time + " น.");

            //last but not least...
            return (string.Format("{0} ปีที่แล้ว", Math.Round(timeSince.TotalDays / 365)) + " เวลา  " + time + " น.");

            // referenc : http://aeykay.blogspot.com/2012/10/facebook-like-time-ago-function.html
  
        }
  
    }
}
