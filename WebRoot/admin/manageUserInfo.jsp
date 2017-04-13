<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@page import="com.entity.BulletinInfo"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.entity.UserInfo"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>系统用户信息管理</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" charset="gb2312">
    
    function showAddUserInfoPage(){
	window.location.href = "../servlet/UpdateUserInfo?method=showAddUserInfoPage";
}
function deleteUserInfo(Id){
	if(confirm("您确定要删除当前所选信息?")){
		window.location.href = "../servlet/UpdateUserInfo?method=delete&Id="+Id+"";
	}
}

    </script>
  </head>
  
  <body>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:13px;">
  <tr>
    <td width="100%" height="36"><strong><font size="6" color="#0099FF">□&nbsp;</font><font color="#666666" size="3">系统用户信息管理</font></strong></td>
    <td><input type="button" value="添加用户" style="height: 26px;width: 70px;padding-top: 2px" onClick="showAddUserInfoPage()"/></td>
 
 </tr>
  <tr>
    <td height="40" colspan="5"><hr  width="100%"/></td>
  </tr>
  <tr>
    <td height="147" colspan="12">
    <%
    		String error = (String)request.getAttribute("error");
    		if(error != null){
    			out.println("<font color='#FF0000' size='2'>"+error+"</font>");
    		}
    	 %>
    <table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px"  bordercolor="#9999FF"> 
      <tr height="30">
        <td width="55"><div align="center"><font color="#666666">用户编号</font></div></td>
        <td ><div align="center"><font color="#666666">用户类别</font></div></td>
        <td><div align="center"><font color="#666666">用户登录名称</font></div></td>
        <td ><div align="center"><font color="#666666">操作</font></div></td>
      </tr>
      <%
      	
      	
      	
      	
      	
      	String isSearching = (String)request.getAttribute("isSearching");
 		ArrayList<UserInfo> userInfoList = (ArrayList<UserInfo>)request.getAttribute("userInfoList");
      	if(userInfoList == null || userInfoList.toString().equals("[]")){
      		out.println("<td colspan='12' height='30'><div align='center'>当前无任何信息!</div></td>");
      	}
      	else{
      		//DecimalFormat df = new DecimalFormat("0.00");
      		for(int i=0;i<userInfoList.size();i++){
      			UserInfo ui = userInfoList.get(i);
      			String userName = ui.getUserName();
      			
      			
      			
      			String role = "系统管理员";
      			if(ui.getRole() == 1){
      				role = "普通操作员";
      			}
      		
      			out.println("<tr height='30'>");
	      		out.println("<td><div align='center'>"+ui.getId()+"</div></td>");
	      		out.println("<td><div align='center'>"+role+"</div></td>");
	      		out.println("<td><div align='center'>"+userName+"</div></td>");
	      		
	      		
				
	      		out.println("<td><div align='center'>");
				
				%>
                
                 <form action="../servlet/UpdateUserInfo?method=edituserInfo" name="formAdd" method="post">
						  <input type="button" value="删除" onclick='deleteUserInfo(<%=ui.getId()%>)'/>   
						    <input type="hidden" name="username" value="<%=userName%>"/>
						    <input type="hidden" name="userrole" value="<%=ui.getRole()%>"/>
						     <input type="hidden" name="Id" value="<%=ui.getId()%>"/>
						     <input type="submit"  value="修改"/>
						</form>
                <%
				//out.println("<a href='../servlet/UpdateUserInfo?method=edituserInfo&Id="+ui.getId()+"'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteUserInfo("+ui.getId()+")>删除</a>");
	      		out.println("</div></td></tr>");
      		}
      	}
       %>
      <tr><td colspan="13" height="50"><div align="center">共找到<%=request.getAttribute("sumCount")%>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第<%=request.getAttribute("currentPage")%>/<%=request.getAttribute("sumPageCount")%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageGoodsInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsInfoPage");}%>&cp=<%=request.getAttribute("indexPage")%>">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageGoodsInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsInfoPage");}%>&cp=<%=request.getAttribute("upPage")%>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageGoodsInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsInfoPage");}%>&cp=<%=request.getAttribute("nextPage")%>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageGoodsInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsInfoPage");}%>&cp=<%=request.getAttribute("lastPage")%>">尾页</a> </div></td></tr>
    </table>
    </td>
  </tr>
</table>
</form>
  </body>
</html>
