<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/VODManagement.master" AutoEventWireup="true" CodeBehind="~/Admin/Users.aspx.cs" Inherits="VideoOnDemand.Admin.UserManagement" %>

<asp:Content ID="UserManagementContent" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">

    <%--    <script src="../Scripts/bootstrap-select.js"></script>
    <link href="../Content/css/bootstrap-select.css" rel="stylesheet" />--%>
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

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            // re-bind your jQuery events here
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
                var labelHeader = document.getElementById('<%= ltlAlertHeader.ClientID %>');
                labelHeader.innerHTML = 'Select User';
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




        //var CONST_COLOR_BACKCOLOR = '#F7BE81';
        //var Const_LastCol_Index = 6;

        //// I am calling a Javascript function to change the selected row color on page load
        //var browserName = navigator.appName;
        //if (browserName == "Microsoft Internet Explorer") {
        //    window.onload = SelectGridOnLoad;
        //}
        //else {
        //    if (browserName == "Netscape") //google chrome app.Name
        //    {
        //        setTimeout("SelectGridOnLoad()", 500);
        //    }
        //    else {
        //        window.onload = SelectGridOnLoad; // helps with Opera
        //    }
        //}


        //function SelectGridOnLoad() {
        //    alert('kdkdkd');

        //    // Looping all the row (Here - 1 is used as I have footer in the Grid View and starting from 1 Row (0 is Header)
        //    // So if you dont have Footer required to loop till end of the row (ie., no -1).
        //    for (var intRow = 1; intRow < document.getElementById('%= gvUserManagement.ClientID %>').rows.length - 1; intRow++) {

        //        // Declaring variable for Holding Values
        //        var vHiddenControlId = 0;
        //        var vCheckById = '';

        //        // Getting the GridView Row
        //        var gridRow = document.getElementById('%= gvUserManagement.ClientID %>').rows[intRow];

        //        for (var intCell = 0; intCell < gridRow.cells[Const_LastCol_Index].childNodes.length; intCell++) // Looping the Row cell
        //        {
        //            if (gridRow.cells[Const_LastCol_Index].childNodes[intCell].id.indexOf("hndRowBackColor") != -1)
        //                if (gridRow.cells[Const_LastCol_Index].childNodes[intCell].id != null) {

        //                    // Getting the Hidden Control Id (for storing current row background color
        //                    vHiddenControlId = gridRow.cells[Const_LastCol_Index].childNodes[intCell].id;

        //                    // Getting Check box Id (to know the check box selected)
        //                    if (gridRow.cells[Const_LastCol_Index].childNodes[intCell].id.indexOf("chkSelectUser") != -1)
        //                        vCheckById = gridRow.cells[Const_LastCol_Index].childNodes[intCell].id;
        //                }
        //        }
        //        if (document.getElementById(vCheckById).checked == true) {
        //            document.getElementById(vHiddenControlId).value = gridRow.style.backgroundColor;
        //            gridRow.style.backgroundColor = CONST_COLOR_BACKCOLOR;
        //        }
        //    }
        //}

        ////function SelectRow(Id) {

        ////    // Declaring variable for Holding Values
        ////    var vHiddenControlId = 0;

        ////    // Getting the GridView Row
        ////    var gridRow = document.getElementById(Id).parentNode.parentNode;

        ////    if (document.getElementById(Id).checked == true) // If Selected
        ////    {

        ////        for (var intCell = 0; intCell < gridRow.cells[Const_LastCol_Index].childNodes.length; intCell++) // Looping the Row cell
        ////        {
        ////            if (gridRow.cells[Const_LastCol_Index].childNodes[intCell].id != null) {

        ////                // Getting the Hidden Control Id (for storing current row background color
        ////                if (gridRow.cells[Const_LastCol_Index].childNodes[intCell].id.indexOf("hndRowBackColor") != -1)
        ////                    vHiddenControlId = gridRow.cells[Const_LastCol_Index].childNodes[intCell].id;
        ////            }
        ////        }

        ////        // Storing the color already was there to the hidden control for future replacement
        ////        document.getElementById(vHiddenControlId).value = gridRow.style.backgroundColor;

        ////        // Chanding the color
        ////        gridRow.style.backgroundColor = CONST_COLOR_BACKCOLOR;
        ////    }
        ////    else // If unselected - Replace the color back
        ////    {
        ////        for (var intCell = 0; intCell < gridRow.cells[Const_LastCol_Index].childNodes.length; intCell++) {

        ////            if (gridRow.cells[Const_LastCol_Index].childNodes[intCell].id != null) {

        ////                // Getting the Hidden Control Id (for storing current row background color
        ////                if (gridRow.cells[Const_LastCol_Index].childNodes[intCell].id.indexOf("hndRowBackColor") != -1)
        ////                    vHiddenControlId = gridRow.cells[Const_LastCol_Index].childNodes[intCell].id;
        ////            }
        ////        }

        ////        // Restoring color back
        ////        gridRow.style.backgroundColor = document.getElementById(vHiddenControlId).value;
        ////    }
        ////}



    </script>



    <div id="management-bottom" class="col-md-12">

        <div class="modal fade" id="mdlAssignGroup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
            <div class="modal-dialog modal-dlg-top">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">
                            <asp:Literal ID="ltlmdlAssignGroupHeader" runat="server" />
                        </h4>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="ddlGroupList" class="col-sm-4 control-label">
                                            <asp:Literal ID="ltlSelect" runat="server" Text="<%$ Resources:Users, mdlAG_SelectGrp %>" />
                                            <span class="required">*</span></label>
                                        <div class="col-sm-7">
                                            <asp:DropDownList ID="ddlGroupList" runat="server" CssClass="form-control" meta:resourcekey="ddlGroupListResource1">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:CustomValidator ID="Cust_Valid_ddlGroupList" runat="server" ControlToValidate="ddlGroupList" OnServerValidate="Cust_Valid_ddlGroupList_ServerValidate"
                                            ErrorMessage="<%$ Resources:Users,MSG_Select_ValidGroupName %>" ValidationGroup="AssingGroup" />
                                    </div>
                                </div>

                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnAssign" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnRemoveAssigned" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="modal-footer">
                        <asp:Button ID="btnRemoveAssigned" runat="server" class="btn btn-primary" Visible="false" OnClick="btnRemoveAssigned_Click" Text="<%$ Resources:Users, mdlAG_btn_Remove %>" ValidationGroup="AssingGroup" />
                        <asp:Button ID="btnAssign" runat="server" class="btn btn-primary" OnClick="btnAssign_Click" Text="<%$ Resources:Users, mdlAG_Assign %>" ValidationGroup="AssingGroup" />
                        <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:Users, mdlAG_Cancel %>" />
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="editUserGroupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
            <div class="modal-dialog modal-dlg-top">
                <div class="modal-content">
                    <div class="modal-header">
                        <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                        <h4 class="modal-title" id="H1">
                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Users, mdlEUP_ModfyGroup %>" />
                        </h4>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">

                                <div class="form-horizontal" role="form">
                                    <div class="form-group">

                                        <label for="lblUserName" class="col-sm-4 control-label">
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Users, mdlEUP_UserName %>" />
                                            <span class="required">*</span></label>
                                        <div class="col-sm-7">
                                            <asp:Label runat="server" ID="lblUserName" class="form-control" name=""></asp:Label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="ddlGroups" class="col-sm-4 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Users, mdlEUP_SelectGroup %>" />
                                            <span class="required">*</span></label>
                                        <div class="col-sm-7">
                                            <asp:DropDownList ID="ddlGroupsEdit" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="CustomValidator1" class="col-sm-4 control-label"></label>
                                            <div class="col-sm-7">
                                                <asp:CustomValidator ID="custValid_ddlGroupEdit_Select" runat="server" ControlToValidate="ddlGroupsEdit" OnServerValidate="custValid_ddlGroupEdit_Select_ServerValidate"
                                                    ErrorMessage="<%$ Resources:Users,MSG_Select_ValidGroupName %>" ForeColor="#E2351D" ValidationGroup="ModGroup" Display="Dynamic" />
                                            </div>
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
                        <asp:Button ID="btnSaveEdit" runat="server" class="btn btn-primary" OnClick="btnSaveEdit_Click" Text="<%$ Resources:Users, mdlEUP_Assign %>" ValidationGroup="ModGroup" />
                        <asp:Button ID="btnCancelEdit" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:Users, mdlEUP_Cancel%>" />

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
                        <h4 class="modal-title" id="H2">
                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Users, mdlDel_Header %>" />
                        </h4>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <asp:Label ID="lblDeleteMessage" runat="server" class="col-sm- control-label" Style="width: 370px;"></asp:Label>
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
                        <asp:Button ID="btnDeleteConform" runat="server" class="btn btn-primary" OnClick="btnDeleteConform_Click" Text="<%$ Resources:Users, mdlDel_Delete %>" />
                        <asp:Button ID="btnDeleteCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:Users, mdlDel_Delete_Cancel %>" />

                        <%-- <button type="button" class="btn btn-primary" data-dismiss="modal">Assign</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="mdlActivateUser" tabindex="-1" role="dialog" aria-labelledby="myActivateLabel" aria-hidden="true" data-dismiss="modal">
            <div class="modal-dialog modal-dlg-top">
                <div class="modal-content">
                    <div class="modal-header">
                        <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                        <h4 class="modal-title" id="myActivateLabel">
                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Users, mdlAU_ActionOnUser %>" />
                        </h4>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <asp:Label ID="lblUserActiveConfirm" runat="server" class="col-sm- control-label" Style="width: 370px;"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnActivateUser" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnDeactivateUser" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="modal-footer">
                        <asp:Button ID="btnActivateUser" runat="server" class="btn btn-primary" OnClick="btnActivateUser_Click" Text="<%$ Resources:Users, mdlAU_ActivateUser %>" />
                        <asp:Button ID="btnDeactivateUser" runat="server" class="btn btn-primary" Visible="false" OnClick="btnDeactivateUser_Click" Text="<%$ Resources:Users, mdlAU_DeactivateUser%>" />
                        <asp:Button ID="btnCancelUserAction" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:Users, mdlAU_CancelButton %>" />

                        <%-- <button type="button" class="btn btn-primary" data-dismiss="modal">Assign</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="alertHeader" aria-hidden="true" data-dismiss="modal">
            <div class="modal-dialog modal-dlg-top">
                <div class="modal-content">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="alertHeader">
                                    <asp:Label runat="server" ID="ltlAlertHeader"></asp:Label></h4>
                            </div>

                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label alertBodyContentAlign padLR10"></asp:Label>
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
                        <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text="<%$ Resources:Users, mdlAlt_Ok %>" />
                    </div>
                </div>
            </div>
        </div>



        <div class="block1 block2 clearfix">
            <%-- <h2 class="col-md-3"> <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Users, hd_UserManagement %>" /></h2>--%>
            <div class="col-md-12">

                <ul>
                    <li>
                        <asp:LinkButton runat="server" ID="lnkActivateUser" OnClick="lnkActivateUser_Click">
                            <span class="iconLump iconActive"></span>
                            <asp:Literal ID="ltlActivateUser" runat="server" Text="<%$ Resources:Users, lnkActivateUser %>" />
                        </asp:LinkButton></li>
                    <li>
                        <asp:LinkButton runat="server" ID="lnkDeactivateUser" OnClick="lnkDeactivateUser_Click">
                            <span class="iconLump iconDeactive"></span>
                            <asp:Literal ID="ltlDeactivateUser" runat="server" Text="<%$ Resources:Users, lnkDeactivateUser %>" />
                        </asp:LinkButton></li>
                    <li>
                        <asp:LinkButton runat="server" ID="lnkRemoveUsersFromGroup" OnClick="lnkRemoveUsersFromGroup_Click">
                            <span class="iconLump iconRemove"></span>
                            <asp:Literal ID="ltlRemoveUsersFromGroup" runat="server" Text="<%$ Resources:Users, lnkRemoveUsersFromGroup %>" />
                        </asp:LinkButton></li>
                    <li>
                        <asp:LinkButton runat="server" ID="lnkAssignUserGroup" OnClick="lnkAssignUserGroup_Click">
                            <span class="sprite ic-assigngroup"></span>
                            <asp:Literal ID="ltlAssignusersGroup" runat="server" Text="<%$ Resources:Users, lnkAssignUserstoGroup %>" />
                        </asp:LinkButton></li>

                    <li class="last">
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Users, lblFilterBy %>">Filter By </asp:Label>

                                <asp:DropDownList ID="ddlUsersFilter" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlUsersFilter_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlListBasedOnFilterBy" runat="server" CssClass="selectpicker dropdownList searchBorder" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlListBasedOnFilterBy_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlUsersFilter" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ddlListBasedOnFilterBy" EventName="SelectedIndexChanged" />
                                <%--  <asp:AsyncPostBackTrigger ControlID="lnkActivateUser" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkDeactivateUser" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkRemoveUsersFromGroup" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkAssignUserGroup" EventName="Click" />--%>
                                <%-- <asp:AsyncPostBackTrigger ControlID="lnkEdit" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="lnkDelete" EventName="Click" />--%>
                            </Triggers>
                        </asp:UpdatePanel>
                    </li>

                </ul>


            </div>
        </div>

        <div class="table-block clearfix col-md-12">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <asp:ObjectDataSource runat="server" ID="UserObjectSource" SelectMethod="BindUsersData"></asp:ObjectDataSource>

                    <asp:GridView ID="gvUserManagement" runat="server" AutoGenerateColumns="False" EnableViewState="true" ShowHeaderWhenEmpty="True"
                        AllowPaging="True" DataSourceID="UserObjectSource"
                        GridLines="None" DataKeyNames="UserId,GroupIds,ISACTIVE" OnRowCommand="gvUserManagement_RowCommand" OnLoad="GridView_Load"
                        EmptyDataText="<%$ Resources:Users, gv_EmtpyData %> " OnPageIndexChanging="gvUserManagement_PageIndexChanging" OnRowCreated="GridView_RowCreated">
                        <AlternatingRowStyle BackColor="#DEDEDE" />
                        <EmptyDataRowStyle HorizontalAlign="Center" />
                        <HeaderStyle CssClass="gridheader" />
                        <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                        <Columns>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" ClientIDMode="Static" runat="server" AutoPostBack="True" OnCheckedChanged="chkAll_CheckedChanged" meta:resourcekey="chkAllResource1" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelectUser" runat="server" AutoPostBack="True" OnCheckedChanged="chkSelectUser_CheckedChanged" meta:resourcekey="chkSelectUserResource1" />
                                    <asp:HiddenField runat="server" ID="hndRowBackColor" />
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="UserID" Visible="False" />
                            <asp:BoundField DataField="UserName" HeaderText="<%$ Resources:Users, gv_hd_Username %> "  HeaderStyle-Wrap="false" />
                            <%--<asp:BoundField DataField="FullName" HeaderText="<%$ Resources:Users, gv_hd_fullname %> ">

                                <ItemStyle Width="25%" />
                            </asp:BoundField>--%>

                            <asp:TemplateField HeaderText="<%$ Resources:Users, gv_hd_fullname %>">
                                <ItemTemplate>

                                    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:150px;">

                                        <asp:Label ID="gvlblUserFullName" runat="server" Text='<%# Bind("FullName") %>' ToolTip='<%#Bind("FullName")%>'></asp:Label>

                                    </div>

                                </ItemTemplate>

                                <HeaderStyle Wrap="false" Width="25%" HorizontalAlign="Left" />

                                <ItemStyle Wrap="false" Width="25%"></ItemStyle>

                            </asp:TemplateField>

                            <%--<asp:BoundField DataField="Domain" HeaderText="<%$ Resources:Users, gv_hd_Domain %> ">
                                <ItemStyle Width="15%" />
                            </asp:BoundField>--%>

                             <asp:TemplateField HeaderText="<%$ Resources:Users, gv_hd_Domain %>">
                                <ItemTemplate>

                                    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 100px;">

                                        <asp:Label ID="gvlblDOMAINNames" runat="server" Text='<%# Bind("Domain") %>' ToolTip='<%#Bind("Domain")%>'></asp:Label>

                                    </div>

                                </ItemTemplate>
                                <HeaderStyle Wrap="false" Width="100px" HorizontalAlign="Left" />

                                <ItemStyle Wrap="false" Width="100px"></ItemStyle>

                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="<%$ Resources:Users, gv_hd_groupName %>">
                                <ItemTemplate>

                                    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 250px;">

                                        <asp:Label ID="gvlblGroupNames" runat="server" Text='<%# Bind("GroupNames") %>' ToolTip='<%#Bind("GroupNames")%>'></asp:Label>

                                    </div>

                                </ItemTemplate>

                                <HeaderStyle Wrap="false" Width="200px" HorizontalAlign="Left" />

                                <ItemStyle Wrap="false" Width="250px"></ItemStyle>

                            </asp:TemplateField>

                          
                            <asp:BoundField DataField="ACTIVESTATUS" HeaderText="<%$ Resources:Users, gv_hd_IsActive %> " ItemStyle-Width="100px">
                                <ItemStyle Wrap="false" />
                                <HeaderStyle Wrap="false" />
                            </asp:BoundField>
 

                            <asp:TemplateField HeaderText="<%$ Resources:Users, gv_hd_Actions %>">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" CommandArgument='<%# Eval("UserId")+ ";"+ Eval("GroupIds") %>' />
                                    <%--<asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%# Eval("UserId")+ ";"+ Eval("GroupId") %>' />--%>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>

                        </Columns>

                        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                    </asp:GridView>
                    <%-- </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="Load" />                     
                    <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="PageIndexChanging" />
                    <asp:AsyncPostBackTrigger ControlID="gvUserManagement" EventName="RowCreated" />                  
                </Triggers>
            </asp:UpdatePanel>--%>
                </ContentTemplate>

            </asp:UpdatePanel>


        </div>

    </div>
</asp:Content>
