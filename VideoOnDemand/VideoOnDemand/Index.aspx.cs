using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Setup
{
    public partial class Index : System.Web.UI.Page
    {
        //bool setup1_Exists = false;
        //bool setup2_Exists = false;
        //bool setup3_Exists = false;
        //bool setup4_Exists = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            //setup1_Exists = IsAlreadyDBSetupExists()
            //setup2_Exists = IsAlreadyActiveDirectorySettingsExists();
            //setup3_Exists = IsAlreadyVODConfigurationSettingsExists();
            //setup4_Exists = IsAlreadySuperAdminDetailsExists();

            CheckingActiveDirectoryCredetials();



            if (CheckConnectionStringExists())
            {

                if (IsAlreadyDBSetupExists())
                {
                    if (IsAlreadyActiveDirectorySettingsExists())
                    {
                        if (IsAlreadyVODConfigurationSettingsExists())
                        {
                            if (IsAlreadySuperAdminDetailsExists())
                            {
                                Response.Redirect(@"~/Users.aspx");
                            }
                            else
                            {
                                Response.Redirect(@"~/Setup/setup4.aspx");
                            }
                        }
                        else
                        {
                            Response.Redirect(@"~/Setup/setup3.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect(@"~/Setup/setup2.aspx");
                    }
                }
                else
                {
                    Response.Redirect(@"~/Setup/setup1.aspx");
                }

            }
            else
            {
                Response.Redirect(@"~/Setup/setup1.aspx");
            }
        }

        private void CheckingActiveDirectoryCredetials()
        {
            PrincipalContext ctx = new PrincipalContext(ContextType.Domain);

            // find current user
            UserPrincipal user = UserPrincipal.Current;

            if (user != null)
            {
                string loginName = user.SamAccountName; // or whatever you mean by "login name"

            }    
        }


        private bool CheckConnectionStringExists()
        {
            clsDBSetup obj=new clsDBSetup();
            System.Configuration.Configuration rootWebConfig =
                 System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
            System.Configuration.ConnectionStringSettings connString;
            if (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0)
            {
                connString =
                    rootWebConfig.ConnectionStrings.ConnectionStrings["VODConnection"];
                if (connString != null && connString.ConnectionString != string.Empty)
                {
                    if (obj.GetValidConnectionString(connString.ConnectionString) != string.Empty)
                        return true;
                    else
                        return false;
                }
                else
                    return false;

            }
            else
                return false;
        }



        private bool IsAlreadySuperAdminDetailsExists()
        {
            clsSuperAdmin repository = new clsSuperAdmin();
            var ds = repository.GetSuperAdminDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }



        private bool IsAlreadyVODConfigurationSettingsExists()
        {
            clsVODConfiguration repository = new clsVODConfiguration();
            var ds = repository.GetVODConfigurationDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }



        private bool IsAlreadyActiveDirectorySettingsExists()
        {
            clsActiveDirectory repository = new clsActiveDirectory();
            var ds = repository.GetADDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }



        private bool IsAlreadyDBSetupExists()
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