<%@ Page Title="" Language="C#" MasterPageFile="~/VODManagement.master" AutoEventWireup="true" CodeBehind="GroupManagement.aspx.cs" Inherits="VideoOnDemand.VODManage.GroupManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('form').find('a.submit-link').click(function () {
                $('form').trigger('submit');
            }).show();
        });



    </script>

    <script type="text/javascript">
         
    </script>
    <div id="management-bottom" class="col-md-12">
        <div class="block1 clearfix">
            <h2 class="col-md-3">Group Management</h2>
            <div class="col-md-9">
                <ul>

                    <li>
                        <asp:LinkButton ID="lnkCreateGroup" runat="server" PostBackUrl="#" data-toggle="modal" data-target="#myModal2"><span class="sprite ic-creategroup"></span>Create Group </asp:LinkButton>
                    </li>
                </ul>





                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel">Create Group</h4>

                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label for="txtGroupName" class="col-sm-4 control-label">Group&nbsp;Name<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtGroupName" placeholder="Group Name" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtDescription" class="col-sm-4 control-label">Description<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox runat="server" ID="txtDescription" class="form-control required NoEmpty" name="" placeholder="Description" TextMode="MultiLine" data-placement="bottom" data-trigger="manual" data-content="Fields must not be empty."></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <%-- <button type="submit" class="btn btn-primary" >Save</button>--%>

                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                                <%--<asp:LinkButton ID="btnSave" runat="server" class="btn btn-primary submit-link" Text="Save" />--%>
                                <%--<asp:ImageButton ID="btnSave" runat="server" UseSubmitBehavior="true" class="btn btn-primary" Text="Save" />--%>
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                                <%--  <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> --%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="H1">Create Group</h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">Group&nbsp;Name<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtEditGroupName" placeholder="Group Name" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPassword3" class="col-sm-4 control-label">Description<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox runat="server" ID="txtEditDescription" class="form-control required NoEmpty" name="" placeholder="Description" TextMode="MultiLine" data-placement="bottom" data-trigger="manual" data-content="Fields must not be empty."></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSaveEdit" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <%-- <button type="submit" class="btn btn-primary" >Save</button>--%>

                                <asp:Button ID="btnSaveEdit" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSaveEdit_Click" />
                                <%--<asp:LinkButton ID="btnSave" runat="server" class="btn btn-primary submit-link" Text="Save" />--%>
                                <%--<asp:ImageButton ID="btnSave" runat="server" UseSubmitBehavior="true" class="btn btn-primary" Text="Save" />--%>
                                <asp:Button ID="btnCanelEdit" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                                <%--  <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> --%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteWarning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="H2">Delete Warning</h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label class="col-sm- control-label" style="width: 320px;">Are&nbsp;you&nbsp;sure&nbsp;to&nbsp;delete&nbsp;group&nbsp?.</label>
                                            </div>
                                        </div>

                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnDeleteConform" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnDeleteConform" runat="server" class="btn btn-primary" OnClick="btnDeleteConform_Click" Text="Delete" />
                                <asp:Button ID="btnDeleteCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel22" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h3 class="modal-title" id="myModalLabel22">Alert !</h3>
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
                                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary"  Text=" OK " />
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>




        <div id="editModal" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="editModalLabel">Edit Record</h3>
            </div>
            <asp:UpdatePanel ID="upEdit" runat="server">
                <ContentTemplate>
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                <td>Country Code : 
                            <asp:Label ID="lblCountryCode" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Population : 
                            <asp:TextBox ID="txtPopulation" runat="server"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="Type Integer Value!" />
                                </td>
                            </tr>
                            <tr>
                                <td>Country Name:
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Continent:
                            <asp:TextBox ID="txtContinent1" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                        <asp:Button ID="btnSaveTwo" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnSave_Click" />
                        <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="btnSaveTwo" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>

        <div class="table-block clearfix col-md-12">
            <%-- <asp:UpdatePanel ID="UpdatePanelGroupMang" runat="server">
                <ContentTemplate>--%>
            <asp:GridView ID="gvGroupManagement" runat="server" AutoGenerateColumns="False" GridLines="None"
                 DataKeyNames="GroupId" AllowPaging="true" PagerSettings-Mode="Numeric"  OnPageIndexChanging="gvGroupManagement_PageIndexChanging"
                OnRowEditing="gvGroupManagement_RowEditing" ShowHeaderWhenEmpty="true"
                OnRowCommand="gvGroupManagement_RowCommand" EmptyDataText="No groups found" EmptyDataRowStyle-HorizontalAlign="Center">
                 <AlternatingRowStyle BackColor="#DEDEDE" />
                        <HeaderStyle CssClass="gridheader" />
                        <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                <Columns>
                    <asp:BoundField DataField="GroupId" Visible="false" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" CommandArgument='<%#Eval("GroupId")%>' />
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%#Eval("GroupId")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BorderStyle="None" BorderWidth="0px" />
            </asp:GridView>
            <%-- </ContentTemplate>
            </asp:UpdatePanel>--%>

 
        </div>

        <div id="deleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="delModalLabel">Delete Record</h3>
            </div>
            <%-- <asp:UpdatePanel ID="upDel" runat="server">
                <ContentTemplate>--%>
            <div class="modal-body">
                Are you sure you want to delete the record?
                            <asp:HiddenField ID="hfCode" runat="server" />
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info" />
                <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
            <%--                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </div>

    </div>
</asp:Content>
