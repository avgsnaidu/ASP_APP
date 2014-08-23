using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsIndex
    {
        public bool IsSMTPDetailsExist()
        {
            clsConfiguration repositoryConfig = new clsConfiguration();
            var ds = repositoryConfig.GetEmailServerDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }


        public bool CheckConnectionStringExists()
        {
            string connString = ClsConnectionString.getConnectionString();
            clsDBSetup obj = new clsDBSetup();
            if (connString != null && connString != string.Empty)
            {
                if (obj.GetValidConnectionString(connString) != string.Empty)
                    return true;
                else
                    return false;
            }
            else
                return false;
        }



        public bool IsAlreadySuperAdminDetailsExists()
        {
            clsSuperAdmin repository = new clsSuperAdmin();
            var ds = repository.GetSuperAdminDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }



        public bool IsAlreadyVODConfigurationSettingsExists()
        {
            clsVODConfiguration repository = new clsVODConfiguration();
            var ds = repository.GetVODConfigurationDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }



        public bool IsAlreadyActiveDirectorySettingsExists()
        {
            clsActiveDirectory repository = new clsActiveDirectory();
            var ds = repository.GetADDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }



        public bool IsAlreadyDBSetupExists()
        {
            clsDBSetup repository = new clsDBSetup();
            var ds = repository.GetDBDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }


    }
}