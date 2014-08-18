using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;

namespace VideoOnDemand.Model.BAL
{
    public class clsConfiguration
    {

        public DataSet GetStreamingServerDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1 [StrServer_ID] StreamingServerId,[SERVER_ID] AS SERVERNAME,[PORT],[USERID],[PASSWORD] FROM [StreamingServer_Details] order by [DATE_CREATED] desc");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public DataSet GetEmailServerDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT TOP 1 [CONFIG_ID] EmailServerId ,[SERVER_ID] AS SERVERNAME,[PORT],[REPLY_TO_EMAIL],[SENDER_NAME],[EMAIL_TYPE],[TLS_Enabled],[SSL_Enabled],[USERNAME],[PASSWORD] " +
                       " FROM [EMAIL_SERVER_DETAILS] ORDER BY [DATE_CREATED] DESC ");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }




        public bool InsertStreamingServerDetails(string serverName, int port, string userName, string password)
        {
            OleDbParameter[] p = new OleDbParameter[4];
            p[0] = new OleDbParameter("@ServerName", OleDbType.VarWChar);
            p[0].Value = serverName;
            p[1] = new OleDbParameter("@Port", OleDbType.Integer);
            p[1].Value = port;
            p[2] = new OleDbParameter("@UserId", OleDbType.VarWChar);
            p[2].Value = userName;
            p[3] = new OleDbParameter("@Password", OleDbType.VarWChar);
            p[3].Value = password;

            string strSql = "INSERT INTO [StreamingServer_Details]([SERVER_ID],[PORT],[USERID],[PASSWORD],[DATE_CREATED]) " +
            " VALUES (?,?,?,?,GETDATE())";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }


        public bool UpdateStreamingServerDetails(int serverId, string serverName, int port, string userName, string password)
        {
            OleDbParameter[] p = new OleDbParameter[5];
            p[0] = new OleDbParameter("@ServerName", OleDbType.VarWChar);
            p[0].Value = serverName;
            p[1] = new OleDbParameter("@Port", OleDbType.Integer);
            p[1].Value = port;
            p[2] = new OleDbParameter("@UserId", OleDbType.VarWChar);
            p[2].Value = userName;
            p[3] = new OleDbParameter("@Password", OleDbType.VarWChar);
            p[3].Value = password;
            p[4] = new OleDbParameter("@ServerId", OleDbType.Integer);
            p[4].Value = serverId;

            string strSql = "UPDATE [StreamingServer_Details] SET [SERVER_ID] = ? ,[PORT] =?   ,[USERID] = ?  ," +
            " [PASSWORD] = ?,[DATE_UPDATED] =GETDATE() WHERE StrServer_ID=? ";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;
        }


        public bool InsertEamilServerDetails(string serverName, int port, string replyToEmail, string SenderName, string emailType, bool isTlsEnabled, bool IsSslEnabled, string userName, string password)
        {
            OleDbParameter[] p = new OleDbParameter[9];
            p[0] = new OleDbParameter("@ServerName", OleDbType.VarWChar);
            p[0].Value = serverName;
            p[1] = new OleDbParameter("@port", OleDbType.Integer);
            p[1].Value = port;
            p[2] = new OleDbParameter("@replyToEmail", OleDbType.VarWChar);
            p[2].Value = replyToEmail;
            p[3] = new OleDbParameter("@SenderName", OleDbType.VarWChar);
            p[3].Value = SenderName;
            p[4] = new OleDbParameter("@emailType", OleDbType.VarWChar);
            p[4].Value = emailType;
            p[5] = new OleDbParameter("@IsTLSEnabled", OleDbType.Boolean);
            p[5].Value = isTlsEnabled;
            p[6] = new OleDbParameter("@IsSslEnabled", OleDbType.Boolean);
            p[6].Value = IsSslEnabled;
            p[7] = new OleDbParameter("@UserName", OleDbType.VarWChar);
            p[7].Value = userName;
            p[8] = new OleDbParameter("@Password", OleDbType.VarWChar);
            p[8].Value = password;



            string strSql = "INSERT INTO [EMAIL_SERVER_DETAILS]([SERVER_ID] ,[PORT] ,[REPLY_TO_EMAIL] ,[SENDER_NAME],[EMAIL_TYPE],[TLS_Enabled],[SSL_Enabled],[USERNAME],[PASSWORD],[DATE_CREATED]) " +
                                "VALUES (?,?,?,?,?,?,?,?,?,GETDATE())";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);

            if (value > 0)
                return true;
            else return false;

        }


        public bool UpdateEmailServerDetails(int emailServerId, string serverName, int port, string replyToEmail, string SenderName, string emailType, bool isTlsEnabled, bool isSslEnabled, string userName, string password)
        {
            OleDbParameter[] p = new OleDbParameter[10];
            p[0] = new OleDbParameter("@ServerName", OleDbType.VarWChar);
            p[0].Value = serverName;
            p[1] = new OleDbParameter("@port", OleDbType.Integer);
            p[1].Value = port;
            p[2] = new OleDbParameter("@replyToEmail", OleDbType.VarWChar);
            p[2].Value = replyToEmail;
            p[3] = new OleDbParameter("@SenderName", OleDbType.VarWChar);
            p[3].Value = SenderName;
            p[4] = new OleDbParameter("@emailType", OleDbType.VarWChar);
            p[4].Value = emailType;
            p[5] = new OleDbParameter("@IsTLSEnabled", OleDbType.Boolean);
            p[5].Value = isTlsEnabled;
            p[6] = new OleDbParameter("@IsSSLEnabled", OleDbType.Boolean);
            p[6].Value = isSslEnabled;
            p[7] = new OleDbParameter("@UserName", OleDbType.VarWChar);
            p[7].Value = userName;
            p[8] = new OleDbParameter("@Password", OleDbType.VarWChar);
            p[8].Value = password;
            p[9] = new OleDbParameter("@EmailServerId", OleDbType.Integer);
            p[9].Value = emailServerId;

            string strSql = "UPDATE [EMAIL_SERVER_DETAILS] SET [SERVER_ID] = ?, [PORT] = ?,[REPLY_TO_EMAIL] =?, " +
                "[SENDER_NAME] =?,[EMAIL_TYPE] =?,[TLS_Enabled] = ?,[SSL_Enabled]=?,[USERNAME] = ?, " +
                "[PASSWORD] = ?,[DATE_UPDATED] = GETDATE() WHERE [CONFIG_ID]=?";

            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;
        }

        public string GetVideoServerPath()
        {
            //clsConfiguration repository = new clsConfiguration();
            DataSet ds = GetStreamingServerDetails();
            string serverPath = string.Empty;
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                string server = ds.Tables[0].Rows[0]["SERVERNAME"].ToString() + (string.IsNullOrEmpty(ds.Tables[0].Rows[0]["PORT"].ToString()) ? "" : (":" + ds.Tables[0].Rows[0]["PORT"].ToString()));
                serverPath = string.Format("http://{0}{1}", server, WebConfigurationManager.AppSettings["VideoFileServerPath"].ToString());
            }
            return serverPath;
        }


        public bool SendTestMail(string Host, int port, string fromAddress, string toAddress, string userId, string password, bool isSslEnabled, string SenderName)
        {
            try
            {

                var MailfromAddress = new MailAddress(fromAddress, SenderName);
                var MailUserIdAddress = new MailAddress(userId, SenderName);
                var MailtoAddress = new MailAddress(toAddress, toAddress.Substring(0, toAddress.IndexOf('@')));
                string fromPassword = password;
                string subject = "Test Mail";
                string body = "<html><h2> Test Mail has been sent to you. ignore the message</h2></html>";

                var smtp = new SmtpClient
                {
                    Host = Host,
                    Port = port,
                    EnableSsl = isSslEnabled,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(MailUserIdAddress.Address, fromPassword)

                };
                using (var message = new MailMessage(MailfromAddress.Address, MailtoAddress.Address)
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                })
                {
                    smtp.Send(message);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }




    }
}