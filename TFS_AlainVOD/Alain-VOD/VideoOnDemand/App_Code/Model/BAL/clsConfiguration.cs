using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsConfiguration
    {

        public DataSet GetStreamingServerDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1 [StrServer_ID] StreamingServerId,[SERVER_ID] AS SERVERNAME,[PORT],[USERID],[PASSWORD] FROM [StreamingServer_Details] order by [DATE_CREATED] desc");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public DataSet GetEmailServerDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT TOP 1 [CONFIG_ID] EmailServerId ,[SERVER_ID] AS SERVERNAME,[PORT],[REPLY_TO_EMAIL],[SENDER_NAME],[EMAIL_TYPE],[TLS_Enabled],[USERNAME],[PASSWORD] " +
                       " FROM [EMAIL_SERVER_DETAILS] ORDER BY [DATE_CREATED] DESC ");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public bool InsertStreamingServerDetails(string serverName, int port, string userName, string password)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@ServerName", SqlDbType.NVarChar);
            p[0].Value = serverName;
            p[1] = new SqlParameter("@Port", SqlDbType.Int);
            p[1].Value = port;
            p[2] = new SqlParameter("@UserId", SqlDbType.NVarChar);
            p[2].Value = userName;
            p[3] = new SqlParameter("@Password", SqlDbType.NVarChar);
            p[3].Value = password;

            string strSql = "INSERT INTO [StreamingServer_Details]([SERVER_ID],[PORT],[USERID],[PASSWORD],[DATE_CREATED]) " +
            " VALUES (@ServerName,@Port,@UserId,@Password,GETDATE())";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }


        public bool UpdateStreamingServerDetails(int serverId, string serverName, int port, string userName, string password)
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@ServerName", SqlDbType.NVarChar);
            p[0].Value = serverName;
            p[1] = new SqlParameter("@Port", SqlDbType.Int);
            p[1].Value = port;
            p[2] = new SqlParameter("@UserId", SqlDbType.NVarChar);
            p[2].Value = userName;
            p[3] = new SqlParameter("@Password", SqlDbType.NVarChar);
            p[3].Value = password;
            p[4] = new SqlParameter("@ServerId", SqlDbType.Int);
            p[4].Value = serverId;

            string strSql = "UPDATE [StreamingServer_Details] SET [SERVER_ID] = @ServerName ,[PORT] =@Port   ,[USERID] = @UserId  ," +
            " [PASSWORD] = @Password,[DATE_UPDATED] =GETDATE() WHERE StrServer_ID=@ServerId ";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;
        }


        public bool InsertEamilServerDetails(string serverName, int port, string replyToEmail, string SenderName, string emailType, bool isTlsEnabled, string userName, string password)
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@ServerName", SqlDbType.NVarChar);
            p[0].Value = serverName;
            p[1] = new SqlParameter("@port", SqlDbType.Int);
            p[1].Value = port;
            p[2] = new SqlParameter("@replyToEmail", SqlDbType.NVarChar);
            p[2].Value = replyToEmail;
            p[3] = new SqlParameter("@SenderName", SqlDbType.NVarChar);
            p[3].Value = SenderName;
            p[4] = new SqlParameter("@emailType", SqlDbType.NVarChar);
            p[4].Value = emailType;
            p[5] = new SqlParameter("@IsTLSEnabled", SqlDbType.NVarChar);
            p[5].Value = isTlsEnabled;
            p[6] = new SqlParameter("@UserName", SqlDbType.NVarChar);
            p[6].Value = userName;
            p[7] = new SqlParameter("@Password", SqlDbType.NVarChar);
            p[7].Value = password;

            string strSql = "INSERT INTO [EMAIL_SERVER_DETAILS]([SERVER_ID] ,[PORT] ,[REPLY_TO_EMAIL] ,[SENDER_NAME],[EMAIL_TYPE],[TLS_Enabled],[USERNAME],[PASSWORD],[DATE_CREATED]) " +
                                "VALUES (@ServerName,@port,@replyToEmail,@SenderName,@emailType,@IsTLSEnabled,@UserName,@Password,GETDATE())";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);

            if (value > 0)
                return true;
            else return false;

        }


        public bool UpdateEmailServerDetails(int emailServerId, string serverName, int port, string replyToEmail, string SenderName, string emailType, bool isTlsEnabled, string userName, string password)
        {
            SqlParameter[] p = new SqlParameter[9];
            p[0] = new SqlParameter("@ServerName", SqlDbType.NVarChar);
            p[0].Value = serverName;
            p[1] = new SqlParameter("@port", SqlDbType.Int);
            p[1].Value = port;
            p[2] = new SqlParameter("@replyToEmail", SqlDbType.NVarChar);
            p[2].Value = replyToEmail;
            p[3] = new SqlParameter("@SenderName", SqlDbType.NVarChar);
            p[3].Value = SenderName;
            p[4] = new SqlParameter("@emailType", SqlDbType.NVarChar);
            p[4].Value = emailType;
            p[5] = new SqlParameter("@IsTLSEnabled", SqlDbType.NVarChar);
            p[5].Value = isTlsEnabled;
            p[6] = new SqlParameter("@UserName", SqlDbType.NVarChar);
            p[6].Value = userName;
            p[7] = new SqlParameter("@Password", SqlDbType.NVarChar);
            p[7].Value = password;
            p[8] = new SqlParameter("@EmailServerId", SqlDbType.Int);
            p[8].Value = emailServerId;

            string strSql = "UPDATE [EMAIL_SERVER_DETAILS] SET [SERVER_ID] = @ServerName, [PORT] = @port,[REPLY_TO_EMAIL] = @replyToEmail, " +
                "[SENDER_NAME] =@SenderName,[EMAIL_TYPE] = @emailType,[TLS_Enabled] = @IsTLSEnabled,[USERNAME] = @UserName, " +
                "[PASSWORD] = @Password,[DATE_UPDATED] = GETDATE() WHERE [CONFIG_ID]=@EmailServerId";

            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;
        }





    }
}