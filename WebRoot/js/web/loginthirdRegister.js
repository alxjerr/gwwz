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
		function sendRequest(){
			if(checkEmail() == false){
				return false;
			}
		 	else{
		 		var regEmail = document.getElementById("regEmail").value;
				if(xmlHttp==null){
					createXMLHttpRequest();
				}
				//�����첽����,POST����
				xmlHttp.open("POST","../servlet/DoMethod?method=checkEmail",true);
				//ָ��һ��HTTP��ͷ
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlHttp.onreadystatechange = callback;
				//���õ���������Ϣ���뵽AjaxDoInput.javaȥ����
				xmlHttp.send("regEmail="+regEmail);
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


function showAndHideTalbe(){
	if(document.getElementById("ck").checked == true){
		document.getElementById("detail").style.display = "block";
	}
	else{
		document.getElementById("detail").style.display = "none";
	}
}


function checkLogin(){
	//��ȡ�ı����е�ֵ
 	var email = document.getElementById("email").value;
 	var pwd = document.getElementById("pwd").value;
 	if(email == ""){
 		alert("�����������ַ!");
 		return false;
 	}
 	else if(email.indexOf("@") == -1 || email.indexOf(".") == -1){
 		alert("�����ַ���Ϸ�!����������!");
 		return false;
 	}
 	else if(email.indexOf(" ") != -1){
 		alert("�����ַ�в��ܺ��пո�!����������!");
 		return false;
 	}
 	else if(pwd == ""){
 		alert("����������!");
 		return false;
 	}
 	else if(pwd.length < 6){
 		alert("���볤�Ȳ���С��6λ!����������!");
 		return false;
 	}
 	else if(pwd.indexOf(" ") != -1){
 		alert("���벻�ܰ����ո�!����������!");
 		return false;
 	}
}
function checkRegister(){
	//��ȡ�ı����е�ֵ
	var regEmail = document.getElementById("regEmail").value;
 	var regPwd = document.getElementById("regPwd").value;
 	var regConPwd = document.getElementById("regConPwd").value;
 	if(checkEmail() == false){
 		return false;
 	}
 	else if(responseMSG.length == 16){
 		alert("�����ѱ�ע��,����������!");
 		return false;
 	}
 	else if(regPwd == ""){
 		alert("����������!");
 		return false;
 	}
 	else if(regPwd.length < 6){
 		alert("���볤�Ȳ���С��6λ!����������!");
 		return false;
 	}
 	else if(regPwd.indexOf(" ") != -1){
 		alert("���벻�ܰ����ո�!����������!");
 		return false;
 	}
 	else if(regConPwd == ""){
 		alert("������ȷ������!");
 		return false;
 	}
 	else if(regConPwd != regPwd){
 		alert("�����������벻һ��!����������!");
 		return false;
 	}
 	else if(document.getElementById("ck").checked == true){
 		var thirdname = document.getElementById("thirdname").value;
 	 	var telephone = document.getElementById("telephone").value;
 	 	var movePhone = document.getElementById("movePhone").value;
 		var address = document.getElementById("address").value;
 		if(thirdname == ""){
 			alert("����д�����̻�����!");
 			return false;
 		}
 		else if(phone == "" ){
 			alert("����д�绰��ϵ��ʽ!");
 			return false;
 		}
 		else if(address == ""){
 			alert("����д������ϵ��ַ!");
 			return false;
 		}
 	}
}


function checkEmail(){
	
	var regEmail = document.getElementById("regEmail").value;
	
	if(regEmail == ""){
 		alert("�����������ַ!");
 		return false;
 	}
	else if(regEmail.indexOf("@") == -1 || regEmail.indexOf(".") == -1){
 		alert("�����ַ���Ϸ�!����������!");
 		return false;
 	}
	else if(regEmail.indexOf(" ") != -1){
 		alert("�����ַ�в��ܺ��пո�!����������!");
 		return false;
 	}
 	return true;
}