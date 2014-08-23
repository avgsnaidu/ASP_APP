<%@ Page Title="" Language="C#" MasterPageFile="~/User/VODUserManagement.master" AutoEventWireup="true" CodeBehind="VideoSearch.aspx.cs" Inherits="VideoOnDemand.User.SearchVideos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%--<%@ MasterType VirtualPath="~/VODManagement.master" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <%-- <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" ></ajaxToolkit:ToolkitScriptManager>
    --%>

    <script src="jwplayer.js"></script>

    <script type="text/javascript">


        $(document).ready(function () {

            $(".selectpicker").selectpicker();

        });


    </script>


    <div id="management-bottom" class="col-md-12">

        <%--   <asp:ListItem Text="All" Value="1" />
                            <asp:ListItem Text="Community" Value="2" />
                            <asp:ListItem Text="District" Value="3" />
                            <asp:ListItem Text="Road" Value="4" />--%>
        <div class="block1 clearfix">
            <%-- <h2 class="col-md-3">
                <asp:Literal ID="ltlSearch" runat="server" Text="<%$Resources:Search,ddlSearchOn_dropdown %>" /></h2>--%>
            <div class="col-md-12">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        
                <div class="form-search pull-right ">

                    <div class="ddlSearchOnButton input-append">
                        <asp:TextBox ID="txtSearchKey" runat="server" class="span2 search-query searchBorder searchTextPadingExist"
                            Style="height: inherit; min-width: 350px;" placeholder="<%$Resources:Search,txtSearch_PlaceHolder %>" autocomplete="off"></asp:TextBox>
                        <ajaxToolkit:AutoCompleteExtender ID="txtSearchKey_AutoCompleteExtender" runat="server"
                            Enabled="True"
                            ServicePath="~/AutoComplete.asmx"
                            TargetControlID="txtSearchKey"
                            UseContextKey="True"
                            ServiceMethod="GetCompletionList"
                            BehaviorID="AutoCompleteEx"
                            MinimumPrefixLength="2"
                            CompletionInterval="1000"
                            EnableCaching="true"
                            CompletionSetCount="20"
                            DelimiterCharacters=";, :">
                            <Animations>
                    <OnShow>
                        <Sequence>
                            <%-- Make the completion list transparent and then show it --%>
                            <OpacityAction Opacity="0" />
                            <HideAction Visible="true" />
                            
                            <%--Cache the original size of the completion list the first time
                                the animation is played and then set it to zero --%>
                            <ScriptAction Script="
                                // Cache the size and setup the initial size
                                var behavior = $find('AutoCompleteEx');
                                if (!behavior._height) {
                                    var target = behavior.get_completionList();
                                    behavior._height = target.offsetHeight - 2;
                                    target.style.height = '0px';
                                }" />
                            
                            <%-- Expand from 0px to the appropriate size while fading in --%>
                            <Parallel Duration=".4">
                                <FadeIn />
                                <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                            </Parallel>
                        </Sequence>
                    </OnShow>
                    <OnHide>
                        <%-- Collapse down to 0px and fade out --%>
                        <Parallel Duration=".4">
                            <FadeOut />
                            <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                        </Parallel>
                    </OnHide>
                            </Animations>
                        </ajaxToolkit:AutoCompleteExtender> 


                        <button type="submit" id="btnSearch" runat="server" onserverclick="SearchVideos_Click" class="btn searchBorder buttonColor">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Search,btnsearch_text %>" />
                            <i class="icon-search"></i>
                        </button>

                    </div>
                    <div class="searchTags">

                        <ul>
                            <li>
                                <asp:CheckBox runat="server" ID="chkAll"  OnCheckedChanged="chkAll_CheckedChanged" AutoPostBack="true" />
                            </li>
                            <li>
                                <asp:CheckBox runat="server" ID="chkCommunity" OnCheckedChanged="chk_Single_CheckedChanged"  AutoPostBack="true"/>
                            </li>
                            <li>
                                <asp:CheckBox runat="server" ID="chkDistrict" OnCheckedChanged="chk_Single_CheckedChanged" AutoPostBack="true" />
                            </li>
                            <li>
                                <asp:CheckBox runat="server" ID="chkRoad" OnCheckedChanged="chk_Single_CheckedChanged" AutoPostBack="true" />
                            </li>

                        </ul>
                    </div>
                </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="chkAll" EventName="CheckedChanged" />
                        <asp:AsyncPostBackTrigger ControlID="chkCommunity" EventName="CheckedChanged" />
                        <asp:AsyncPostBackTrigger ControlID="chkDistrict" EventName="CheckedChanged" />
                        <asp:AsyncPostBackTrigger ControlID="chkRoad" EventName="CheckedChanged" />
                    </Triggers>
                </asp:UpdatePanel>


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
                                    <%--<asp:LinkButton ID="lnkPlay" runat="server" CommandName="Play" CssClass="glyphicon glyphicon-play-circle" CommandArgument='<%#Eval("VIDEOID")%>' />--%>
                                    <asp:LinkButton ID="lnkPlay" runat="server" CommandName="Play" CssClass="spritePlay playicon"
                                        CommandArgument='<%#Eval("VIDEOID")+ ";"+ Eval("VideoName")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>

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

          <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel2">
                                    <asp:Literal ID="ltlalert" runat="server" Text="<%$ Resources:Search, AlertMsgModal_Header %>" />
                                </h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <%--<label   class="col-sm- control-label" style="width: 320px;">Are&nbsp;you&nbsp;sure&nbsp;to&nbsp;delete&nbsp;group&nbsp?.</label>--%>
                                                <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label" Style="width: 320px;"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvSearch" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text=" <%$ Resources:Search, ALM_btnOK_Text %> " />
                            </div>
                        </div>
                    </div>
                </div>


    </div>

</asp:Content>
