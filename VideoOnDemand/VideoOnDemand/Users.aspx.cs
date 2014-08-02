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
    public partial class UserManagement : ChildBasePage
    {
        clsUserManagement repository = new clsUserManagement();
        clsGroupManagement groupRepository = new clsGroupManagement();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ViewState["SelectedUsersToAddGroup"] = "";
            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                {

                    if (!IsPostBack)
                    {
                        BindUsers();
                        BindGroups(false);
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

        private void BindUsers(int groupId = 0)
        {
            DataSet ds = repository.GetUsersList(groupId);
            gvUserManagement.DataSource = ds;
            gvUserManagement.DataBind();
        }

        protected void gvUserManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string commandNames = e.CommandArgument.ToString();
            string[] commandArguments = commandNames.Split(';');


            Session["UserID"] = "";

            if (e.CommandName.Equals("Editing"))
            {
                int userId = Convert.ToInt32(commandArguments[0]);
                int GroupId = Convert.ToInt32(commandArguments[1]);

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                // row contains current Clicked Gridview Row
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                Session["UserID"] = userId;
                Session["GroupID"] = GroupId;
                lblUserName.Text = row.Cells[2].Text;
                if (BindGroups(true, true))
                {
                    ddlGroupsEdit.SelectedValue = GroupId.ToString();

                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#editUserGroupModal').modal('show');");

                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowEditModal", sb.ToString(), false);
                }

            }
            else if (e.CommandName.Equals("Deleting"))
            {
                int userId = Convert.ToInt32(commandArguments[0]);
                int GroupId = Convert.ToInt32(commandArguments[1]);

                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                Session["UserID"] = userId;
                //deleteWarning
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteWarning').modal('show');");

                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowDeleteConfirmModal", sb.ToString(), false);

            }

        }




        protected void lnkAssignUserGroup_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb;
            bool atLeastOneSelected = default(bool);
            foreach (GridViewRow row in gvUserManagement.Rows)
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
                sb = new System.Text.StringBuilder();
                lblAlertHeader.Text = "Select User";
                lblMessage.Text = "Please select at least one user";
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(GetType(), "SelectOneUser", sb.ToString());
            }
            if (BindGroups())
            {
                sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#mdlAssignGroup').modal('show');");
                sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString()); //(0r)

                ScriptManager.RegisterStartupScript(this, this.GetType(), "EditModalScript", sb.ToString(), false);
            }


        }

        private bool BindGroups(bool bindPopUp = true, bool isEdit = false, bool fromLoad = true)
        {
            bool groupBinded = false;
            DataSet ds = groupRepository.GetGroups();

            if (ds.Tables[0].Rows.Count > 0)
            {
                if (fromLoad)
                {
                    //DataRow drow = ds.Tables[0].NewRow();
                    //drow["GroupId"] = 0;
                    //drow["GroupName"] = "Select Group";
                    //ds.Tables[0].Rows.InsertAt(drow, 0);
                    ddlGroupsFilter.DataTextField = "GroupName";
                    ddlGroupsFilter.DataValueField = "GroupId";
                    ddlGroupsFilter.DataSource = ds;
                    ddlGroupsFilter.DataBind();
                    ddlGroupsFilter.Items.Insert(0, new ListItem(Resources.Users.ddlGroupsList_SelectGroup_Text, "0"));

                    groupBinded = true;
                }

                //DataRow dr = ds.Tables[0].NewRow();
                //dr["GroupId"] = 0;
                //dr["GroupName"] = "Select";
                //ds.Tables[0].Rows.InsertAt(dr, 0);
                if (bindPopUp)
                {
                    if (!isEdit)
                    {
                        ddlGroupList.DataTextField = "GroupName";
                        ddlGroupList.DataValueField = "GroupId";
                        ddlGroupList.DataSource = ds;
                        ddlGroupList.DataBind();
                        ddlGroupList.Items.Insert(0, new ListItem(Resources.Users.ddlGroupsList_SelectGroup_Text, "0"));

                        groupBinded = true; ;
                    }
                    else
                    {
                        //DataRow dr = ds.Tables[0].NewRow();
                        //dr["GroupId"] = 0;
                        //dr["GroupName"] = "Select";
                        //ds.Tables[0].Rows.InsertAt(dr, 0);
                        ddlGroupsEdit.DataTextField = "GroupName";
                        ddlGroupsEdit.DataValueField = "GroupId";
                        ddlGroupsEdit.DataSource = ds;
                        ddlGroupsEdit.DataBind();
                        groupBinded = true;
                        ddlGroupsEdit.Items.Insert(0, new ListItem(Resources.Users.ddlGroupsList_SelectGroup_Text, "0"));
                    }


                }
            }
            else
            {
                //System.Text.StringBuilder sb;

                //sb = new System.Text.StringBuilder();
                //lblAlertHeader.Text = "No Groups";
                //lblMessage.Text = "There is no groups avaliable";
                //sb.Append(@"<script type='text/javascript'>");
                //sb.Append("$('#alertMessageModal').modal('show');");
                //sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(GetType(), "NoGroups", sb.ToString(), false);

                if (fromLoad)
                    ddlGroupsFilter.Items.Insert(0, new ListItem(Resources.Users.ddlGroupsList_NoGroup_Text, "0"));
                if (bindPopUp)
                {
                    if (!isEdit)
                        ddlGroupList.Items.Insert(0, new ListItem(Resources.Users.ddlGroupsList_NoGroup_Text, "0"));

                    else
                        ddlGroupsEdit.Items.Insert(0, new ListItem(Resources.Users.ddlGroupsList_NoGroup_Text, "0"));
                }

                groupBinded = false;

            }
            return groupBinded;
        }

        //private bool BindEditGroupsList()
        //{
        //    bool groupBinded = false;
        //    DataSet ds = groupRepository.GetGroups();
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {

        //    }
        //    else
        //    {
        //        System.Text.StringBuilder sb;

        //        sb = new System.Text.StringBuilder();
        //        lblMessage.Text = "There is no groups avaliable.";
        //        sb.Append(@"<script type='text/javascript'>");
        //        sb.Append("$('#alertMessageModal').modal('show');");
        //        sb.Append(@"</script>");
        //        ClientScript.RegisterStartupScript(GetType(), "NoGroups", sb.ToString(), false);
        //        groupBinded = false;
        //    }
        //    return groupBinded;
        //}

        protected void chkSelectUser_CheckedChanged(object sender, EventArgs e)
        {


            CheckBox ChkBoxHeader = (CheckBox)gvUserManagement.HeaderRow.FindControl("chkAll");
            // if top is checked


            bool allNotChecked = default(bool);
            foreach (GridViewRow row in gvUserManagement.Rows)
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

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvUserManagement.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in gvUserManagement.Rows)
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

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Session["SelectedUsersToAddGroup"] = "";
            StringBuilder sb = new StringBuilder();

            if (ddlGroupList.SelectedItem.Value == null || ddlGroupList.SelectedItem.Value == "" || ddlGroupList.SelectedItem.Value == "0")
            {

                sb = new System.Text.StringBuilder();
                lblAlertHeader.Text = "Select Group";
                lblMessage.Text = "Please select valid group name";
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(GetType(), "SelectGroup", sb.ToString(), false);
                return;
            }
            foreach (GridViewRow row in gvUserManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null && checkBox.Checked)
                {
                    sb.Append(gvUserManagement.DataKeys[row.RowIndex].Value.ToString()); sb.Append(';');
                }
            }
            Session["SelectedUsersToAddGroup"] = sb.ToString();

            //string scriptValue = string.Format("<script>alert('checked Checkboxes {0} ');</script>", Session["SelectedUsersToAddGroup"]);
            //ClientScript.RegisterStartupScript(this.GetType(), "SelectedList", scriptValue, false);


            if (Session["SelectedUsersToAddGroup"] != null && Session["SelectedUsersToAddGroup"].ToString() != "")
            {
                repository.AssignUsersToGroup(Convert.ToInt32(ddlGroupList.SelectedItem.Value), Session["SelectedUsersToAddGroup"].ToString());
                BindUsers();

                lblMessage.Text = "Successfully users assigned to group ";
                lblAlertHeader.Text = "Users Assigned";
                sb = new System.Text.StringBuilder();


                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#mdlAssignGroup').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

            }

        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            StringBuilder sb;
            if (ddlGroupsEdit.SelectedItem.Value == null || ddlGroupsEdit.SelectedItem.Value == "" || ddlGroupsEdit.SelectedItem.Value == "0")
            {

                sb = new System.Text.StringBuilder();
                lblAlertHeader.Text = "Select Group";
                lblMessage.Text = "Please select valid group name";
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(GetType(), "SelectGroup", sb.ToString(), false);

                return;
            }

            var returnValue = repository.UpdateUserGroup(Convert.ToInt32(ddlGroupsEdit.SelectedItem.Value), Convert.ToInt32(Session["UserID"].ToString()));
            if (returnValue)
                BindUsers();
            lblAlertHeader.Text = "Group Updated";
            lblMessage.Text = "Group Updated Successfully";
            sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#alertMessageModal').modal('show');");
            sb.Append("$('#editUserGroupModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditHideModalScript", sb.ToString(), false);

            //}


        }

        protected void btnDeleteConform_Click(object sender, EventArgs e)
        {
            var returnValue = repository.UpdateUserGroup(0, Convert.ToInt32(Session["UserID"].ToString()));
            if (returnValue)
                BindUsers();
            lblAlertHeader.Text = "Group Delete";
            lblMessage.Text = "Group deleted successfully";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#alertMessageModal').modal('show');");
            sb.Append("$('#deleteWarning').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteHideModalScript", sb.ToString(), false);

        }

        protected void ddlGroupsFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlGroupsFilter.SelectedItem != null && ddlGroupsFilter.SelectedItem.Value != string.Empty)
            {
                var group = Convert.ToInt32(ddlGroupsFilter.SelectedItem.Value);
                BindUsers(group);
            }
        }

        protected void gvUserManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUserManagement.PageIndex = e.NewPageIndex;

            var group = Convert.ToInt32((ddlGroupsFilter.SelectedItem != null) ? ddlGroupsFilter.SelectedItem.Value : "0");
            BindUsers(group);
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvUserManagement.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvUserManagement.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }

        }




        //protected void lnkUserMang_Click(object sender, EventArgs e)
        //{

        //    Response.Redirect(@"~/VODManage/UserManagement.aspx");

        //}

        //protected void lnkVideoMang_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect(@"~/VODManage/VideoManagement.aspx");
        //}


    }
}