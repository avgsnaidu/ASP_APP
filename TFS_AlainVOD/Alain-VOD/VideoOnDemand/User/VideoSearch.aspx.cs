using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.User
{
    public partial class SearchVideos : ChildBasePage
    {
        clsSearch repository = new clsSearch();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsUser"] != null && Convert.ToBoolean(Session["IsUser"].ToString()))
                {

                    if (!IsPostBack)
                    {
                        chkAll.Checked = true;
                        AddEmtpyRowToGrid();
                        BindSearchFilterTags();
                    }

                }
                else
                    Response.Redirect("~/WindowsUser.aspx");
            }
            else
            {
                Response.Redirect("~/WindowsUser.aspx");
            }
        }

        private void BindSearchFilterTags()
        {
            DataSet ds = repository.GetSearchFilterTagsList();

            if (ds.Tables[0].Rows.Count > 0)
            {
                chkAll.Text = ds.Tables[0].Rows[0][1].ToString();
                chkCommunity.Text = ds.Tables[0].Rows[1][1].ToString();
                chkDistrict.Text = ds.Tables[0].Rows[2][1].ToString();
                chkRoad.Text = ds.Tables[0].Rows[3][1].ToString();
            }

            //ddlSearchOn.DataTextField = "SEARCHTAG";
            //ddlSearchOn.DataValueField = "SearchTagCode";

            //ddlSearchOn.DataSource = ds;
            //ddlSearchOn.DataBind();

        }

        private void AddEmtpyRowToGrid()
        {
            DataSet ds = new DataSet();
            ds = null;
            gvSearch.DataSource = ds;
            gvSearch.DataBind();

            DataTable dtSearch = new DataTable();
            dtSearch.Columns.Add("VIDEOID");
            dtSearch.Columns.Add("VideoName");
            dtSearch.Columns.Add("TAG");
            dtSearch.Rows.Add(dtSearch.NewRow());

            gvSearch.DataSource = dtSearch;
            gvSearch.DataBind();
            gvSearch.Rows[0].Visible = false;
        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string commandNames = e.CommandArgument.ToString();
            string[] commandArguments = commandNames.Split(';');

            int index = Convert.ToInt32(commandArguments[0]);

            Session["VideoId"] = index;
            if (e.CommandName.Equals("Play"))
            {
                string VideoName = commandArguments[1].ToString();

                if (!string.IsNullOrEmpty(VideoName))
                {
                    LoadVideoFile(VideoName);

                }
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

                string playerUrl = string.Format(Application["videoServerUrl"].ToString(), videoName);

                //string playerUrl=@"/Player/VideoSample.mp4";
                cstext1.Append("<script type='text/javascript'> ");
                cstext1.Append(" jwplayer('player').setup({ ");
                cstext1.Append(" flashplayer: 'jwplayer.flash.swf',");
                cstext1.Append(" width:'1000px',");
                cstext1.Append(" height:'800px',");
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


                //$('#editTagsModal').modal('show');cs.RegisterStartupScript(cstype, csname1, cstext1.ToString());
            }



        }


        protected void SearchVideos_Click(object sender, EventArgs e)
        {
            if (IsAnyFilterTagChecked())
                BindSearchGrid();
            else
            {
                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = Resources.Search.MSG_Select_Atleast_OneTag;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterStartupScript(this,this.GetType(), "SelectOneTag", sb.ToString(),false);
                return;
            }

        }

        private bool IsAnyFilterTagChecked()
        {
            if (chkAll.Checked || chkCommunity.Checked || chkDistrict.Checked || chkRoad.Checked)
                return true;
            else
                return false;
        }

        private void BindSearchGrid()
        {
            string searchKeyword = txtSearchKey.Text.Trim();
            string search = string.Empty;


            if (!chkAll.Checked)
            {
                if (chkCommunity.Checked)
                    search = search + "2;";
                if (chkDistrict.Checked)
                    search = search + "3;";
                if (chkRoad.Checked)
                    search = search + "4;";
            }
            else
                search = search + '1';

            DataSet ds = repository.fnSearchBasedOnUser(searchKeyword, Session["LoginUserName"].ToString(), search, BasePage.CurrentLanguage == 'E' ? false : true);
            gvSearch.DataSource = ds;
            gvSearch.DataBind();
        }

        protected void gvSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSearch.PageIndex = e.NewPageIndex;
            BindSearchGrid();

        }

        //protected void gvSearch_PageIndexChanged(object sender, GridViewPageEventArgs e)
        //{
        //    gvSearch.PageIndex = e.NewPageIndex;
        //    BindSearchGrid();

        //}

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvSearch.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvSearch.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }

        protected void gvSearch_DataBound(object sender, EventArgs e)
        {

        }

        protected void ddlSearchOn_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string selectedValue = string.IsNullOrEmpty(ddlSearchOn.SelectedValue) ? "1" : ddlSearchOn.SelectedValue;
            //txtSearchKey_AutoCompleteExtender.ContextKey = selectedValue;
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAll.Checked)
            {
                chkCommunity.Checked = false;
                chkDistrict.Checked = false;
                chkRoad.Checked = false;
            }
            else
            {
                chkCommunity.Checked = true;
                //chkDistrict.Checked = true;
                //chkRoad.Checked = true;
            }
        }

        protected void chk_Single_CheckedChanged(object sender, EventArgs e)
        {
            if (chkCommunity.Checked && chkDistrict.Checked && chkRoad.Checked)
            {
                chkAll.Checked = true;
                chkCommunity.Checked = false;
                chkDistrict.Checked = false;
                chkRoad.Checked = false;
            }
            else if (!chkCommunity.Checked || !chkDistrict.Checked || !chkRoad.Checked)
                chkAll.Checked = false;
        }

    }
}