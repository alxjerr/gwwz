function sh(orderid){
		if(confirm("��ȷ���Ѿ��ջ�?")){
			window.location.href = "../servlet/OrderInfo?method=sh&orderId="+orderid+"";
		}
}
function th(orderid){
		if(confirm("��ȷ��Ҫ�˻�?")){
			window.location.href = "../servlet/OrderInfo?method=th&orderId="+orderid+"";
		}
}

function checkupdate(){

	//��ȡ�ı����е�ֵ
 	var regPwd = document.getElementById("regPwd").value;
 	var regConPwd = document.getElementById("regConPwd").value;
 	 if(regPwd == ""){
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
	 	
}
