using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VideoOnDemand.Model.BAL;
using System.Data.SqlClient;
using VideoOnDemand.Model;
using System.Configuration;

namespace VideoOnDemand
{
    public partial class Road : BasePage
    {
        clsRoad road = new clsRoad();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
            {
                if (!IsPostBack)
                    BindRoad();
            }
            else
                Response.Redirect("~/Admin/login.aspx");
        }

        private void BindRoad()
        {
            DataSet ds = road.GetRoadDetails(BasePage.CurrentLanguage);
            gvRoad.DataSource = ds;
            gvRoad.DataBind();
        }

        protected void gvRoad_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvRoad_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Session["ROAD_NO"] = index;
            if (e.CommandName.Equals("Editing"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                lblRoadNumberValue.Text = index.ToString();
                txtEditRoadName.Text = HttpUtility.UrlDecode(row.Cells[1].Text.Trim());

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
            if (txtEditRoadName.Text.Trim() != string.Empty && Session["Road_NO"] != null)
            {
                road.RoadName = txtEditRoadName.Text.Trim();

                bool returnValue = road.UpdateRoadDetails(Convert.ToInt32(Session["ROAD_NO"]), HttpUtility.HtmlEncode(txtEditRoadName.Text.Trim()),BasePage.CurrentLanguage);
                if (returnValue)
                {
                    lblMessage.Text = Resources.Road.MSG_Road_Upadate_Sucess;
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
                    road.RoadNo = Convert.ToInt32(HttpUtility.HtmlEncode(txtRoadNumber.Text.Trim()));
                    road.RoadName = HttpUtility.HtmlEncode(txtName.Text.Trim());

                    bool returnValue = road.AddRoadDetails(BasePage.CurrentLanguage);

                    if (returnValue)
                    {
                        BindRoad();
                        lblMessage.Text = Resources.Road.MSG_ROAD_SAVE_Sucess;
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
                        lblMessage.Text = Resources.Road.MSG_Road_Save_Failed_RoadNo_Exists;
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
                    lblMessage.Text = Resources.Road.MSG_Road_Save_Failed;
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
                var returnValue = road.DeleteRoad(Convert.ToInt32(Session["Road_NO"]));
                if (returnValue)
                    BindRoad();
                lblMessage.Text = Resources.Road.MSG_ROAD_DELETE_SUCESS;
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
                    lblMessage.Text = Resources.Road.MSG_ROAD_Delete_Failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
                else
                {
                    lblMessage.Text = Resources.Road.MSG_ROAD_Delete_Failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = Resources.Road.MSG_ROAD_Delete_Failed;
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

        protected void gvRoad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRoad.PageIndex = e.NewPageIndex;
            BindRoad();
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvRoad.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvRoad.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }


        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            VODLoginRedirectByRoleSection roleRedirectSection = (VODLoginRedirectByRoleSection)ConfigurationManager.GetSection("loginRedirectByRole");
            foreach (RoleRedirect roleRedirect in roleRedirectSection.RoleRedirects)
            {
                if (roleRedirect.Role.ToLower() == "administrator")
                {
                    Response.Redirect(WebHelper.RelativeWebRoot + roleRedirect.Url);
                }
            }
        }


    }
}