function showAddGoodsInfoPage(){
	window.location.href = "../servlet/tManageGoodsInfo?method=showAddGoodsInfoPage";
}

function deletMoreGoodsInfo(){
	var ckb = document.getElementsByName("ckb");
	var flag = 0;
	var i;
	if(ckb.length == 0){
		alert("��ǰ���κ���Ʒ��Ϣ!");
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
		if(confirm("��ȷ��Ҫɾ����ǰ��ѡ��Ʒ?")){
			return true;
		}
		return false;
		
	}
	else{
		alert("��ѡ����Ҫɾ������Ʒ!");
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



function searchGoodsInfo(){
	var key = document.getElementById("key").value;
	if(key == ""){
		alert("�������ѯ�ؼ���!");
		return false;
	}
	else{
		window.location.href = "../servlet/tManageGoodsInfo?method=search&key="+key+"";
		return true;
	}
}

function deleteGoodsInfoOfSearching(goodsId,key,thirdId){
	if(confirm("��ȷ��Ҫɾ����ǰ��ѡ��Ʒ?")){
		window.location.href = "../servlet/tManageGoodsInfo?method=delete&goodsId="+goodsId+"&isSearching=yes&key="+key+"&thirdId="+thirdId+"";
	}
}
function deleteGoodsInfo(goodsId,thirdId){
	if(confirm("��ȷ��Ҫɾ����ǰ��ѡ��Ʒ?")){
		window.location.href = "../servlet/tManageGoodsInfo?method=delete&goodsId="+goodsId+"&thirdId="+thirdId+"";
	}
}



