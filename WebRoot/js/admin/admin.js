function checkLogin(){
	//��ȡ�ı����е�ֵ
 	var userName = document.getElementById("userName").value;
 	var pwd = document.getElementById("pwd").value;
 	if(userName == ""){
 		alert("�������û���!");
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