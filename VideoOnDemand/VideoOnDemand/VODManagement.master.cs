using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VideoOnDemand.VODManage
{
    public partial class VODManagement : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Convert.ToBoolean(Session["IsAdmin"].ToString()))
                {
                    string linkButtonID = Request.RawUrl;

                    if (-1 < linkButtonID.IndexOf("Users"))
                    {
                        ((HtmlGenericControl)lnkUserMang.Parent).Style.Add("disyplay", "none !important");
                    }
                    if (-1 < linkButtonID.IndexOf("GroupManagement"))
                    {
                        ((HtmlGenericControl)lnkGroupMang.Parent).Attributes.Add("class", "active");
                    }
                    else if (-1 < linkButtonID.IndexOf("VideoManagement"))
                    {
                        ((HtmlGenericControl)lnkVideoMang.Parent).Attributes.Add("class", "active");
                    }
                    else if (-1 < linkButtonID.IndexOf("Search"))
                    {
                        ((HtmlGenericControl)lnkSearch.Parent).Attributes.Add("class", "active");
                    }
                    else if (-1 < linkButtonID.IndexOf("Archived"))
                    {
                        ((HtmlGenericControl)lnkArchiveListen.Parent).Attributes.Add("class", "active");

                    }

                }
            }
            else
            {
                Response.Redirect("~/Error.aspx");
            }
            if (!IsPostBack)
            {
                lnkUserMang.CssClass = "";
                lnkVideoMang.CssClass = "";
                lnkSearch.CssClass = "";
                lnkArchiveListen.CssClass = "";
                string linkButtonID = Request.RawUrl;

                if (-1 < linkButtonID.IndexOf("Users"))
                {
                    ((HtmlGenericControl)lnkUserMang.Parent).Attributes.Add("class", "active");
                }
                if (-1 < linkButtonID.IndexOf("GroupManagement"))
                {
                    ((HtmlGenericControl)lnkGroupMang.Parent).Attributes.Add("class", "active");
                }
                else if (-1 < linkButtonID.IndexOf("VideoManagement"))
                {
                    ((HtmlGenericControl)lnkVideoMang.Parent).Attributes.Add("class", "active");
                }
                else if (-1 < linkButtonID.IndexOf("Search"))
                {
                    ((HtmlGenericControl)lnkSearch.Parent).Attributes.Add("class", "active");
                }
                else if (-1 < linkButtonID.IndexOf("Archived"))
                {
                    ((HtmlGenericControl)lnkArchiveListen.Parent).Attributes.Add("class", "active");

                }



            }

        }

        protected void Page_PreInt(object sender, EventArgs e)
        {

        }
        protected void SelectedTheCurrentItem(object sender, EventArgs e)
        {
            var selectedID = ((LinkButton)sender).ID;
            //foreach (Control ctrl in ulManageTop.Controls)
            //{
            //    if (ctrl is LinkButton)
            //    {

            //        if (selectedID == ((LinkButton)ctrl).ID)
            //        {
            //            ((LinkButton)ctrl).CssClass = "active";
            //        }
            //        else
            //        {
            //            ((LinkButton)ctrl).CssClass = "";

            //        }

            //        //string url = ((LinkButton)ctrl).Href;
            //        //if (url == GetCurrentPage())  // <-- you'd need to write that
            //        //    ctrl.Parent.Attributes.Add("class", "active");
            //    }

            //}

            if (selectedID == lnkArchiveListen.ID)
            {
                Response.Redirect("~/Archived.aspx");
            }
            else if (selectedID == lnkSearch.ID)
            {
                Response.Redirect("~/Search.aspx");
            }
            else if (selectedID == lnkUserMang.ID)
            {
                Response.Redirect("~/Users.aspx");
            }
            else if (selectedID == lnkVideoMang.ID)
            {
                Response.Redirect("~/VideoManagement.aspx");
            }
            else if (selectedID == lnkGroupMang.ID)
            {
                Response.Redirect("~/GroupManagement.aspx");
            }
        }
    }
}