

function loginOut(exit){
	
	if(confirm("��ȷ��Ҫ�˳�ϵͳ?")){
		window.location.href = "../servlet/CheckThirdLogin?method=loginOut";
	}
}