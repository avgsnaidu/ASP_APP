using System;
using System.Collections.Generic;
using System.Data;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Setup
{
    public partial class Index : BasePage
    {
        //bool setup1_Exists = false;
        //bool setup2_Exists = false;
        //bool setup3_Exists = false;
        //bool setup4_Exists = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            //setup1_Exists = IsAlreadyDBSetupExists()
            //setup3_Exists = IsAlreadyVODConfigurationSettingsExists();
            //setup4_Exists = IsAlreadySuperAdminDetailsExists();

            if (!IsPostBack)
            {

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
                                    if (!(Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString())))
                                    {
                                        Response.Redirect(@"~/WindowsUser.aspx");
                                    }
                                    else if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                                    {
                                        Response.Redirect(@"~/Users.aspx");
                                    }
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
        }


        private bool CheckConnectionStringExists()
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

            //clsDBSetup obj = new clsDBSetup();
            //System.Configuration.Configuration rootWebConfig =
            //     System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
            //System.Configuration.ConnectionStringSettings connString;
            //if (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0)
            //{
            //    connString =
            //        rootWebConfig.ConnectionStrings.ConnectionStrings["VODConnection"];
            //    if (connString != null && connString.ConnectionString != string.Empty)
            //    {
            //        if (obj.GetValidConnectionString(connString.ConnectionString) != string.Empty)
            //            return true;
            //        else
            //            return false;
            //    }
            //    else
            //        return false;

            //}
            //else
            //    return false;
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