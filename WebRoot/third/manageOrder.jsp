<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>订单信息管理</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/third/manageOrder.js" charset="gb2312"></script>
  </head>
  
  <body>
  <form action="../servlet/ManageOrder?method=deleteMore" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:13px;">
  <tr>
    <td width="100%" height="36"><strong><font size="6" color="#0099FF">□&nbsp;</font><font color="#666666" size="3">订单信息管理</font></strong></td>
    <td height="36"><div align="right"><input id="key" type="text" name="key" style="height: 24px;width: 250px;padding-top: 2px;padding-left:20px;background-image: url(../image/icon/key_search.gif);background-repeat: no-repeat"/></div></td>
    <td><input type="button" value="查询" style="height: 26px;width: 70px;padding-top: 2px" onClick="return searchOrder(<%=session.getAttribute("thirdId")%>)"/></td>
    <td><input type="submit" value="删除订单" style="height: 26px;width: 70px;padding-top: 2px" onClick="return deletMoreOrder()"/></td>
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
        <td><div align="center"><font color="#666666">订单编号</font></div></td>
        <td><div align="center"><font color="#666666">订单状态</font></div></td>
        <td><div align="center"><font color="#666666">下单时间</font></div></td>
        <td><div align="center"><font color="#666666">客户账户/邮箱</font></div></td>
        <td><div align="center"><font color="#666666">收货人</font></div></td>
        <td><div align="center"><font color="#666666">固定电话</font></div></td>
        <td><div align="center"><font color="#666666">移动电话</font></div></td>
        <td><div align="center"><font color="#666666">操作</font></div></td>
      </tr>
      <%
      	String isSearching = (String)request.getAttribute("isSearching");
 		ArrayList<OrderInfo> orderInfoList = (ArrayList<OrderInfo>)request.getAttribute("orderInfoList");
 		CustomerDetailInfoDAO cddao = new CustomerDetailInfoDAO();
 		CustomerInfoDAO cdao = new CustomerInfoDAO();
      	if(orderInfoList == null || orderInfoList.toString().equals("[]")){
      		out.println("<td colspan='10' height='30'><div align='center'>当前无任何订单信息!</div></td>");
      	}
      	else{
      		for(int i=0;i<orderInfoList.size();i++){
      			OrderInfo od = orderInfoList.get(i);
      			CustomerDetailInfo customerDetailInfo = cddao.getCustomerDetailInfo(od.getCustomerId());
      			CustomerInfo customerInfo = cdao.getCustomerInfo(customerDetailInfo.getCustomerId());
      			out.println("<tr height='30'>");
	      		out.println("<td><div align='center'>勾选</div></td>");
	      		out.println("<td><div align='center'><input id='ckb' type='checkbox' name='ckb' value='"+od.getOrderId()+"' /></div></td>");
	      		out.println("<td><div align='center'>"+od.getOrderId()+"</div></td>");
	      		if(od.getStatus() == 0){
	      			out.println("<td><div align='center'><font color='#FF0000'>未确认</font></div></td>");
	      		}
	      		else if(od.getStatus() == 1){
	      			out.println("<td><div align='center'>已确认</div></td>");
	      		}
	      		else if(od.getStatus() == 100){
	      			out.println("<td><div align='center'>确认收货</div></td>");
	      		}
	      		else if(od.getStatus() == 101){
	      			out.println("<td><div align='center'>退货</div></td>");
	      		}
	        Validate v = new Validate();
  
		out.println("<td><div align='center'>"+v.datemmddtime(od.getOrderTime())+"</div></td>");
	      		out.println("<td><div align='center'>"+customerInfo.getEmail()+"</div></td>");
	      		out.println("<td><div align='center'>"+customerDetailInfo.getName()+"</div></td>");
	      		out.println("<td><div align='center'>"+customerDetailInfo.getTelphone()+"</div></td>");
	      		out.println("<td><div align='center'>"+customerDetailInfo.getMovePhone()+"</div></td>");
	      		if(PublicToolCheckParam.checkNullAndEmpty(isSearching) && orderInfoList.size() > 1){
	      			if(od.getStatus() == 0){
	      				out.println("<td><div align='center'><a href='#' onclick=confirmOrderOfSearching("+od.getOrderId()+","+od.getStatus()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>确认订单</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showDetail&orderId="+od.getOrderId()+"'  target='_blank'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrderOfSearching("+od.getOrderId()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      			}
	      			else if(od.getStatus() == 1){
	      				//out.println("<td><div align='center'><a href='#' onclick=confirmOrderOfSearching("+od.getOrderId()+","+od.getStatus()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>取消确认</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showDetail&orderId="+od.getOrderId()+"' target='_blank'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrderOfSearching("+od.getOrderId()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      				out.println("<td><div align='center'><a href='#' onclick=confirmOrderOfSearching("+od.getOrderId()+","+od.getStatus()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>取消确认</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showaddwuliu&orderId="+od.getOrderId()+"&thirdId="+session.getAttribute("thirdId")+"'>管理物流信息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/ManageOrder?method=showDetail&orderId="+od.getOrderId()+"'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrderOfSearching("+od.getOrderId()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      			}
	      			else if(od.getStatus() == 100){
	      				//out.println("<td><div align='center'><a href='#' onclick=confirmOrderOfSearching("+od.getOrderId()+","+od.getStatus()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>取消确认</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showDetail&orderId="+od.getOrderId()+"' target='_blank'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrderOfSearching("+od.getOrderId()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      				out.println("<td><div align='center'>确认收货&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/ManageOrder?method=showDetail&orderId="+od.getOrderId()+"'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrderOfSearching("+od.getOrderId()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      			}
	      			else if(od.getStatus() == 101){
	      				//out.println("<td><div align='center'><a href='#' onclick=confirmOrderOfSearching("+od.getOrderId()+","+od.getStatus()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>取消确认</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showDetail&orderId="+od.getOrderId()+"' target='_blank'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrderOfSearching("+od.getOrderId()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      				out.println("<td><div align='center'>退货&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/ManageOrder?method=showDetail&orderId="+od.getOrderId()+"'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrderOfSearching("+od.getOrderId()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      			}
	      			
	      		}
	      		else{
		      		if(od.getStatus() == 0){
		      			out.println("<td><div align='center'><a href='#' onclick=confirmOrder("+od.getOrderId()+","+od.getStatus()+","+session.getAttribute("thirdId")+")>确认订单</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showDetail&orderId="+od.getOrderId()+"' target='_blank'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrder("+od.getOrderId()+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
		      		}
	      			else if(od.getStatus() == 1){
	      				out.println("<td><div align='center'><a href='#' onclick=confirmOrder("+od.getOrderId()+","+od.getStatus()+","+session.getAttribute("thirdId")+")>取消确认</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showaddwuliu&orderId="+od.getOrderId()+"&thirdId="+session.getAttribute("thirdId")+"'>管理物流信息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showDetail&orderId="+od.getOrderId()+"' target='_blank'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrder("+od.getOrderId()+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      			}
	      			else if(od.getStatus() == 100){
	      				out.println("<td><div align='center'>确认收货&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showDetail&orderId="+od.getOrderId()+"' target='_blank'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrder("+od.getOrderId()+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      			}
	      			else if(od.getStatus() == 101){
	      				out.println("<td><div align='center'>退货&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/tManageOrder?method=showDetail&orderId="+od.getOrderId()+"' target='_blank'>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteOrder("+od.getOrderId()+","+session.getAttribute("thirdId")+")>删除</a></div></td>");
	      			}
	      		}
	      		
	      		out.println("</tr>");
      		}
      	}
       %>
      <tr><td colspan="10" height="50"><div align="center">共找到<%=request.getAttribute("sumCount")%>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第<%=request.getAttribute("currentPage")%>/<%=request.getAttribute("sumPageCount")%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageOrder?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageOrderPage");}%>&cp=<%=request.getAttribute("indexPage")%>">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageOrder?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageOrderPage");}%>&cp=<%=request.getAttribute("upPage")%>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageOrder?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageOrderPage");}%>&cp=<%=request.getAttribute("nextPage")%>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageOrder?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageOrderPage");}%>&cp=<%=request.getAttribute("lastPage")%>">尾页</a> </div></td></tr>
    </table>
    </td>
  </tr>
</table>
</form>
  </body>
</html>
