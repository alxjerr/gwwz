function updateCount(gid)
	{
		if(document.getElementById("gc"+gid).value == ""){
			alert("��������Ҫ�޸ĵ�����!");
			return false;
		}
		else if(document.getElementById("gc"+gid).value <= 0){
			alert("��������������0!����������!");
			document.getElementById("gc"+gid).value = "";
			return false;
		}
		var flag = false; 
		var count = document.getElementsByName("gc"+gid);
		var size = count.length; 
		var exp = /^[0-9]*[1-9][0-9]*$/;
		
		//�ж�����ļƻ���Ϊ�쳣�ַ� 
		for(var i=0;i<size;i++){ 
		    if(!exp.test(count[i].value)){ 
		    flag = true;
		    break; 
		    } 
		} 
		if(flag == true && !(document.getElementById("gc"+gid).value <= 0)){ 
			alert("��������а��������ַ�!����������!");
			document.getElementById("gc"+gid).value = "";
			return false ; 
		}
		else{
			document.frm.txtcount.value = document.getElementById("gc"+gid).value;
		 	document.frm.txtgid.value = gid;  		   		 
		 	document.frm.submit();//�ύ��
		}
	}
	