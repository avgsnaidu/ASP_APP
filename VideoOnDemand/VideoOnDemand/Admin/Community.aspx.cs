using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;
using System.Data.SqlClient;
using System.Data;

namespace VideoOnDemand
{
    public partial class Community : BasePage
    {    
        clsCommunity repository = new clsCommunity();
        clsDistrict district = new clsDistrict();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
            {
                if (!IsPostBack)
                {
                    BindDistrict();
                    BindCommunityDetails();
                }
            }
            else
                Response.Redirect("~/Admin/login.aspx");
        }
        private void BindCommunityDetails()
        {
            DataSet ds = repository.GetCommunityDetails(BasePage.CurrentLanguage);
            gvCommunity.DataSource = ds;
            gvCommunity.DataBind();
        }

        private void BindDistrict()
        {
            System.Data.DataSet ds = district.GetDistrictDetails(BasePage.CurrentLanguage);

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].NewRow();

                ddlDistrict.DataTextField = "DISTRICTNAME";
                ddlDistrict.DataValueField = "District_No";

                ddlDistrict.DataSource = ds;
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new ListItem(Resources.Community.mdlUC_District_EmptySelect, "0"));

                //ddlDistrictEdit.DataTextField = "DISTRICTNAME";
                //ddlDistrictEdit.DataTextField = "District_No";

                //ddlDistrictEdit.DataSource = ds;
                //ddlDistrictEdit.DataBind();
            }
        }


        protected void gvCommunity_RowCommand(object sender, GridViewCommandEventArgs e)
        {



            if (e.CommandName.Equals("Editing"))
            {

                string commandNames = e.CommandArgument.ToString();
                string[] commandArguments = commandNames.Split(';');

                Session["COMMUNITY_NO"] = commandArguments[0];

                BindDistrict();

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                lblCommunityNumberValue.Text = commandArguments[1];
                txtEditCommunity.Text = row.Cells[1].Text.Trim();
                System.Data.DataSet ds = district.GetDistrictDetails(BasePage.CurrentLanguage);

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    ddlDistrictEdit.DataTextField = "DISTRICTNAME";
                    ddlDistrictEdit.DataValueField = "District_No";

                    ddlDistrictEdit.DataSource = ds;
                    ddlDistrictEdit.DataBind();
                    ddlDistrictEdit.Items.Insert(0, new ListItem(Resources.Community.mdlUC_District_EmptySelect, "0"));
                }
                ddlDistrictEdit.Items.FindByValue(commandArguments[2]).Selected = true;

                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModalUpdate').modal('show');");

                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowEditModal", sb.ToString(), false);

            }
            else if (e.CommandName.Equals("Deleting"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["COMMUNITY_NO"] = index;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteWarning').modal('show');");

                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowDeleteConfirmModal", sb.ToString(), false);
            }
        }


        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            if (txtEditCommunity.Text.Trim() != string.Empty && ddlDistrictEdit.SelectedItem.Value.ToString() != string.Empty && Session["COMMUNITY_NO"] != null)
            {
                try
                {
                    repository.CommunityNo = Convert.ToInt32(lblCommunityNumberValue.Text.Trim());
                    repository.CommunityName = txtEditCommunity.Text.Trim();
                    repository.DistrictNo = Convert.ToInt32(ddlDistrictEdit.SelectedItem.Value.ToString());

                    bool returnValue = repository.UpdateCommunityDetails(Convert.ToInt32(Session["COMMUNITY_NO"]), txtEditCommunity.Text.Trim(), Convert.ToInt32(ddlDistrictEdit.SelectedItem.Value.ToString()), BasePage.CurrentLanguage);
                    if (returnValue)
                    {
                        lblMessage.Text = Resources.Community.MSG_Community_Update_Sucess;
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#myModalUpdate').modal('hide');");
                        sb.Append(@"</script>");

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UpdateHideModalScript", sb.ToString(), false);

                    }
                }
                catch (SqlException sqlEx)
                {
                    if (sqlEx.Number == 2601)
                    {
                        lblMessage.Text = Resources.Community.MSG_District_Community_Duplication_Error;
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#myModalUpdate').modal('hide');");
                        sb.Append(@"</script>");

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UpdateHideModalScript", sb.ToString(), false);

                    }
                    else
                    {
                        lblMessage.Text = Resources.Community.MSG_UPdation_Failed;
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#myModalUpdate').modal('hide');");
                        sb.Append(@"</script>");

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UpdateHideModalScript", sb.ToString(), false);

                    }

                }
                catch (Exception ex)
                {
                    lblMessage.Text = Resources.Community.MSG_UPdation_Failed;
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#myModalUpdate').modal('hide');");
                    sb.Append(@"</script>");

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UpdateHideModalScript", sb.ToString(), false);
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtCommunity.Text.Trim() != string.Empty && ddlDistrict.SelectedItem.Value.ToString() != string.Empty)
            {
                try
                {
                    repository.CommunityNo = Convert.ToInt32(txtCommunityNumber.Text.Trim());
                    repository.CommunityName = HttpUtility.HtmlEncode(txtCommunity.Text.Trim());
                    repository.DistrictNo = Convert.ToInt32(ddlDistrict.SelectedItem.Value.ToString());
                    repository.CreatedDate = DateTime.Now;
                    bool returnValue = repository.AddCommunityDetails(BasePage.CurrentLanguage);
                    if (returnValue)
                    {
                        BindCommunityDetails();
                        lblMessage.Text = Resources.Community.MSG_Community_Save_Sucess;
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#myModal2').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = Resources.Community.mdlCC_Commnity_Save_Failed_WithSameIDExists;
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#myModal2').modal('hide');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
                }
            }

        }


        protected void btnDeleteConform_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            try
            {
                var returnValue = repository.DeleteCommunity(Convert.ToInt32(Session["COMMUNITY_NO"]));
                if (returnValue)
                    BindCommunityDetails();
                BindDistrict();
                lblMessage.Text = Resources.Community.MSG_Community_Delete_Sucess; ;
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
                    lblMessage.Text = Resources.Community.MSG_Community_Delete_failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
                else
                {
                    lblMessage.Text = Resources.Community.MSG_Community_Delete_failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = Resources.Community.MSG_Community_Delete_failed_UserbyAnother;
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

        protected void gvCommunity_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCommunity.PageIndex = e.NewPageIndex;
            BindCommunityDetails();
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvCommunity.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvCommunity.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }
    }
}