using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Setup
{
    public partial class SMTPSetup : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            bool intsertResult = true;

            clsConfiguration repository = new clsConfiguration();

            try
            {
                string HostName = HttpUtility.HtmlEncode(txtServerId.Text.Trim());
                int port = Convert.ToInt32(HttpUtility.HtmlEncode(txtPort.Text.Trim()));
                string fromAddress = HttpUtility.HtmlEncode(txtReply.Text.Trim());
                string toAddress = ConfigurationManager.AppSettings["TestEmailId"].ToString();
                string toUserId = HttpUtility.HtmlEncode(txtUserName.Text.Trim());
                string password = HttpUtility.HtmlEncode(txtPassword.Text.Trim());
                bool IsEnableSsl = (ddlEncryptType.SelectedItem != null && ddlEncryptType.SelectedItem.Value == "1") ? true : false;
                bool IsEnableTLS = (ddlEncryptType.SelectedItem != null && ddlEncryptType.SelectedItem.Value == "2") ? true : false;
                string SenderName = HttpUtility.HtmlEncode(txtSenderName.Text.Trim());

                var sentResult = repository.SendTestMail(HostName, port, fromAddress, toAddress, toUserId, password, IsEnableSsl, SenderName);
                if (sentResult)
                {
                    intsertResult = repository.InsertEamilServerDetails(HostName,
                port, fromAddress, SenderName, "SMTP", IsEnableTLS, IsEnableSsl, toUserId, password);
                    if (intsertResult)
                    {

                        Response.Redirect("~/Setup/step3.aspx", false);
                        //StringBuilder sb = new System.Text.StringBuilder();
                        //lblMessage.Text = Resources.Setup.SMTP_MSG_Connection_Sucess;
                        ////lblMessage.Text = Resources.Setup.DBS_MSG_LoginAlreadyExists;
                        //sb.Append(@"<script type='text/javascript'>");
                        //sb.Append("$('#alertMessageModal').modal('show');");
                        //sb.Append(@"</script>");
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowConnectionresultModal", sb.ToString(), false);
                    }
                    else
                    {
                        StringBuilder sb = new System.Text.StringBuilder();
                        lblMessage.Text = Resources.Setup.SMTP_MSG_Details_Save_Failed;
                        //lblMessage.Text = Resources.Setup.DBS_MSG_LoginAlreadyExists;
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowConnectionresultModal", sb.ToString(), false);
                        return;

                    }

                }
                else
                {
                    StringBuilder sb = new System.Text.StringBuilder();
                    lblMessage.Text = Resources.Setup.SMTP_MSG_Connection_Failed;
                    //lblMessage.Text = Resources.Setup.DBS_MSG_LoginAlreadyExists;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append(@"</script>");
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

        protected void btnTest_Click(object sender, EventArgs e)
        {
            clsConfiguration repository = new clsConfiguration();
            string HostName = HttpUtility.HtmlEncode(txtServerId.Text.Trim());
            int port = Convert.ToInt32(HttpUtility.HtmlEncode(txtPort.Text.Trim()));
            string fromAddress = HttpUtility.HtmlEncode(txtReply.Text.Trim());
            string toAddress = ConfigurationManager.AppSettings["TestEmailId"].ToString();
            string toUserId = HttpUtility.HtmlEncode(txtUserName.Text.Trim());
            string password = HttpUtility.HtmlEncode(txtPassword.Text.Trim());
            bool IsEnableSsl = (ddlEncryptType.SelectedItem != null && ddlEncryptType.SelectedItem.Value == "1") ? true : false;
            string SenderName = HttpUtility.HtmlEncode(txtSenderName.Text.Trim());
            ViewState["Password"] = password;
            txtPassword.Attributes.Add("value", ViewState["Password"].ToString());

            var sentResult = repository.SendTestMail(HostName, port, fromAddress, toAddress, toUserId, password, IsEnableSsl, SenderName);
            if (sentResult)
            {
                StringBuilder sb = new System.Text.StringBuilder();
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
                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = Resources.Setup.SMTP_MSG_Connection_Failed;
                //lblMessage.Text = Resources.Setup.DBS_MSG_LoginAlreadyExists;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(GetType(), "connectionNotValid", sb.ToString(), false);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowConnectionresultModal", sb.ToString(), false);

            }


        }

    }
}