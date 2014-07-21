using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsVideoManagement
    {
        public DataSet GetVideosList()
        {
            string strSql = string.Empty;
            strSql = "SELECT VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.Text AS STATUS,TAGS_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Code";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }


    }
}