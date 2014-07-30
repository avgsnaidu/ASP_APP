<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoPlayer.aspx.cs" Inherits="VideoOnDemand.Player.VideoPlayer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>RegisterStartupScript</title>
    <script type="text/javascript" src="jwplayer.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id='player'></div><br/>


        </div>
    </form>
</body>

<%--<head> 
    <title></title>
    <script type="text/javascript" src="jwplayer.js"></script>
</head>
<body style="padding-left:350px;padding-top:170px;"> 
<div id='player'></div><br/>
<script type='text/javascript'>
    //jwplayer('player').setup({
    //    flashplayer: "jwplayer.flash.swf",
    //    //width: '60%',
    //    //height: '60%',
    //    primary: "flash",
    //    mute: "true",
    //    stretching: "exactfit",
    //    playlist: [{ sources: [{ file: "http://172.16.1.201:1935/vod/smil:test.smil/jwplayer.smil" }] }
    //        // have to replace test.smil with original smil file name Ex: http://172.16.1.201:1935/vod/smil:VideoOne.smil/jwplayer.smil
    //    ]
    //});
</script>
</body>--%>
</html>
