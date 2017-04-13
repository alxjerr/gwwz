		var xmlHttp = null;
    	//创建XMLHttp对象
    	function createXMLHttpRequest(){
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}
			else{
				try{
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				}catch(e){
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
		}
    	
		
		
		//实现热键：回车发送消息
		function enterkey(){
			var enter_keydown=window.event.srcElement;
        	if(event.keyCode==13 && enter_keydown.id=="privateChatMessageInput"){	
		   	 	privateChatMessageInput.focus();
           		privateChatSendMessage.focus();
       		 }
       	}
		//隐藏私聊窗口
       	function hidePrivateChatDiv(){
			var privateChatDiv = parent.document.getElementById("privateChatDiv");
			privateChatDiv.style.display = "none";
			document.getElementById("privateChatMessageInput").value = "";
		}
 