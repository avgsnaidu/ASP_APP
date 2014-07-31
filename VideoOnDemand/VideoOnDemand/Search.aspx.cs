﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.VODManage
{
    public partial class Search : ChildBasePage
    {
        clsSearch repository = new clsSearch();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Session["IsUser"] != null)
                {

                    if (!IsPostBack)
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

                }
                else
                    Response.Redirect("Error.aspx");
            }
            else
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void gvSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void SearchVideos_Click(object sender, EventArgs e)
        {
            BindSearchGrid();

            //repository.fnSearch(sear

        }

        private void BindSearchGrid()
        {
            string search = ddlSearchOn.SelectedValue.ToString();
            string searchKeyword = txtSearchKey.Text.Trim();
            string searchOn = string.Empty;

            if (search == "4")
            {
                searchOn = "Road";
            }
            else if (search == "3")
            {
                searchOn = "District";
            }
            else if (search == "2")
            {
                searchOn = "Community";
            }
            else
            {
                searchOn = "All";
            }

            DataSet ds = repository.fnSearch(searchKeyword, searchOn, false);
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

    }
}