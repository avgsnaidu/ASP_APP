using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model;
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

            repository.SourceFolder = HttpUtility.HtmlEncode(txtSourceFolder.Text.Trim());
            repository.TargetFolder = HttpUtility.HtmlEncode(txtDestFolder.Text.Trim());
            repository.ArchiveFolder = HttpUtility.HtmlEncode(txtArchiveFolder.Text.Trim());
            repository.BackupFolder = HttpUtility.HtmlEncode(txtBackUpFolder.Text.Trim());
            try
            {
                char schedularFlag;
                double interval = 0.00;
                if (ddlInterval.SelectedItem.Value != "0")
                {
                    schedularFlag = 'R';
                    interval = Convert.ToDouble(ddlInterval.SelectedItem.Value);
                }
                else
                {
                    schedularFlag = 'F';
                    interval = (double)DecimalToTimeConverters.ToDecimal(Convert.ToDateTime(txtScheduleInterval.Text.Trim()));
                    //var span = DateTime.ParseExact(.ToString(),"yyyy.MM.dd HH:mm:ss.fff",
                    //           CultureInfo.InvariantCulture).ToOADate();  
                }

                repository.SchedulerFlag = schedularFlag;
                repository.SchedulerHours = interval;

                //if (!string.IsNullOrEmpty(ddlSimultaneous.SelectedValue))
                //    repository.SimultaneousConversions = Convert.ToInt16(ddlSimultaneous.SelectedValue);
                //else
                //    repository.SimultaneousConversions = default(int) + 1;

                repository.SimultaneousConversions = Convert.ToInt32(string.IsNullOrEmpty(ConfigurationManager.AppSettings["VODSimultaneousConversions"].ToString()) ? "5" : ConfigurationManager.AppSettings["VODSimultaneousConversions"].ToString());

                repository.CreatedDate = DateTime.Now;
                //repository.ModifiedDate = DateTime.Now; 

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

        //private bool IsSourceFolderExists(string path)
        //{
        //    if (false == Directory.Exists(path))
        //    {
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}

        //private bool IsDestinationFolderExists(string path)
        //{
        //    if (false == Directory.Exists(path))
        //    {
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}

        //private bool IsBackUpFolderExists(string path)
        //{
        //    if (false == Directory.Exists(path))
        //    {
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}

        //private bool IsArchiveFolderExists(string path)
        //{
        //    if (false == Directory.Exists(path))
        //    {
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}

        protected void custSourceVald_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (repository.IsFolderExists(txtSourceFolder.Text.Trim()))
                args.IsValid = true;

        }

        protected void custDestValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (repository.IsFolderExists(txtDestFolder.Text.Trim()))
                args.IsValid = true;
        }


        protected void custArchValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (repository.IsFolderExists(txtArchiveFolder.Text.Trim()))
                args.IsValid = true;
        }

        protected void custBackValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (repository.IsFolderExists(txtBackUpFolder.Text.Trim()))
                args.IsValid = true;

        }

        protected void custIntervalTimeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (ddlInterval.SelectedValue != "0" || !string.IsNullOrEmpty(txtScheduleInterval.Text.Trim()))
            {

                //string pattern = "\\d{1,2}:\\d{2}\\s*(AM|PM)";
                string pattern = "\\d{1,2}:\\d{2}";

                if (!string.IsNullOrEmpty(txtScheduleInterval.Text.Trim()) && ddlInterval.SelectedValue == "0")
                {
                    if (!Regex.IsMatch(txtScheduleInterval.Text, pattern, RegexOptions.CultureInvariant))
                    {
                        //MessageBox.Show("Not a valid time format ('hh:mm AM|PM').");
                        //e.Cancel = true;
                        //box.Select(0, box.Text.Length);
                        custIntervalValidator.ErrorMessage = Resources.Setup.VOD_Time_Valid;
                        return;
                    }
                }
                args.IsValid = true;
            }
        }


    }
}