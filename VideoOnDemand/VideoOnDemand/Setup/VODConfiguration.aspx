<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="VODConfiguration.aspx.cs" Inherits="VideoOnDemand.Setup.VODConfiguration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="VODConfigurationContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div class="container">
        <!--container-->

        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step2">
                    <li class="first-child completed"><a href="#"><span>1</span>Database Setup</a></li>
                    <li class="completed"><a href="#"><span>2</span>VOD Configuration Details </a></li>
                    <li class="last-child"><a href="#"><span>3</span>Super Admin Info</a></li>
                </ul>
            </div>
            <div class="column1">Info here...</div>
            <div class="column2">
                <label>VOD Source Folder</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtSourceFolder"></asp:TextBox>
                    <span class="sprite source"></span>
                </div>
            </div>
            <div class="column2">
                <label>VOD Destination Folder</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtDestFolder"></asp:TextBox>

                    <span class="sprite destination"></span>
                </div>
            </div>
            <div class="column2">
                <label>VOD Archive Folder</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtArchiveFolder"></asp:TextBox>
                    <span class="sprite backup"></span>
                </div>
            </div>
            <%--  <div class="column2">
                <label>Schedule Configuration</label>
                <div class="input-holder">
                    <input name="" type="text">
                    <span class="sprite configuration"></span>
                </div>
            </div>--%>
            <div class="column2">
                <label>Schedule Interval</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtScheduleInterval"></asp:TextBox>
                    <span class="sprite interval"></span>
                </div>
            </div>
            <div class="column2">
                <label>Time</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtTime"></asp:TextBox>
                    <span class="sprite interval"></span>
                </div>
            </div>

            <div class="column2">
                <label>Simultaneous Video Conversions</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtSimlVidConversions"></asp:TextBox>
                    <span class="sprite threads"></span>
                </div>
            </div>

            <div class="bottom-container clearfix">
                <p class="pull-left">
                    Fields that must be completed<br />
                    If you are not sure about database details, please contact your host.
                </p>
                <p class="pull-right">
                    <asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/Setup/SuperAdminInfo.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>
                </p>
            </div>
        </div>
    </div>

</asp:Content>
