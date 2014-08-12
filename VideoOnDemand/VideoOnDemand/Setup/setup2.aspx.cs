using System;
using System.Collections.Generic;
using System.Linq;
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
                intResult = repository.AddADDetails();

                bool domainResult = repository.AddADDomainDetails();

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                repository = null;
            }
            Response.Redirect("~/Setup/setup3.aspx");
        }
    }
}