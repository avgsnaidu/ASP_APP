using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using VideoOnDemand.Model;
using System.Data.OleDb;

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
            int returnVal = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateRoadDetails(int roadNo, string roadName, char lang)
        {
            OleDbParameter[] p = new OleDbParameter[5];
            p[0] = new OleDbParameter("@lang", OleDbType.Char);
            p[0].Value = lang;
            p[1] = new OleDbParameter("@RoadName", OleDbType.VarWChar);
            p[1].Value = roadName;
            p[2] = new OleDbParameter("@lang2", OleDbType.Char);
            p[2].Value = lang;
            p[3] = new OleDbParameter("@RoadName2", OleDbType.VarWChar);
            p[3].Value = roadName;
            p[4] = new OleDbParameter("@RoadNo", OleDbType.Integer);
            p[4].Value = roadNo;

            string strSql = "UPDATE Roads SET Name_Eng=CASE WHEN ?='E' THEN ? END, Name_Arb=CASE WHEN ?='A' THEN ? END, DATE_UPDATED=GETDATE() where ROAD_NO=?";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetRoadDetails(char language)
        {
            string strSql = string.Empty;

            OleDbParameter[] p = new OleDbParameter[2];
            p[0] = new OleDbParameter("@lang", OleDbType.Char);
            p[0].Value = language;
            p[1] = new OleDbParameter("@lang2", OleDbType.Char);
            p[1].Value = language;

            strSql = string.Format("SELECT ROAD_NO,CASE WHEN ?='A' THEN NAME_ARB WHEN ?='E' THEN NAME_ENG END ROADNAME FROM ROADS ORDER BY ROADNAME");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            return ds;
        }

        public bool DeleteRoad(int RoadNo)
        {
            string strSql = "DELETE FROM Roads WHERE ROAD_NO=" + RoadNo;
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }
    }
}