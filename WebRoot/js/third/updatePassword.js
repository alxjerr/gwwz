var xmlHttp = null;
var responseMSG = null;
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
		function sendRequest(thirdId){
			var oldUserPwd = document.getElementById("oldUserPwd").value;
			if(oldUserPwd == ""){
		 		alert("�����������!");
		 		return false;
		 	}
		 	else{
				if(xmlHttp==null){
					createXMLHttpRequest();
				}
				//�����첽����,POST����
				xmlHttp.open("POST","../servlet/tUpdateUserInfo?method=checkOldUserPwd&thirdId="+thirdId,true);
				//ָ��һ��HTTP��ͷ
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlHttp.onreadystatechange = callback;
				//���õ���������Ϣ���뵽AjaxDoInput.javaȥ����
				xmlHttp.send("oldUserPwd="+oldUserPwd);
				return true;
			}
		}
		
		function callback(){
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				var msg = document.getElementById("msg");
				msg.innerText = xmlHttp.responseText;
				responseMSG =  xmlHttp.responseText;
			}
		}





function checkUserPwd(){
	//��ȡ�ı����е�ֵ
 	var oldUserPwd = document.getElementById("oldUserPwd").value;
 	var newUserPwd = document.getElementById("newUserPwd").value;
 	var confirmNewUserPwd = document.getElementById("confirmNewUserPwd").value;
 	if(oldUserPwd == ""){
 		alert("�����������!");
 		return false;
 	}
 	else if(newUserPwd == ""){
 		alert("������������!");
 		return false;
 	}
 	else if(newUserPwd.length < 6){
 		alert("���볤�Ȳ���С��6λ!����������!");
 		return false;
 	}
 	else if(newUserPwd.indexOf(" ") != -1){
 		alert("���벻�ܰ����ո�!����������!");
 		return false;
 	}
 	else if(confirmNewUserPwd != newUserPwd){
 		alert("������������벻һ��!����������!");
 		return false;
 	}
}