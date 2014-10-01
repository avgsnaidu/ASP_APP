using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VideoOnDemand
{
    public partial class VODUserManagement : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/WindowsUser.aspx");
            }
            if (!IsPostBack)
            {
                lnkVideoMang.CssClass = "";
                lnkSearch.CssClass = "";
                string linkButtonID = Request.RawUrl;
                if (-1 < linkButtonID.IndexOf("VideoManagement"))
                {
                    ((HtmlGenericControl)lnkVideoMang.Parent).Attributes.Add("class", "active");
                }
                else if (-1 < linkButtonID.IndexOf("Search"))
                {
                    ((HtmlGenericControl)lnkSearch.Parent).Attributes.Add("class", "active");
                }

            }

        }

        protected void SelectedTheCurrentItem(object sender, EventArgs e)
        {
            var selectedID = ((LinkButton)sender).ID;

            if (selectedID == lnkSearch.ID)
            {
                Response.Redirect("~/Search.aspx");
            }
            else if (selectedID == lnkVideoMang.ID)
            {
                Response.Redirect("~/VideoManagement.aspx");
            }

        }
    }
}