using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;
using System.Data;
using System.Data.SqlClient;

namespace VideoOnDemand
{
    public partial class District : BasePage
    {
        clsDistrict district = new clsDistrict();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
            {
                if (!IsPostBack)
                    BindDistrict();
            }
            else
                Response.Redirect("~/WindowsUser.aspx");
        }

        private void BindDistrict()
        {
            DataSet ds = district.GetDistrictDetails(BasePage.CurrentLanguage);
            gvDistrict.DataSource = ds;
            gvDistrict.DataBind();
        }

        protected void gvDistrict_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvDistrict_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Session["DISTRICT_NO"] = index;
            if (e.CommandName.Equals("Editing"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                lblDistrictNumberValue.Text = index.ToString();
                txtEditCommunityName.Text = HttpUtility.HtmlDecode(row.Cells[1].Text);

                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModalUpdate').modal('show');");

                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowEditModal", sb.ToString(), false);

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

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            if (txtEditCommunityName.Text.Trim() != string.Empty && Session["DISTRICT_NO"] != null)
            {
                district.DistrictName = txtEditCommunityName.Text.Trim();
                bool returnValue = district.UpdateDistrictDetails(Convert.ToInt32(Session["DISTRICT_NO"]), txtEditCommunityName.Text.Trim(), BasePage.CurrentLanguage);
                if (returnValue)
                {
                    lblMessage.Text = Resources.District.MSG_Distrct_Update_Sucess;
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
            if (txtName.Text.Trim() != string.Empty)
            {
                try
                {
                    district.DistrictName = HttpUtility.HtmlEncode(txtName.Text.Trim());
                    district.DistrictNo = Convert.ToInt32(txtDistrictNumber.Text.Trim());
                    bool returnValue = district.AddDistrictDetails(BasePage.CurrentLanguage);

                    if (returnValue)
                    {
                        BindDistrict();
                        lblMessage.Text = Resources.District.MSG_District_Save_Sucess;
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#myModal2').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

                    }
                }
                catch (SqlException sqlex)
                {
                    if (sqlex.Number == 2627)
                    {
                        lblMessage.Text = Resources.District.MSG_Save_Failed_DistrictNo_Exists;
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal').modal('show');");
                        sb.Append("$('#myModal2').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
                    }
                    else
                    {
                        lblMessage.Text = Resources.District.MSG_Save_Failed;
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
                    lblMessage.Text = Resources.District.MSG_Save_Failed;
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
                var returnValue = district.DeleteDistrict(Convert.ToInt32(Session["DISTRICT_NO"]));
                if (returnValue)
                    BindDistrict();
                lblMessage.Text = Resources.District.MSG_District_Delete_Sucess;
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
                    lblMessage.Text = Resources.District.MSG_District_Delete_Failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
                else
                {
                    lblMessage.Text = Resources.District.MSG_District_Delete_Failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = Resources.District.MSG_District_Delete_Failed_Depends;
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

        protected void gvDistrict_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDistrict.PageIndex = e.NewPageIndex;
            BindDistrict();
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvDistrict.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvDistrict.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }


    }
}