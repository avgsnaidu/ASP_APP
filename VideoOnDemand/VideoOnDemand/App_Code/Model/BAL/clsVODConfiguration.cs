using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;

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
        public bool GetVODConfigurationDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("Select * from VOD_CONFIG");
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

    }
}