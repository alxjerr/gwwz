function addTypeName() {

    var typeName = document.getElementById("typeName").value;
    if (typeName == "") {
        alert("��������Ҫ��ӵ���Ʒ��������!");
        return false;
    }
}

function back() {
    window.location.href = "../servlet/ManageGoodsType?method=showManageGoodsTypePage";
}
	
