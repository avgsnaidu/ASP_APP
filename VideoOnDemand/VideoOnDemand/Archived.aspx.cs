using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.VODManage
{
    public partial class ArchiveListing : ChildBasePage
    {
        clsArchive repository = new clsArchive();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                {

                    if (!IsPostBack)
                    {
                        BindArchiveList();
                    }
                }
                else
                    Response.Redirect("WindowsUser.aspx");
            }
            else
            {
                Response.Redirect("WindowsUser.aspx");
            }
        }
        private void BindArchiveList()
        {
            DataSet ds = repository.GetArchiveList();
            gvArchiveListing.DataSource = ds;
            gvArchiveListing.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindSearchedList();
        }

        private void BindSearchedList()
        {
            string searchKeyword = txtSearchKey.Text.Trim();
            DataSet ds = repository.GetSearchedArchiveList(searchKeyword);
            gvArchiveListing.DataSource = ds;
            gvArchiveListing.DataBind();
        }



        protected void gvArchiveListing_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvArchiveListing.PageIndex = e.NewPageIndex;
            BindArchiveList();
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvArchiveListing.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvArchiveListing.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }
    }
}