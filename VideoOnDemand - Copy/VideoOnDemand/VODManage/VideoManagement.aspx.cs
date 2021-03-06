﻿using System;
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
    public partial class VideoManagement : System.Web.UI.Page
    {
        clsGroupManagement groupRepository = new clsGroupManagement();
        clsVideoManagement repository = new clsVideoManagement();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                char status = (ddlStatus.SelectedItem.Value.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '1';
                BindVideos(status);
            }
        }

        private void BindVideos(char status = '1')
        {
            DataSet ds = repository.GetVideosList(Convert.ToChar(status));
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
                ClientScript.RegisterStartupScript(GetType(), "Select One User", "<script>alert('please Select At Least One Video')</script>");

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

        private bool BindGroups()
        {
            bool groupBinded = false;
            DataSet ds = groupRepository.GetGroups();
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].NewRow();
                dr["GroupId"] = 0;
                dr["GroupName"] = "Select";
                ds.Tables[0].Rows.InsertAt(dr, 0);
                ddlGroupList.DataTextField = "GroupName";
                ddlGroupList.DataValueField = "GroupId";
                ddlGroupList.DataSource = ds;
                ddlGroupList.DataBind();
                groupBinded = true; ;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "NoGroups", "<script>alert('there is no groups avaliable')</script>", false); groupBinded = false;
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

        protected void gvVideoManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName.Equals("Edit"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                // row contains current Clicked Gridview Row
                String VersionId = row.Cells[2].Text;
            }

        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            char status = (ddlStatus.SelectedItem.Value.ToString() != string.Empty) ? Convert.ToChar(ddlStatus.SelectedItem.Value) : '1';
            BindVideos(status);
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Session["SelectedVideosToAddGroup"] = "";
            StringBuilder sb = new StringBuilder();

            if (ddlGroupList.SelectedItem.Value == null || ddlGroupList.SelectedItem.Value == "" || ddlGroupList.SelectedItem.Value == "0")
            {
                string script = string.Format("<script>alert('Please select valid group Name');</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", script, false);
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

            string scriptValue = string.Format("<script>alert('checked Checkboxes {0} ');</script>", Session["SelectedVideosToAddGroup"]);
            ClientScript.RegisterStartupScript(this.GetType(), "SelectedList", scriptValue, false);


            if (Session["SelectedVideosToAddGroup"] != null && Session["SelectedVideosToAddGroup"].ToString() != "")
            {
                repository.AssignVideosToGroup(Convert.ToInt32(ddlGroupList.SelectedItem.Value), Session["SelectedVideosToAddGroup"].ToString());
                BindVideos();

                sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Added Group Successfully');");
                sb.Append("$('#myModal3').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

            }
        }


    }
}