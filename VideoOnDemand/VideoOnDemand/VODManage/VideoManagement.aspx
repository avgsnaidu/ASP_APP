<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.master" AutoEventWireup="true" CodeBehind="VideoManagement.aspx.cs" Inherits="VideoOnDemand.VODManage.VideoManagement" %>

<asp:Content ID="VideoManagementContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div id="management-top">
        <div class="container">
            <ul>
                <%-- <li class="active"><a href="#">User Management<span class="sprite ic-usermanagement"></span><small class="sprite arrow-down"></small></a></li>
                <li><a href="video-management.html">Video Management<span class="sprite ic-videomanagement"></span><small class="sprite arrow-down"></small></a></li>
                <li><a href="#">Search<span class="sprite ic-search"></span><small class="sprite arrow-down"></small></a></li>
                <li><a href="#">Archive Listing<span class="sprite ic-archivelisting"></span><small class="sprite arrow-down"></small></a></li>--%>

                <li class="active">
                    <asp:LinkButton runat="server" ID="lnkUserMang" PostBackUrl="~/VODManage/UserManagement.aspx">User Management<span class="sprite ic-usermanagement"></span><small class="sprite arrow-down"></small> </asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton runat="server" ID="lnkVideoMang" PostBackUrl="~/VODManage/VideoManagement.aspx">Video Management<span class="sprite ic-videomanagement"></span><small class="sprite arrow-down"></small></asp:LinkButton>

                </li>
                <li>
                    <asp:LinkButton runat="server" ID="lnkSearch" PostBackUrl="#">Search<span class="sprite ic-search"></span><small class="sprite arrow-down"></small></asp:LinkButton>

                </li>
                <li>
                    <asp:LinkButton runat="server" ID="lnkArchiveListen" PostBackUrl="#">Archive Listing<span class="sprite ic-archivelisting"></span><small class="sprite arrow-down"></small></asp:LinkButton>
                </li>

            </ul>
        </div>

    </div>
    <div class="container">

        <div id="management-bottom" class="col-md-12">
            <div class="block1 clearfix">
                <h2 class="col-md-3">Video Management</h2>
                <div class="col-md-9">
                    <ul>
                        <li>
                            <asp:LinkButton runat="server" ID="lnkAll" PostBackUrl="#"><span class="sprite ic-all"></span>All</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton runat="server" ID="lnkConverted" PostBackUrl="#"><span class="sprite ic-converted"></span>Converted</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton runat="server" ID="lnkUnConverted" PostBackUrl="#"><span class="sprite ic-unconverted"></span>Unconverted</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton runat="server" ID="lnkPresentlyConverting" PostBackUrl="#"> <span class="sprite ic-presentlyconverting"></span>Presently Converting</asp:LinkButton></li>
                    </ul>
                </div>
            </div>
            <div class="table-block clearfix col-md-12">
                <table>
                    <tr>
                        <th>Video Name</th>
                        <th>Video Status</th>
                        <th>Tags</th>
                    </tr>
                    <tr>
                        <td>Video Name</td>
                        <td>Pending</td>
                        <td>Video Tags here, Video Tags here, Video Tags here,Video Tags..</td>
                    </tr>
                    <tr class="even">
                        <td>Video Name</td>
                        <td>Done</td>
                        <td>Video Tags here, Video Tags here, Video Tags here,Video Tags..</td>
                    </tr>
                    <tr>
                        <td>Video Name</td>
                        <td>Process</td>
                        <td>Video Tags here, Video Tags here, Video Tags here,Video Tags..</td>
                    </tr>
                    <tr class="even">
                        <td>Video Name</td>
                        <td>Done</td>
                        <td>Video Tags here, Video Tags here, Video Tags here,Video Tags..</td>
                    </tr>
                    <tr>
                        <td>Video Name</td>
                        <td>Pending</td>
                        <td>Video Tags here, Video Tags here, Video Tags here,Video Tags..</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
