using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VideoOnDemand
{

    public partial class VODMain : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                {
                    ulDropDown.Visible = true;
                }
                else
                {
                    ulDropDown.Visible = false;
                }


                if (!IsPostBack)
                {

                    string linkButtonID = Request.RawUrl;

                    if (-1 < linkButtonID.IndexOf("Users") || -1 < linkButtonID.IndexOf("GroupManagement") || -1 < linkButtonID.IndexOf("VideoManagement")
                        || -1 < linkButtonID.IndexOf("Search") || -1 < linkButtonID.IndexOf("Archived") || -1 < linkButtonID.IndexOf("Configuration"))
                    {
                        lnkDDMUserName.Visible = true;
                    }
                    else
                        lnkDDMUserName.Visible = false;

                    BindUserName();
                }


            }
            else
            {
                ulDropDown.Visible = false;
                lnkDDMUserName.Visible = false;
                //Response.Redirect("~/Error.aspx");
            }
        }

        private void BindUserName()
        {
            lnkDDMUserName.Text = "Welcome , " + Session["LoginUserName"];
        }


        protected void btnConfiguration_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Admin/Configuration.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            //FormsAuthentication.RedirectToLoginPage();
            Response.Redirect(@"~/Admin/Login.aspx");
        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                    Response.Redirect(@"~/Users.aspx");
                else
                    Response.Redirect(@"~/VideoManagement.aspx");
            }
        }

        protected void lnkEnglish_Click(object sender, EventArgs e)
        {
            Session["CurrentLanguage"] = "en-US";
        }

        protected void lnkArabic_Click(object sender, EventArgs e)
        {
            Session["CurrentLanguage"] = "ar";
        }


    }
}