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
		//创建发送数据对象
		function sendRequest(){
			var messageInput = document.getElementById("messageInput");
			if(messageInput.value==""){
				alert("请输入消息!");
				document.getElementById("messageInput").focus();
				return;
			}
			if(xmlHttp==null){
				createXMLHttpRequest();
			}
			//采用异步传输,POST方法
			xmlHttp.open("POST","../servlet/AjaxDoInput",true);
			//指定一个HTTP报头
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//将得到的输入信息传入到AjaxDoInput.java去处理
			xmlHttp.send("message="+messageInput.value);
			//将输入框清空
			messageInput.value="";
			//获取输入框的焦点
			messageInput.focus();
		}
		
		
		//实现热键：回车发送消息
		function enterkey(){
			var enter_keydown=window.event.srcElement;
        	if(event.keyCode==13 && enter_keydown.id=="messageInput"){	
		   	 	messageInput.focus();
           		sendMessage.focus();
       		 }
		}
		//隐藏表情功能
		function showFace(){
			var face = parent.document.getElementById("face");
			if(face.style.display == "none"){
				face.style.display = "block";
			}
			else{
				face.style.display = "none";
			}
		}
		//改变表情按钮背景的颜色
		function changeFaceIconBgcolor(){
			var faceIconBgcolor = document.getElementById("faceIconBgcolor");
			if(faceIconBgcolor.style.backgroundColor == ""){
				faceIconBgcolor.style.backgroundColor = "pink";
			}
			else{
				faceIconBgcolor.style.backgroundColor = "";
			}
		}
		