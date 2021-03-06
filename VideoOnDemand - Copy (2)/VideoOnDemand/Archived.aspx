﻿<%@ Page Title="" Language="C#" MasterPageFile="~/VODManagement.master" AutoEventWireup="true" CodeBehind="Archived.aspx.cs" Inherits="VideoOnDemand.VODManage.ArchiveListing" %>

<asp:Content ID="ArchiveContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <div id="management-bottom" class="col-md-12">
        <div class="block1 clearfix">
            <h2 class="col-md-3">Archive Listing</h2>
            <div class="col-md-9">

                <div class="form-search pull-right">
                    <div class="input-append">
                        <asp:TextBox runat="server" ID="txtSearchKey" type="text" class="span2 search-query searchBorder searchTextPadingExist" Style="height: inherit; min-width: 350px;" placeholder="Enter search keywords.." />
                        <%--<button type="submit" class="btn btn-danger searchBorder">Search <i class="icon-search"></i></button>--%>
                        <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-danger searchBorder" OnClick="btnSearch_Click">Search <i class="icon-search"></i></asp:LinkButton>
                    </div>
                </div> 
            </div>
        </div>
        <div class="table-block clearfix col-md-12">
            <asp:GridView ID="gvArchiveListing" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeaderWhenEmpty="true"
                EmptyDataText="No archive records found" EmptyDataRowStyle-HorizontalAlign="Center" AllowPaging="true"
                PageSize="10" OnPageIndexChanging="gvArchiveListing_PageIndexChanging">
                <AlternatingRowStyle BackColor="#DEDEDE" />
                <HeaderStyle CssClass="gridheader" />
                <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                <Columns>
                    <asp:BoundField DataField="FILENAME" HeaderText="FILE NAME" />
                    <%-- <asp:BoundField DataField="GROUP_NAME" HeaderText="Group Name" />
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" />--%>
                    <asp:BoundField DataField="TAG" HeaderText="TAGS" />
                    <asp:BoundField DataField="ARCHIVEDDATE" HeaderText="ARCHIVED DATE" />
                </Columns>
                <EditRowStyle BorderStyle="None" BorderWidth="0px" />
            </asp:GridView> 
        </div>
    </div>




    <!--container-->
    <%-- <div id="management-bottom" class="col-md-12">
        <div class="block1 clearfix">
            <h2 class="col-md-3">Archive Listing</h2>
            <div class="col-md-9">

                <div class="form-search pull-right">
                    <div class="input-append">
                        <input type="text" class="span2 search-query searchBorder" style="height: inherit; min-width: 350px;" placeholder="What are searching for?">
                        <button type="submit" class="btn btn-danger searchBorder" style="background-color: red;">Search<i class="icon-search"></i></button>

                    </div>
                </div>


            </div>
        </div>
        <div class="table-block clearfix col-md-12">
            <table>
                <tr>
                    <th>Video Name</th>
                    <th>Video Status</th>
                    <th>Tags</th>
                </tr>
                <tr>
                    <td>Video Name</td>
                    <td>All</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr class="even">
                    <td>Video Name</td>
                    <td>Done</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr>
                    <td>Video Name</td>
                    <td>Pending</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr class="even">
                    <td>Video Name</td>
                    <td>Processing</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr>
                    <td>Video Name</td>
                    <td>Done</td>
                    <td>Root, Area, Place ...</td>
                </tr>
            </table>
        </div>
    </div>--%>
</asp:Content>
