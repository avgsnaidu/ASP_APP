<%@ Page Title="" Language="C#" MasterPageFile="~/VODManage/VODManagement.master" AutoEventWireup="true" CodeBehind="GroupManagement.aspx.cs" Inherits="VideoOnDemand.VODManage.GroupManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('form').find('a.submit-link').click(function () {
                $('form').trigger('submit');
            }).show();
        });

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
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4 control-label">Group&nbsp;Name<span class="required"> *</span></label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control textboxFormat required LettersMin3" id="txtGroupName" placeholder="Group Name" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters.">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-4 control-label">Description<span class="required"> *</span></label>
                                        <div class="col-sm-7">
                                            <textarea class="form-control required NoEmpty" name="" cols="" rows="" placeholder="Description" data-placement="bottom" data-trigger="manual" data-content="Fields must not be empty."></textarea>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <%-- <button type="submit" class="btn btn-primary" >Save</button>--%>

                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="Save" />
                                <%--<asp:LinkButton ID="btnSave" runat="server" class="btn btn-primary submit-link" Text="Save" />--%>
                                <%--<asp:ImageButton ID="btnSave" runat="server" UseSubmitBehavior="true" class="btn btn-primary" Text="Save" />--%>
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                                <%--  <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-block clearfix col-md-12">
            <table>
                <tr>

                    <th>Group Name</th>
                    <th>Description</th>
                    <th class="last-child">Actions</th>
                </tr>
                <tr>
                    <td>Group Name 1</td>
                    <td>Description</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr class="even">
                    <td>Group Name 2</td>
                    <td>Description</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr>
                    <td>Group Name 3</td>
                    <td>Description</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr class="even">
                    <td>Group Name 4</td>
                    <td>Description</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr>
                    <td>Group Name 5</td>
                    <td>Description</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
            </table>
        </div>
    </div>


</asp:Content>
