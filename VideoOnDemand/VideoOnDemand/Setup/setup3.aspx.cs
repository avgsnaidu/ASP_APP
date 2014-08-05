using System;
using System.Collections.Generic;
using System.Linq;
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



            //clsVODConfiguration vod = new clsVODConfiguration();

            ////vod.ConfigId = Convert.ToInt32(hdVODConfig.Value);
            //int configId = Convert.ToInt32(hdVODConfig.Value);
            //string source = txtSrcFold.Text.Trim();
            //string archive = txtArchiveFold.Text.Trim();
            //string target = txtDestFolder.Text.Trim();
            //string backUp = txtBackupFold.Text.Trim();
            //double interval = 0.00;

            //char schedularFlag;
            //if (ddlInterval.SelectedItem.Value != "0")
            //{
            //    schedularFlag = 'R';
            //    interval = Convert.ToDouble(ddlInterval.SelectedItem.Value);
            //}
            //else
            //{
            //    schedularFlag = 'F';
            //    interval = Convert.ToDateTime(txtScheduleInterval.Text.Trim()).ToOADate() / 10000.0;
            //    //var span = DateTime.ParseExact(.ToString(),"yyyy.MM.dd HH:mm:ss.fff",
            //    //           CultureInfo.InvariantCulture).ToOADate(); 

            //}

            //int simultaneousConvertions = Convert.ToInt32(ddlSimultaneous.SelectedItem.Value);

            //try
            //{
            //    intResult = vod.UpdateVODDetails(configId, source, target, archive, backUp, schedularFlag, interval, simultaneousConvertions);

            //}
            //catch (Exception ee)
            //{
            //    ee.Message.ToString();
            //}



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
                 


                if (!string.IsNullOrEmpty(ddlSimultaneous.SelectedValue))
                    repository.SimultaneousConversions = Convert.ToInt16(ddlSimultaneous.SelectedValue);
                else
                    repository.SimultaneousConversions = default(int) + 1;

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
    }
}