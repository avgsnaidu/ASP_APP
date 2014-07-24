<%@ Page Title="" Language="C#" MasterPageFile="~/VODManage/VODManagement.master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="VideoOnDemand.VODManage.UserManagement" %>

<asp:Content ID="UserManagementContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <script src="../Scripts/bootstrap-select.js"></script>
    <link href="../Content/css/bootstrap-select.css" rel="stylesheet" />
    <style>
      

    </style>
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

            $(".selectpicker").selectpicker();

        });

        function HighlightRow(chkB) {
            debugger;
            var IsChecked = chkB.checked;
            if (IsChecked) {
                chkB.parentElement.parentElement.style.backgroundColor = '#228b22';
                chkB.parentElement.parentElement.style.color = 'white';
            } else {
                chkB.parentElement.parentElement.style.backgroundColor = 'white';
                chkB.parentElement.parentElement.style.color = 'black';
            }
            var checkAll = document.getElementById('chkAll');

            Parent = document.getElementById('<%= gvUserManagement.ClientID %>');
            var items = Parent.getElementsByTagName('input');
            if (IsChecked && (!checkAll.checked)) {


            }
            else {

            }
        }


        function SelectAllCheckboxesSpecific(spanChk) {
            var IsChecked = spanChk.checked;
            var Chk = spanChk;
            Parent = document.getElementById('<%= gvUserManagement.ClientID %>');
            var items = Parent.getElementsByTagName('input');
            for (i = 0; i < items.length; i++) {
                if (items[i].id != Chk && items[i].type == "checkbox") {
                    if (items[i].checked != IsChecked) {
                        items[i].click();
                    }
                }
            }
        }



        //function CheckAllEmp(Checkbox) {
        //    var GridVwHeaderChckbox = document.getElementById("%=gvUserManagement.ClientID %>");
        //      for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
        //          GridVwHeaderChckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
        //      }
        //}


        //function SelectAllCheckboxesMoreSpecific(spanChk) {
        //    var IsChecked = spanChk.checked;
        //    var Chk = spanChk;
        //    Parent = document.getElementById('%= gvUserManagement.ClientID %>');
        //    for (i = 0; i < Parent.rows.length; i++) {
        //        debugger;
        //        var tr = Parent.rows[i];
        //        //var td = tr.childNodes[0];                                  
        //        var td = tr.firstChild;
        //        var item = td.firstChild;
        //        if (item.id != Chk && item.type == "checkbox") {
        //            if (item.checked != IsChecked) {
        //                item.click();
        //            }
        //        }
        //    }
        //}




        $(document).ready(function () {
            function openModal() {
                $('#myModal1').modal('show');
            }


            $('#myModal1').on('show.bs.modal', function (e) {
                var isValid = false;
                debugger;
                var gridView = document.getElementById('<%= gvUserManagement.ClientID %>');
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
                    $('#alertMessageModal').modal('show');
                    //alert("Please select atleast one user");
                    return e.preventDefault() // stops modal from being shown
                }
            })

        });


        function CheckCheckBoxSelection() {
            var isValid = false;
            debugger;
            var gridView = document.getElementById('<%= gvUserManagement.ClientID %>');
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
                label.innerHTML = 'Please select minimum one user';
                $('#alertMessageModal').modal('show');
                //alert("Please select atleast one user");
                //return e.preventDefault() // stops modal from being shown
                return false;
            }
        }


        //$(document).ready(function () {
        //    $("#tstModal").click(function () {
        //        $(".modal").modal("show");
        //    });
        //});

    </script>



    <div id="management-bottom" class="col-md-12">

        <div class="block1 block2 clearfix">
            <h2 class="col-md-3">User Management</h2>
            <div class="col-md-9">
                <ul>
                    <!--<li><a href="#"><span class="sprite ic-assignvideo"></span>Assign Videos to Group </a></li>-->
                    <li>
                        <%--                        <asp:LinkButton runat="server" data-toggle="modal" data-target="#myModal1" ID="LinkButton1" OnClientClick="javascript:validateCheckBoxes()"> <span class="sprite ic-assignvideo"></span>Assign Users to Group </asp:LinkButton></li>--%>
                        <asp:LinkButton runat="server" ID="lnkAssignUserGroup" OnClick="lnkAssignUserGroup_Click" OnClientClick="return CheckCheckBoxSelection();"> <span class="sprite ic-assignvideo"></span>Assign Users to Group </asp:LinkButton></li>
                    <!--<li><a href="#"><span class="sprite ic-creategroup"></span>Create Group </a></li>-->
                    <li class="last">
                        <label>Filter By </label>
                        <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>--%>
                        <asp:DropDownList ID="ddlGroupsFilter" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="true"
                            Width="100px" OnSelectedIndexChanged="ddlGroupsFilter_SelectedIndexChanged">
                        </asp:DropDownList>
                        <%--                            </ContentTemplate>
                        </asp:UpdatePanel>--%>
 
                    </li>
                </ul>

                <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel">Assign Users to Group</h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">Select&nbsp;Group<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddlGroupList" runat="server" CssClass="form-control">
                                                        <%--<asp:ListItem Value="0" Text="Select" Selected="True" />
                                                <asp:ListItem Value="1" Text="Group Name 1" />
                                                <asp:ListItem Value="2" Text="Group Name 2" />
                                                <asp:ListItem Value="3" Text="Group Name 3" />
                                                <asp:ListItem Value="4" Text="Group Name 4" />--%>
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
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnAssign" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnAssign" runat="server" class="btn btn-primary" OnClick="btnAssign_Click" Text="Assign" />
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                                <%-- <button type="button" class="btn btn-primary" data-dismiss="modal">Assign</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="editUserGroupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="H1">Modify User Group</h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">

                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">

                                                <label for="lblUserName" class="col-sm-4 control-label">Description<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:Label runat="server" ID="lblUserName" class="form-control" name=""></asp:Label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="ddlGroups" class="col-sm-4 control-label">Select&nbsp;Group<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddlGroupsEdit" runat="server" CssClass="form-control">
                                                        <%--<asp:ListItem Value="0" Text="Select" Selected="True" />
                                                <asp:ListItem Value="1" Text="Group Name 1" />
                                                <asp:ListItem Value="2" Text="Group Name 2" />
                                                <asp:ListItem Value="3" Text="Group Name 3" />
                                                <asp:ListItem Value="4" Text="Group Name 4" />--%>
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
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSaveEdit" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnSaveEdit" runat="server" class="btn btn-primary" OnClick="btnSaveEdit_Click" Text="Assign" />
                                <asp:Button ID="btnCancelEdit" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                                <%-- <button type="button" class="btn btn-primary" data-dismiss="modal">Assign</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
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
                                                <label for="inputEmail3" class="col-sm- control-label" style="width: 370px;">Are&nbsp;you&nbsp;sure&nbsp;to&nbsp;delete&nbsp;group&nbsp;from&nbsp;user ?.</label>
                                            </div>
                                        </div>

                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnDeleteConform" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnDeleteConform" runat="server" class="btn btn-primary" OnClick="btnDeleteConform_Click" Text="Delete" />
                                <asp:Button ID="btnDeleteCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Cancel" />

                                <%-- <button type="button" class="btn btn-primary" data-dismiss="modal">Assign</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="alertHeader" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="alertHeader">Alert !</h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label" Style="width: 320px;"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="RowCommand" />
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
                    <asp:GridView ID="gvUserManagement" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" AllowPaging="true"
                        GridLines="None" DataKeyNames="UserId,GroupId" OnRowCommand="gvUserManagement_RowCommand" EmptyDataText="No users to display in selected group."
                        EmptyDataRowStyle-HorizontalAlign="Center"  PagerSettings-Mode="Numeric" OnPageIndexChanging="gvUserManagement_PageIndexChanging">
                        <AlternatingRowStyle BackColor="#DEDEDE" />
                         <HeaderStyle CssClass="gridheader" />
                        <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
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


                            <asp:BoundField DataField="UserID" Visible="false" />
                            <asp:BoundField DataField="UserName" HeaderText="User Name" />
                            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                            <asp:BoundField DataField="Domain" HeaderText="Domain Name" />
                            <asp:BoundField DataField="GroupName" HeaderText="Group Name" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" CommandArgument='<%#Eval("UserId")+ ";"+ Eval("GroupId")%>' />
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%#Eval("UserId")+ ";"+ Eval("GroupId")%>' />
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
