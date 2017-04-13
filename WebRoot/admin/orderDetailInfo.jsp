<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.entity.CustomerDetailInfo"%>
<%@page import="com.entity.CustomerInfo"%>
<%@page import="com.entity.OrderInfo"%>
<%@page import="com.entity.OrderGoodsInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.GoodsInfoDAO"%>
<%@page import="com.entity.GoodsInfo"%>
<%@page import="com.dao.GoodsTypeDAO"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.util.Validate"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	ArrayList<OrderGoodsInfo> orderGoodsInfoList = (ArrayList<OrderGoodsInfo>)request.getAttribute("orderGoodsInfoList");
	CustomerDetailInfo customerDetailInfo = (CustomerDetailInfo)request.getAttribute("customerDetailInfo");
	CustomerInfo customerInfo = (CustomerInfo)request.getAttribute("customerInfo");
	OrderInfo orderInfo =  (OrderInfo)request.getAttribute("orderInfo");
 %>
<html>
  <head>
    <title>订单详细信息</title>
    <script type="text/javascript" src="../js/admin/manageOrder.js" charset="gb2312"></script>
  </head>
  <body>
   	<table style="font-size:13px;" width="100%" height="390">
  <tr>
    <td colspan="6"><strong><font size="6" color="#0099FF">□</font><font color="#666666" size="3">&nbsp;订单详细信息</font></strong></td>
  </tr>
  <tr>
    <td height="15" colspan="6"><hr  width="100%" style="height: 2px;"/></td>
  </tr>
  <tr height="40px">
    <td><strong>订单编号：</strong></td>
    <td width="200" align="left"><%=orderInfo.getOrderId()%></td>
    <td><strong>订单状态：</strong></td>
    <td width="200" align="left"><%if(orderInfo.getStatus() == 0){out.println("已确认");}else{out.println("未确认");}%></td>
    <td><strong>下单时间：</strong></td>
     <%Validate v = new Validate();%>


    
    <td width="200" align="left"><%=v.datemmddtime(orderInfo.getOrderTime())%></td>
  </tr>
  <tr height="40px">
    <td><strong>客户编号：</strong></td>
    <td><%=orderInfo.getCustomerId()%></td>
    <td><strong>客户账号/编号：</strong></td>
    <td><%=customerInfo.getEmail()%></td>
    <td><strong>注册时间：</strong></td>
    <td>
	  <%%>


	
	<%=v.datemmddtime(customerInfo.getRegisterTime())%></td>
  </tr>
  <tr height="40px">
    <td><strong>收货人姓名：</strong></td>
    <td><%=customerDetailInfo.getName()%></td>
    <td><strong>固定电话：</strong></td>
    <td><%if(customerDetailInfo.getTelphone() == null){out.println("无");}else{out.println(""+customerDetailInfo.getTelphone()+"");}%></td>
    <td width="90"><strong>移动电话：</strong></td>
    <td><%if(customerDetailInfo.getMovePhone() == null){out.println("无");}else{out.println(""+customerDetailInfo.getMovePhone()+"");}%></td>
  </tr>
  <tr height="40px">
    <td><strong>收货地址：</strong></td>
    <td colspan="5"><%=customerDetailInfo.getAddress()%></td>
   </tr>
   <tr>
    <td colspan="6">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px"  bordercolor="#9999FF"> 
	      <tr height="30">
	        <td><div align="center"><font color="#666666">商品编号</font></div></td>
	        <td><div align="center"><font color="#666666">商品类别</font></div></td>
	        <td><div align="center"><font color="#666666">商品名称</font></div></td>
	        <td><div align="center"><font color="#666666">商品价格</font></div></td>
	        <td><div align="center"><font color="#666666">商品折扣</font></div></td>
	        <td><div align="center"><font color="#666666">订购数量</font></div></td>
	        <td><div align="center"><font color="#666666">小计</font></div></td>
	      </tr>
	      <%
	      		double sum = 0;
	      		DecimalFormat df = new DecimalFormat("0.00");
	      		if(orderGoodsInfoList != null){
	      			for(int i=0;i<orderGoodsInfoList.size();i++){
	      				OrderGoodsInfo orderGoodsInfo = orderGoodsInfoList.get(i);
	      				GoodsInfoDAO gdao = new GoodsInfoDAO();
	      				GoodsInfo goodsInfo = gdao.getQueryGoodsInfo(orderGoodsInfo.getGoodsId());
	      				sum += orderGoodsInfo.getQuantity()*goodsInfo.getDiscount()*goodsInfo.getPrice();
	      				String price = df.format(goodsInfo.getPrice());
	      				String discount = String.format("%.1f",goodsInfo.getDiscount());
	      				if((int)goodsInfo.getDiscount() == 10){
	      					discount = "全";
	      				}
	      				String currentSum = df.format(orderGoodsInfo.getQuantity()*goodsInfo.getDiscount()*goodsInfo.getPrice());
	      				out.println("<tr height='30'>");
	      				out.println("<td><div align='center'><font color='#666666'>"+goodsInfo.getGoodsId()+"</font></div></td>");
	      				out.println("<td><div align='center'><font color='#666666'>"+goodsInfo.getTypeDetailInfo()+"</font></div></td>");
	      				out.println("<td><div align='center'><font color='#666666'>"+goodsInfo.getGoodsName()+"</font></div></td>");
	      				out.println("<td><div align='center'><font color='#666666'>"+price+"</font></div></td>");
	      				out.println("<td><div align='center'><font color='#666666'>"+discount+"折</font></div></td>");
	      				out.println("<td><div align='center'><font color='#666666'>"+orderGoodsInfo.getQuantity()+"</font></div></td>");
	      				out.println("<td><div align='center'><font color='#666666'>"+currentSum+"</font></div></td>");
	      			}
	      		}
	       %>
	       <tr height="40">
	        <td><div align="center"><font color="#666666">总金额：</font></div></td>
	        <td colspan="6"><font color='#FF6633' size='5'><strong>￥<%=df.format(sum)%></strong></font></td>
	      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td colspan="6"><div align="left"><input type="button" value="返回" onclick="back()" style="width: 50px; height: 26px;padding-top: 3px"/></div></td>
  </tr>
</table>
  </body>
</html>
