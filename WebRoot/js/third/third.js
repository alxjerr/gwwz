function checkLogin(){
	//��ȡ�ı����е�ֵ
 	var email = document.getElementById("email").value;
 	var pwd = document.getElementById("pwd").value;
 	if(email == ""){
 		alert("������ע������!");
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