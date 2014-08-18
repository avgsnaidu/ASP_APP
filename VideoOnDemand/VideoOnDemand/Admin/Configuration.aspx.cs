using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Admin
{
    public partial class Configuration : BasePage
    {
        clsDBSetup dbSetup = new clsDBSetup();
        clsActiveDirectory activeDirectory = new clsActiveDirectory();
        clsVODConfiguration vodConfiguration = new clsVODConfiguration();
        clsSuperAdmin superAdmin = new clsSuperAdmin();
        clsConfiguration repositoryConfig = new clsConfiguration();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
            {
                if (!IsPostBack)
                {
                    BindConfiguration();
                    BindStreamingServer();
                    BindEmailServerDetails();
                }
            }
            else
                Response.Redirect("~/Admin/login.aspx");
        }


        void BindConfiguration()
        {
            DataSet ds;
            clsDBSetup dbSetup = new clsDBSetup();
            clsActiveDirectory activeDirectory = new clsActiveDirectory();
            clsVODConfiguration vodConfiguration = new clsVODConfiguration();
            clsSuperAdmin superAdmin = new clsSuperAdmin();

            try
            {
                ds = dbSetup.GetDBDetails();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    hdConfigId.Value = ds.Tables[0].Rows[i]["CONFIG_ID"].ToString();

                    txtAddress.Text = ds.Tables[0].Rows[i]["IP"].ToString();
                    txtIpAddress.Text = ds.Tables[0].Rows[i]["IP"].ToString();
                    var port = ds.Tables[0].Rows[i]["Port"].ToString();
                    txtPort.Text = (port == "0") ? "" : port;
                    lblDataPort.Text = (port == "0") ? "" : port;

                    txtDatabase.Text = ds.Tables[0].Rows[i]["Name"].ToString();
                    lbltxtDatabase.Text = ds.Tables[0].Rows[i]["Name"].ToString();

                    txtUser.Text = ds.Tables[0].Rows[i]["Userid"].ToString();
                    txtUserId.Text = ds.Tables[0].Rows[i]["Userid"].ToString();

                    //txtDbPassword.Text = ds.Tables[0].Rows[i]["Password"].ToString();
                    ViewState["DBPassword"] = ds.Tables[0].Rows[i]["Password"].ToString();

                    lblDataPassword.Text = ds.Tables[0].Rows[i]["Password"].ToString();
                }
                ds = activeDirectory.GetADDetails();
                DataSet dsDomain = activeDirectory.GetADDomainDetails();
                if (dsDomain != null && dsDomain.Tables[0].Rows.Count > 0)
                {
                    lblDomainValue.Text = dsDomain.Tables[0].Rows[0]["DomainName"].ToString();
                    txtDomain.Text = dsDomain.Tables[0].Rows[0]["DomainName"].ToString().Trim();
                    Session["DomainID"] = dsDomain.Tables[0].Rows[0]["ID"].ToString().Trim();
                }
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    hdAdConfigId.Value = ds.Tables[0].Rows[i]["CONFIG_ID"].ToString();

                    lblADServerIdValue.Text = ds.Tables[0].Rows[i]["IP"].ToString();
                    txtADServerId.Text = ds.Tables[0].Rows[i]["IP"].ToString();

                    txtUsername.Text = ds.Tables[0].Rows[i]["Userid"].ToString();
                    lblADUserNameValue.Text = ds.Tables[0].Rows[i]["Userid"].ToString();

                    ViewState["ADPassword"] = ds.Tables[0].Rows[i]["Password"].ToString();
                    lblADPasswordValue.Text = ds.Tables[0].Rows[i]["Password"].ToString();
                }
                ds = vodConfiguration.GetVODConfigurationDetails();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    hdVODConfig.Value = ds.Tables[0].Rows[i]["CONFIG_ID"].ToString();

                    lblSrcFolderValue.Text = ds.Tables[0].Rows[i]["SOURCE_FOLDER"].ToString();
                    txtSrcFold.Text = ds.Tables[0].Rows[i]["SOURCE_FOLDER"].ToString();

                    lblDestFolderValue.Text = ds.Tables[0].Rows[i]["TARGET_FOLDER"].ToString();
                    txtDstFold.Text = ds.Tables[0].Rows[i]["TARGET_FOLDER"].ToString();

                    lblArchiveFolderValue.Text = ds.Tables[0].Rows[i]["ARCHIVE_FOLDER"].ToString();
                    txtArchiveFold.Text = ds.Tables[0].Rows[i]["ARCHIVE_FOLDER"].ToString();

                    txtBack.Text = ds.Tables[0].Rows[i]["BACKUP_FOLDER"].ToString();
                    txtBackupFold.Text = ds.Tables[0].Rows[i]["BACKUP_FOLDER"].ToString();

                    if (ds.Tables[0].Rows[i]["SCHEDULER_FLAG"].ToString() == "R")
                    {
                        string stringConcat = string.Format(Resources.Config.SchedularIntervalRepeatText, ds.Tables[0].Rows[i]["SCHEDULER_HOURS_INTERVAL"].ToString());
                        lblScheduleValue.Text = stringConcat;
                        ddlInterval.Items.FindByValue(Convert.ToInt32(ds.Tables[0].Rows[i]["SCHEDULER_HOURS_INTERVAL"]).ToString()).Selected = true;

                    }
                    else if (ds.Tables[0].Rows[i]["SCHEDULER_FLAG"].ToString() == "F")
                    {
                        string stringConcat = string.Format(Resources.Config.SchedularIntervalFixedText, Get12HoursFormat(ds.Tables[0].Rows[i]["SCHEDULER_HOURS_INTERVAL"].ToString()));
                        lblScheduleValue.Text = stringConcat;
                        txtScheduleInterval.Text = DecimalToTimeConverters.ToDateTime(Convert.ToDecimal(ds.Tables[0].Rows[i]["SCHEDULER_HOURS_INTERVAL"])).ToLongTimeString();

                        //txtSchedule.Text = ds.Tables[0].Rows[i]["SCHEDULER_FLAG"].ToString();
                        //ddlInterval.Text = ds.Tables[0].Rows[i]["SCHEDULER_FLAG"].ToString();

                    }

                    lblVideoConversionValue.Text = ds.Tables[0].Rows[i]["SIMULT_CONVERSIONS"].ToString();

                    ddlSimultaneous.Items.FindByValue(ds.Tables[0].Rows[i]["SIMULT_CONVERSIONS"].ToString()).Selected = true;





                }
                ds = superAdmin.GetSuperAdminDetails();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    hdSuperAdmin.Value = ds.Tables[0].Rows[i]["CONFIG_ID"].ToString();

                    txtSuperUser.Text = ds.Tables[0].Rows[i]["USERID"].ToString();
                    txtSuperUsername.Text = ds.Tables[0].Rows[i]["USERID"].ToString();

                    txtAdminPassword.Text = ds.Tables[0].Rows[i]["PASSWORD"].ToString();
                    txtSupPassword.Text = ds.Tables[0].Rows[i]["PASSWORD"].ToString();

                    txtEmail.Text = ds.Tables[0].Rows[i]["EMAIL"].ToString();
                    txtSuperEmail.Text = ds.Tables[0].Rows[i]["EMAIL"].ToString();
                }

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                dbSetup = null;
            }
        }

        private string Get12HoursFormat(string time)
        {
            DateTime date = new DateTime(1900, 1, 1);
            date = date.AddHours(Convert.ToDouble(time.Substring(0, time.IndexOf('.'))));
            date = date.AddMinutes(Convert.ToDouble(time.Substring(time.IndexOf('.') + 1, time.Length - (time.IndexOf('.') + 1))));
            return date.ToString("hh:mm tt");
        }

        private void BindEmailServerDetails()
        {
            DataSet ds = repositoryConfig.GetEmailServerDetails();
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblEsdServernameValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["SERVERNAME"].ToString());
                lblESDPortValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["PORT"].ToString());
                lblESDReplyEmailValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["REPLY_TO_EMAIL"].ToString());
                lblESDSenderNameValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["SENDER_NAME"].ToString());
                lblESDEmailTypeValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["EMAIL_TYPE"].ToString());

                lblESDTlsEnabledValue.Text = (Convert.ToBoolean(ds.Tables[0].Rows[0]["TLS_Enabled"].ToString()) == true) ? "Yes" : "No";
                lblESDUserNameValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["USERNAME"].ToString());
                lblESDPwdValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["PASSWORD"].ToString());


                Session["EmailServerID"] = ds.Tables[0].Rows[0]["EmailServerId"].ToString();
            }
            else
            {
                Session["EmailServerID"] = 0;
            }
        }





        private void BindStreamingServer()
        {
            DataSet ds = repositoryConfig.GetStreamingServerDetails();
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblSSDServerNameValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["SERVERNAME"].ToString());
                lblSSDPortValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["PORT"].ToString());
                lblSSDUserIdValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["USERID"].ToString());
                lblSSDPasswordValue.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["PASSWORD"].ToString());
                Session["StrmServerID"] = ds.Tables[0].Rows[0]["StreamingServerId"].ToString();
            }
            else
            {
                Session["StrmServerID"] = 0;
            }
        }

        private void BindStreamingServerPopup()
        {
            DataSet ds = repositoryConfig.GetStreamingServerDetails();
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtStreaminServerId.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["SERVERNAME"].ToString());
                txtStrSerPort.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["PORT"].ToString());
                txtStremserUsername.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["USERID"].ToString());
                txtStrserPwd.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["PASSWORD"].ToString());
                Session["StrmServerID"] = ds.Tables[0].Rows[0]["StreamingServerId"].ToString();
            }
            else
            {
                Session["StrmServerID"] = 0;
            }
        }

        private void BindEmailServerDetailsPopup()
        {
            DataSet ds = repositoryConfig.GetEmailServerDetails();
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtEmailServerId.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["SERVERNAME"].ToString());
                txtEmailSerPort.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["PORT"].ToString());
                txtEmailServReplyToEmail.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["REPLY_TO_EMAIL"].ToString());
                txtEmailSenderName.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["SENDER_NAME"].ToString());
                ddlESDMailType.Items.FindByValue(HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["EMAIL_TYPE"].ToString())).Selected = true;

                chkTlsEnabled.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["TLS_Enabled"].ToString());
                txtEmailSerUsername.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["USERNAME"].ToString());
                txtEmailPassword.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["PASSWORD"].ToString());


                Session["EmailServerID"] = ds.Tables[0].Rows[0]["EmailServerId"].ToString();
            }
            else
            {
                Session["EmailServerID"] = 0;
            }
        }




        protected void btnSaveDB_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            btnSaveDb.Enabled = false;

            bool intResult = true;

            clsDBSetup repository = new clsDBSetup();

            repository.ConfigId = Convert.ToInt32(hdConfigId.Value);

            try
            {
                string validString = dbSetup.GetValidConnectionString(txtIpAddress.Text.Trim(), txtDatabase.Text.Trim(), txtPort.Text.Trim(),
                     txtUserId.Text.Trim(), string.IsNullOrEmpty(txtDbPassword.Text.Trim()) ? ViewState["DBPassword"].ToString() : txtDbPassword.Text.Trim());
                if (!string.IsNullOrEmpty(validString))
                {
                    if (ClsConnectionString.WriteConnectionStringToFile(txtDatabase.Text.Trim(), txtIpAddress.Text.Trim(), txtPort.Text.Trim(), txtUserId.Text.Trim(), txtDbPassword.Text.Trim()))
                    {
                        intResult = repository.UpdateDBDetails(Convert.ToInt32(hdConfigId.Value), txtIpAddress.Text.Trim(),
                            string.IsNullOrEmpty(txtPort.Text.Trim()) ? 0 : Convert.ToInt16(txtPort.Text.Trim()), txtDatabase.Text.Trim(), txtUserId.Text.Trim(), string.IsNullOrEmpty(txtDbPassword.Text.Trim()) ? ViewState["DBPassword"].ToString() : txtDbPassword.Text.Trim());
                    }
                    else
                    {
                        lblMessage.Text = Resources.Config.MSG_Provide_Valid_Connection;
                        StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#mdlDbSetup').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "validConnectModalScript", sb.ToString(), false);
                    }
                }
                else
                {
                    lblMessage.Text = Resources.Config.MSG_Provide_Valid_Connection;
                    StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#mdlDbSetup').modal('hide');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "validConnectModalScript", sb.ToString(), false);
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
            BindConfiguration();
            Response.Redirect("~/Admin/Configuration.aspx");

        }


        protected void btnSaveAD_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            bool intResult = true;

            clsActiveDirectory activedirectory = new clsActiveDirectory();

            activedirectory.ConfigId = Convert.ToInt32(hdAdConfigId.Value);

            try
            {
                intResult = activedirectory.UpdateADDetails(Convert.ToInt32(hdAdConfigId.Value), txtADServerId.Text.Trim(),
                    txtUsername.Text.Trim(), txtADPassword.Text.Trim(), (Session["DomainID"] != null) ? Convert.ToInt32(Session["DomainID"].ToString()) : 0, txtDomain.Text.Trim());

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                activedirectory = null;
            }
            BindConfiguration();
            Response.Redirect("~/Admin/Configuration.aspx");

        }

        protected void btnSaveVOD_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            bool intResult = true;
            clsVODConfiguration vod = new clsVODConfiguration();

            //vod.ConfigId = Convert.ToInt32(hdVODConfig.Value);
            int configId = Convert.ToInt32(hdVODConfig.Value);
            string source = HttpUtility.HtmlEncode(txtSrcFold.Text.Trim());
            string archive = HttpUtility.HtmlEncode(txtArchiveFold.Text.Trim());
            string target = HttpUtility.HtmlEncode(txtDstFold.Text.Trim());
            string backUp = HttpUtility.HtmlEncode(txtBackupFold.Text.Trim());
            double interval = 0.00;
            try
            {
                char schedularFlag;
                if (ddlInterval.SelectedItem.Value != "0")
                {
                    schedularFlag = 'R';
                    interval = Convert.ToDouble(ddlInterval.SelectedItem.Value);
                }
                else
                {
                    schedularFlag = 'F';
                    interval = (double)DecimalToTimeConverters.ToDecimal(Convert.ToDateTime(txtScheduleInterval.Text.Trim()));

                    //interval = Convert.ToDateTime(txtScheduleInterval.Text.Trim()).ToOADate()/10000.0;
                    //var span = DateTime.ParseExact(.ToString(),"yyyy.MM.dd HH:mm:ss.fff",
                    //           CultureInfo.InvariantCulture).ToOADate(); 

                }

                int simultaneousConvertions = Convert.ToInt32(ddlSimultaneous.SelectedItem.Value);

                intResult = vod.UpdateVODDetails(configId, source, target, archive, backUp, schedularFlag, interval, simultaneousConvertions);

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                vod = null;
            }
            BindConfiguration();
            Response.Redirect(Request.RawUrl);

        }

        protected void btnSaveSuperAdmin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            bool intResult = true;

            clsSuperAdmin superAdmin = new clsSuperAdmin();

            superAdmin.ConfigId = Convert.ToInt32(hdSuperAdmin.Value);

            try
            {
                intResult = superAdmin.UpdateSuperDetails(Convert.ToInt32(hdSuperAdmin.Value), txtSuperUsername.Text.Trim(), txtSupPassword.Text.Trim(), txtSuperEmail.Text.Trim());

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                superAdmin = null;
            }
            BindConfiguration();
            Response.Redirect("~/Admin/Configuration.aspx");

        }

        protected void btnStreaminServerSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            bool IsSucess = default(bool);
            if (!string.IsNullOrEmpty(Session["StrmServerID"].ToString()) && Convert.ToInt16(Session["StrmServerID"].ToString()) > 0)
            {
                IsSucess = repositoryConfig.UpdateStreamingServerDetails(Convert.ToInt16(Session["StrmServerID"].ToString()), txtStreaminServerId.Text.Trim(),
                 Convert.ToInt32(txtStrSerPort.Text.Trim()), txtStremserUsername.Text.Trim(), txtStrserPwd.Text.Trim());
            }
            else
            {
                IsSucess = repositoryConfig.InsertStreamingServerDetails(txtStreaminServerId.Text.Trim(),
                  Convert.ToInt32(txtStrSerPort.Text.Trim()), txtStremserUsername.Text.Trim(), txtStrserPwd.Text.Trim());
            }

            if (IsSucess)
            {
                BindStreamingServer();
                lblMessage.Text = Resources.Config.MSG_SteramingServer_Saved_Sucess;
                StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#mdlStreamServer').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StrmHideModalScript", sb.ToString(), false);
            }
            else
            {
                lblMessage.Text = Resources.Config.MSG_StreamingServer_Save_Failed;
                StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#mdlStreamServer').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StrmHideModalScript", sb.ToString(), false);
            }

        }

        protected void btnEmailSerSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            bool IsSucess = default(bool);

            if (!string.IsNullOrEmpty(Session["EmailServerID"].ToString()) && Convert.ToInt16(Session["EmailServerID"].ToString()) > 0)
            {
                IsSucess = repositoryConfig.UpdateEmailServerDetails(Convert.ToInt16(Session["EmailServerID"].ToString()), txtEmailServerId.Text.Trim(),
                 Convert.ToInt32(txtEmailSerPort.Text.Trim()), txtEmailServReplyToEmail.Text.Trim(), txtEmailSenderName.Text.Trim(),
                 ddlESDMailType.SelectedValue, chkTlsEnabled.Checked, txtEmailSerUsername.Text.Trim(), txtEmailPassword.Text.Trim());
            }
            else
            {
                IsSucess = repositoryConfig.InsertEamilServerDetails(txtEmailServerId.Text.Trim(),
                 Convert.ToInt32(txtEmailSerPort.Text.Trim()), txtEmailServReplyToEmail.Text.Trim(), txtEmailSenderName.Text.Trim(),
                 ddlESDMailType.SelectedValue, chkTlsEnabled.Checked, txtEmailSerUsername.Text.Trim(), txtEmailPassword.Text.Trim());
            }

            if (IsSucess)
            {
                BindEmailServerDetails();
                lblMessage.Text = Resources.Config.MSG_EmailServer_Save_Sucess;
                StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#mdlEmailServer').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StrmHideModalScript", sb.ToString(), false);
            }
            else
            {
                lblMessage.Text = Resources.Config.MSG_EmailServer_Save_Failed;
                StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#mdlEmailServer').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StrmHideModalScript", sb.ToString(), false);
            }

        }



        protected void lnkEditDBDInfo_Click(object sender, EventArgs e)
        {
            btnSaveDb.Enabled = true;
            StringBuilder sb = new System.Text.StringBuilder();
            txtDbPassword.Attributes.Add("value", ViewState["DBPassword"].ToString());

            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#mdlDbSetup').modal('show');");
            //sb.Append("$('#editTagsModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditDbInfo", sb.ToString(), false);

        }

        protected void lnkEditAD_Click(object sender, EventArgs e)
        {


            txtADPassword.Attributes.Add("value", ViewState["ADPassword"].ToString());
            StringBuilder sb = new System.Text.StringBuilder();

            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#myActiveDirectory').modal('show');");
            //sb.Append("$('#editTagsModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditActiveDirectory", sb.ToString(), false);


        }

        protected void lnkEditVOD_Click(object sender, EventArgs e)
        {

            StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#mdlVOD').modal('show');");
            //sb.Append("$('#editTagsModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditVOD", sb.ToString(), false);
        }

        protected void lnkEditSuperAdmin_Click(object sender, EventArgs e)
        {


            StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#mySuperAdmin').modal('show');");
            //sb.Append("$('#editTagsModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditSuperAdmin", sb.ToString(), false);
        }

        protected void lnkServerDetEdit_Click(object sender, EventArgs e)
        {

            BindStreamingServerPopup();
            StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#mdlStreamServer').modal('show');");
            //sb.Append("$('#editTagsModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditStreaminServer", sb.ToString(), false);


        }

        protected void lnkEmailServerEdit_Click(object sender, EventArgs e)
        {
            BindEmailServerDetailsPopup();
            StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#mdlEmailServer').modal('show');");
            //sb.Append("$('#editTagsModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditStreaminServer", sb.ToString(), false);


        }


        protected void custSourceVald_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (vodConfiguration.IsFolderExists(txtSrcFold.Text.Trim()))
                args.IsValid = true;

        }

        protected void custDestValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (vodConfiguration.IsFolderExists(txtDstFold.Text.Trim()))
                args.IsValid = true;
        }


        protected void custArchValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (vodConfiguration.IsFolderExists(txtArchiveFold.Text.Trim()))
                args.IsValid = true;
        }

        protected void custBackValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (vodConfiguration.IsFolderExists(txtBackupFold.Text.Trim()))
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

        protected void validConnectionString_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            string validString = dbSetup.GetValidConnectionString(txtIpAddress.Text.Trim(), txtDatabase.Text.Trim(), txtPort.Text.Trim(),
                txtUserId.Text.Trim(), string.IsNullOrEmpty(txtDbPassword.Text.Trim()) ? ViewState["DBPassword"].ToString() : txtDbPassword.Text.Trim());
            if (!string.IsNullOrEmpty(validString))
                args.IsValid = true;

        }

        protected void btnUpBackSubmit_Click(object sender, EventArgs e)
        {
            VODLoginRedirectByRoleSection roleRedirectSection = (VODLoginRedirectByRoleSection)ConfigurationManager.GetSection("loginRedirectByRole");
            foreach (RoleRedirect roleRedirect in roleRedirectSection.RoleRedirects)
            {
                if (roleRedirect.Role.ToLower() == "administrator")
                {
                    Response.Redirect(WebHelper.RelativeWebRoot + roleRedirect.Url);
                }
            }
        }





    }
}