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
		//�����������ݶ���
		function sendRequest(){
			var messageInput = document.getElementById("messageInput");
			if(messageInput.value==""){
				alert("��������Ϣ!");
				document.getElementById("messageInput").focus();
				return;
			}
			if(xmlHttp==null){
				createXMLHttpRequest();
			}
			//�����첽����,POST����
			xmlHttp.open("POST","../servlet/AjaxDoInput",true);
			//ָ��һ��HTTP��ͷ
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//���õ���������Ϣ���뵽AjaxDoInput.javaȥ����
			xmlHttp.send("message="+messageInput.value);
			//����������
			messageInput.value="";
			//��ȡ�����Ľ���
			messageInput.focus();
		}
		
		
		//ʵ���ȼ����س�������Ϣ
		function enterkey(){
			var enter_keydown=window.event.srcElement;
        	if(event.keyCode==13 && enter_keydown.id=="messageInput"){	
		   	 	messageInput.focus();
           		sendMessage.focus();
       		 }
		}
		//���ر��鹦��
		function showFace(){
			var face = parent.document.getElementById("face");
			if(face.style.display == "none"){
				face.style.display = "block";
			}
			else{
				face.style.display = "none";
			}
		}
		//�ı���鰴ť��������ɫ
		function changeFaceIconBgcolor(){
			var faceIconBgcolor = document.getElementById("faceIconBgcolor");
			if(faceIconBgcolor.style.backgroundColor == ""){
				faceIconBgcolor.style.backgroundColor = "pink";
			}
			else{
				faceIconBgcolor.style.backgroundColor = "";
			}
		}
		