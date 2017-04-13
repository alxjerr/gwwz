<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>私聊信息输入</title>
    <script type="text/javascript" src="../js/chat/privateChatInput.js" charset="gb2312"></script>
<style type="text/css">
<!--
#Layer7 {
	position:absolute;
	left:315px;
	top:75px;
	z-index:7;
}
#Layer10 {
	position:absolute;
	left:1px;
	top:0px;
	z-index:1;
}
body{
   		text-align:center;
   		font-size:13px;
   	}
   	form{padding:10px 0px 0px 0px;)
-->
</style>
<script type="text/javascript" src="../js/privateChatInput.js" charset="gb2312"></script>
<script type="text/javascript">
		//创建发送数据对象
		function sendRequest(){
			var privateChatMessageInput = document.getElementById("privateChatMessageInput");
			if(privateChatMessageInput.value==""){
				alert("请输入消息!");
				document.getElementById("privateChatMessageInput").focus();
				return;
			}
			if(xmlHttp==null){
				createXMLHttpRequest();
			}
			//采用异步传输,POST方法
			xmlHttp.open("POST","../servlet/AjaxDoPrivateChatInput",true);
			//指定一个HTTP报头
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//将得到的输入信息传入到AjaxDoInput.java去处理
			xmlHttp.send("privateChatMessage="+privateChatMessageInput.value+"&sendToWho="+parent.document.getElementById("userName").innerText+"&receiveFromWho="+'<%=session.getAttribute("email")%>');
			//将输入框清空
			privateChatMessageInput.value="";
			//获取输入框的焦点
			privateChatMessageInput.focus();
		}
  </script>
  </head>
  </head>
  <body bgcolor="#96C2G9">
  <div id="Layer10">
  	&nbsp;&nbsp;&nbsp; <textarea id="privateChatMessageInput" style="width:487px; height:53px" onkeyDown="enterkey()"></textarea>
	<div id="Layer7">
		<input id="closePrivateChatDiv" type="button" class="btn" value="关&nbsp;闭(C)" style="width:70px; height:25px;font-size:15px;cursor: pointer;" onclick="hidePrivateChatDiv()"/>
		&nbsp;&nbsp;
		<input id="privateChatSendMessage" type="button" class="btn" value="发&nbsp;送(S)" style="width:70px; height:25px;font-size:15px;cursor: pointer;" onclick="sendRequest()"/>
	</div>
  </div>
  </body>
</html>
