using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections;

namespace Common
{
    public class DistrictDataTable
    {
        public static DataTable SelectDistinct(string[] pColumnNames, DataTable pOriginalTable)
        {
            /*Method District Select in Data Table*/

            DataTable distinctTable = new DataTable();

            int numColumns = pColumnNames.Length;

            for (int i = 0; i < numColumns; i++)
            {

                distinctTable.Columns.Add(pColumnNames[i], pOriginalTable.Columns[pColumnNames[i]].DataType);

            }

            Hashtable trackData = new Hashtable();

            foreach (DataRow currentOriginalRow in pOriginalTable.Rows)
            {

                StringBuilder hashData = new StringBuilder();

                DataRow newRow = distinctTable.NewRow();

                for (int i = 0; i < numColumns; i++)
                {

                    hashData.Append(currentOriginalRow[pColumnNames[i]].ToString());

                    newRow[pColumnNames[i]] = currentOriginalRow[pColumnNames[i]];

                }

                if (!trackData.ContainsKey(hashData.ToString()))
                {

                    trackData.Add(hashData.ToString(), null);

                    distinctTable.Rows.Add(newRow);

                }

            }

            return distinctTable;

        }
    }
}
