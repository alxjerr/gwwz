var xmlHttp = null;
var responseMSG = null;
    	//����XMLHttp����
    	function createXMLHttpRequest(){
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}
			else{
				try{
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				}catch(e){
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
		}
		//�����������ݶ���
		function sendRequest(){
	 		var goodsTypeId = document.getElementById("goodsTypeId").value;
			if(xmlHttp==null){
				createXMLHttpRequest();
			}
			//�����첽����,POST����
			xmlHttp.open("POST","../servlet/ManageGoodsInfo?method=getTypeDetailInfo",true);
			//ָ��һ��HTTP��ͷ
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlHttp.onreadystatechange = callback;
			//���õ���������Ϣ���뵽AjaxDoInput.javaȥ����
			xmlHttp.send("goodsTypeId="+goodsTypeId);
		}
		
		function callback(){
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				var typeContent = xmlHttp.responseText; //��ȡ���������ص�ֵ
				var values = typeContent.split("|");
				var select = document.getElementById("typeDetailInfo");
				//����������б��е�ֵ,��ʾ�ӷ�����
				select.options.length = 0;//���
				for(var i=0;i<values.length-1;i++){
					var valuesx =values[i].split(",");
					select.options.add(new Option(valuesx[0],valuesx[1]));			
		  }	
			}
		}
		
		
function checkGoodsInfo(){
	var flag1 = false; 
	var flag2 = false;
	var price = document.getElementsByName("price");
	var discount = document.getElementsByName("discount");
	var size1 = price.length; 
	var size2 = discount.length;
	var exp1 = /^\d+(\.{0,1}\d+){0,1}$/;
	
	//�ж�����ļƻ���Ϊ�쳣�ַ� 
	for(var i=0;i<size1;i++){ 
	    if(!exp1.test(price[i].value)){ 
	    flag1 = true;
	    break; 
	    } 
	} 
	
	for(var i=0;i<size2;i++){ 
	    if(!exp1.test(discount[i].value)){ 
	    flag2 = true;
	    break; 
	    } 
	} 
	
	var flag3 = false; 
	var countRequire = document.getElementsByName("countRequire");
	var size3 = countRequire.length; 
	var exp2 = /^[0-9]*[1-9][0-9]*$/;
	
	//�ж�����ļƻ���Ϊ�쳣�ַ� 
	for(var i=0;i<size3;i++){ 
	    if(!exp2.test(countRequire[i].value)){ 
	    flag3 = true;
	    break; 
	    } 
	} 
	
	if(document.getElementById("goodsName").value == ""){
		alert("��������Ʒ����!");
		return false;
	}
	else if(document.getElementById("price").value == ""){
		alert("��������Ʒ�۸�!");
		return false;
	}
	else if(flag1 == true){ 
		alert("����ļ۸��а��������ַ�!����������!");
		document.getElementById("price").value = "";
		return false ; 
	}
	else if(flag2 == true &&  document.getElementById("discount").value != ""){ 
		alert("������ۿ��а��������ַ�!����������!");
		document.getElementById("discount").value = "";
		return false ; 
	}
	else if(document.getElementById("discount").value != "" && (document.getElementById("discount").value >10 || document.getElementById("discount").value <1)){
		alert("��������Ϊ1��10��!����������!")
		return false;
	}
	else if(document.getElementById("countRequire").value == ""){
		alert("����������!");
		return false;
	}
	else if(flag3 == true){
		alert("������������а��������ַ�!����������!");
		document.getElementById("countRequire").value = "";
		return false;
	}
	
}



function back(){

	window.location.href = "../servlet/ManageGoodsInfo?method=showManageGoodsInfoPage";
	}
	