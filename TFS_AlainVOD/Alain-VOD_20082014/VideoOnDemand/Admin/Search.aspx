<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/VODManagement.master" AutoEventWireup="true" CodeBehind="~/Admin/Search.aspx.cs"
    Inherits="VideoOnDemand.Admin.Search" %>

<%@ MasterType VirtualPath="~/Admin/VODManagement.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <%--    <script src="../Scripts/bootstrap-select.js"></script>
    <link href="../Content/css/bootstrap-select.css" rel="stylesheet" />--%>
    <script src="jwplayer.js"></script>

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
                        <asp:TextBox type="text" ID="txtSearchKey" runat="server" class="span2 search-query searchBorder searchTextPadingExist" autocomplete="off" Style="height: inherit; min-width: 350px;" placeholder="<%$Resources:Search,txtSearch_PlaceHolder %>" />
                        <asp:AutoCompleteExtender ID="txtSearchKey_AutoCompleteExtender" runat="server" DelimiterCharacters="" 
                             ServicePath="http://localhost:65467/VODWEB/Admin/AutoCompleteSearch.asmx" TargetControlID="txtSearchKey" ServiceMethod="GetSearchWord">
                        </asp:AutoCompleteExtender>


                        <asp:DropDownList ID="ddlSearchOn" runat="server" ClientIDMode="Static" CssClass="selectpicker searchBorder input-prepend  radiusNone" Width="100px" Height="35px">
                            <%--   <asp:ListItem Text="All" Value="1" />
                            <asp:ListItem Text="Community" Value="2" />
                            <asp:ListItem Text="District" Value="3" />
                            <asp:ListItem Text="Road" Value="4" />--%>
                        </asp:DropDownList>

                        <button type="submit" id="btnSearch" runat="server" onserverclick="SearchVideos_Click" class="btn searchBorder buttonColor">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Search,btnsearch_text %>" />
                            <i class="icon-search"></i>
                        </button>

                    </div>
                </div>


            </div>
        </div>
        <div class="table-block clearfix col-md-12" style="max-height: 450px; overflow: auto;">


            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeaderWhenEmpty="true" AllowPaging="true" DataKeyNames="VIDEOID,VideoName"
                        PageSize="10" OnPageIndexChanging="gvSearch_PageIndexChanging" AlternatingRowStyle-ForeColor="Black" AlternatingRowStyle-BackColor="#DEDEDE"
                        OnRowCommand="gvSearch_RowCommand" EmptyDataText="<%$Resources:Search,gv_EmtpyData %>" EmptyDataRowStyle-HorizontalAlign="Center"
                        PagerSettings-Mode="Numeric" OnDataBound="gvSearch_DataBound">
                        <HeaderStyle CssClass="gridheader" />
                        <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />

                        <%--  <AlternatingRowStyle BackColor="#DEDEDE" />--%>
                        <Columns>

                            <asp:BoundField DataField="VIDEOID" Visible="false" />
                            <asp:BoundField DataField="VideoName" HeaderText="<%$Resources:Search,gv_Hd_VideoName %>" ItemStyle-Width="30%" />
                            <asp:BoundField DataField="TAG" HeaderText="<%$Resources:Search,GV_TAG_headertext %>" />

                            <asp:TemplateField HeaderText="<%$ Resources:VideoManagement, grd_Hd_Play %>" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkPlay" runat="server" CommandName="Play" CssClass="spritePlay playicon"
                                        CommandArgument='<%#Eval("VIDEOID")+ ";"+ Eval("VideoName")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>


        <div class="modal fade" id="mdlPlayVideo" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalVideoLabel" aria-hidden="true" data-dismiss="modal">
            <div class="modal-dialog modal-dlg-top">
                <a href="#" class="closeX close" data-dismiss="modal">X</a>
                <div class="modal-content">

                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">

                                        <div id='player' class="player_wrapper_Custom"></div>

                                        <br />
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>


    </div>

</asp:Content>
