<%@ Page Title="" Language="C#" MasterPageFile="~/VODManage/VODManagement.master" AutoEventWireup="true" CodeBehind="VideoManagement.aspx.cs" Inherits="VideoOnDemand.VODManage.VideoManagement" %>

<asp:Content ID="VideoManagementContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">
    <script src="../Scripts/bootstrap-select.js"></script>
    <link href="../Content/css/bootstrap-select.css" rel="stylesheet" />

    <script type="text/javascript">

        $(document).ready(function () {

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
                //alert("Please select atleast one user");
                //return e.preventDefault() // stops modal from being shown
                return false;
            }
        }


    </script>



    <div id="management-bottom" class="col-md-12">
        <div class="block1 block2 clearfix">
            <h2 class="col-md-3">Video Management</h2>
            <div class="col-md-9">
                <ul>
                    <li>
                        <asp:LinkButton ID="lnkAssignVidToGroup" runat="server" OnClick="lnkAssignVidToGroup_Click" OnClientClick="return CheckCheckBoxSelection();"> <span class="sprite ic-assignvideo"></span>Assign Videos to Group </asp:LinkButton>
                    </li>
                    <li class="last">
                        <label>Filter By </label>
                        <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>--%>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                            <%--<asp:ListItem Text="All" Value="1" />
                            <asp:ListItem Text="Converted" Value="2" />
                            <asp:ListItem Text="Pending" Value="3" />
                            <asp:ListItem Text="Processing" Value="4" />--%>
                        </asp:DropDownList>

                        <asp:DropDownList ID="ddlGroupsFilter" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlGroups_SelectedIndexChanged">
                        </asp:DropDownList>

                        <%--                            </ContentTemplate>
                        </asp:UpdatePanel>--%>
 
                    </li>
                </ul>
                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel">Assign Videos to Group</h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">Select&nbsp;Group<span class="required"> *</span></label>
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
                                <asp:Button ID="btnAssign" runat="server" class="btn btn-primary" Text="Assign" OnClick="btnAssign_Click" />
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                                <%--  <button type="button" class="btn btn-primary" data-dismiss="modal">Assign</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel2">Alert !</h4>
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
                                <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text=" OK " />
                            </div>
                        </div>
                    </div>
                </div>


            </div>


        </div>
        <div class="table-block clearfix col-md-12">


            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvVideoManagement" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="VIDEOID" ShowHeaderWhenEmpty="true"
                        OnRowCommand="gvVideoManagement_RowCommand" EmptyDataText="No videos to display." EmptyDataRowStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:TemplateField HeaderText="Roles">
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
                            <asp:BoundField DataField="FILENAME" HeaderText="Video Name" />
                            <asp:BoundField DataField="STATUS" HeaderText="Status" />
                            <asp:BoundField DataField="TAG" HeaderText="TAG" />
                            <%--<asp:BoundField DataField="GroupName" HeaderText="Group Name" />--%>
                            <asp:TemplateField HeaderText="Play">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="sprite delete" CommandArgument='<%#Eval("VIDEOID")%>' />
                                    <%--<asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="sprite edit" CommandArgument='<%#Eval("VIDEOID") %>' />--%>
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
