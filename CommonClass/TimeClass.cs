using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace CommonClass
{
    public class TimeClass
    {
        public string GetDateInMonth(string month)
        {
            string year = "0";
            string N_SMonth = "";
            string date = "";
            switch (month)
            {
                case "ม.ค.":
                    N_SMonth = "01";
                    date = "31"; break;
                case "ก.พ.":
                    N_SMonth = "02";
                    if ((Convert.ToInt32(year) - 543) % 4 == 0) { date = "29"; }
                    else { date = "28"; }; break;
                case "มี.ค.":
                    N_SMonth = "03";
                    date = "31"; break;
                case "เม.ย.":
                    N_SMonth = "04";
                    date = "30"; break;
                case "พ.ค.":
                    N_SMonth = "05";
                    date = "31"; break;
                case "มิ.ย.":
                    N_SMonth = "06";
                    date = "30"; break;
                case "ก.ค.":
                    N_SMonth = "07";
                    date = "31"; break;
                case "ส.ค.":
                    N_SMonth = "08";
                    date = "31"; break;
                case "ก.ย.":
                    N_SMonth = "09";
                    date = "30"; break;
                case "ต.ค.":
                    N_SMonth = "10";
                    date = "31"; break;
                case "พ.ย.":
                    N_SMonth = "11";
                    date = "30"; break;
                case "ธ.ค.":
                    N_SMonth = "12";
                    date = "31"; break;
            }

            return N_SMonth;
        }

        public static string dateTimePost(string ddate, string dtime)
        {
            try
            {
                DateTime dob = Convert.ToDateTime(ddate);
                string time = dtime;
                int year = Convert.ToInt32(dob.Year) + 543;
                string ddt = dob.Day + "/" + dob.Month + "/" + year + " " + time;
                DateTime date = Convert.ToDateTime(ddt);
                string da = ToTimeSinceString(date);
                return da;
            }
            catch (Exception)
            {
                return "string date time isn't format ! ";
            }
        }

        private static string ToTimeSinceString(DateTime date)
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
                return (string.Format("{0} ชัวโมงที่แล้ว", timeSince.Hours) + " เวลา  " + time + " น.");
            if (timeSince.TotalDays == 1)
                return ("1 วันที่แล้ว " + "เวลา : " + time);
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