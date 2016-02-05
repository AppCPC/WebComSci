using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;

namespace CommonClass
{
    public class GeneralClass
    {
        public static string spliteFun(string textSplite, char splite, int IndextSplit)
        {
            string[] word = textSplite.Split(splite);
            int i = 1;
            string spite = "";
            foreach (string item in word)
            {
                if (i == IndextSplit)
                {
                    spite = item;
                } i++;
            }
            return spite;
        }

        public static Boolean VerifyPeopleID(String PID)
        {
            //ตรวจสอบว่าทุก ๆ ตัวอักษรเป็นตัวเลข
            if (PID.ToCharArray().All(c => char.IsNumber(c)) == false)

                return false;

            //ตรวจสอบว่าข้อมูลมีทั้งหมด 13 ตัวอักษร

            if (PID.Trim().Length != 13)

                return false;

            int sumValue = 0;

            for (int i = 0; i < PID.Length - 1; i++)

                sumValue += int.Parse(PID[i].ToString()) * (13 - i);

            int v = 11 - (sumValue % 11);

            return PID[12].ToString() == v.ToString();
        }

        public static string showIp()
        {
            IPHostEntry host;
            string localIP = "?";
            host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (IPAddress ip in host.AddressList)
            {
                if (ip.AddressFamily.ToString() == "InterNetwork")
                {
                    localIP = ip.ToString();
                }
            }
            return localIP;
        }

        public string encrypFun(string sData)
        {
            try
            {
                byte[] encData_byte = new byte[sData.Length];
                encData_byte = System.Text.Encoding.UTF8.GetBytes(sData);
                string encodedData = Convert.ToBase64String(encData_byte);
                return encodedData;
            }

            catch (Exception ex)
            {
                throw new Exception("Error in base64Encode" + ex.Message);
            }
        }

        public string decryptFun(string sData)
        {
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            System.Text.Decoder utf8Decode = encoder.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(sData);
            int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            string result = new string(decoded_char);

            return result;
        }
    }
}