<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="DatabaseSetup.aspx.cs" Inherits="VideoOnDemand.Setup.DatabaseSetup" %>

<asp:Content ID="DatabaseSetupHeadContent" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>

<asp:Content ID="DatabaseSetupContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('form').find('a.submit-link').click(function () {
                $('form').trigger('submit');
            }).show();


        });

        //$('form').submit(function (e) {
        //    e.preventDefault();
        //    alert("form is valid, do ajax now");
        //});

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
                <asp:RequiredFieldValidator runat="server" ID="rfvTxtIPAddress" ControlToValidate="txtIPAddress" EnableClientScript="false" ValidationGroup="DbSetup" ErrorMessage="Field must not be empty" ForeColor="#E2351D"> *  Field should not be empty.</asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Port<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPort" ClientIDMode="Static" CssClass="form-control required NoEmpty portnumber" data-placement="right" data-trigger="manual" MaxLength="6" data-content="Enter valid port number"></asp:TextBox>
                    <span class="sprite port"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvport" ControlToValidate="txtPort" EnableClientScript="false" ValidationGroup="DbSetup" ErrorMessage="Field must not be empty" ForeColor="#E2351D"> *  Field should not be empty.</asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Database Name<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtDatabaseName" CssClass="form-control required NoEmpty " data-placement="right" data-trigger="manual" MaxLength="25" data-content="Field should not be empty."></asp:TextBox>
                    <span class="sprite database"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvDatabaseName" ControlToValidate="txtDatabaseName" EnableClientScript="false" ValidationGroup="DbSetup" ErrorMessage="Field must not be empty" ForeColor="#E2351D"> *  Field should not be empty.</asp:RequiredFieldValidator>
            </div>

            <div class="column2">
                <label>User ID<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserId" CssClass="form-control required NoEmpty " data-placement="right" data-trigger="manual" MaxLength="15" data-content="Field should not be empty."></asp:TextBox>
                    <span class="sprite username"></span>
                </div>
                  <asp:RequiredFieldValidator runat="server" ID="rfvUserId" ControlToValidate="txtUserId" ValidationGroup="DbSetup" ErrorMessage="Field must not be empty" ForeColor="#E2351D"> *  Field should not be empty.</asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Password<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control required NoEmpty" data-placement="right" data-trigger="manual" MaxLength="15" data-content="Field should not be empty."></asp:TextBox>
                   <span class="sprite password"></span>
                </div>
                 <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtPassword" ValidationGroup="DbSetup" ErrorMessage="Field must not be empty" ForeColor="#E2351D"> *  Field should not be empty.</asp:RequiredFieldValidator>
                    
              
            </div>

            <div class="bottom-container clearfix">
                <p class="pull-left">
                    <span class="required required-font">*</span> Indicates mandatory fields
                    <br>
                    If you are not sure about database details, please contact your host.
                </p>
                <p class="pull-right">

                    <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" Width="0" Height="0" CausesValidation="true" BackColor="Transparent" ValidationGroup="DbSetup" BorderWidth="0" OnClick="btnNext_ServerClick" />
                    <label runat="server" id="lblClickButton" for="btnNext" class="labelButton">Next<span class="sprite ic-arrow"></span></label>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
