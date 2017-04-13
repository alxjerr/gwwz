function checkLogin(){
	//获取文本框中的值
 	var email = document.getElementById("email").value;
 	var pwd = document.getElementById("pwd").value;
 	if(email == ""){
 		alert("请输入注册邮箱!");
 		return false;
 	}
 	else if(pwd == ""){
 		alert("请输入密码!");
 		return false;
 	}
 	else if(pwd.length < 6){
 		alert("密码长度不得小于6位!请重新输入!");
 		return false;
 	}
 	else if(pwd.indexOf(" ") != -1){
 		alert("密码不能包含空格!请重新输入!");
 		return false;
 	}
}