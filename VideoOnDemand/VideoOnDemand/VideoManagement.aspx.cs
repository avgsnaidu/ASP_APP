using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.VODManage
{
    public partial class VideoManagement : BasePage
    {
        clsGroupManagement groupRepository = new clsGroupManagement();
        clsVideoManagement repository = new clsVideoManagement();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVideoStatus();
                BindGroups(false, true);
                char status = (ddlStatus.SelectedItem != null && ddlStatus.SelectedValue.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '0';
                int groupSelected = (ddlGroupsFilter.SelectedItem != null && ddlGroupsFilter.SelectedValue.ToString() != string.Empty) ? Convert.ToInt32(ddlGroupsFilter.SelectedItem.Value) : 0;
                BindVideos(status, groupSelected);

            }
        }

        private void BindVideoStatus()
        {
            DataSet ds = repository.GetVideoStatus();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].NewRow();
                dr["StatusCode"] = 0;
                dr["StatusName"] = "Select Status";
                ds.Tables[0].Rows.InsertAt(dr, 0);

                ddlStatus.DataTextField = "StatusName";
                ddlStatus.DataValueField = "StatusCode";

                ddlStatus.DataSource = ds;
                ddlStatus.DataBind();

            }
            else
            {
                var dt = new DataTable();
                dt.Columns.Add("StatusCode");
                dt.Columns.Add("StatusName");
                DataRow dr = dt.NewRow();
                dr["StatusCode"] = '0';
                dr["StatusName"] = "Select Status";
                dt.Rows.InsertAt(dr, 0);
                dr = dt.NewRow();
                dr["StatusCode"] = 'D';
                dr["StatusName"] = "Converted";
                dt.Rows.InsertAt(dr, 1);
                dr = dt.NewRow();
                dr["StatusCode"] = 'U';
                dr["StatusName"] = "Pending";
                dt.Rows.InsertAt(dr, 2);
                dr = dt.NewRow();
                dr["StatusCode"] = 'P';
                dr["StatusName"] = "Processing";
                dt.Rows.InsertAt(dr, 3);


                ddlStatus.DataTextField = "StatusName";
                ddlStatus.DataValueField = "StatusCode";

                ddlStatus.DataSource = ds;
                ddlStatus.DataBind();


            }


        }

        private void BindVideos(char status = '0', int selectedGroup = 0)
        {
            DataSet ds = repository.GetVideosList(Convert.ToChar(status), selectedGroup);
            gvVideoManagement.DataSource = ds;
            gvVideoManagement.DataBind();

        }

        protected void lnkAssignVidToGroup_Click(object sender, EventArgs e)
        {
            bool atLeastOneSelected = default(bool);
            foreach (GridViewRow row in gvVideoManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null)
                {
                    if (checkBox.Checked)
                        atLeastOneSelected = true;
                }
            }
            if (!atLeastOneSelected)
            {
                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = "Please select at least one video";
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(GetType(), "SelectOneVideo", sb.ToString());
                return;



            }
            if (BindGroups())
            {
                //data-toggle="modal" data-target="#myModal3"
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModal3').modal('show');");
                sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString()); //(0r)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AddModalScript", sb.ToString(), false);
            }


        }

        protected void gvVideoManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Session["VideoId"] = index;
            if (e.CommandName.Equals("Editing"))
            {
                if (index > 0)
                {
                    DataSet ds = GetVideoTagsDetails(index);

                    lblVideoName.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["VIDEONAME"].ToString());
                    txtCommunityTag.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["COMMUNITY_TAG"].ToString());
                    txtDistrictTag.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["DISTRICT_TAG"].ToString());
                    txtRoadTag.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["ROAD_TAG"].ToString());

                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#editTagsModal').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AdddModalScript", sb.ToString(), false);

                }
            }

        }

        private DataSet GetVideoTagsDetails(int vidoeId)
        {
            return repository.GetVideoTagDetails(vidoeId);
        }






        private bool BindGroups(bool bindPopUp = true, bool fromLoad = false)
        {
            bool groupBinded = false;
            DataSet ds = groupRepository.GetGroups();
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (fromLoad)
                {
                    DataRow drow = ds.Tables[0].NewRow();
                    drow["GroupId"] = 0;
                    drow["GroupName"] = "Select Group";
                    ds.Tables[0].Rows.InsertAt(drow, 0);
                    ddlGroupsFilter.DataTextField = "GroupName";
                    ddlGroupsFilter.DataValueField = "GroupId";
                    ddlGroupsFilter.DataSource = ds;
                    ddlGroupsFilter.DataBind();
                    groupBinded = true;
                }
                if (bindPopUp)
                {
                    DataRow dr = ds.Tables[0].NewRow();
                    dr["GroupId"] = 0;
                    dr["GroupName"] = "Select Group";
                    ds.Tables[0].Rows.InsertAt(dr, 0);
                    ddlGroupList.DataTextField = "GroupName";
                    ddlGroupList.DataValueField = "GroupId";
                    ddlGroupList.DataSource = ds;
                    ddlGroupList.DataBind();
                    groupBinded = true;
                }
            }
            else
            {
                System.Text.StringBuilder sb;

                sb = new System.Text.StringBuilder();
                lblMessage.Text = "There is no groups avaliable";
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(GetType(), "NoGroups", sb.ToString(), false);
                groupBinded = false;
            }
            return groupBinded;
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvVideoManagement.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in gvVideoManagement.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkSelectUser");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                    row.BackColor = System.Drawing.Color.FromName("#D1DDF1");
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }

        protected void chkSelectUser_CheckedChanged(object sender, EventArgs e)
        {

            CheckBox ChkBoxHeader = (CheckBox)gvVideoManagement.HeaderRow.FindControl("chkAll");
            // if top is checked 

            bool allNotChecked = default(bool);
            foreach (GridViewRow row in gvVideoManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null)
                {
                    if (!checkBox.Checked)
                    {
                        allNotChecked = true;
                    }
                    else
                    {
                        row.BackColor = System.Drawing.Color.FromName("#D1DDF1");
                    }
                }
            }
            if (allNotChecked)
            {
                if (ChkBoxHeader != null)
                    ChkBoxHeader.Checked = false;
            }
            else if (!ChkBoxHeader.Checked)
            {
                ChkBoxHeader.Checked = true;
            }

        }

        //protected void gvVideoManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    int index = Convert.ToInt32(e.CommandArgument);
        //    //StringBuilder sb;

        //    if (e.CommandName.Equals("Editing"))
        //    {
        //        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //        sb.Append(@"<script type='text/javascript'>");
        //        sb.Append("$('#myModal3').modal('show');");
        //        sb.Append(@"</script>");
        //        //ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString()); //(0r)
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "AddModalScript", sb.ToString(), false);


        //        //GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        //        //// row contains current Clicked Gridview Row
        //        //String VersionId = row.Cells[2].Text;

        //        //StringBuilder sb = new System.Text.StringBuilder();
        //        //lblMessage.Text = "Please select at least one video.";
        //        //sb.Append(@"<script type='text/javascript'>");
        //        //sb.Append("$('#alertMessageModal').modal('show');");
        //        //sb.Append(@"</script>");
        //        //ClientScript.RegisterStartupScript(GetType(), "SelectOneVideo", sb.ToString());

        //        //sb = new System.Text.StringBuilder();

        //        //sb.Append(@"<script type='text/javascript'>");
        //        //sb.Append("$('#alertMessageModal').modal('show');");
        //        //sb.Append(@"</script>");
        //        //ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString(), false);

        //    }

        //}

        protected void ddlGroups_SelectedIndexChanged(object sender, EventArgs e)
        {
            char status = (ddlStatus.SelectedItem.Value.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '0';
            int groupSelected = (ddlGroupsFilter.SelectedItem != null && ddlGroupsFilter.SelectedValue.ToString() != string.Empty) ? Convert.ToInt32(ddlGroupsFilter.SelectedItem.Value) : 0;
            BindVideos(status, groupSelected);
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            char status = (ddlStatus.SelectedItem.Value.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '0';
            int groupSelected = (ddlGroupsFilter.SelectedItem != null && ddlGroupsFilter.SelectedValue.ToString() != string.Empty) ? Convert.ToInt32(ddlGroupsFilter.SelectedItem.Value) : 0;
            BindVideos(status, groupSelected);
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Session["SelectedVideosToAddGroup"] = "";
            StringBuilder sb = new StringBuilder();

            if (ddlGroupList.SelectedItem.Value == null || ddlGroupList.SelectedItem.Value == "" || ddlGroupList.SelectedItem.Value == "0")
            {
                sb = new System.Text.StringBuilder();

                lblMessage.Text = "Please select valid group Name";
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString(), false);

                return;
            }
            foreach (GridViewRow row in gvVideoManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null && checkBox.Checked)
                {
                    sb.Append(gvVideoManagement.DataKeys[row.RowIndex].Value.ToString()); sb.Append(';');
                }
            }
            Session["SelectedVideosToAddGroup"] = sb.ToString();

            //string scriptValue = string.Format("<script>alert('checked Checkboxes {0} ');</script>", Session["SelectedVideosToAddGroup"]);
            //ClientScript.RegisterStartupScript(this.GetType(), "SelectedList", scriptValue, false);


            if (Session["SelectedVideosToAddGroup"] != null && Session["SelectedVideosToAddGroup"].ToString() != "")
            {
                repository.AssignVideosToGroup(Convert.ToInt32(ddlGroupList.SelectedItem.Value), Session["SelectedVideosToAddGroup"].ToString());
                BindVideos();

                lblMessage.Text = "Successfully videos assigned to group";
                sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#myModal3').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

            }
        }

        protected void gvVideoManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVideoManagement.PageIndex = e.NewPageIndex;
            BindVideosBasedOnSelection();

        }

        private void BindVideosBasedOnSelection()
        {
            char status = (ddlStatus.SelectedItem.Value.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '0';
            int groupSelected = (ddlGroupsFilter.SelectedItem != null && ddlGroupsFilter.SelectedValue.ToString() != string.Empty) ? Convert.ToInt32(ddlGroupsFilter.SelectedItem.Value) : 0;
            BindVideos(status, groupSelected);
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvVideoManagement.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvVideoManagement.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }

        protected void btnSaveTag_Click(object sender, EventArgs e)
        {
            StringBuilder sb;
            bool updateSucess = repository.UpdateVideoTags(Convert.ToInt32(Session["VideoId"].ToString()), txtCommunityTag.Text.Trim(), txtDistrictTag.Text.Trim(), txtRoadTag.Text.Trim());
            if (updateSucess)
            {
                BindVideosBasedOnSelection();
                lblMessage.Text = "Successfully video tags updated";
                sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#editTagsModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

            }
            else
            {
                lblMessage.Text = "Updations of video tags not completed";
                sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#editTagsModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
            }



        }

        protected void gvVideoManagement_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }




    }
}