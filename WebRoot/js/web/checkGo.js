function checkGo(){
	if(document.getElementById("go").value == ""){
		alert("��������Ҫ��ת��ҳ��!");
		return false;
	}
	else if(document.getElementById("go").value <= 0){
			alert("��תҳ������С��0!����������!");
			document.getElementById("go").value = "";
			return false;
		}
		var flag = false; 
		var go = document.getElementsByName("go");
		var size = go.length; 
		var exp = /^[0-9]*[1-9][0-9]*$/;
		
		//�ж�����ļƻ���Ϊ�쳣�ַ� 
		for(var i=0;i<size;i++){ 
		    if(!exp.test(go[i].value)){ 
		    flag = true;
		    break; 
		    } 
		} 
		if(flag == true && !(document.getElementById("go").value <= 0)){ 
			alert("��תҳ���а��������ַ�!����������!");
			document.getElementById("go").value = "";
			return false ; 
		}
}