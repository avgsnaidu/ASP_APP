using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsArchive
    {
        public DataSet GetArchiveList()
        {
            string strSql = string.Empty;

            strSql = "Select A.FILE_NAME,G.GROUP_NAME,G.DESCRIPTION,A.TAGS_ENG FROM ARCHIVE A JOIN GROUPS G ON G.GROUP_ID = A.GROUP_ID";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);

            return ds;
        }
    }
}