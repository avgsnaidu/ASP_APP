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
        public string Name_Eng { get; set; }
        public string Name_Arb { get; set; }
        public int RoadNo { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddRoadDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("Insert into Roads (NAME_ENG,NAME_ARB,DATE_CREATED,DATE_UPDATED)VALUES('{0}','{1}','{2}','{3}')",
                Name_Eng, Name_Arb, DateTime.Now, (DateTime?)null);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateRoadDetails(int RoadNo, string NameEng, string NameArb)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@RoadNo", SqlDbType.Int);
            p[0].Value = RoadNo;
            p[1] = new SqlParameter("@NameEng", SqlDbType.NVarChar);
            p[1].Value = NameEng;
            p[2] = new SqlParameter("@NameArb", SqlDbType.NVarChar);
            p[2].Value = NameArb;

            string strSql = "UPDATE Roads SET Name_Eng=@NameEng, Name_Arb=@NameArb, DATE_UPDATED=GETDATE() where ROAD_NO=@RoadNo";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetRoadDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT ROAD_NO,Name_Eng,Name_Arb FROM Roads order by date_Created desc");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
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