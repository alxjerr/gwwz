//创建XMLHttp对象
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
		//创建发送数据对象
		function sendRequest(){
			if(xmlHttp == null){
				createXMLHttpRequest();
			}		
			//采用异步传输,GET方法
			xmlHttp.open("GET","../servlet/AjaxGetPrivateChatMessage",true);
			xmlHttp.onreadystatechange = callback;
			xmlHttp.send(null);
		}
		
		function callback(){
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				var privateChatMsgDiv = document.getElementById("privateChatMsg_content_div");
				privateChatMsgDiv.innerHTML = xmlHttp.responseText;
				showAndHidePrivateMessage();
				window.scroll(0,document.body.scrollHeight);	
			}		
		}
		//每隔一秒刷新一次页面
		function page_load(){
			setInterval(sendRequest,1000);		
		}
		