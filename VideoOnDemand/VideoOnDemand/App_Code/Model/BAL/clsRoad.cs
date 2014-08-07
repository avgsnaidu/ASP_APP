using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using VideoOnDemand.Model;

namespace VideoOnDemand.Model.BAL
{
    public class clsRoad
    {
        public string RoadName { get; set; }
        public int RoadNo { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddRoadDetails(char language)
        {
            string strSql = string.Empty;
            if (language == 'A')
                strSql = string.Format("Insert into Roads (ROAD_NO,NAME_ARB,DATE_CREATED)VALUES({0},N'{1}','{2}')",
                   RoadNo, RoadName, DateTime.Now);
            else
                strSql = string.Format("Insert into Roads (ROAD_NO,NAME_ENG,DATE_CREATED)VALUES({0},N'{1}','{2}')",
                  RoadNo, RoadName, DateTime.Now);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateRoadDetails(int roadNo, string roadName, char lang)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@RoadNo", SqlDbType.Int);
            p[0].Value = roadNo;
            p[1] = new SqlParameter("@RoadName", SqlDbType.NVarChar);
            p[1].Value = roadName;
            p[2] = new SqlParameter("@lang", SqlDbType.Char);
            p[2].Value = lang;

            string strSql = "UPDATE Roads SET Name_Eng=CASE WHEN @LANG='E' THEN @RoadName END, Name_Arb=CASE WHEN @LANG='A' THEN @RoadName END, DATE_UPDATED=GETDATE() where ROAD_NO=@RoadNo";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetRoadDetails(char language)
        {
            string strSql = string.Empty;

            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@lang", SqlDbType.Char);
            p[0].Value = language;

            strSql = string.Format("SELECT ROAD_NO,CASE WHEN @lang='A' THEN NAME_ARB WHEN @lang='E' THEN NAME_ENG END ROADNAME FROM ROADS ORDER BY ROADNAME");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql,p);
            return ds;
        }

        public bool DeleteRoad(int RoadNo)
        {
            string strSql = "DELETE FROM Roads WHERE ROAD_NO=" + RoadNo;
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }
    }
}