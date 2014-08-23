using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoOnDemand.Player
{
    public partial class VideoPlayer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Session["IsUser"] != null)
                {
                    if (!IsPostBack)
                    {
                        if (!string.IsNullOrEmpty(Request.QueryString["VideoName"]))
                        {
                            string videoName = Request.QueryString["VideoName"].ToString();
                            LoadVideoFile(videoName);
                        }
                    }
                }
                else
                    Response.Redirect("Error.aspx");
            }
            else
            {
                Response.Redirect("Error.aspx");
            }
        }

        private void LoadVideoFile(string videoName)
        {


            // Define the name and type of the client scripts on the page.
            String csname1 = "PopupScript";
            Type cstype = this.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = Page.ClientScript;

            // Check to see if the startup script is already registered.
            if (!cs.IsStartupScriptRegistered(cstype, csname1))
            {
                StringBuilder cstext1 = new StringBuilder();
                //cstext1.Append("<script type=text/javascript> alert('Hello World!') </");
                //cstext1.Append("script>");

                string playerUrl = string.Format("http://172.16.1.201:1935/vod/smil:{0}.smil/jwplayer.smil", videoName);

                cstext1.Append("<script type='text/javascript'> ");
                cstext1.Append(" jwplayer('player').setup({ ");
                cstext1.Append(" flashplayer: 'jwplayer.flash.swf',");
                cstext1.Append(" primary: 'flash', ");
                cstext1.Append(" mute: 'true',");
                cstext1.Append(" stretching: 'exactfit', ");
                cstext1.Append(" playlist: [{ sources: [{ file: '");
                cstext1.Append(playerUrl);
                cstext1.Append("'}]} ] ");
                cstext1.Append("  }); ");
                cstext1.Append("$('#mdlPlayVideo').modal('show'); </");
                cstext1.Append("script>");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "AdddModalScript", cstext1.ToString(), false);



            }





            //////// Define the name and type of the client scripts on the page.
            //////String csname1 = "PopupScript";
            //////Type cstype = this.GetType();

            //////// Get a ClientScriptManager reference from the Page class.
            //////ClientScriptManager cs = Page.ClientScript;

            //////// Check to see if the startup script is already registered.
            //////if (!cs.IsStartupScriptRegistered(cstype, csname1))
            //////{
            //////    StringBuilder cstext1 = new StringBuilder();
            //////    //cstext1.Append("<script type=text/javascript> alert('Hello World!') </");
            //////    //cstext1.Append("script>");

            //////    string playerUrl = string.Format("http://172.16.1.201:1935/vod/smil:{0}.smil/jwplayer.smil", videoName);

            //////    cstext1.Append("<script type='text/javascript'> ");
            //////    cstext1.Append(" jwplayer('player').setup({ ");
            //////    cstext1.Append(" flashplayer: 'jwplayer.flash.swf',");
            //////    cstext1.Append(" primary: 'flash', ");
            //////    cstext1.Append(" mute: 'true',");
            //////    cstext1.Append(" stretching: 'exactfit', ");
            //////    cstext1.Append(" playlist: [{ sources: [{ file: '");
            //////    cstext1.Append(playerUrl);
            //////    cstext1.Append("'}]} ] ");
            //////    cstext1.Append("  }); </");
            //////    cstext1.Append("script>");



            //////    cs.RegisterStartupScript(cstype, csname1, cstext1.ToString());
            //////}



        }
    }
}