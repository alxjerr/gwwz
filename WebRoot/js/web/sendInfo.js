function checkSendInfo(){
	//��ȡ�ı����е�ֵ
 		var name = document.getElementById("name").value;
 	 	var telephone = document.getElementById("telephone").value;
 	 	var movePhone = document.getElementById("movePhone").value;
 		var address = document.getElementById("address").value;
 		if(name == ""){
 			alert("����д������ʵ����!");
 			return false;
 		}
 		else if(telephone == "" && movePhone == ""){
 			alert("��������дһ��绰��ϵ��ʽ!");
 			return false;
 		}
 		else if(address == ""){
 			alert("����д�����ջ��ַ!");
 			return false;
 		}
}