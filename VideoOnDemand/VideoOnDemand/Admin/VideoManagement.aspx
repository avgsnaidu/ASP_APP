<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/VODManagement.master" AutoEventWireup="true" CodeBehind="~/Admin/VideoManagement.aspx.cs" 
    Inherits="VideoOnDemand.Admin.VideoManagement" %>

<asp:Content ID="VideoManagementContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">
    <%--  <script src="../Scripts/bootstrap-select.js"></script>
    <link href="../Content/css/bootstrap-select.css" rel="stylesheet" />--%>
    <style type="text/css">
     
    </style>

    <script src="jwplayer.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $(".closeX").click(function () {
                $(".tranceBg").hide();
                $(".videoPopup").hide();
                $("#mdlPlayVideo").hide();
                $("#mdlPlayVideo").hide();

            });
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
                //alert("Please select atleast one user");
                //return e.preventDefault() // stops modal from being shown
                return false;
            }
        }


    </script>



    <div id="management-bottom" class="col-md-12">
        <div class="block1 block2 clearfix">
            <h2 class="col-md-3">
                <asp:Literal runat="server" ID="ltlVidMang" Text="<%$ Resources:VideoManagement, HDRVideoManagement %>"></asp:Literal></h2>
            <div class="col-md-9">
                <ul>
                    <li>
                        <asp:LinkButton ID="lnkAssignVidToGroup" runat="server" OnClick="lnkAssignVidToGroup_Click" OnClientClick="return CheckCheckBoxSelection();">
                            <span runat="server" class="sprite ic-assignvideo"></span>
                            <asp:Literal ID="ltlAssingVidGroup" runat="server" Text="<%$ Resources:VideoManagement, lnkAssignVideostoGroup %>" />
                        </asp:LinkButton></li>
                    <li class="last">
                        <asp:Label runat="server" ID="lblFilterBy" Text="<%$ Resources:VideoManagement, lblFilterBy %>  "></asp:Label><%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>--%><asp:DropDownList ID="ddlStatus" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                            </asp:DropDownList>

                        <asp:DropDownList ID="ddlGroupsFilter" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlGroups_SelectedIndexChanged">
                        </asp:DropDownList>


                    </li>
                </ul>

                <div class="modal fade" id="editTagsModal" tabindex="-1" role="dialog" aria-labelledby="myEditTabLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
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
                                                    <asp:DropDownList runat="server" ID="ddlCommunityTag" CssClass="selectpicker minHeightControl" AutoPostBack="true" Width="100%" />

                                                    <%--                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat"
                                                        ID="txtCommunityTag" placeholder="Enter Community Tag" data-placement="top" data-trigger="manual" />--%>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblDirstrictTag" for="txtDistrictTag" class="col-sm-4 control-label" Text="<%$ Resources:VideoManagement, ETM_txtDistrictTagText %>">
                                                </asp:Label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlDistrictTag" CssClass="selectpicker minHeightControl" AutoPostBack="true" Width="100%" />

                                                    <%--                                                    <asp:TextBox type="text" ID="txtDistrictTag" runat="server" class="form-control textboxFormat "
                                                        placeholder="Enter District Tag" data-placement="bottom" data-trigger="manual" />--%>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblRoadTags" for="txtRoadTag" class="col-sm-4 control-label" Text="<%$ Resources:VideoManagement, ETM_txtRoadTagText %>">
                                                </asp:Label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList runat="server" ID="ddlRoadTag" CssClass="selectpicker minHeightControl" AutoPostBack="true" Width="100%" />

                                                    <%--                                                    <asp:TextBox type="text" runat="server" ID="txtRoadTag" class="form-control textboxFormat"
                                                        name="" placeholder="Enter Road Tags" data-placement="bottom" data-trigger="manual"></asp:TextBox>--%>
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
                                    <asp:Literal runat="server" ID="ltlAssignVidToGroup" Text="<%$ Resources:VideoManagement, GroupSelectModal_Header %>"></asp:Literal></h4>
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
                                    <asp:AsyncPostBackTrigger ControlID="gvVideoManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnAssign" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
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
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel2">
                                    <asp:Literal ID="ltlalert" runat="server" Text="<%$ Resources:VideoManagement, AlertMsgModal_Header %>" />
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



                <%-- <div class="tranceBg" id="mdlPlayVideo"></div>--%>
                <%-- <div class="videoPopup" id="mdlPlayVideo" style="visibility: hidden;">
                    <a href="#" class="closeX">X</a>

                     <iframe width="100%" height="350px" src="http://www.youtube.com/embed/LRARHtMzZQE" frameborder="0" allowfullscreen></iframe> 
                    <div id='player'></div>

                    <br />

                </div>--%>
            </div>


        </div>
        <div class="table-block clearfix col-md-12">


            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvVideoManagement" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="VIDEOID,FILENAME,STATUSCODE"
                        ShowHeaderWhenEmpty="true" AllowPaging="true" OnRowDataBound="gvVideoManagement_RowDataBound"
                        OnRowCommand="gvVideoManagement_RowCommand" OnPageIndexChanging="gvVideoManagement_PageIndexChanging"
                        EmptyDataText="No videos to display." EmptyDataRowStyle-HorizontalAlign="Center">
                        <AlternatingRowStyle BackColor="#DEDEDE" />
                        <HeaderStyle CssClass="gridheader" />
                        <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" ClientIDMode="Static" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />
                                    <%--<asp:CheckBox ID="chkAll" ClientIDMode="Static" onclick="javascript:SelectAllCheckboxesSpecific(this);" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%--<asp:CheckBox onclick="javascript:HighlightRow(this);" ID="chkSelectUser" runat="server" EnableViewState="true" AutoPostBack="true" OnCheckedChanged="chkSelectUser_CheckedChanged" />--%>
                                    <asp:CheckBox ID="chkSelectUser" runat="server" EnableViewState="true" AutoPostBack="true" OnCheckedChanged="chkSelectUser_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="VIDEOID" Visible="false" />
                            <asp:BoundField DataField="FILENAME" HeaderText="<%$ Resources:VideoManagement, grd_Hd_VideoName %>" ItemStyle-Width="27%" />
                            <asp:BoundField DataField="STATUS" HeaderText="<%$ Resources:VideoManagement, grd_Hd_Status %>" ItemStyle-Width="12%" />
                            <asp:BoundField DataField="TAG" HeaderText="<%$ Resources:VideoManagement, grd_Hd_Tag %>" />
                            <%--<asp:BoundField DataField="GroupName" HeaderText="Group Name" />--%>
                            <asp:TemplateField HeaderText="<%$ Resources:VideoManagement, grd_Hd_Edit %>" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete"
                                        CommandArgument='<%#Eval("VIDEOID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="<%$ Resources:VideoManagement, grd_Hd_Play %>" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <%--<asp:LinkButton ID="lnkPlay" runat="server" CommandName="Play" CssClass="glyphicon glyphicon-play-circle" CommandArgument='<%#Eval("VIDEOID")%>' />--%>
                                    <asp:LinkButton ID="lnkPlay" runat="server" CommandName="Play" CssClass="spritePlay playicon"
                                        CommandArgument='<%#Eval("VIDEOID")+ ";"+ Eval("FILENAME")%>' Visible='<%#IsStatusCompleted(Convert.ToChar(Eval("STATUSCODE"))) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>


        </div>
    </div>


</asp:Content>
