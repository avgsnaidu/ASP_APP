<%@ Page Title="" Language="C#" MasterPageFile="~/VODManage/VODManagement.master" AutoEventWireup="true" CodeBehind="VideoManagement.aspx.cs" Inherits="VideoOnDemand.VODManage.VideoManagement" %>

<asp:Content ID="VideoManagementContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <script type="text/javascript">



        $(document).ready(function () {

            $('#myModal3').on('show.bs.modal', function (e) {
                var isValid = false;
                debugger;
                var gridView = document.getElementById('<%=grdVideoManagement.ClientID %>');
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
    </script>



    <div id="management-bottom" class="col-md-12">
        <div class="block1 block2 clearfix">
            <h2 class="col-md-3">Video Management</h2>
            <div class="col-md-9">
                <ul>
                    <li>
                        <asp:LinkButton ID="lnkAssignVidToGroup" runat="server" data-toggle="modal" data-target="#myModal3"> <span class="sprite ic-assignvideo"></span>Assign Videos to Group </asp:LinkButton>
                    </li>
                    <li class="last">
                        <label>Filter By </label>
                        <div class="btn-group">
                            <button class="btn dropdown-toggle searchBorder dropbutton-align" data-toggle="dropdown">All<span class="caret"></span></button>
                            <ul class="dropdown-menu ">
                                <li><a href="#">All      </a></li>
                                <li><a href="#">Converted</a></li>
                                <li><a href="#">Pending </a></li>
                                <li><a href="#">Processing </a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel">Assign Videos to Group</h4>
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

                                            <%-- <select name="" class="form-control">
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

                                <%--  <button type="button" class="btn btn-primary" data-dismiss="modal">Assign</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="table-block clearfix col-md-12">
            <table id="grdVideoManagement" runat="server">
                <tr>
                    <th>Video Name</th>
                    <th>Video Status</th>
                    <th>Tags</th>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="" />
                        Video Name</td>
                    <td>Pending</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr class="even">
                    <td>
                        <input type="checkbox" name="" />
                        Video Name</td>
                    <td>Converted</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="" />
                        Video Name</td>
                    <td>Pending</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr class="even">
                    <td>
                        <input type="checkbox" name="" />
                        Video Name</td>
                    <td>Processing</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="" />
                        Video Name</td>
                    <td>Converted</td>
                    <td>Root, Area, Place ...</td>
                </tr>
            </table>
        </div>
    </div>


</asp:Content>
