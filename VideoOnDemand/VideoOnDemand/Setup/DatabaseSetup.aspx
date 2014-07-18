<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="DatabaseSetup.aspx.cs" Inherits="VideoOnDemand.Setup.DatabaseSetup" %>

<asp:Content ID="DatabaseSetupHeadContent" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="DatabaseSetupContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div class="container">
        <!--container-->

        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul>
                    <li class="first-child completed"><a href="#"><span>1</span>Database Setup</a></li>
                    <li><a href="#"><span>2</span>VOD Configuration Details </a></li>
                    <li class="last-child"><a href="#"><span>3</span>Super Admin Info</a></li>
                </ul>
            </div>
            <div class="column1">Below you should enter your database connecton details.</div>
            <!--Step1-->
            <div class="column2">
                <label>IP Address</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtIPAddress"></asp:TextBox>
                    <span class="sprite ip"></span>
                </div>
            </div>
            <div class="column2">
                <label>Port</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPort"></asp:TextBox>
                    <span class="sprite port"></span>
                </div>
            </div>
            <div class="column2">
                <label>Database Name</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtDatabaseName"></asp:TextBox>
                    <span class="sprite database"></span>
                </div>
            </div>


              <div class="column2">
                <label>User ID</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserId"></asp:TextBox>
                    <span class="sprite port"></span>
                </div>
            </div>
            <div class="column2">
                <label>Password</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPassword"></asp:TextBox>
                    <span class="sprite database"></span>
                </div>
            </div>


            <div class="bottom-container clearfix">
                <p class="pull-left">
                    Fields that must be completed<br>
                    If you are not sure about database details, please contact your host.
                </p>
                <p class="pull-right">
                    <asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/Setup/VODConfiguration.aspx" >Next<span class="sprite ic-arrow"></span></asp:LinkButton>

                </p>
            </div>
        </div>
    </div>


</asp:Content>
