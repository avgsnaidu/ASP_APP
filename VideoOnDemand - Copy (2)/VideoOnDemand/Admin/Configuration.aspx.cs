using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Admin
{
    public partial class Configuration : System.Web.UI.Page
    {
        clsDBSetup dbSetup = new clsDBSetup();
        clsActiveDirectory activeDirectory = new clsActiveDirectory();
        clsVODConfiguration vodConfiguration = new clsVODConfiguration();
        clsSuperAdmin superAdmin = new clsSuperAdmin();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true)
            {
                BindConfiguration();
            }
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

                    txtPort.Text = ds.Tables[0].Rows[i]["Port"].ToString();
                    lblDataPort.Text = ds.Tables[0].Rows[i]["Port"].ToString();

                    txtDatabase.Text = ds.Tables[0].Rows[i]["Name"].ToString();
                    lbltxtDatabase.Text = ds.Tables[0].Rows[i]["Name"].ToString();

                    txtUser.Text = ds.Tables[0].Rows[i]["Userid"].ToString();
                    txtUserId.Text = ds.Tables[0].Rows[i]["Userid"].ToString();

                    txtADPassword.Text = ds.Tables[0].Rows[i]["Password"].ToString();
                    lblDataPassword.Text = ds.Tables[0].Rows[i]["Password"].ToString();
                }
                ds = activeDirectory.GetADDetails();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    hdAdConfigId.Value = ds.Tables[0].Rows[i]["CONFIG_ID"].ToString();

                    txtServer.Text = ds.Tables[0].Rows[i]["IP"].ToString();
                    txtServerId.Text = ds.Tables[0].Rows[i]["IP"].ToString();

                    txtUsername.Text = ds.Tables[0].Rows[i]["Userid"].ToString();
                    txtADUser.Text = ds.Tables[0].Rows[i]["Userid"].ToString();

                    txtDBPassword.Text = ds.Tables[0].Rows[i]["Password"].ToString();
                    txtADPassword.Text = ds.Tables[0].Rows[i]["Password"].ToString();
                }
                ds = vodConfiguration.GetVODConfigurationDetails();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    hdVODConfig.Value = ds.Tables[0].Rows[i]["CONFIG_ID"].ToString();

                    txtSrcFolder.Text = ds.Tables[0].Rows[i]["SOURCE_FOLDER"].ToString();
                    txtSrcFold.Text = ds.Tables[0].Rows[i]["SOURCE_FOLDER"].ToString();

                    txtDestFolder.Text = ds.Tables[0].Rows[i]["TARGET_FOLDER"].ToString();
                    txtDstFold.Text = ds.Tables[0].Rows[i]["TARGET_FOLDER"].ToString();

                    txtArchive.Text = ds.Tables[0].Rows[i]["ARCHIVE_FOLDER"].ToString();
                    txtArchiveFold.Text = ds.Tables[0].Rows[i]["ARCHIVE_FOLDER"].ToString();

                    txtBack.Text = ds.Tables[0].Rows[i]["BACKUP_FOLDER"].ToString();
                    txtBackupFold.Text = ds.Tables[0].Rows[i]["BACKUP_FOLDER"].ToString();

                    txtSchedule.Text = ds.Tables[0].Rows[i]["SCHEDULER_FLAG"].ToString();
                    ddlInterval.Text = ds.Tables[0].Rows[i]["SCHEDULER_FLAG"].ToString();

                    txtVideo.Text = ds.Tables[0].Rows[i]["SCHEDULER_HOURS_INTERVAL"].ToString();
                    ddlSimultaneous.Text = ds.Tables[0].Rows[i]["SCHEDULER_HOURS_INTERVAL"].ToString();
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

        protected void btnSaveDB_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            bool intResult = true;

            clsDBSetup repository = new clsDBSetup();

            repository.ConfigId = Convert.ToInt32(hdConfigId.Value);

            try
            {
                intResult = repository.UpdateDBDetails(Convert.ToInt32(hdConfigId.Value), txtIpAddress.Text.Trim(), Convert.ToInt16(txtPort.Text.Trim()), txtDatabase.Text.Trim(), txtUserId.Text.Trim(), txtADPassword.Text.Trim());

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
            bool intResult = true;

            clsActiveDirectory activedirectory = new clsActiveDirectory();

            activedirectory.ConfigId = Convert.ToInt32(hdAdConfigId.Value);

            try
            {
                intResult = activedirectory.UpdateADDetails(Convert.ToInt32(hdAdConfigId.Value), txtServerId.Text.Trim(), txtUsername.Text.Trim(), txtDBPassword.Text.Trim());

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
            bool intResult = true;

            clsVODConfiguration vod = new clsVODConfiguration();

            //vod.ConfigId = Convert.ToInt32(hdVODConfig.Value);
            int configId = Convert.ToInt32(hdVODConfig.Value);
            string source = txtSrcFold.Text.Trim();
            string archive = txtArchiveFold.Text.Trim();
            string target = txtDestFolder.Text.Trim();
            string backUp = txtBackupFold.Text.Trim();
            double interval= 0.00;

            char schedularFlag;
            if (ddlInterval.SelectedItem.Value != "0")
            {
                schedularFlag = 'F';
                interval = Convert.ToDouble(ddlInterval.SelectedItem.Value);
            }
            else
            {
                schedularFlag = 'R';
                var interVal1 = Convert.ToDateTime(txtScheduleInterval.Text.Trim());
            }

            int simultaneousConvertions = Convert.ToInt32(ddlSimultaneous.SelectedItem.Value);

            try
            {
                intResult = vod.UpdateVODDetails(configId, source, target, archive, backUp, schedularFlag, interval);

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
            Response.Redirect("~/Admin/Configuration.aspx");

        }

        protected void btnSaveSuperAdmin_Click(object sender, EventArgs e)
        {
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

    }
}