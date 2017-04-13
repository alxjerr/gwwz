<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.entity.OrderInfo"%>
<%@page import="com.dao.ThirdInfoDAO"%>
<%@page import="com.entity.ThirdInfo"%>
<%@page import="com.util.Validate"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商户信息管理</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/third/manageThirdInfo.js" charset="gb2312"></script>
  </head>
  
  <body>
  <form action="../servlet/ManageThirdInfo?method=coolMore&isCooled" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:13px;">
  <tr>
    <td width="100%" height="36"><strong><font size="6" color="#0099FF">□&nbsp;</font><font color="#666666" size="3">商户信息管理</font></strong></td>
    <td height="36"><div align="right"><input type="text" name="key" style="height: 24px;width: 250px;padding-top: 2px;padding-left:20px;background-image: url(../image/icon/key_search.gif);background-repeat: no-repeat"/></div></td>
    <td><input type="button" value="查询" style="height: 26px;width: 70px;padding-top: 2px" onClick="return searchThirdInfo()"/></td>
    <td><input type="submit" value="商户取消审核" style="height: 26px;width: 70px;padding-top: 2px" onClick="return coolMoreThirdInfo()"/></td>
  </tr>
  <tr>
    <td height="40" colspan="4"><hr  width="100%"/></td>
  </tr>
  <tr>
    <td height="147" colspan="4">
    <table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px"  bordercolor="#9999FF"> 
      <tr height="30">
        <td width="50"><div align="center"><font color="#666666">全选</font></div></td>
        <td width="40"><div align="center"><input type="checkbox" id="checkAll" value="checkbox" onClick="selectAll()"/></div></td>
        <td><div align="center"><font color="#666666">商户编号</font></div></td>
        <td><div align="center"><font color="#666666">审核状态</font></div></td>
        <td><div align="center"><font color="#666666">商户账户/邮箱</font></div></td>
        <td><div align="center"><font color="#666666">注册时间</font></div></td>
        <td><div align="center"><font color="#666666">商户名称</font></div></td>
        <td><div align="center"><font color="#666666">联系电话</font></div></td>
        <td><div align="center"><font color="#666666">联系地址</font></div></td>
        <td  width="70"><div align="center"><font color="#666666">操作</font></div></td>
      </tr>
      <%
      	String isSearching = (String)request.getAttribute("isSearching");
      	String name = "无";
      	String telephone = "无";
      	String movePhone = "无";
      	String address = "无";
 		ArrayList<ThirdInfo> ThirdInfoList = (ArrayList<ThirdInfo>)request.getAttribute("ThirdInfoList");
 		//ThirdDetailInfoDAO cddao = new ThirdDetailInfoDAO();
      	if(ThirdInfoList == null || ThirdInfoList.toString().equals("[]")){
      		out.println("<td colspan='11' height='30'><div align='center'>当前无任何商户信息!</div></td>");
      	}
      	else{
      		for(int i=0;i<ThirdInfoList.size();i++){
      			ThirdInfo ct = ThirdInfoList.get(i);
      		//	boolean isExist = cddao.isThirdDetailInfo(ct.getId());
      		//	if(isExist == true){
      			//	ThirdDetailInfo ThirdDetailInfo = cddao.getThirdDetailInfo(ct.getId());
      				
			//	}
      			out.println("<tr height='30'>");
	      		out.println("<td><div align='center'>勾选</div></td>");
	      		out.println("<td><div align='center'><input id='ckb' type='checkbox' name='ckb' value='"+ct.getId()+"' /></div></td>");
	      		out.println("<td><div align='center'>"+ct.getId()+"</div></td>");
	      		if(ct.getIsCooled() == 1){
	      			out.println("<td><div align='center'><font color='#FF0000'>未审核</font></div></td>");
	      		}
	      		else{
	      			out.println("<td><div align='center'>已审核</div></td>");
	      		}
	      		out.println("<td><div align='center'>"+ct.getEmail()+"</div></td>");
	      		Validate v = new Validate();


    
				
				out.println("<td><div align='center'>"+v.datemmddtime(ct.getRegisterTime())+"</div></td>");
	      		out.println("<td><div align='center'>"+ct.getthirdName()+"</div></td>");
	      		out.println("<td><div align='center'>"+ct.getPhone()+"</div></td>");
	      		out.println("<td><div align='center'>"+ct.getAddress()+"</div></td>");
	      		if(PublicToolCheckParam.checkNullAndEmpty(isSearching) && ThirdInfoList.size() > 1){
	      			if(ct.getIsCooled() == 1){
	      				out.println("<td><div align='center'><a href='#' onclick=coolThirdInfoOfSearching("+ct.getId()+","+ct.getIsCooled()+","+request.getAttribute("key")+")>取消审核</a></div></td>");
	      			}
	      			else{
	      				out.println("<td><div align='center'><a href='#' onclick=coolThirdInfoOfSearching("+ct.getId()+","+ct.getIsCooled()+","+request.getAttribute("key")+")>审核通过</a></div></td>");
	      			}
	      		}
	      		else{
	      			if(ct.getIsCooled() == 1){
	      				out.println("<td><div align='center'><a href='#' onclick=coolThirdInfo("+ct.getId()+","+ct.getIsCooled()+")>审核通过 </a></div></td>");
	      			}
	      			else{
	      				out.println("<td><div align='center'><a href='#' onclick=coolThirdInfo("+ct.getId()+","+ct.getIsCooled()+")>取消审核</a></div></td>");
	      			}
	      			
	      		}
	      		
	      		out.println("</tr>");
      		}
      	}
       %>
      <tr><td colspan="11" height="50"><div align="center">共找到<%=request.getAttribute("sumCount")%>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第<%=request.getAttribute("currentPage")%>/<%=request.getAttribute("sumPageCount")%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageThirdInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageThirdInfoPage");}%>&cp=<%=request.getAttribute("indexPage")%>">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageThirdInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageThirdInfoPage");}%>&cp=<%=request.getAttribute("upPage")%>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageThirdInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageThirdInfoPage");}%>&cp=<%=request.getAttribute("nextPage")%>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageThirdInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageThirdInfoPage");}%>&cp=<%=request.getAttribute("lastPage")%>">尾页</a> </div></td></tr>
    </table>
    </td>
  </tr>
</table>
</form>
  </body>
</html>
