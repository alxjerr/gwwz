<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>私聊信息显示</title>
</head>
  <style type="text/css">
    	body {font-size: 12px;}
    	#msg_content_div div{text-indent:20px;padding:3px}
  </style>
     <script type="text/javascript" src="../js/chat/privateChatMessage.js" charset="gb2312"></script>
     <script type="text/javascript">
     	//实现私聊
		function showAndHidePrivateMessage(){
			//得到当前的用户昵称
			var currentUserName = "<%=session.getAttribute("email")%>";
			//得到当前聊天对象的昵称
			var chatWithWho = parent.document.getElementById("userName").innerText;
			//获取所有的私聊信息
			var privateChatMessageListTable = document.getElementById("privateChatMessageList");
			//获取当前私聊信息的条数
			if(privateChatMessageListTable != null){
				var privateChatMessageListTableRows = privateChatMessageListTable.rows;
				for(var i=0;i<privateChatMessageListTableRows.length;i++){
					//获取每条私聊信息的ID
					privateChatMessageId = document.getElementsByTagName("td")[i].id;
					//指定私聊信息只能在发送者和接收者直接显示
					if(!(((currentUserName+"&"+chatWithWho) == privateChatMessageId) || ((chatWithWho+"&"+currentUserName) == privateChatMessageId))){
						document.getElementsByTagName("td")[i].style.display = "none";
					}
				}
			}
		}
    </script>
  <body onload="page_load();">
   	<div id="privateChatMsg_content_div"></div>
  </body>
</html>
