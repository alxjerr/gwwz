function getKey(){
	var key = document.getElementById("key").value;
	if(key==""){
		alert("�����������ؼ���!");
		return false;}
	else{
		top.location.href = "../servlet/SearchProduct?key="+key+"";
		return true;
	}
}