using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsArchive
    {
        public DataSet GetArchiveList(char lanugage)
        {
            string strSql = string.Empty;
            
            if (lanugage == 'A')
                strSql = "SELECT ARCHIVEID ,VIDEONAME AS FILENAME, Case " +
                        "WHEN (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) " +
                        "LIKE '%,'  THEN LEFT((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) , LEN((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')))-1) " +
                         "ELSE  (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) END AS TAG  " +
                          ",DATE_CREATED AS ARCHIVEDDATE  FROM VW_ARCHIVES_WITH_TAGS_ARB VD";
            else
                strSql = "SELECT ARCHIVEID ,VIDEONAME AS FILENAME, Case " +
                        "WHEN (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) " +
                        "LIKE '%,'  THEN LEFT((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) , LEN((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')))-1) " +
                         "ELSE  (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) END AS TAG  " +
                          ",DATE_CREATED AS ARCHIVEDDATE  FROM VW_ARCHIVES_WITH_TAGS VD ";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);

            return ds;
        }

        public DataSet GetSearchedArchiveList(string searchKeyword, char language)
        {

            DataSet ds;

            string strSql = string.Empty;
            string table = string.Empty;

            if (language == 'A')
                table = "VW_ARCHIVES_WITH_TAGS_ARB";
            else
                table = "VW_ARCHIVES_WITH_TAGS";

            strSql = " Select VIDEONAME AS [FILENAME], Case  WHEN (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,''))  " +
                                    " LIKE '%,'  THEN LEFT((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) , LEN((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')))-1) " +
                                    " ELSE  (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) END AS TAG " +
                                     " ,DATE_CREATED AS ARCHIVEDDATE  from " + table + " WHERE " +
                                      "COMMUNITY like'%" + searchKeyword + "%'" +
                        " OR District like'%" + searchKeyword + "%'" +
                        " OR ROAD like'%" + searchKeyword + "%'";

            ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;

        }

    }
}