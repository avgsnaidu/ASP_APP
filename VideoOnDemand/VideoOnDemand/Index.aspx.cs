using System;
using System.Collections.Generic;
using System.Data;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Web;
using System.Web.Security;
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
                                if (ValidateActiveDirectoryCredetials())
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

        private bool ValidateActiveDirectoryCredetials()
        {
            PrincipalContext ctx = new PrincipalContext(ContextType.Domain);

            // find current user
            UserPrincipal user = UserPrincipal.Current;
            string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            string DomainName = Environment.UserDomainName;
            //string UName = Environment.UserName;

            if (user != null)
            {
                string loginName = user.SamAccountName; // or whatever you mean by "login name"
                if (loginName != string.Empty)
                {
                    DataSet ds = AuthenticateWidowsUserWithDB(loginName, DomainName);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        //SELECT USER_ID AS USERID,NAME AS LOGINNAME,DOMAIN,FULL_NAME AS FULLNAME,GROUP_ID AS LOGINGroupID

                        Session["LoginUserName"] = ds.Tables[0].Rows[0]["LOGINNAME"].ToString();
                        Session["UserFullName"] = ds.Tables[0].Rows[0]["FULLNAME"].ToString();
                        Session["LOGINGroupId"] = ds.Tables[0].Rows[0]["LOGINGroupID"].ToString();
                        Session["IsAdmin"] = false;

                        FormsAuthentication.RedirectFromLoginPage(Session["LoginUserName"].ToString(), true);

                        return true;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            else
                return false;
        }

        private DataSet AuthenticateWidowsUserWithDB(string loginName, string domain)
        {
            clsUserManagement repository = new clsUserManagement();
            DataSet userData = null;
            repository.IsAuthenticateLoginUser(loginName, domain, ref userData);
            return userData;
        }


        private bool CheckConnectionStringExists()
        {
            clsDBSetup obj = new clsDBSetup();
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