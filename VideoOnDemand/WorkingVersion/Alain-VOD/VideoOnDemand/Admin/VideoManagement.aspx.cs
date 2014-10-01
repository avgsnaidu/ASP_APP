using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Admin
{
    public partial class VideoManagement : BasePage
    {
        clsGroupManagement groupRepository = new clsGroupManagement();
        clsVideoManagement repository = new clsVideoManagement();
        clsVideoTags repositoryVdTag = new clsVideoTags();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Request.IsAuthenticated && Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                {
                    if (!IsPostBack)
                    {
                        BindVideoStatus();
                        BindGroups(false, true);
                        Session["groupSelected"] = Session["Status"] = string.Empty;
                        BindVideos();

                    }
                }
                else
                    Response.Redirect("~/Admin/login.aspx");
            }
            else
            {
                Response.Redirect("~/Admin/login.aspx");
            }
        }

        protected void GridView_Load(object sender, System.EventArgs e)
        {
            Control gv = (GridView)sender;
            if (!gv.Page.IsPostBack)
            {
                GridViewPageSize_N.SetPageSize(this.Page, (GridView)sender);
            }

        }

        protected void GridView_RowCreated(object sender, GridViewRowEventArgs e)
        {

            GridViewPageSize_N.AddSizerToGridPager((GridView)sender, e.Row, Resources.MasterData.Grid_PageSize_Label);
        }

        public void Page_Init(object o, EventArgs e)
        {

            VideosObjectSource.TypeName = this.GetType().BaseType.FullName.ToString();
        }

        private void BindVideoStatus()
        {
            DataSet ds = repository.GetVideoStatus();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].NewRow();
                dr["StatusCode"] = 0;
                dr["StatusName"] = Resources.VideoManagement.ddlStatus_Select_Text;
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
                dr["StatusName"] = Resources.VideoManagement.ddlStatus_Select_Text;
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

        public DataTable BindVideosData()
        {

            clsGroupManagement groupRepository = new clsGroupManagement();

            char status = (Session["Status"] != null && Session["Status"].ToString() != string.Empty) ? Convert.ToChar(Session["Status"].ToString()) : '0';
            int groupSelected = (Session["groupSelected"] != null && Session["groupSelected"].ToString() != string.Empty) ? Convert.ToInt32(Session["groupSelected"].ToString()) : 0;


            DataSet ds = repository.GetVideosList(Convert.ToChar(status), groupSelected, BasePage.CurrentLanguage);

            DataSet GroupsList = groupRepository.GetGroups();

            DataTable videosList = ds.Tables[0];
            for (int i = 0; i < videosList.Rows.Count; i++)
            {
                string groupIds = string.Empty;
                string groupNames = string.Empty;

                string videoId = videosList.Rows[i]["VIDEOID"].ToString();
                DataSet groupIDSet = repository.GetGroupIDsOfVideos(videoId);
                if (groupIDSet.Tables[0].Rows.Count > 0)
                {
                    for (int j = 0; j < groupIDSet.Tables[0].Rows.Count; j++)
                    {
                        if (groupIds.Length > 0)
                            groupIds = groupIds + ',';
                        if (groupNames.Length > 0)
                            groupNames = groupNames + ',';
                        groupIds = groupIds + groupIDSet.Tables[0].Rows[j]["GroupId"].ToString();
                        DataRow groupNameRow = GroupsList.Tables[0].Select("GroupId=" + groupIDSet.Tables[0].Rows[j]["GroupId"].ToString()).FirstOrDefault();
                        groupNames = groupNames + groupNameRow["GroupName"].ToString();
                    }

                }

                videosList.Rows[i]["GroupIDs"] = groupIds;
                videosList.Rows[i]["GroupNames"] = groupNames;
            }
            //gvVideoManagement.DataSource = ds;
            //gvVideoManagement.DataBind();
            videosList.AcceptChanges();

            return videosList;

        }

        private void BindVideos()
        {
            gvVideoManagement.DataBind();

        }

        protected void lnkAssignVidToGroup_Click(object sender, EventArgs e)
        {
            bool atLeastOneSelected = default(bool);
            int defaultSelectedVideo = default(int);

            StringBuilder selectedVideos = new StringBuilder();
            foreach (GridViewRow row in gvVideoManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");

                if (checkBox != null)
                {
                    if (checkBox.Checked)
                    {
                        atLeastOneSelected = true;
                        if (selectedVideos.Length >= 1)
                            selectedVideos.Append(',');
                        selectedVideos.Append(gvVideoManagement.DataKeys[row.RowIndex].Value.ToString());
                        //break;
                    }
                }

            }
            if (!atLeastOneSelected)
            {
                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = Resources.VideoManagement.MSG_Select_Atleast_One;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "SelectOneVideo", sb.ToString(), false);
                return;

            }
            else
            {
                DataSet ds = repository.GetGroupIDsOfVideos(selectedVideos.ToString());
                if (ds.Tables[0].Rows.Count > 0)
                    defaultSelectedVideo = Convert.ToInt32(ds.Tables[0].Rows[0]["GroupID"].ToString());

                if (BindGroups(true, false, defaultSelectedVideo))
                {
                    //data-toggle="modal" data-target="#myModal3"
                    btnAssign.Visible = true;
                    btnRemoveAssigned.Visible = false;


                    ltlAssignVidToGroup.Text = Resources.VideoManagement.GroupSelectModal_Header;


                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#myModal3').modal('show');");
                    sb.Append(@"</script>");
                    //ScriptManager.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString()); //(0r)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AddModalScript", sb.ToString(), false);
                }
                else
                {
                    StringBuilder sb = new System.Text.StringBuilder();
                    lblMessage.Text = Resources.VideoManagement.MSG_NoGroups_Avalable_To_assign;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "SelectOneVideo", sb.ToString(), false);
                    return;

                }
            }
        }

        protected void lnkRemoveVidFromGroup_Click(object sender, EventArgs e)
        {
            bool atLeastOneSelected = default(bool);
            StringBuilder selectedVideos = new StringBuilder();
            foreach (GridViewRow row in gvVideoManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null)
                {
                    if (checkBox.Checked)
                    {
                        atLeastOneSelected = true;
                        if (selectedVideos.Length >= 1)
                            selectedVideos.Append(',');
                        selectedVideos.Append("'" + gvVideoManagement.DataKeys[row.RowIndex].Value + "'");
                        //break;
                    }
                }
            }


            if (!atLeastOneSelected)
            {
                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = Resources.VideoManagement.MSG_Select_Atleast_One;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "SelectOneVideo", sb.ToString(), false);
                return;

            }

            string selectedGroups = string.Empty;

            DataSet dsVidoes = repository.GetGroupIDsOfVideos(selectedVideos.ToString());

            if (dsVidoes.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < dsVidoes.Tables[0].Rows.Count; i++)
                {
                    if (selectedGroups.Length >= 1)
                        selectedGroups = selectedGroups + ",";
                    selectedGroups = selectedGroups + dsVidoes.Tables[0].Rows[i]["GroupId"].ToString();
                }
            }

            if (BindSpecificGroups(selectedGroups))
            {
                //data-toggle="modal" data-target="#myModal3"
                btnAssign.Visible = false;
                btnRemoveAssigned.Visible = true;
                ltlAssignVidToGroup.Text = Resources.VideoManagement.GroupRemoveModal_Header;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModal3').modal('show');");
                sb.Append(@"</script>");
                //ScriptManager.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString()); //(0r)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AddModalScript", sb.ToString(), false);
            }
            else
            {
                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = Resources.VideoManagement.MSG_NoGroups_To_RemoveAssigned;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "SelectOneVideo", sb.ToString(), false);
                return;

            }

        }

        private bool BindSpecificGroups(string selectedGroupsList)
        {

            bool groupBinded = false;
            DataSet ds1 = groupRepository.GetGroups();
            //groupRepository.GetGroups().Tables[0].DefaultView.RowFilter = "GroupID IN (" + selectedVideosList + ")";

            DataTable dt = ds1.Tables[0];
            //dt.DefaultView.RowFilter = "GroupID IN (" + selectedVideosList + ")";
            if (!string.IsNullOrEmpty(selectedGroupsList))
            {
                DataView dView = new DataView(dt);
                dView.RowFilter = "GroupID IN (" + selectedGroupsList + ")";
                dt = dView.ToTable();

                if (dt.Rows.Count > 0)
                {
                    ddlGroupList.Items.Clear();
                    DataRow dr = dt.NewRow();
                    dr["GroupId"] = 0;
                    dr["GroupName"] = Resources.VideoManagement.ddlGroupsList_EmtpySelect_Text;
                    dt.Rows.InsertAt(dr, 0);
                    ddlGroupList.DataTextField = "GroupName";
                    ddlGroupList.DataValueField = "GroupId";
                    ddlGroupList.DataSource = dt;
                    ddlGroupList.DataBind();
                    ddlGroupList.Items[1].Selected = true;
                    groupBinded = true;

                }
                else
                {
                    groupBinded = false;
                }
            }
            return groupBinded;
        }

        protected void gvVideoManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string commandNames = e.CommandArgument.ToString();
            string[] commandArguments = commandNames.Split(';');

            int index = Convert.ToInt32(commandArguments[0]);

            Session["VideoId"] = index;
            if (e.CommandName.Equals("Editing"))
            {
                if (index > 0)
                {
                    BindCommunitiesList();
                    BindDistrictList();
                    BindRoadDistrict();

                    DataSet ds = GetVideoTagsDetails(index);


                    lblVideoName.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["VIDEONAME"].ToString());
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["COMMUNITY_TAG"].ToString()))
                        ddlCommunityTag.Items.FindByValue(ds.Tables[0].Rows[0]["COMMUNITY_TAG"].ToString()).Selected = true;
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["DISTRICT_TAG"].ToString()))
                        ddlDistrictTag.Items.FindByValue(ds.Tables[0].Rows[0]["DISTRICT_TAG"].ToString()).Selected = true;
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ROAD_TAG"].ToString()))
                        ddlRoadTag.Items.FindByValue(ds.Tables[0].Rows[0]["ROAD_TAG"].ToString()).Selected = true;

                    //txtCommunityTag.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["COMMUNITY_TAG"].ToString());
                    //txtDistrictTag.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["DISTRICT_TAG"].ToString());
                    //txtRoadTag.Text = HttpUtility.HtmlDecode(ds.Tables[0].Rows[0]["ROAD_TAG"].ToString());

                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#editTagsModal').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AdddModalScript", sb.ToString(), false);

                }
            }
            else if (e.CommandName.Equals("Play"))
            {
                string VideoName = commandArguments[1].ToString();

                if (!string.IsNullOrEmpty(VideoName))
                {
                    string pageurl = "Player/VideoPlayer.aspx?videoName=" + VideoName;


                    LoadVideoFile(VideoName);

                    //playVideosss();

                }

            }

        }

        private void BindRoadDistrict()
        {
            DataSet ds = null;
            ds = repositoryVdTag.GetRoadsList(BasePage.CurrentLanguage);
            if (ds != null)
            {

                ddlRoadTag.DataValueField = "ROADNO";
                ddlRoadTag.DataTextField = "ROADNAME";

                ddlRoadTag.DataSource = ds;
                ddlRoadTag.DataBind();
                ddlRoadTag.Items.Insert(0, new ListItem(Resources.VideoManagement.mdlTagEdit_RoadSelect_Text, "-1"));
            }
        }

        private void BindDistrictList()
        {
            DataSet ds = null;
            ds = repositoryVdTag.GetDistrictList(BasePage.CurrentLanguage);
            if (ds != null)
            {
                ddlDistrictTag.DataValueField = "DISTNO";
                ddlDistrictTag.DataTextField = "DISTRICTNAME";
                ddlDistrictTag.DataSource = ds;
                ddlDistrictTag.DataBind();
                ddlDistrictTag.Items.Insert(0, new ListItem(Resources.VideoManagement.mdlTagEdit_DistSelect_Text, "-1"));
            }
        }

        private void BindCommunitiesList()
        {
            DataSet ds = null;
            ds = repositoryVdTag.GetCommunityList(BasePage.CurrentLanguage);
            if (ds != null)
            {
                ddlCommunityTag.DataValueField = "COMMUNITYNO";
                ddlCommunityTag.DataTextField = "COMMUNITYNAME";
                ddlCommunityTag.DataSource = ds;
                ddlCommunityTag.DataBind();
                ddlCommunityTag.Items.Insert(0, new ListItem(Resources.VideoManagement.mdlTagEdit_CommnitySelect_Text, "0"));
            }
        }

        private void playVideosss()
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#editTagsModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "AdddModalScript", sb.ToString(), false);

        }

        private DataSet GetVideoTagsDetails(int vidoeId)
        {
            return repository.GetVideoTagDetails(vidoeId, BasePage.CurrentLanguage);
        }

        private bool BindGroups(bool bindPopUp = true, bool fromLoad = false, int defaultSelectedVideo = 0)
        {
            bool groupBinded = false;
            DataSet ds = groupRepository.GetGroups();

            if (ds.Tables[0].Rows.Count > 0)
            {
                if (fromLoad)
                {
                    //DataRow drow = ds.Tables[0].NewRow();
                    //drow["GroupId"] = 0;
                    //drow["GroupName"] = Resources.VideoManagement.ddlFilterGroup_EmptySelect_Text;
                    //ds.Tables[0].Rows.InsertAt(drow, 0);
                    ddlGroupsFilter.Items.Clear();

                    ddlGroupsFilter.DataTextField = "GroupName";
                    ddlGroupsFilter.DataValueField = "GroupId";
                    ddlGroupsFilter.DataSource = ds;
                    ddlGroupsFilter.DataBind();

                    groupBinded = true;
                }
                if (bindPopUp)
                {
                    ddlGroupList.Items.Clear();

                    DataRow dr = ds.Tables[0].NewRow();
                    dr["GroupId"] = 0;
                    dr["GroupName"] = Resources.VideoManagement.ddlGroupsList_EmtpySelect_Text;
                    ds.Tables[0].Rows.InsertAt(dr, 0);
                    ddlGroupList.DataTextField = "GroupName";
                    ddlGroupList.DataValueField = "GroupId";
                    ddlGroupList.DataSource = ds;
                    ddlGroupList.DataBind();
                    ddlGroupList.Items.FindByValue(defaultSelectedVideo.ToString()).Selected = true;
                    groupBinded = true;
                }
            }
            else
            {
                //System.Text.StringBuilder sb;

                //sb = new System.Text.StringBuilder();
                //lblMessage.Text = "There is no groups avaliable";
                //sb.Append(@"<script type='text/javascript'>");
                //sb.Append("$('#alertMessageModal').modal('show');");
                //sb.Append(@"</script>");
                //ScriptManager.RegisterStartupScript(GetType(), "NoGroups", sb.ToString(), false);


                groupBinded = false;
            }

            if (fromLoad)
            {
                if (groupBinded)
                    ddlGroupsFilter.Items.Insert(0, new ListItem(Resources.VideoManagement.ddlGroupsList_EmtpySelect_Text, "0"));
                else
                    ddlGroupsFilter.Items.Insert(0, new ListItem(Resources.VideoManagement.ddlGroupsList_NoGroups_Text, "0"));
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
                    var item = gvVideoManagement.DataKeys[row.RowIndex]["STATUSCODE"].ToString();
                    if (item != "D")
                    {
                        ChkBoxRows.Checked = false;
                    }
                    else
                    {
                        ChkBoxRows.Checked = true;
                        row.BackColor = System.Drawing.Color.FromName("#D1DDF1");
                    }
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

        protected void ddlGroups_SelectedIndexChanged(object sender, EventArgs e)
        {
            char status = (ddlStatus.SelectedItem.Value.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '0';
            int groupSelected = (ddlGroupsFilter.SelectedItem != null && ddlGroupsFilter.SelectedValue.ToString() != string.Empty) ? Convert.ToInt32(ddlGroupsFilter.SelectedItem.Value) : 0;

            Session["Status"] = status;
            Session["groupSelected"] = groupSelected;

            BindVideos();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            char status = (ddlStatus.SelectedItem.Value.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '0';
            int groupSelected = (ddlGroupsFilter.SelectedItem != null && ddlGroupsFilter.SelectedValue.ToString() != string.Empty) ? Convert.ToInt32(ddlGroupsFilter.SelectedItem.Value) : 0;
            //BindVideos(status, groupSelected);

            Session["Status"] = status;
            Session["groupSelected"] = groupSelected;

            BindVideos();
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Session["SelectedVideosToAddGroup"] = "";
            StringBuilder sb = new StringBuilder();

            if (ddlGroupList.SelectedItem.Value == null || ddlGroupList.SelectedItem.Value == "" || ddlGroupList.SelectedItem.Value == "0")
            {
                sb = new System.Text.StringBuilder();

                lblMessage.Text = Resources.Users.MSG_Select_ValidGroupName;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SelectGroup", sb.ToString(), false);

                return;
            }
            foreach (GridViewRow row in gvVideoManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null && checkBox.Checked)
                {
                    if (sb.Length > 0)
                        sb.Append(';');
                    sb.Append(gvVideoManagement.DataKeys[row.RowIndex].Value.ToString());
                }
            }
            Session["SelectedVideosToAddGroup"] = sb.ToString();

            //string scriptValue = string.Format("<script>alert('checked Checkboxes {0} ');</script>", Session["SelectedVideosToAddGroup"]);
            //ScriptManager.RegisterStartupScript(this.GetType(), "SelectedList", scriptValue, false);

            if (Session["SelectedVideosToAddGroup"] != null && Session["SelectedVideosToAddGroup"].ToString() != "")
            {
                bool returnValue = default(bool);
                try
                {
                    string message = string.Empty;
                    returnValue = repository.AssignVideosToGroup(Convert.ToInt32(ddlGroupList.SelectedItem.Value), Session["SelectedVideosToAddGroup"].ToString());
                    BindVideos();
                    var selectedUsers = Session["SelectedVideosToAddGroup"].ToString().Split(';');

                    string videoName = string.Empty;
                    if (selectedUsers.Length == 1)
                        videoName = repository.GetVideoName(Session["SelectedVideosToAddGroup"].ToString());

                    if (string.IsNullOrEmpty(videoName))
                        message = Resources.VideoManagement.MSG_Videos_AssingedToGroup_Sucess + " - <strong>" + (string.IsNullOrEmpty(ddlGroupList.SelectedItem.Text) ? "" : ddlGroupList.SelectedItem.Text) + "</strong>";
                    else
                        message = "<strong>" + videoName + "</strong> - " + Resources.VideoManagement.MSG_Videos_AssingedToGroup_Sucess_Signle + " - <strong>" + (string.IsNullOrEmpty(ddlGroupList.SelectedItem.Text) ? "" : ddlGroupList.SelectedItem.Text) + "</strong>";


                    if (returnValue)
                    {

                        lblMessage.Text = message;
                        btnRemoveAssigned.Visible = false;
                        btnAssign.Visible = true;
                        sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#myModal3').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
                    }
                }
                catch (Exception ex)
                {
                    VODActionLog.LogException(VODActionLog.LogMessageType.Exception, ex.StackTrace, ex.Message, HttpContext.Current.User.Identity.Name, Request.RawUrl);

                    returnValue = false;
                }

                if (!returnValue)
                {
                    lblMessage.Text = Resources.VideoManagement.MSG_Videos_AssingedToGroup_failed;
                    sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#myModal3').modal('hide');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
                }
            }
            BindGroups(false, true);
        }

        protected void gvVideoManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVideoManagement.PageIndex = e.NewPageIndex;
            BindVideosBasedOnSelection();
        }

        private void BindVideosBasedOnSelection()
        {
            //char status = (ddlStatus.SelectedItem.Value.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '0';
            //int groupSelected = (ddlGroupsFilter.SelectedItem != null && ddlGroupsFilter.SelectedValue.ToString() != string.Empty) ? Convert.ToInt32(ddlGroupsFilter.SelectedItem.Value) : 0;
            //BindVideos(status, groupSelected);
            BindVideos();
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
        }

        protected void btnSaveTag_Click(object sender, EventArgs e)
        {
            StringBuilder sb;
            bool updateSucess = false;
            updateSucess = repositoryVdTag.UpdateVideoTags(Convert.ToInt32(Session["VideoId"].ToString()), Convert.ToInt16(ddlCommunityTag.SelectedValue), Convert.ToInt16((ddlDistrictTag.SelectedValue == "-1") ? "0" : ddlDistrictTag.SelectedValue), Convert.ToInt16((ddlRoadTag.SelectedValue == "-1") ? "0" : ddlRoadTag.SelectedValue));
            if (updateSucess)
            {
                BindVideosBasedOnSelection();
                lblMessage.Text = Resources.VideoManagement.MSG_Video_Tags_Updated;
                sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#editTagsModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

            }
            else
            {
                lblMessage.Text = Resources.VideoManagement.MSG_VideoTags_Update_Failed;
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
            if (e.Row.RowIndex > 0)
            {
                var item = gvVideoManagement.DataKeys[e.Row.RowIndex]["STATUSCODE"].ToString();
                if (item != "D")
                {
                    CheckBox checkBox = (CheckBox)e.Row.FindControl("chkSelectUser");
                    if (checkBox != null)
                        checkBox.Checked = false;

                }
            }
        }

        private void LoadVideoFile(string videoName)
        {
            // Define the name and type of the client scripts on the page.
            String csname1 = "PopupScript";
            Type cstype = this.GetType();

            // Get a ScriptManagerManager reference from the Page class.
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

        public bool IsStatusCompleted(char Status)
        {
            if (Status == 'D')
                return true;
            else
                return false;
        }

        protected void btnAssignGroup_Click(object sender, EventArgs e)
        {

        }

        protected void btnRemoveAssigned_Click(object sender, EventArgs e)
        {
            Session["SelectedVideosToRemoveGroup"] = "";
            StringBuilder sb = new StringBuilder();

            if (ddlGroupList.SelectedItem.Value == null || ddlGroupList.SelectedItem.Value == "" || ddlGroupList.SelectedItem.Value == "0")
            {
                sb = new System.Text.StringBuilder();

                lblMessage.Text = Resources.Users.MSG_Select_ValidGroupName;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SelectGroup", sb.ToString(), false);

                return;
            }
            foreach (GridViewRow row in gvVideoManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null && checkBox.Checked)
                {
                    if (sb.Length > 0)
                        sb.Append(';');
                    sb.Append(gvVideoManagement.DataKeys[row.RowIndex].Value.ToString());
                }
            }
            Session["SelectedVideosToRemoveGroup"] = sb.ToString();

            if (Session["SelectedVideosToRemoveGroup"] != null && Session["SelectedVideosToRemoveGroup"].ToString() != "")
            {
                bool returnValue = default(bool);
                try
                {
                    returnValue = repository.RemoveVideosFromGroup(Convert.ToInt32(ddlGroupList.SelectedItem.Value), Session["SelectedVideosToRemoveGroup"].ToString());
                    BindVideos();
                    string message = string.Empty;
                    var selectedUsers = Session["SelectedVideosToRemoveGroup"].ToString().Split(',');

                    string videoName = string.Empty;
                    if (selectedUsers.Length == 1)
                        videoName = repository.GetVideoName(Session["SelectedVideosToRemoveGroup"].ToString());

                    if (string.IsNullOrEmpty(videoName))
                        message = Resources.VideoManagement.MSG_Videos_RemovedFromGroup_Sucess + "<strong>" + (string.IsNullOrEmpty(ddlGroupList.SelectedItem.Text) ? "" : ddlGroupList.SelectedItem.Text) + "</strong>";
                    else
                        message = "<strong>" + videoName + "</strong> - " + Resources.VideoManagement.MSG_Videos_RemovedFromGroup_Sucess + " - <strong>" + (string.IsNullOrEmpty(ddlGroupList.SelectedItem.Text) ? "" : ddlGroupList.SelectedItem.Text) + "</strong>";


                    if (returnValue)
                    {

                        lblMessage.Text = message;
                        btnRemoveAssigned.Visible = false;
                        btnAssign.Visible = true;
                        sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#myModal3').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "removeHideModalScript", sb.ToString(), false);

                    }
                }
                catch (Exception ex)
                {
                    VODActionLog.LogException(VODActionLog.LogMessageType.Exception, ex.StackTrace, ex.Message, HttpContext.Current.User.Identity.Name, Request.RawUrl);
                    returnValue = false;
                }

                if (!returnValue)
                {
                    //BindGroups(false, true);
                    string message = string.Empty;
                    message = Resources.VideoManagement.MSG_Videos_RemovedFromGroup_failed;
                    string singleqoute = "'";
                    message = message.Replace(singleqoute, " ");
                    lblMessage.Text = message;

                    sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#myModal3').modal('hide');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
                }
                BindGroups(false, true);

            }

        }


    }
}