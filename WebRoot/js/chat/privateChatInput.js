		var xmlHttp = null;
    	//����XMLHttp����
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
    	
		
		
		//ʵ���ȼ����س�������Ϣ
		function enterkey(){
			var enter_keydown=window.event.srcElement;
        	if(event.keyCode==13 && enter_keydown.id=="privateChatMessageInput"){	
		   	 	privateChatMessageInput.focus();
           		privateChatSendMessage.focus();
       		 }
       	}
		//����˽�Ĵ���
       	function hidePrivateChatDiv(){
			var privateChatDiv = parent.document.getElementById("privateChatDiv");
			privateChatDiv.style.display = "none";
			document.getElementById("privateChatMessageInput").value = "";
		}
 