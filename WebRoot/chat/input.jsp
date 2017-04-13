<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   	<title>群聊消息输入</title>
   	<script type="text/javascript" src="../js/chat/input.js" charset="gb2312"></script>
  <style type="text/css">
<!--
body{
   		text-align:center;
   		font-size:13px;
   	}
#Layer1 {
	position:absolute;
	left:1067px;
	top:35px;
	z-index:1;
}
-->
</style>
  <link type="text/css" rel="stylesheet" href="../css/style.css" />
  </head>
  <body>
  		<table style="margin-top: 22px;">
  			<tr>
  				<td>
					<img src="../image/chatIcon/messageInput.gif" />
				</td>
				<td>
					<input type="text" class="input" id="messageInput" onkeyDown="enterkey()" style="width:600px; height:33px;padding-top:5px;font-size:16px"/>
				</td>
				<td id="faceIconBgcolor" onmouseover="changeFaceIconBgcolor()" onmouseout="changeFaceIconBgcolor()">
					<div align="center"><img src="../image/chatIcon/faceIcon.gif" onclick="showFace()" style="cursor: pointer;" width="31" height="31"></div>
				</td>
				<td>
					<input id="sendMessage" type="button" class="btn" onclick="sendRequest();" value="发&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;送" style="width:100px; height:33px;font-size:15px;cursor: pointer;" />
				</td>
			</tr>
		</table>
		<div id="Layer1"><a href="../servlet/DoChatMethod?method=loginOut" target="_top"><font size="4">安全退出</font></a></div>
  </body>
</html>
