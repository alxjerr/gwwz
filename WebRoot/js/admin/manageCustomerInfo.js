function coolMoreCustomerInfo(){
	var ckb = document.getElementsByName("ckb");
	var flag = 0;
	var i;
	if(ckb.length == 0){
		alert("��ǰ���κοͻ���Ϣ!");
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
		if(confirm("��ȷ��Ҫ���ᵱǰ��ѡ�ͻ�?")){
			return true;
		}
		return false;
		
	}
	else{
		alert("��ѡ����Ҫ����Ŀͻ�!");
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



function searchCustomerInfo(){
	var key = document.getElementById("key").value;
	if(key == ""){
		alert("�������ѯ�ؼ���!");
		return false;
	}
	else{
		window.location.href = "../servlet/ManageCustomerInfo?method=search&key="+key+"";
		return true;
	}
}

function coolCustomerInfoOfSearching(customerId,isCooled,key){
	if(isCooled == "0"){
		if(confirm("��ȷ��Ҫ���ᵱǰ��ѡ�ͻ�?")){
			window.location.href = "../servlet/ManageCustomerInfo?method=cool&customerId="+customerId+"&isCooled="+isCooled+"&isSearching=yes&key="+key+"";
		}
	}
	else{
		if(confirm("��ȷ��Ҫ���ǰ��ѡ�ͻ�?")){
			window.location.href = "../servlet/ManageCustomerInfo?method=cool&customerId="+customerId+"&isCooled="+isCooled+"&isSearching=yes&key="+key+"";
		}
	}
}

function coolCustomerInfo(customerId,isCooled){
	if(isCooled == "0"){
		if(confirm("��ȷ��Ҫ���ᵱǰ��ѡ�ͻ�?")){
			window.location.href = "../servlet/ManageCustomerInfo?method=cool&customerId="+customerId+"&isCooled="+isCooled+"";
		}
	}
	else{
		if(confirm("��ȷ��Ҫ���ǰ��ѡ�ͻ�?")){
			window.location.href = "../servlet/ManageCustomerInfo?method=cool&customerId="+customerId+"&isCooled="+isCooled+"";
		}
	}
}




function back(){

	window.location.href = "../servlet/ManageCustomerInfo?method=showManageCustomerInfoPage";
	}
	
	