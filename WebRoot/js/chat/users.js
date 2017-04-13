		var xmlHttp = null;
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

		function sendRequest(){
			if(xmlHttp == null){
				createXMLHttpRequest();
			}		
			xmlHttp.open("GET","../servlet/AjaxGetUsers",true);
			xmlHttp.onreadystatechange=callback;
			xmlHttp.send(null);
		}
		
		function callback(){
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				var usersDiv = document.getElementById("users_div");
				usersDiv.innerHTML = xmlHttp.responseText;
			}
		}
		
		function page_load(){
			setInterval(sendRequest,1000);
		}
		//��ʾ˽�Ĵ��ڣ�����ȡ�õ��û��ǳƺ�ͷ��ֵ�����ڶ���
		function getBtnVal(){
			if(event.srcElement.id != ""){
				parent.document.getElementById("userName").innerText = event.srcElement.id;
				parent.document.getElementById("privateChatDiv").style.display = "block";
				if(event.srcElement.id == parent.document.getElementById("receiveFromWho").innerText){
					parent.document.getElementById("Layer13").style.display = "none";
				}
				//��ȡ�����Ľ���
				parent.window.frames["privateChatInput"].document.getElementById("privateChatMessageInput").focus();
			}
		}