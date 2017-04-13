function showAddGoodsInfoPage(){
	window.location.href = "../servlet/tManageGoodsInfo?method=showAddGoodsInfoPage";
}

function deletMoreGoodsInfo(){
	var ckb = document.getElementsByName("ckb");
	var flag = 0;
	var i;
	if(ckb.length == 0){
		alert("当前无任何商品信息!");
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
		if(confirm("您确定要删除当前所选商品?")){
			return true;
		}
		return false;
		
	}
	else{
		alert("请选择您要删除的商品!");
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
		alert("请输入查询关键词!");
		return false;
	}
	else{
		window.location.href = "../servlet/tManageGoodsInfo?method=search&key="+key+"";
		return true;
	}
}

function deleteGoodsInfoOfSearching(goodsId,key,thirdId){
	if(confirm("您确定要删除当前所选商品?")){
		window.location.href = "../servlet/tManageGoodsInfo?method=delete&goodsId="+goodsId+"&isSearching=yes&key="+key+"&thirdId="+thirdId+"";
	}
}
function deleteGoodsInfo(goodsId,thirdId){
	if(confirm("您确定要删除当前所选商品?")){
		window.location.href = "../servlet/tManageGoodsInfo?method=delete&goodsId="+goodsId+"&thirdId="+thirdId+"";
	}
}



