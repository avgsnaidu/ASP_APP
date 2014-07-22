<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true"
    CodeBehind="Configuration.aspx.cs" Inherits="VideoOnDemand.Admin.Configuration" %>

<asp:Content ID="ConfigurationContent" ContentPlaceHolderID="VODContentPlaceHolder"
    runat="server">
    <div class="container">
        <div id="management-bottom" class="col-md-12">
            <div style="float: right;padding-right:30px;">
                    <br /><asp:LinkButton runat="server" ID="btnSubmit" CssClass="btn-type1" ForeColor="White" PostBackUrl="~/VODManage/ArchiveListing.aspx">Home</asp:LinkButton>
                <br /> &nbsp;</div>
            <div class="block1 clearfix">
                    <h2 class="col-md-12 title1">
                        Database Connecton Details</h2>
                
            </div>
            <div class="table-block clearfix col-md-12">
                <div>
                    <table style="background:#fff">
                        <tr>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight:bold" class="middle-rightchild">
                                        <asp:Label ID="lblIpAddress" runat="server" Text="IPAddress"></asp:Label>
                                    </div>
                                    <div style="float: right;" class="middle-rightchild">
                                        <asp:Label ID="txtAddress" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight:bold" class="middle-rightchild">
                                        <asp:Label ID="lblPort" runat="server" Text="Port Number"></asp:Label>
                                    </div>
                                    <div style="float: right;" class="middle-rightchild">
                                        <asp:Label ID="txtPort" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight:bold" class="middle-rightchild">
                                        <asp:Label ID="lblDatabase" runat="server" Text="Database"></asp:Label>
                                    </div>
                                    <div style="float: right;" class="middle-rightchild">
                                        <asp:Label ID="txtDatabase" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight:bold" class="middle-rightchild">
                                        <asp:Label ID="lblUserId" runat="server" Text="User Id"></asp:Label>
                                    </div>
                                    <div style="float: right;" class="middle-rightchild">
                                        <asp:Label ID="txtUser" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight:bold" class="middle-rightchild">
                                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                    </div>
                                    <div style="float: right;" class="middle-rightchild">
                                        <asp:Label ID="txtPassword" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td width="50%">&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="block1 clearfix">
                <h2 class="col-md-12 title1">
                    Active Directory Details</h2>
            </div>
            <div class="table-block clearfix col-md-12">
                <table style="background:#fff">
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblServerId" runat="server" Text="Server Id"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtServer" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblADUserName" runat="server" Text="User Name"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtADUser" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblADPassword" runat="server" Text="AD Password"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtADPassword" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblDomain" runat="server" Text="Domain"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtDomain" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="block1 clearfix">
                <h2 class="col-md-12 title1">
                    VOD Configuration Details</h2>
            </div>
            <div class="table-block clearfix col-md-12">
                <table style="background:#fff">
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblSrcFolder" runat="server" Text="Source Folder"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtSrcFolder" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblDestFolder" runat="server" Text="Destination"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtDestFolder" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblArchiveFolder" runat="server" Text="Archive"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtArchive" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblBackUp" runat="server" Text="Back Up"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtBack" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblSchedule" runat="server" Text="Interval Time"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtSchedule" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblVideoConversion" runat="server" Text="Video Conversion"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtVideo" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="block1 clearfix">
                <h2 class="col-md-12 title1">
                    Super Admin Info</h2>
            </div>
            <div class="table-block clearfix col-md-12">
                <table style="background:#fff">
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblSuperUser" runat="server" Text="User Name"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtSuperUser" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblAdminPassword" runat="server" Text="Password"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtAdminPassword" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight:bold" class="middle-rightchild">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="txtEmail" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                        &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
