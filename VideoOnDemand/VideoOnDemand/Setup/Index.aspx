<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="VideoOnDemand.Setup.DatabaseSetup" %>

<asp:Content ID="DatabaseSetupHeadContent" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>

<asp:Content ID="DatabaseSetupContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('form').find('a.submit-link').click(function () {
                $('form').trigger('submit');
            }).show();


            //var myApp;
            //myApp = myApp || (function () {
            //    alert('kkk');
            //    var pleaseWaitDiv = $('<div class="modal hide" id="pleaseWaitDialog" data-backdrop="static" data-keyboard="false"><div class="modal-header"><h1>Processing...</h1></div><div class="modal-body"><div class="progress progress-striped active"><div class="bar" style="width: 100%;"></div></div></div></div>');
            //    return {
            //        showPleaseWait: function () {
            //            pleaseWaitDiv.modal();

            //        },
            //        hidePleaseWait: function () {
            //            pleaseWaitDiv.modal('hide');

            //        },

            //    };
            //})();


        });



    </script>
    <div class="container">
        <!--container-->


        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul>
                    <li class="first-child completed edit-s"><a href="#"><span>1</span>Database Setup</a></li>
                    <li class="middle-leftchild"><a href="#"><span>2</span>Active Directory Details </a></li>
                    <li class="middle-rightchild"><a href="#"><span>3</span>VOD Configuration Details </a></li>
                    <li class="last-child"><a href="#"><span>4</span>Super Admin Info</a></li>
                </ul>
            </div>
            <div class="column1">Enter database connecton details.</div>
            <!--Step1-->
            <div class="column2">
                <label>IP Address<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtIPAddress" ClientIDMode="Static" CssClass="form-control required NoEmpty ipformat" data-placement="right" data-trigger="manual" MaxLength="25" data-content="Enter valid ip address"></asp:TextBox>
                    <span class="sprite ip"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvTxtIPAddress" ControlToValidate="txtIPAddress" ValidationGroup="DbSetup" ErrorMessage="* Please Enter IP Address" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server" ID="revTxtIPAddress" ValidationGroup="DbSetup" ValidationExpression="^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$" ForeColor="Red" ControlToValidate="txtIPAddress" ErrorMessage="* Invalid Ip Address" Display="Dynamic" />
            </div>
            <div class="column2">
                <label>Port<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPort" ClientIDMode="Static" CssClass="form-control required NoEmpty portnumber" data-placement="right" data-trigger="manual" MaxLength="6" data-content="Enter valid port number"></asp:TextBox>
                    <span class="sprite port"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvport" ControlToValidate="txtPort" ValidationGroup="DbSetup" ErrorMessage="* Please Enter Port" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="revPort" ValidationGroup="DbSetup" ValidationExpression="^(102[0-4]|10[0-1]\d|[1-9][0-9]{0,3}|0)$" ForeColor="Red" ControlToValidate="txtPort" Display="Dynamic" ErrorMessage="* Invalid Port" />

            </div>
            <div class="column2">
                <label>Database Name<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtDatabaseName" CssClass="form-control required NoEmpty " data-placement="right" data-trigger="manual" MaxLength="25" data-content="Enter Valid Database"></asp:TextBox>
                    <span class="sprite database"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvDatabaseName" ControlToValidate="txtDatabaseName" ValidationGroup="DbSetup" ErrorMessage="* Please Enter Database" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>

            <div class="column2">
                <label>User ID<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserId" CssClass="form-control required NoEmpty " data-placement="right" data-trigger="manual" MaxLength="15" data-content="Enter Valid UserId"></asp:TextBox>
                    <span class="sprite username"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvUserId" ControlToValidate="txtUserId" ValidationGroup="DbSetup" ErrorMessage="* Please Enter UserId" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Password<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control required NoEmpty" data-placement="right" data-trigger="manual" MaxLength="15" data-content="Enter Password"></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtPassword" ValidationGroup="DbSetup" ErrorMessage="* Please Enter Password" ForeColor="#E2351D"></asp:RequiredFieldValidator>


            </div>

            <div class="bottom-container clearfix">
                <p class="pull-left">
                    <span class="required required-font">*</span> Indicates mandatory fields
                    <br>
                    If you are not sure about database details, please contact your host.
                </p>
                <p class="pull-right">

                    <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" Width="0" Height="0" CausesValidation="true" BackColor="Transparent"
                        ValidationGroup="DbSetup" BorderWidth="0" OnClick="btnNext_ServerClick" OnClientClick="myApp.showPleaseWait()" />
                    <label runat="server" id="lblClickButton" for="btnNext" class="labelButton">Next<span class="sprite ic-arrow"></span></label>
                </p>
            </div>
        </div>


        <div class="modal fade" id="alertMessageModal2" tabindex="-1" role="dialog" aria-labelledby="alertHeader" aria-hidden="true" data-dismiss="modal">
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
                                        <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label" Style="width: 400px; word-wrap: normal; text-align: left; padding-left: 20px;"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>

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

  <%--  <div class="modal fade hide" id="pleaseWaitDialog" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="alertHeader" aria-hidden="true" data-dismiss="modal">
        <div class="modal-header">
            <h1>Processing...</h1>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="modal-body">
                    <div class="progress progress-striped active">
                        <div class="bar" style="width: 100%;"></div>
                    </div>
                </div>
            </ContentTemplate>

        </asp:UpdatePanel>
    </div>--%>



</asp:Content>
