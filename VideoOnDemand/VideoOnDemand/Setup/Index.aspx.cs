using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoOnDemand.Setup
{
    public partial class Index : System.Web.UI.Page
    {
        bool setup1_Exists = false;
        bool setup2_Exists = false;
        bool setup3_Exists = false;
        bool setup4_Exists = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            //setup1_Exists = IsAlreadyDBSetupExists()
            //setup2_Exists = IsAlreadyActiveDirectorySettingsExists();
            //setup3_Exists = IsAlreadyVODConfigurationSettingsExists();
            //setup4_Exists = IsAlreadySuperAdminDetailsExists();

            if (IsAlreadyDBSetupExists())
            {
                if (IsAlreadyActiveDirectorySettingsExists())
                {
                    if (IsAlreadyVODConfigurationSettingsExists())
                    {
                        if (IsAlreadySuperAdminDetailsExists())
                        {
                            Response.Redirect(@"~/VODManage/UserManagement.aspx");
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

        private bool IsAlreadySuperAdminDetailsExists()
        {
            return true;
        }

        private bool IsAlreadyVODConfigurationSettingsExists()
        {
            return true;
        }

        private bool IsAlreadyActiveDirectorySettingsExists()
        {
            return true;
        }

        private bool IsAlreadyDBSetupExists()
        {
            return true;
        }

    }
}