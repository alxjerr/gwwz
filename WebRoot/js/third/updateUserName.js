function checkUserName(){
	
	var userName = document.getElementById("userName").value;
	if(userName == ""){
		alert("��������Ҫ���ĺ���û���!");
		return false;
	}
	var phone = document.getElementById("phone").value;
	if(phone == ""){
		alert("������绰!");
		return false;
	}
	var address = document.getElementById("address").value;
	if(address == ""){
		alert("�������ַ!");
		return false;
	}
	else if(userName.length <5){
		alert("�û������Ȳ���С��5λ!����������!");
		document.getElementById("userName").value = "";
		return false;
	}
	
}
