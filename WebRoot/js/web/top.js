function getKey(){
	var key = document.getElementById("key").value;
	if(key==""){
		alert("ÇëÊäÈëËÑË÷¹Ø¼ü×Ö!");
		return false;}
	else{
		top.location.href = "../servlet/SearchProduct?key="+key+"";
		return true;
	}
}