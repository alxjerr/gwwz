function checkNull(){
	if(document.getElementById("title").value == ""){
		alert("�����빫�����!");
		return false;
	}
	else if(document.getElementById("title").value.length >80){
		alert("������ⳤ�Ȳ��ô���80λ!");
		return false;
	}
	else if(document.getElementById("content").value == ""){
		alert("�����빫������!");
		return false;
	}
}

function back(){

	window.location.href = "../servlet/ManageBulletin?method=showManageBulletinPage";
	}
	