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
		