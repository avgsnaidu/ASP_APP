<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/VODManagement.master" AutoEventWireup="true" CodeBehind="~/Admin/VideoManagement.aspx.cs"
    Inherits="VideoOnDemand.Admin.VideoManagement" %>

<asp:Content ID="VideoManagementContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">
    <script src="jwplayer.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".selectpicker").selectpicker();
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            // re-bind your jQuery events here
            $(".selectpicker").selectpicker();
        });

        $(document).ready(function () {
            $('#myModal3').on('show.bs.modal', function (e) {
                var isValid = false;
                debugger;
                var gridView = document.getElementById('<%=gvVideoManagement.ClientID %>');
                for (var i = 1; i < gridView.rows.length; i++) {
                    var inputs = gridView.rows[i].getElementsByTagName('input');
                    if (inputs != null) {
                        if (inputs[0].type == "checkbox") {
                            if (inputs[0].checked) {
                                isValid = true;
                                return true;
                            }
                        }
                    }
                }

                if (!isValid) {
                    alert("Please select atleast one video");
                    return e.preventDefault() // stops modal from being shown
                }
            })

        });

        function CheckCheckBoxSelection() {
            var isValid = false;
            debugger;
            var gridView = document.getElementById('<%= gvVideoManagement.ClientID %>');
            for (var i = 1; i < gridView.rows.length; i++) {
                var inputs = gridView.rows[i].getElementsByTagName('input');
                if (inputs != null && inputs.length > 0) {
                    if (inputs[0].type == "checkbox") {
                        if (inputs[0].checked) {
                            isValid = true;
                            return true;
                        }
                    }
                }
            }

            if (!isValid) {
                var label = document.getElementById('<%= lblMessage.ClientID %>');
                label.innerHTML = 'Please select minimum one video';
                $('#alertMessageModal').modal('show');
                return false;
            }
        }
    </script>

    <div id="management-bottom" class="col-md-12">
        <div class="block1 block2 clearfix">
            <div class="col-md-12">
                <ul>
                    <li>
                        <asp:LinkButton ID="lnkRemoveVidFromGroup" runat="server" OnClick="lnkRemoveVidFromGroup_Click">
                            <span id="Span1" runat="server" class="sprite ic-assignvideo"></span>
                            <asp:Literal ID="ltlAssingVidGroup" runat="server" Text="<%$ Resources:VideoManagement, lnkRemoveVideosFromGroup %>" />
                        </asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="lnkAssignVidToGroup" runat="server" OnClick="lnkAssignVidToGroup_Click">
                            <span id="Span2" runat="server" class="sprite ic-assignvideo"></span>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:VideoManagement, lnkAssignVideostoGroup %>" />
                        </asp:LinkButton></li>

                    <li class="last">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:Label runat="server" ID="lblFilterBy" Text="<%$ Resources:VideoManagement, lblFilterBy %>  "></asp:Label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlGroupsFilter" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlGroups_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlStatus" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ddlGroupsFilter" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>

                    </li>
                </ul>

                <div class="modal fade" id="editTagsModal" tabindex="-1" role="dialog" aria-labelledby="myEditTabLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myEditTabLabel">
                                    <asp:Literal runat="server" ID="ltlEditTagsDetails" Text="<%$ Resources:VideoManagement, EditTags_Header %>" />
                                </h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">

                                            <div class="form-group">
                                                <asp:Label for="lblVideoName" ID="lblVideoNameText" runat="server" class="col-sm-4 control-label" Font-Overline="False" Text="<%$ Resources:VideoManagement, ETM_VideoName %>">
                                                </asp:Label><div class="col-sm-7">
                                                    <asp:Label runat="server" class="form-control" ID="lblVideoName" data-trigger="manual" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <asp:Label for="txtCommunityTag" ID="lblCommunityTag" runat="server" class="col-sm-4 control-label" Text="<%$ Resources:VideoManagement, ETM_txtCommunityTagText %>"></asp:Label><div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlCommunityTag" CssClass="minHeightControl" AutoPostBack="true" Width="100%" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblDirstrictTag" for="txtDistrictTag" class="col-sm-4 control-label" Text="<%$ Resources:VideoManagement, ETM_txtDistrictTagText %>">
                                                </asp:Label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlDistrictTag" CssClass="minHeightControl" AutoPostBack="true" Width="100%" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblRoadTags" for="txtRoadTag" class="col-sm-4 control-label" Text="<%$ Resources:VideoManagement, ETM_txtRoadTagText %>">
                                                </asp:Label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlRoadTag" CssClass="minHeightControl" AutoPostBack="true" Width="100%" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvVideoManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSaveTag" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnSaveTag" runat="server" class="btn btn-primary" Text="<%$ Resources:VideoManagement, ETM_btnSaveTag_Text %>" OnClick="btnSaveTag_Click" />
                                <asp:Button ID="btnCancelTag" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:VideoManagement, ETM_btnCancelTag_Text %>" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">
                                    <asp:Literal runat="server" ID="ltlAssignVidToGroup"></asp:Literal></h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblselectGroup" for="ddlGroupList" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" Text="<%$ Resources:VideoManagement,  GSM_ddlGroupListText %>" /><span class="required"> *</span></asp:Label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddlGroupList" runat="server" CssClass="form-control">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnAssign" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnRemoveAssigned" runat="server" class="btn btn-primary" Visible="false" Text="<%$ Resources:VideoManagement, GSM_btnRemoveAssign_Text%>" OnClick="btnRemoveAssigned_Click" />
                                <asp:Button ID="btnAssign" runat="server" class="btn btn-primary" Text="<%$ Resources:VideoManagement, GSM_btnAssign_Text %>" OnClick="btnAssign_Click" />
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:VideoManagement, GSM_btnCancel_Text %>" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel2">
                                    <asp:Literal ID="ltlalert" runat="server" Text="<%$ Resources:VideoManagement, AlertMsgModal_Header %>" />
                                </h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label padLR10 alertBodyContentAlign"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvVideoManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text=" <%$ Resources:VideoManagement, ALM_btnOK_Text %> " />
                            </div>
                        </div>
                    </div>
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
        </div>

        <div class="table-block clearfix col-md-12">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvVideoManagement" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="VIDEOID,FILENAME,STATUSCODE"
                        ShowHeaderWhenEmpty="true" AllowPaging="true" OnRowDataBound="gvVideoManagement_RowDataBound" DataSourceID="VideosObjectSource"
                        OnRowCommand="gvVideoManagement_RowCommand" OnPageIndexChanging="gvVideoManagement_PageIndexChanging" OnLoad="GridView_Load" OnRowCreated="GridView_RowCreated"
                        EmptyDataText="No videos to display." EmptyDataRowStyle-HorizontalAlign="Center">
                        <AlternatingRowStyle BackColor="#DEDEDE" />
                        <HeaderStyle CssClass="gridheader" />
                        <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" ClientIDMode="Static" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelectUser" runat="server" ClientIDMode="Static" EnableViewState="true" AutoPostBack="true" OnCheckedChanged="chkSelectUser_CheckedChanged" Visible='<%#IsStatusCompleted(Convert.ToChar(Eval("STATUSCODE"))) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="VIDEOID" Visible="false" />
                            <asp:TemplateField HeaderText="<%$ Resources:VideoManagement, grd_Hd_VideoName %>">
                                <ItemTemplate>
                                    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 200px;">
                                        <asp:Label ID="gvlblVideoName" runat="server" Text='<%# Bind("FILENAME") %>' ToolTip='<%#Bind("FILENAME")%>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                                <ItemStyle Wrap="false" Width="100"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:VideoManagement, grd_Hd_Groups %>">
                                <ItemTemplate>
                                    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 220px;">
                                        <asp:Label ID="gvlblgroupNames" runat="server" Text='<%# Bind("GroupNames") %>' ToolTip='<%#Bind("GroupNames")%>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                                <ItemStyle Wrap="false" Width="100"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:VideoManagement, grd_Hd_Tag %>">
                                <ItemTemplate>
                                    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 220px;">
                                        <asp:Label ID="gvlblTags" runat="server" Text='<%# Bind("TAG") %>' ToolTip='<%#Bind("TAG")%>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                                <ItemStyle Wrap="false" Width="100"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="STATUS" HeaderText="<%$ Resources:VideoManagement, grd_Hd_Status %>" ItemStyle-Width="10%" />
                            <asp:TemplateField HeaderText="<%$ Resources:VideoManagement, gv_hd_Actions %>" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" ToolTip="Edit Tags" Visible='<%#IsStatusCompleted(Convert.ToChar(Eval("STATUSCODE"))) %>'
                                        CommandArgument='<%#Eval("VIDEOID") %>' />
                                    <asp:LinkButton ID="lnkPlay" runat="server" CommandName="Play" CssClass="spritePlay playicon" ToolTip="Play"
                                        CommandArgument='<%#Eval("VIDEOID")+ ";"+ Eval("FILENAME")%>' Visible='<%#IsStatusCompleted(Convert.ToChar(Eval("STATUSCODE"))) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                    </asp:GridView>
                    <asp:ObjectDataSource runat="server" ID="VideosObjectSource" SelectMethod="BindVideosData"></asp:ObjectDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
