<%@ Page Title="" Language="C#" MasterPageFile="~/VODManage/VODManagement.master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="VideoOnDemand.VODManage.UserManagement" %>

<asp:Content ID="UserManagementContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <script type="text/javascript" lang="javascript">
        /* function validateCheckBoxes() {
             var isValid = false;
             debugger;
             var gridView = document.getElementById('');
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
             alert("Please select atleast one checkbox");
             var modalitem = document.getElementById("myModal1");
             modalitem.modal('hide')
             $("#myModal1").modal('hide');
 
             var removeSuccessClass = function (e) {
                 $(e).closest('.form-group').removeClass('has-success');
             }
             return false;
 
         }
         */


        $(document).ready(function () {

            $('#myModal1').on('show.bs.modal', function (e) {
                var isValid = false;
                debugger;
                var gridView = document.getElementById('<%= gvcheckbox.ClientID %>');
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
                    alert("Please select atleast one user");
                    return e.preventDefault() // stops modal from being shown
                }
            })

        });


    </script>

    <div id="management-bottom" class="col-md-12">
        <div class="block1 clearfix">
            <h2 class="col-md-3">User Management</h2>
            <div class="col-md-9">
                <ul>
                    <!--<li><a href="#"><span class="sprite ic-assignvideo"></span>Assign Videos to Group </a></li>-->
                    <li>
                        <%--                        <asp:LinkButton runat="server" data-toggle="modal" data-target="#myModal1" ID="LinkButton1" OnClientClick="javascript:validateCheckBoxes()"> <span class="sprite ic-assignvideo"></span>Assign Users to Group </asp:LinkButton></li>--%>
                        <asp:LinkButton runat="server" data-toggle="modal" data-target="#myModal1" ID="lnkAssignUserGroup"> <span class="sprite ic-assignvideo"></span>Assign Users to Group </asp:LinkButton></li>
                    <!--<li><a href="#"><span class="sprite ic-creategroup"></span>Create Group </a></li>-->
                </ul>
                <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel">Assign Users to Group</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4 control-label">Select&nbsp;Group<span class="required"> *</span></label>
                                        <div class="col-sm-7">
                                            <asp:DropDownList ID="ddlGroupList" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0" Text="Select" Selected="True" />
                                                <asp:ListItem Value="1" Text="Group Name 1" />
                                                <asp:ListItem Value="2" Text="Group Name 2" />
                                                <asp:ListItem Value="3" Text="Group Name 3" />
                                                <asp:ListItem Value="4" Text="Group Name 4" />
                                            </asp:DropDownList>

                                            <%--  <select name="" class="form-control">
                                      <option disabled selected>Select group</option>
										<option>Group Name 1</option>
										<option>Group Name 2</option>
										<option>Group Name 3</option>
										<option>Group Name 4</option>
                                      </select>--%>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnAssign" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Assign" />
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                                <%-- <button type="button" class="btn btn-primary" data-dismiss="modal">Assign</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-block clearfix col-md-12">
                        

            <table id="gvcheckbox" runat="server">
                <tr>
                    <th>User Name</th>
                    <th>Full Name </th>
                    <th>Domain Name </th>
                    <th>Group Name</th>
                    <th class="last-child">Actions</th>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="" />
                        User Name</td>
                    <td>Full Name </td>
                    <td>ETG </td>
                    <td>Group Name 1</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr class="even">
                    <td>
                        <input type="checkbox" name="" />
                        User Name</td>
                    <td>Full Name </td>
                    <td>ETG.Net </td>
                    <td>Group Name 2</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="" />
                        User Name</td>
                    <td>Full Name </td>
                    <td>ETG.Mobile </td>
                    <td>Group Name 3</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr class="even">
                    <td>
                        <input type="checkbox" name="" />
                        User Name</td>
                    <td>Full Name </td>
                    <td>ETG.PHP </td>
                    <td>Group Name 4</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="" />
                        User Name</td>
                    <td>Full Name </td>
                    <td>ETG.Admin </td>
                    <td>Group Name 5</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
