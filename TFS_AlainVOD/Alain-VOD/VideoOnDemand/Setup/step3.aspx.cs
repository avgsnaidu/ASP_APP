using System;
using System.Collections.Generic;
using System.DirectoryServices;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Setup
{
    public partial class ActiveDirectoryInfo : System.Web.UI.Page
    {

        clsActiveDirectory repository = new clsActiveDirectory();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    string StyleSheetPath = string.Empty;
            //    if (Session["CurrentCulture"].ToString() == "ar")
            //        StyleSheetPath = "Content/css/style_arabic.css";
            //    else
            //        StyleSheetPath = "";

            //    string styleFormat = "<LINK href='{0}' type='text/css' rel='stylesheet'>";

            //    string linkText;
            //    linkText = String.Format(styleFormat, StyleSheetPath);
            //    StyleSheet.Text = linkText;


            //}
        }

        protected void GoToVODConfigurationPage_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            bool intResult = true;

            clsActiveDirectory repository = new clsActiveDirectory();

            repository.IP = HttpUtility.HtmlEncode(txtADServerId.Text.Trim());
            repository.Userid = HttpUtility.HtmlEncode(txtADUserName.Text.Trim());
            repository.Password = HttpUtility.HtmlEncode(txtADPassword.Text.Trim());
            repository.DomainName = HttpUtility.HtmlEncode(txtDomain.Text.Trim());
            repository.CreatedDate = DateTime.Now;
            repository.ModifiedDate = DateTime.Now;

            try
            {

                if (TestActiveDirectoryDetails(repository.DomainName, repository.Userid, repository.Password))
                {

                    intResult = repository.AddADDetails();

                    bool domainResult = repository.AddADDomainDetails();
                    Response.Redirect("~/Setup/step4.aspx");
                }
                else
                {
                    StringBuilder sb = new StringBuilder();
                    lblMessage.Text = Resources.Setup.SMTP_MSG_Connection_Failed;
                    //lblMessage.Text = Resources.Setup.DBS_MSG_LoginAlreadyExists;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append(@"</script>");
                    //ClientScript.RegisterStartupScript(GetType(), "connectionNotValid", sb.ToString(), false);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowConnectionresultModal", sb.ToString(), false);

                }
            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                repository = null;
            }

        }

        protected void btnTestAD_Click(object sender, EventArgs e)
        {
            StringBuilder sb = null;
            string domainName = HttpUtility.HtmlEncode(txtDomain.Text.Trim());
            string userName = HttpUtility.HtmlEncode(txtADUserName.Text.Trim());
            string password = HttpUtility.HtmlEncode(txtADPassword.Text.Trim());

            ViewState["Password"] = password;
            txtADPassword.Attributes.Add("value", ViewState["Password"].ToString());

            bool AdResult = TestActiveDirectoryDetails(domainName, userName, password);

            if (AdResult)
            {
                sb = new System.Text.StringBuilder();
                lblMessage.Text = Resources.Setup.SMTP_MSG_Connection_Sucess;
                //lblMessage.Text = Resources.Setup.DBS_MSG_LoginAlreadyExists;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(GetType(), "connectionNotValid", sb.ToString(), false);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowConnectionresultModal", sb.ToString(), false);
            }
            else
            {
                sb = new System.Text.StringBuilder();
                lblMessage.Text = Resources.Setup.SMTP_MSG_Connection_Failed;
                //lblMessage.Text = Resources.Setup.DBS_MSG_LoginAlreadyExists;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(GetType(), "connectionNotValid", sb.ToString(), false);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowConnectionresultModal", sb.ToString(), false);

            }
        }


        private bool TestActiveDirectoryDetails(string SearchOnDomain, string userName, string password)
        {

            try
            {
                DirectoryEntry myLdapConnection = new DirectoryEntry("LDAP://" + SearchOnDomain, userName, password);
                DirectorySearcher search = new DirectorySearcher(myLdapConnection) { Filter = ("(&(objectClass=user)(objectCategory=person))") };
                search.CacheResults = true;
                //search.SearchScope = SearchScope.Subtree;
                SearchResultCollection allResults = search.FindAll();

                var allres = allResults;

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


    }
}