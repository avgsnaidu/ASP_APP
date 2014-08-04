<%@ Page Title="" Language="C#" MasterPageFile="~/VODManagement.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="VideoOnDemand.VODManage.Search" %>

<%@ MasterType VirtualPath="~/VODManagement.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <%--    <script src="../Scripts/bootstrap-select.js"></script>
    <link href="../Content/css/bootstrap-select.css" rel="stylesheet" />--%>

    <script type="text/javascript">


        $(document).ready(function () {

            $(".selectpicker").selectpicker();

        });


    </script>


    <div id="management-bottom" class="col-md-12">

        <div class="block1 block2 clearfix">
            <h2 class="col-md-3">
                <asp:Literal ID="ltlSearch" runat="server" Text="<%$Resources:Search,ddlSearchOn_dropdown %>" /></h2>
            <div class="col-md-9">

                <div class="form-search pull-right ">

                    <div class="ddlSearchOnButton input-append">
                        <asp:TextBox type="text" ID="txtSearchKey" runat="server" class="span2 search-query searchBorder searchTextPadingExist" Style="height: inherit; min-width: 350px;" placeholder="<%$Resources:Search,txtSearch_PlaceHolder %>" />

                        <asp:DropDownList ID="ddlSearchOn" runat="server" ClientIDMode="Static" CssClass="selectpicker searchBorder input-prepend  radiusNone" Width="100px" Height="35px">
                            <%--   <asp:ListItem Text="All" Value="1" />
                            <asp:ListItem Text="Community" Value="2" />
                            <asp:ListItem Text="District" Value="3" />
                            <asp:ListItem Text="Road" Value="4" />--%>
                        </asp:DropDownList>
                        <%--<div class="btn-group input-prepend">
                            <button id="btnDropDown" class="btn dropdown-toggle searchBorder" data-toggle="dropdown">Filter By..<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Route </a></li>
                                <li><a href="#">Area     </a></li>
                                <li><a href="#">Road     </a></li>
                                <li><a href="#">Community </a></li>
                                <li><a href="#">District </a></li>
                            </ul>
                        </div>--%>


                        <button type="submit" id="btnSearch" runat="server" onserverclick="SearchVideos_Click" class="btn searchBorder buttonColor">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Search,btnsearch_text %>" />
                            <i class="icon-search"></i></button>

                    </div>
                </div>


            </div>
        </div>
        <div class="table-block clearfix col-md-12" style="max-height: 450px; overflow: auto;">


            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeaderWhenEmpty="true" AllowPaging="true"
                        PageSize="5" OnPageIndexChanging="gvSearch_PageIndexChanging" AlternatingRowStyle-ForeColor="Black" AlternatingRowStyle-BackColor="#DEDEDE"
                        OnRowCommand="gvSearch_RowCommand" EmptyDataText="<%$Resources:Search,gv_EmtpyData %>" EmptyDataRowStyle-HorizontalAlign="Center"
                        PagerSettings-Mode="Numeric" OnDataBound="gvSearch_DataBound">
                        <HeaderStyle CssClass="gridheader" />
                        <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />

                        <%--  <AlternatingRowStyle BackColor="#DEDEDE" />--%>
                        <Columns>

                            <asp:BoundField DataField="VIDEOID" Visible="false" />
                            <asp:BoundField DataField="VideoName" HeaderText="<%$Resources:Search,gv_Hd_VideoName %>" ItemStyle-Width="30%" />
                            <asp:BoundField DataField="TAG" HeaderText="<%$Resources:Search,GV_TAG_headertext %>" />

                            <%--   <asp:TemplateField HeaderText="Play">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="sprite delete" CommandArgument='<%#Eval("VideoId")%>' />

                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                    </asp:GridView>


                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

    </div>

</asp:Content>
