function showAddBulletinPage(){
	window.location.href = "../admin/addBulletin.jsp";
}

function deletMoreBulletin(){
	var ckb = document.getElementsByName("ckb");
	var flag = 0;
	var i;
	if(ckb.length == 0){
		alert("��ǰ���κι�����Ϣ!");
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
		if(confirm("��ȷ��Ҫɾ����ǰ��ѡ����?")){
			return true;
		}
		return false;
		
	}
	else{
		alert("��ѡ����Ҫɾ���Ĺ�����Ϣ!");
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



function searchBulletin(){
	var key = document.getElementById("key").value;
	if(key == ""){
		alert("�������ѯ�ؼ���!");
		return false;
	}
	else{
		window.location.href = "../servlet/ManageBulletin?method=search&key="+key+"";
		return true;
	}
}

function deleteBulletinOfSearching(bid,key){
	if(confirm("��ȷ��Ҫɾ����ǰ��ѡ����?")){
		window.location.href = "../servlet/ManageBulletin?method=delete&bid="+bid+"&isSearching=yes&key="+key+"";
	}
}
function deleteBulletin(bid){
	if(confirm("��ȷ��Ҫɾ����ǰ��ѡ����?")){
		window.location.href = "../servlet/ManageBulletin?method=delete&bid="+bid+"";
	}
}