<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoPlayer.aspx.cs" Inherits="VideoOnDemand.Player.VideoPlayer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="jwplayer.js"></script>

</head>
<body style="padding: 10%">
   
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <%-- <div id='player'></div>
            <br />--%>


            <div class="modal fade" id="mdlPlayVideo" tabindex="-1" role="dialog" aria-labelledby="modalVideoLabel" aria-hidden="true" data-dismiss="modal">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                            <h4 class="modal-title" id="modalVideoLabel">Alert !</h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">

                                            <div id='player'></div>

                                            <br />

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
    </form>
</body>

</html>
