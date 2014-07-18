<%@ Page Title="" Language="C#" MasterPageFile="~/VODManage/VODManagement.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="VideoOnDemand.VODManage.Search" %>

<%@ MasterType VirtualPath="~/VODManage/VODManagement.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">


    <script type="text/javascript">
        $(document).ready(function () {

            $(".dropdown-menu li a").click(function () {
                var selText = $(this).text();
                $(this).parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');
            });


        });

    </script>

    <%--  
    <style>

        .block1 ul li {
            clear: both;
        }
        
        .searchBorder {
            border-color: red !important;
        } 

        .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
            color: red;
            background-color: white;
            background-image: none;
            filter: none;
        }

        .dropdown-menu.showApparance {
            background-color: red;
        }
    </style>--%>


    <div id="management-bottom" class="col-md-12">
        <div class="block1 block2 clearfix">
            <h2 class="col-md-3">Search</h2>
            <div class="col-md-9">

                <div class="form-search pull-right">
                    <div class="input-append">
                        <input type="text" class="span2 search-query searchBorder searchTextPadingExist" style="height: inherit; min-width: 350px;" placeholder="Enter search keywords..">
                        <div class="btn-group input-prepend">
                            <button id="btnDropDown" class="btn dropdown-toggle searchBorder" data-toggle="dropdown">Filter By..<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Route </a></li>
                                <li><a href="#">Area     </a></li>
                                <li><a href="#">Road     </a></li>
                                <li><a href="#">Community </a></li>
                                <li><a href="#">District </a></li>
                            </ul>
                        </div>
                        <button type="submit" class="btn searchBorder btn-danger">Search <i class="icon-search"></i></button>

                    </div>
                </div>


            </div>
        </div>
        <div class="table-block clearfix col-md-12">
            <table>
                <tr>
                    <th>Video Name</th>
                    <th>Tags</th>
                </tr>
                <tr>
                    <td>Video Name</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr class="even">
                    <td>Video Name</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr>
                    <td>Video Name</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr class="even">
                    <td>Video Name</td>
                    <td>Root, Area, Place ...</td>
                </tr>
                <tr>
                    <td>Video Name</td>
                    <td>Root, Area, Place ...</td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
