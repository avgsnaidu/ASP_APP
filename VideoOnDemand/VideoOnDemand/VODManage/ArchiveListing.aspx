<%@ Page Title="" Language="C#" MasterPageFile="~/VODManage/VODManagement.master" AutoEventWireup="true" CodeBehind="ArchiveListing.aspx.cs" Inherits="VideoOnDemand.VODManage.ArchiveListing" %>

<asp:Content ID="ArchiveContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <div id="management-bottom" class="col-md-12">
        <div class="block1 clearfix">
            <h2 class="col-md-3">Archive Listing</h2>
            <div class="col-md-9">

                <div class="form-search pull-right">
                    <div class="input-append">
                        <input type="text" class="span2 search-query searchBorder searchTextPadingExist" style="height: inherit; min-width: 350px;" placeholder="Enter search keywords..">
                        <%--<button type="submit" class="btn btn-danger searchBorder">Search <i class="icon-search"></i></button>--%>
                        <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-danger searchBorder">Search <i class="icon-search"></i></asp:LinkButton>
                    </div>
                </div>


            </div>
        </div>
        <div class="table-block clearfix col-md-12">
               <asp:GridView ID="gvArchiveListing" runat="server"   AutoGenerateColumns="False" GridLines="None" ShowHeaderWhenEmpty="true" 
                   EmptyDataText="No archive records found"  EmptyDataRowStyle-HorizontalAlign="Center">
                <Columns>    
                    <asp:BoundField DataField="FILE_NAME" HeaderText="File Name" />
                    <asp:BoundField DataField="GROUP_NAME" HeaderText="Group Name" />
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" />
                    <asp:BoundField DataField="TAGS_ENG" HeaderText="Tag" />                                
                </Columns>
                <EditRowStyle BorderStyle="None" BorderWidth="0px" />
            </asp:GridView>
            <%--<table>
                <tr>
                    <th>Video Name</th>
                    
                    <th>Tags</th>
                </tr>
                <tr>
                    <td>Video Name</td>
                    
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr class="even">
                    <td>Video Name</td>
                     
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr>
                    <td>Video Name</td>
                     
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr class="even">
                    <td>Video Name</td>
                    
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr>
                    <td>Video Name</td>
                    
                    <td>Root, Area, Place ...</td>
                </tr>
            </table>--%>
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
