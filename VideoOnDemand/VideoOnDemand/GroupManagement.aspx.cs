using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.VODManage
{
    public partial class GroupManagement : System.Web.UI.Page
    {
        clsGroupManagement repository = new clsGroupManagement();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            BindGroupsDetails();
            //}
        }

        private void BindGroupsDetails()
        {
            DataSet ds = repository.GetGroups();
            gvGroupManagement.DataSource = ds;
            gvGroupManagement.DataBind();
        }

        protected void gvGroupManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Session["GroupID"] = index;
            if (e.CommandName.Equals("Editing"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                // row contains current Clicked Gridview Row
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                txtEditGroupName.Text = row.Cells[1].Text;
                txtEditDescription.Text = row.Cells[2].Text;

                //txtPopulation.Text = row.Cells[1].Text;
                //txtName.Text = row.Cells[2].Text;


                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModalUpdate').modal('show');");
                //sb.Append("$('#deleteModal').css('z-index', '1500');");

                sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString()); //(0r)
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "EditModalScript", sb.ToString(), false);

                //ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { LoginFail(); });", false);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "<script>alert('please Select At Least One User')</script>", false);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowEditModal", sb.ToString(), false);


                //ScriptManager.RegisterStartupScript(this, this.GetType(), "EditModalScript", "<script>alert('please Select At Least One User')</script>", false);


            }
            else if (e.CommandName.Equals("Deleting"))
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteWarning').modal('show');");

                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowDeleteConfirmModal", sb.ToString(), false);

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtGroupName.Text.Trim() != string.Empty && txtDescription.Text.Trim() != string.Empty)
            {
                bool returnValue = repository.InsertGroupDetails(txtGroupName.Text.Trim(), txtDescription.Text.Trim());
                if (returnValue)
                {
                    BindGroupsDetails();
                    lblMessage.Text = "Group saved sucessfully";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#myModal2').modal('hide');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

                }
            }

        }

        protected void gvGroupManagement_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            if (txtEditGroupName.Text.Trim() != string.Empty && txtEditDescription.Text.Trim() != string.Empty && Session["GroupID"] != null)
            {
                bool returnValue = repository.UpdateGroupDetails(Convert.ToInt32(Session["GroupID"]), txtEditGroupName.Text.Trim(), txtEditDescription.Text.Trim());
                if (returnValue)
                {
                    lblMessage.Text = "Group updated successfully";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();

                    //sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("showGroupUpdateMsg();");
                    //sb.Append(@"</script>");

                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#myModalUpdate').modal('hide');");
                    sb.Append(@"</script>");



                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UpdateHideModalScript", sb.ToString(), false);
                    BindGroupsDetails();

                }
            }
        }

        protected void btnDeleteConform_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            try
            {
                var returnValue = repository.DeleteGroup(Convert.ToInt32(Session["GroupID"]));
                if (returnValue)
                    BindGroupsDetails();
                lblMessage.Text = "Group deleted successfully";
                sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#deleteWarning').modal('hide');");
                sb.Append(@"</script>");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteHideModalScript", sb.ToString(), false);
            }
            catch (SqlException ex)
            {
                sb = new System.Text.StringBuilder();
                if (ex.Number == 547)
                {
                    lblMessage.Text = "Group not deleted,as it is assigned to another user/video";
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
                else
                {
                    lblMessage.Text = "Group not deleted as it is assigned to another";
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Another object is depends on this group";
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#deleteWarning').modal('hide');");
                sb.Append(@"</script>");

            }
            finally
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteHideModalScript", sb.ToString(), false);
            }

        }

        protected void gvGroupManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGroupManagement.PageIndex = e.NewPageIndex;
            BindGroupsDetails();
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvGroupManagement.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvGroupManagement.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }
    }
}