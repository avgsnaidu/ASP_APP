using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Setup
{
    public partial class VODConfiguration : System.Web.UI.Page
    {
        clsVODConfiguration repository = new clsVODConfiguration();
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

        protected void GoToSuperAdminInfo_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            bool intResult = true;

            clsVODConfiguration repository = new clsVODConfiguration();

            repository.SourceFolder = txtSourceFolder.Text;
            repository.TargetFolder = txtDestFolder.Text;
            repository.ArchiveFolder = txtArchiveFolder.Text;
            repository.BackupFolder = txtBackUpFolder.Text;
            repository.SchedulerFlag = ddlInterval.Text;
            repository.SchedulerHours = Convert.ToInt32(ddlInterval.SelectedItem.Value);
            repository.CreatedDate = DateTime.Now;
            repository.ModifiedDate = DateTime.Now;

            try
            {
                intResult = repository.AddVODConfigurationDetails();

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                repository = null;
            }
            Response.Redirect("~/Setup/setup4.aspx");
        }
    }
}