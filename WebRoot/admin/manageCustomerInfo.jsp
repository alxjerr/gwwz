<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.entity.OrderInfo"%>
<%@page import="com.entity.CustomerDetailInfo"%>
<%@page import="com.dao.CustomerDetailInfoDAO"%>
<%@page import="com.dao.CustomerInfoDAO"%>
<%@page import="com.entity.CustomerInfo"%>
<%@page import="com.util.Validate"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户信息管理</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/admin/manageCustomerInfo.js" charset="gb2312"></script>
  </head>
  
  <body>
  <form action="../servlet/ManageCustomerInfo?method=coolMore&isCooled" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:13px;">
  <tr>
    <td width="100%" height="36"><strong><font size="6" color="#0099FF">□&nbsp;</font><font color="#666666" size="3">客户信息管理</font></strong></td>
    <td height="36"><div align="right"><input type="text" name="key"  id="key"  style="height: 24px;width: 250px;padding-top: 2px;padding-left:20px;background-image: url(../image/icon/key_search.gif);background-repeat: no-repeat"/></div></td>
    <td><input type="button" value="查询" style="height: 26px;width: 70px;padding-top: 2px" onclick="return searchCustomerInfo()"/></td>
    <td><input type="submit" value="冻结客户" style="height: 26px;width: 70px;padding-top: 2px" onclick="return coolMoreCustomerInfo()"/></td>
  </tr>
  <tr>
    <td height="40" colspan="4"><hr  width="100%"/></td>
  </tr>
  <tr>
    <td height="147" colspan="4">
    
    统计信息  客户总数：<%=request.getAttribute("sumCount")%>名，其中被冻结：<%=request.getAttribute("dongjie")%>名，正常状态：<%=request.getAttribute("zhengchang")%>名
    <table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px"  bordercolor="#9999FF"> 
      <tr height="30">
        <td width="50"><div align="center"><font color="#666666">全选</font></div></td>
        <td width="40"><div align="center"><input type="checkbox" id="checkAll" value="checkbox" onClick="selectAll()"/></div></td>
        <td><div align="center"><font color="#666666">客户编号</font></div></td>
        <td><div align="center"><font color="#666666">冻结状态</font></div></td>
        <td><div align="center"><font color="#666666">客户账户/邮箱</font></div></td>
        <td><div align="center"><font color="#666666">注册时间</font></div></td>
        <td><div align="center"><font color="#666666">收货人姓名</font></div></td>
        <td><div align="center"><font color="#666666">固定电话</font></div></td>
        <td><div align="center"><font color="#666666">移动电话</font></div></td>
        <td><div align="center"><font color="#666666">收货地址</font></div></td>
        <td  width="70"><div align="center"><font color="#666666">操作</font></div></td>
      </tr>
      <%
      	String isSearching = (String)request.getAttribute("isSearching");
      	String name = "无";
      	String telephone = "无";
      	String movePhone = "无";
      	String address = "无";
 		ArrayList<CustomerInfo> customerInfoList = (ArrayList<CustomerInfo>)request.getAttribute("customerInfoList");
 		CustomerDetailInfoDAO cddao = new CustomerDetailInfoDAO();
      	if(customerInfoList == null || customerInfoList.toString().equals("[]")){
      		out.println("<td colspan='11' height='30'><div align='center'>当前无任何客户信息!</div></td>");
      	}
      	else{
      		for(int i=0;i<customerInfoList.size();i++){
      			CustomerInfo ct = customerInfoList.get(i);
      			boolean isExist = cddao.isCustomerDetailInfo(ct.getId());
      			if(isExist == true){
      				CustomerDetailInfo customerDetailInfo = cddao.getCustomerDetailInfo(ct.getId());
      				name = customerDetailInfo.getName();
      				telephone = customerDetailInfo.getTelphone();
      				movePhone = customerDetailInfo.getMovePhone();
      				address = customerDetailInfo.getAddress();
				}
      			out.println("<tr height='30'>");
	      		out.println("<td><div align='center'>勾选</div></td>");
	      		out.println("<td><div align='center'><input id='ckb' type='checkbox' name='ckb' value='"+ct.getId()+"' /></div></td>");
	      		out.println("<td><div align='center'>"+ct.getId()+"</div></td>");
	      		if(ct.getIsCooled() == 1){
	      			out.println("<td><div align='center'><font color='#FF0000'>已被冻结</font></div></td>");
	      		}
	      		else{
	      			out.println("<td><div align='center'>未被冻结</div></td>");
	      		}
	      		out.println("<td><div align='center'>"+ct.getEmail()+"</div></td>");
				  Validate v = new Validate();


				out.println("<td><div align='center'>"+v.datemmddtime(ct.getRegisterTime())+"</div></td>");
	      		out.println("<td><div align='center'>"+name+"&nbsp;</div></td>");
	      		out.println("<td><div align='center'>"+telephone+"&nbsp;</div></td>");
	      		out.println("<td><div align='center'>"+movePhone+"&nbsp;</div></td>");
	      		out.println("<td><div align='center'>"+address+"&nbsp;</div></td>");
	      		if(PublicToolCheckParam.checkNullAndEmpty(isSearching) && customerInfoList.size() > 1){
	      			if(ct.getIsCooled() == 1){
	      				out.println("<td><div align='center'><a href='#' onclick=coolCustomerInfoOfSearching("+ct.getId()+","+ct.getIsCooled()+","+request.getAttribute("key")+")>取消冻结</a></div></td>");
	      			}
	      			else{
	      				out.println("<td><div align='center'><a href='#' onclick=coolCustomerInfoOfSearching("+ct.getId()+","+ct.getIsCooled()+","+request.getAttribute("key")+")>冻结客户</a></div></td>");
	      			}
	      		}
	      		else{
	      			if(ct.getIsCooled() == 1){
	      				out.println("<td><div align='center'><a href='#' onclick=coolCustomerInfo("+ct.getId()+","+ct.getIsCooled()+")>取消冻结</a></div></td>");
	      			}
	      			else{
	      				out.println("<td><div align='center'><a href='#' onclick=coolCustomerInfo("+ct.getId()+","+ct.getIsCooled()+")>冻结客户</a></div></td>");
	      			}
	      			
	      		}
	      		
	      		out.println("</tr>");
      		}
      	}
       %>
      <tr><td colspan="11" height="50"><div align="center">共找到<%=request.getAttribute("sumCount")%>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第<%=request.getAttribute("currentPage")%>/<%=request.getAttribute("sumPageCount")%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageCustomerInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageCustomerInfoPage");}%>&cp=<%=request.getAttribute("indexPage")%>">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageCustomerInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageCustomerInfoPage");}%>&cp=<%=request.getAttribute("upPage")%>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageCustomerInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageCustomerInfoPage");}%>&cp=<%=request.getAttribute("nextPage")%>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageCustomerInfo?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageCustomerInfoPage");}%>&cp=<%=request.getAttribute("lastPage")%>">尾页</a> </div></td></tr>
    </table>
    </td>
  </tr>
</table>
</form>
  </body>
</html>
