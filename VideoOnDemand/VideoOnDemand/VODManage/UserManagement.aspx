<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="VideoOnDemand.VODManage.UserManagement" %>

<asp:Content ID="UserManagementContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
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
            <h2 class="col-md-3">User Management</h2>
            <div class="col-md-9">
                <ul>
                    <li>
                        <asp:LinkButton runat="server" ID="lnkAssignVidGroup" PostBackUrl="#"> <span class="sprite ic-assignvideo"></span>Assign Videos to Group </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton runat="server" ID="lnkAssignGroup" PostBackUrl="#"><span class="sprite ic-assigngroup"></span>Assign Group </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton runat="server" ID="lnkCreateGroup" PostBackUrl="#"><span class="sprite ic-creategroup"></span>Create Group </asp:LinkButton>
                    </li>
                </ul>
            </div>
        </div>
        <div class="table-block clearfix col-md-12">
            <table>
                <tr>
                    <th>User Here</th>
                    <th>Full Name here</th>
                    <th>Group Name</th>
                    <th class="last-child">Actions</th>
                </tr>
                <tr>
                    <td>User Here</td>
                    <td>Full Name here</td>
                    <td>Group Name</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr class="even">
                    <td>User Here</td>
                    <td>Full Name here</td>
                    <td>Group Name</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr>
                    <td>User Here</td>
                    <td>Full Name here</td>
                    <td>Group Name</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr class="even">
                    <td>User Here</td>
                    <td>Full Name here</td>
                    <td>Group Name</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
                <tr>
                    <td>User Here</td>
                    <td>Full Name here</td>
                    <td>Group Name</td>
                    <td class="last-child"><a href="#" class="sprite edit"></a><a href="#" class="sprite delete"></a></td>
                </tr>
            </table>
        </div>
        </div>
    </div>

</asp:Content>
