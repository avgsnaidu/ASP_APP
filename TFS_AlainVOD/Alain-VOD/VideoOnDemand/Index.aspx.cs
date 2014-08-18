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
        clsIndex repository = new clsIndex();
        protected void Page_Load(object sender, EventArgs e)
        {
            //setup1_Exists = IsAlreadyDBSetupExists()
            //setup3_Exists = IsAlreadyVODConfigurationSettingsExists();
            //setup4_Exists = IsAlreadySuperAdminDetailsExists();

            if (!IsPostBack)
            {
                if (Application["SetupCompleted"] == null || Convert.ToBoolean(Application["SetupCompleted"].ToString()) == false)
                {
                    if (repository.CheckConnectionStringExists())
                    {
                        if (repository.IsAlreadyDBSetupExists())
                        {
                            if (repository.IsSMTPDetailsExist())
                            {
                                if (repository.IsAlreadyActiveDirectorySettingsExists())
                                {
                                    if (repository.IsAlreadyVODConfigurationSettingsExists())
                                    {
                                        if (repository.IsAlreadySuperAdminDetailsExists())
                                        {
                                            Application["SetupCompleted"] = true;
                                            if (!(Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString())))
                                            {
                                                Response.Redirect(@"~/WindowsUser.aspx");
                                            }
                                            else if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                                            {
                                                Response.Redirect(@"~/Admin/Users.aspx");
                                            }
                                        }
                                        else
                                        {
                                            Response.Redirect(@"~/Setup/step5.aspx");
                                        }
                                    }
                                    else
                                    {
                                        Response.Redirect(@"~/Setup/step4.aspx");
                                    }
                                }
                                else
                                {
                                    Response.Redirect(@"~/Setup/step3.aspx");
                                }
                            }
                            else
                            {
                                Response.Redirect(@"~/Setup/step2.aspx");
                            }
                        }
                        else
                        {
                            Response.Redirect(@"~/Setup/step1.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect(@"~/Setup/step1.aspx");
                    }
                }
                else
                {
                    if (!(Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString())))
                    {
                        Response.Redirect(@"~/WindowsUser.aspx");
                        //Response.Redirect(Request.Path);
                    }
                    else if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                    {
                        Response.Redirect(@"~/Admin/Users.aspx");
                        //Response.Redirect(Request.Path);

                    }
                }
            }
        }


    }
}