function coolMoreThirdInfo(){
	var ckb = document.getElementsByName("ckb");
	var flag = 0;
	var i;
	if(ckb.length == 0){
		alert("��ǰ���κ��̻���Ϣ!");
		return false;
	}
	else if(ckb.length > 0){
		for(i=0;i<ckb.length;i++){
			if(ckb[i].checked == true){
				flag = 1;
				break;
			}
		}
	}
	if(flag == 1){
		if(confirm("��ȷ��Ҫȡ����˵�ǰ��ѡ�̻�?")){
			return true;
		}
		return false;
		
	}
	else{
		alert("��ѡ����Ҫ���ͨ�����̻�!");
		return false;
	}
}


function selectAll(){
	var ckb = document.getElementsByName("ckb");
	if(ckb.length > 0){
		if(document.getElementById("checkAll").checked == true){
			for(var i=0;i<ckb.length;i++){
				ckb[i].checked = true;
			}
		}
		else if(document.getElementById("checkAll").checked == false){
			for(var i=0;i<ckb.length;i++){
				ckb[i].checked = false;
			}
		}
	}
}



function searchThirdInfo(){
	var key = document.getElementById("key").value;
	if(key == ""){
		alert("�������ѯ�ؼ���!");
		return false;
	}
	else{
		window.location.href = "../servlet/ManageThirdInfo?method=search&key="+key+"";
		return true;
	}
}

function coolThirdInfoOfSearching(thirdId,isCooled,key){
	if(isCooled == "0"){
		if(confirm("��ȷ��Ҫȡ����˵�ǰ��ѡ�̻�?")){
			window.location.href = "../servlet/ManageThirdInfo?method=cool&thirdId="+thirdId+"&isCooled="+isCooled+"&isSearching=yes&key="+key+"";
		}
	}
	else{
		if(confirm("��ȷ��Ҫ���ͨ����ǰ��ѡ�̻�?")){
			window.location.href = "../servlet/ManageThirdInfo?method=cool&thirdId="+thirdId+"&isCooled="+isCooled+"&isSearching=yes&key="+key+"";
		}
	}
}

function coolThirdInfo(thirdId,isCooled){
	if(isCooled == "0"){
		if(confirm("��ȷ��Ҫȡ����˵�ǰ��ѡ�̻�?")){
			window.location.href = "../servlet/ManageThirdInfo?method=cool&thirdId="+thirdId+"&isCooled="+isCooled+"";
		}
	}
	else{
		if(confirm("��ȷ��Ҫ��˵�ǰ��ѡ�̻�?")){
			window.location.href = "../servlet/ManageThirdInfo?method=cool&thirdId="+thirdId+"&isCooled="+isCooled+"";
		}
	}
}




function back(){

	window.location.href = "../servlet/ManageThirdInfo?method=showManageThirdInfoPage";
	}
	
	