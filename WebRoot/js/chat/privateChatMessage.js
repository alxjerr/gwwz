//����XMLHttp����
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
		//�����������ݶ���
		function sendRequest(){
			if(xmlHttp == null){
				createXMLHttpRequest();
			}		
			//�����첽����,GET����
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
		//ÿ��һ��ˢ��һ��ҳ��
		function page_load(){
			setInterval(sendRequest,1000);		
		}
		