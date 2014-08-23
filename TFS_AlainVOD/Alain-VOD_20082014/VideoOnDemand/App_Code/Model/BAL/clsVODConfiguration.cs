using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;

namespace VideoOnDemand.Model.BAL
{
    public class clsVODConfiguration
    {
        public string SourceFolder { get; set; }
        public string TargetFolder { get; set; }
        public string ArchiveFolder { get; set; }
        public string BackupFolder { get; set; }
        public char SchedulerFlag { get; set; }
        public double SchedulerHours { get; set; }
        public int ConfigId { get; set; }
        public int SimultaneousConversions { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddVODConfigurationDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("INSERT INTO VOD_CONFIG (SOURCE_FOLDER,TARGET_FOLDER,ARCHIVE_FOLDER,BACKUP_FOLDER,SCHEDULER_FLAG,SCHEDULER_HOURS_INTERVAL,SIMULT_CONVERSIONS,DATE_CREATED)VALUES('N{0}','N{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}')",
                SourceFolder, TargetFolder, ArchiveFolder, BackupFolder, SchedulerFlag, SchedulerHours, SimultaneousConversions, DateTime.Now);
            int returnVal = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateVODDetails(int configid, string Src, string Dest, string Arch, string Backup, char SchedulFlag, double Schedulehrs, int simultaneousConversions)
        {
            OleDbParameter[] p = new OleDbParameter[8];
            p[0] = new OleDbParameter("@Source", OleDbType.VarWChar);
            p[0].Value = Src;
            p[1] = new OleDbParameter("@Dest", OleDbType.VarWChar);
            p[1].Value = Dest;
            p[2] = new OleDbParameter("@Archive", OleDbType.VarWChar);
            p[2].Value = Arch;
            p[3] = new OleDbParameter("@Backup", OleDbType.VarWChar);
            p[3].Value = Backup;
            p[4] = new OleDbParameter("@SchedulFlag", SqlDbType.NChar);
            p[4].Value = SchedulFlag;
            p[5] = new OleDbParameter("@Schedulehrs", SqlDbType.Float);
            p[5].Value = Schedulehrs;
            p[6] = new OleDbParameter("@SimultConversions", OleDbType.Integer);
            p[6].Value = simultaneousConversions;
            p[7] = new OleDbParameter("@configid", OleDbType.Integer);
            p[7].Value = configid;

            string strSql = "UPDATE VOD_CONFIG SET SOURCE_FOLDER=? ,TARGET_FOLDER=?, ARCHIVE_FOLDER=?, BACKUP_FOLDER=?," +
                " SCHEDULER_FLAG=?, SCHEDULER_HOURS_INTERVAL=?,SIMULT_CONVERSIONS=?, DATE_UPDATED=GETDATE() where CONFIG_ID=?";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetVODConfigurationDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1 [CONFIG_ID] ,[SOURCE_FOLDER],[TARGET_FOLDER],[ARCHIVE_FOLDER],[BACKUP_FOLDER],[SCHEDULER_FLAG],[SCHEDULER_HOURS_INTERVAL] ,[SIMULT_CONVERSIONS]  FROM [VOD_CONFIG]order by date_Created desc ");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public bool IsFolderExists(string path)
        {
            if (false == Directory.Exists(path))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

    }
}