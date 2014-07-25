using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
using System.Data;
using System.Data.SqlClient;

namespace VideoOnDemand.Model.BAL
{
    public class clsVODConfiguration
    {
        public string SourceFolder { get; set; }
        public string TargetFolder { get; set; }
        public string ArchiveFolder { get; set; }
        public string BackupFolder { get; set; }
        public string SchedulerFlag { get; set; }
        public int SchedulerHours { get; set; }
        public int ConfigId { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddVODConfigurationDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("INSERT INTO VOD_CONFIG (SOURCE_FOLDER,TARGET_FOLDER,ARCHIVE_FOLDER,BACKUP_FOLDER,SCHEDULER_FLAG,SCHEDULER_HOURS_INTERVAL,DATE_CREATED,DATE_UPDATED)VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')",
                SourceFolder, TargetFolder, ArchiveFolder, BackupFolder, SchedulerFlag, SchedulerHours, DateTime.Now, (DateTime?)null);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateVODDetails(int configid, string Src, string Dest, string Arch, string Backup, char SchedulFlag, double Schedulehrs)
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@Source", SqlDbType.NVarChar);
            p[0].Value = Src;
            p[1] = new SqlParameter("@Dest", SqlDbType.NVarChar);
            p[1].Value = Dest;
            p[2] = new SqlParameter("@Archive", SqlDbType.NVarChar);
            p[2].Value = Arch;
            p[3] = new SqlParameter("@configid", SqlDbType.Int);
            p[3].Value = configid;
            p[4] = new SqlParameter("@Backup", SqlDbType.NVarChar);
            p[4].Value = Backup;
            p[5] = new SqlParameter("@SchedulFlag", SqlDbType.Char);
            p[5].Value = SchedulFlag;
            p[6] = new SqlParameter("@Schedulehrs", SqlDbType.Float);
            p[6].Value = Schedulehrs;

            string strSql = "UPDATE VOD_CONFIG SET SOURCE_FOLDER=@Source ,TARGET_FOLDER=@Dest, ARCHIVE_FOLDER=@Archive, BACKUP_FOLDER=@Backup,SCHEDULER_FLAG=@SchedulFlag, SCHEDULER_HOURS_INTERVAL=@Schedulehrs,DATE_UPDATED=GETDATE() where CONFIG_ID=@configid";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetVODConfigurationDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1  CONFIG_ID,SOURCE_FOLDER,TARGET_FOLDER,ARCHIVE_FOLDER,BACKUP_FOLDER,SCHEDULER_FLAG,SCHEDULER_HOURS_INTERVAL FROM VOD_CONFIG order by date_Created desc ");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

    }
}