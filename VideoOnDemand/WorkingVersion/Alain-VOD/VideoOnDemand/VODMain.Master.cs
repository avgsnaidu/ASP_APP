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
        protected System.Web.UI.WebControls.Literal StyleSheet;

        private static string arabicStyleSheet;
        public static string styleFormat = "";
        public string StyleFormat { get { return styleFormat; } set { styleFormat = value; } }
        public static string ArabicStyleSheet { get { return arabicStyleSheet; } set { arabicStyleSheet = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                AdjustArabicSriptUrl();
                AdjustLauguageLinks();
            }


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
                    //AdjustArabicSriptUrl();


                    string linkButtonID = Request.RawUrl;



                    if (-1 < linkButtonID.ToLower().IndexOf("step1") || -1 < linkButtonID.ToLower().IndexOf("step2")
                       || -1 < linkButtonID.ToLower().IndexOf("step3")
                       || -1 < linkButtonID.ToLower().IndexOf("step4")
                       || -1 < linkButtonID.ToLower().IndexOf("step5")
                       || -1 < linkButtonID.ToLower().IndexOf("login")
                       || -1 < linkButtonID.ToLower().IndexOf("resetpassword"))
                    {
                        lnkDDMUserName.Visible = false;
                    }
                    else
                        lnkDDMUserName.Visible = true;

                    BindUserName();
                }


            }
            else
            {
                ulDropDown.Visible = false;
                lnkDDMUserName.Visible = false;
                //Response.Redirect("~/WindowsUser.aspx");
            }
        }

        private void AdjustArabicSriptUrl()
        {
            if (Session["CurrentCulture"] != null && Session["CurrentCulture"].ToString() == "ar")
                SetArabicStyleSheet();

            styleFormat = "<LINK href='{0}' type='text/css' rel='stylesheet'>";

            string linkText;
            linkText = String.Format(styleFormat, StyleSheetPath);
            StyleSheet.Text = linkText;
        }

        private void AdjustLauguageLinks()
        {
            if (BasePage.CurrentLanguage == 'E')
            {
                lnkEnglish.Enabled = false;
                lnkArabic.Enabled = true;
                lnkEnglish.Style.Add("text-decoration", "none");
                lnkArabic.Style.Add("text-decoration", "underline");
                lnkEnglish.Style.Add("color", "#C0C0C0");
                lnkArabic.Style.Add("color", "#ed1b23");
            }
            else
            {
                lnkEnglish.Enabled = true;
                lnkArabic.Enabled = false;
                lnkArabic.Style.Add("text-decoration", "none");
                lnkArabic.Style.Add("color", "#C0C0C0");
                lnkEnglish.Style.Add("color", "#ed1b23");
                lnkEnglish.Style.Add("text-decoration", "underline");

            }
        }

        private void BindUserName()
        {
            if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
            {
                string conCat = ", Super Admin (" + Session["LoginUserName"].ToString() + ")";
                ltlUserName.Text = Resources.MasterData.logedUserWelcome_Text + conCat;

            }
            else
                lnkDDMUserName.Text = Resources.MasterData.logedUserWelcome_Text + ", " + Session["LoginUserName"];
        }


        protected void btnConfiguration_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Admin/Configuration.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            //Session.Clear();
            ClearSessionVariables();

            FormsAuthentication.SignOut();
            //FormsAuthentication.RedirectToLoginPage();
            Response.Redirect(@"~/Admin/Login.aspx");
        }

        public void ClearSessionVariables()
        {
            Session.Remove("LoginUserName");
            Session.Remove("IsAdmin");
            Session.Remove("IsUser");
            Session.Remove("SearchOn");
            Session.Remove("searchKeyword");
            Session.Remove("COMMUNITY_NO");
            Session.Remove("DomainID");
            Session.Remove("EmailServerID");
            Session.Remove("StrmServerID");
            Session.Remove("ConnectionChangeWithAdmin");
            Session.Remove("DISTRICT_NO");
            Session.Remove("GroupID");
            Session.Remove("ROAD_NO");
            Session.Remove("FilterBy");
            Session.Remove("selectedDomain");
            Session.Remove("selectedStatus");
            Session.Remove("selectedGroup");
            Session.Remove("UserID");
            Session.Remove("GroupIDs");
        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                    Response.Redirect(@"~/Admin/Users.aspx");
                else
                    Response.Redirect(@"~/User/VideoSearch.aspx");
            }
            else
            {

                AdjustArabicSriptUrl();
                AdjustLauguageLinks();
                Response.Redirect(@"~/Admin/Login.aspx");
            }
        }

        protected void lnkEnglish_Click(object sender, EventArgs e)
        {
            LinkButton senderLink = sender as LinkButton;

            ArabicStyleSheet = "";

            //store requested language as new culture in the session
            Session["CurrentCulture"] = senderLink.CommandArgument;

            //reload last requested page with new culture
            Response.Redirect(Request.Path);


        }

        protected void lnkArabic_Click(object sender, EventArgs e)
        {

            //if (Session["CurrentCulture"] != null && !string.IsNullOrEmpty(Session["CurrentCulture"].ToString()) && Session["CurrentCulture"].ToString() == "ar-QA")
            if (Session["CurrentCulture"] != null && !string.IsNullOrEmpty(Session["CurrentCulture"].ToString()))
                SetArabicStyleSheet();
            //"Content/css/style_arabic.css"

            LinkButton senderLink = sender as LinkButton;


            //store requested language as new culture in the session
            Session["CurrentCulture"] = senderLink.CommandArgument;

            //reload last requested page with new culture
            Response.Redirect(Request.Path);


        }

        private static void SetArabicStyleSheet()
        {
            ArabicStyleSheet = "Content/css/style_arabic.css";
        }



        private string ApplicationPath
        {
            get
            {
                string result = Request.ApplicationPath;
                if (!result.EndsWith("/"))
                {
                    result += "/";
                }
                return result;
            }
        }


        protected string StyleSheetPath
        {
            get
            {
                // pull the stylesheet name from a database or xml file...

                return string.IsNullOrEmpty(ArabicStyleSheet) ? "." : (ApplicationPath + ArabicStyleSheet);
            }
        }

    }
}