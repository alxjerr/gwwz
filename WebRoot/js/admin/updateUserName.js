function checkUserName(){
	
	var userName = document.getElementById("userName").value;
	if(userName == ""){
		alert("��������Ҫ���ĺ���û���!");
		return false;
	}
	else if(userName.length <5){
		alert("�û������Ȳ���С��5λ!����������!");
		document.getElementById("userName").value = "";
		return false;
	}
	else{
		top.location.href = " ../servlet/UpdateUserInfo?method=updateUserName&userName="+userName+"";
		return true;
	}
}
