//����XMLHttp����
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
		//�����������ݶ���
		function sendRequest(orderId){
			var serviceAssessment = document.getElementById("serviceAssessment").value;
			if(serviceAssessment == ""){
				alert("�����������������!");
				return false;
			}
			else{
				var isInsert = "insert";
				var method = "showOrderInfo";
				if(xmlHttp == null){
					createXMLHttpRequest();
				}		
				//�����첽����,GET����
				xmlHttp.open("POST","../servlet/OrderInfo",true);
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlHttp.send("isInsert="+isInsert+"&method="+method+"&serviceAssessment="+serviceAssessment+"&orderId="+orderId);
				document.getElementById("serviceAssessment").value = "";
				xmlHttp.onreadystatechange = callback;
				return true;
			}
		}
		
		function callback(){
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				var serviceAssessmentTable = document.getElementById("serviceAssessmentTable");
				serviceAssessmentTable.innerHTML = xmlHttp.responseText;
			}		
		}