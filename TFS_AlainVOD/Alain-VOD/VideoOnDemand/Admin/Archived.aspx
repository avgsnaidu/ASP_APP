<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/VODManagement.master" AutoEventWireup="true" CodeBehind="~/Admin/Archived.aspx.cs" Inherits="VideoOnDemand.Admin.ArchiveListing" %>

<asp:Content ID="ArchiveContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <div id="management-bottom" class="col-md-12">
        <div class="block1 clearfix">
            <h2 class="col-md-3"><asp:Literal ID="ltlSearch" runat="server" Text="<%$Resources:Archived,hd_ArchiveListing %>"/> </h2>
            <div class="col-md-9">

                <div class="form-search pull-right">
                    <div class="input-append">
                        <asp:TextBox runat="server" ID="txtSearchKey" type="text" class="span2 search-query searchBorder searchTextPadingExist" Style="height: inherit; min-width: 350px;" 
                            placeholder="<%$Resources:Archived,hd_ArchiveListing %>"/>
                        <%--<button type="submit" class="btn btn-danger searchBorder">Search <i class="icon-search"></i></button>--%>
                        <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-danger searchBorder" OnClick="btnSearch_Click">
                        <asp:Literal ID="ltlSearchbtn" runat="server" Text="<%$Resources:Archived,btnSearch_text %>"/>                             
                            <i class="icon-search"></i></asp:LinkButton>
                    </div>
                </div> 
            </div>
        </div>
        <div class="table-block clearfix col-md-12">
            <asp:GridView ID="gvArchiveListing" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeaderWhenEmpty="true"
                EmptyDataText="<%$Resources:Archived,gv_DataEmtpy %>" EmptyDataRowStyle-HorizontalAlign="Center" AllowPaging="true"
                PageSize="10" OnPageIndexChanging="gvArchiveListing_PageIndexChanging">
                <AlternatingRowStyle BackColor="#DEDEDE" />
                <HeaderStyle CssClass="gridheader" />
                <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                <Columns>
                    <asp:BoundField DataField="FILENAME" HeaderText="<%$Resources:Archived,gv_Hd_FILENAME %>"  ItemStyle-Width="40%" />
                   <asp:BoundField DataField="TAG" HeaderText="<%$Resources:Archived,gv_hd_TAGS %>" />
                    <asp:BoundField DataField="ARCHIVEDDATE" HeaderText="<%$Resources:Archived,gv_Hd_ArchDate %>"  ItemStyle-Width="180px"/>
                </Columns>
                <EditRowStyle BorderStyle="None" BorderWidth="0px" />
            </asp:GridView> 
        </div>
    </div>



     
</asp:Content>
