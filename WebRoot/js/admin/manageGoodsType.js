function showAddGoodsTypePage(){
	window.location.href = "../admin/addGoodsType.jsp";
}


function deletMoreGoodsType(){
	var ckb = document.getElementsByName("ckb");
	var flag = 0;
	var i;
	if(ckb.length == 0){
		alert("��ǰ���κ���Ʒ������Ϣ!");
		return false;
	} else if(ckb.length > 0){
		for(i=0;i<ckb.length;i++){
			if(ckb[i].checked == true){
				flag = 1;
				break;
			}
		}
	}if(flag == 1){
		if(confirm("��ȷ��Ҫɾ����ǰ��ѡ��Ʒ����?")){
			return true;
		}
		return false;
		
	}else{
		alert("��ѡ����Ҫɾ������Ʒ����!");
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



function searchGoodsType(){
	var key = document.getElementById("key").value;
	if(key == ""){
		alert("�������ѯ�ؼ���!");
		return false;
	}
	else{
		window.location.href = "../servlet/ManageGoodsType?method=search&key="+key+"";
		return true;
	}
}


function deleteGoodsTypeOfSearching(typeId,key){
	if(confirm("��ȷ��Ҫɾ����ǰ��ѡ��Ʒ����?")){
		window.location.href = "../servlet/ManageGoodsType?method=delete&typeId="+typeId+"&isSearching=yes&key="+key+"";
	}
}
function deleteGoodsType(typeId){
	if(confirm("��ȷ��Ҫɾ����ǰ��ѡ��Ʒ����?")){
		window.location.href = "../servlet/ManageGoodsType?method=delete&typeId="+typeId+"";
	}
}
function deleteDetailType(Id,typeId){
	if(confirm("��ȷ��Ҫɾ����ǰ��ѡ��Ʒ����?")){
		window.location.href = "../servlet/ManageDetailType?method=delete&Id="+Id+"&typeId="+typeId+"";
	}
}