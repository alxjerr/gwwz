var xmlHttp = null;
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

		
	<!--ʣ��������ʾ�͹��������жϲ��ܳ���ʣ������-->
function getCount(countRequire){
	var goodsCount = document.getElementById("count").value;
	if(goodsCount == ""){
		alert("��������Ҫ���������!");
		return false;
	}
	else if(goodsCount <= 0){
		alert("��������������0!����������!");
		document.getElementById("count").value = "";
		return false;
	}
	else if(goodsCount > countRequire){
		alert("����������ܴ�����Ʒ����!");
		document.getElementById("count").value = "";
		return false;
	}
	var flag = false; 
	var count = document.getElementsByName("count");
	var size = count.length; 
	var exp = /^[0-9]*[1-9][0-9]*$/;
	
	//�ж�����ļƻ���Ϊ�쳣�ַ� 
	for(var i=0;i<size;i++) { 
	    if(!exp.test(count[i].value)){ 
	    	flag = true; 
	    	break; 
	    } 
	} 
	if(flag == true && !(document.getElementById("count").value <= 0)){ 
		alert("��������а��������ַ�!����������!");
		document.getElementById("count").value = "";
		return false ; 
	}
}

