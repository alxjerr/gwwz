<%@ page language="java" pageEncoding="utf-8" import="java.util.ArrayList,com.entity.GoodsInfo,com.entity.CustomerInfo,com.entity.CustomerDetailInfo,java.text.DecimalFormat"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.util.PublicToolGetGoodsTypeName"%>
<%@page import="com.util.Validate"%>

<%
	CustomerInfo customerInfo = (CustomerInfo)request.getAttribute("customerInfoList");
	CustomerDetailInfo customerDetailInfo = (CustomerDetailInfo)request.getAttribute("customerDetailInfoList");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>配送信息确认</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    	<script type="text/javascript" src="../js/web/confirmSendInfo.js" charset="gb2312"></script>
  </head>
  
  <body>
  <iframe src="../web/top.jsp" width="100%" height="170" frameborder="0"></iframe>
  <table border="0" cellspacing="0" cellpadding="0"  width='960px' align="center">
  <tr height="60">
    <td><font size="2" color="#999999">您现在所在位置：<a href="../">网站首页</a>&gt; <a href="../web/cart.jsp">购物车</a>&gt; <a href="../web/sendInfo.jsp">填写配送信息</a>&gt; 订单确认</font></td>
  </tr>
</table>
<table  width='960px' align="center"><tr>
  <td><font color="#666666"><strong>购物订单确认表</strong></font></td></tr></table>
<table height="220" cellpadding="0" cellspacing="0" bordercolor="#999999" border="1"  style="border:1px; font-size:13px;"  width='960px' align="center">
  <tr>
    <td height="32" bgcolor="#9999FF"><img src="../image/icon/item.gif" width="12" height="12" /><strong>客户信息</strong></td>
  </tr>
  <tr>
    <td><div align="center">
	<table width="895" height="140" cellpadding="0" cellspacing="0"  bordercolor="#9999FF" border="1">
      <tr>
        <td width="112"><font color="#666666">客户编号</font></td>
        <td width="350"><font color="#666666"><%=customerInfo.getId()%></font></td>
        <td width="83"><font color="#666666">注册时间</font></td>
       
       	 <% Validate v= new Validate();%>
      	
        <td width="340"><font color="#666666"><%=v.datemmddtime(customerInfo.getRegisterTime())%></font></td>
      </tr>
      <tr>
        <td><font color="#666666">客户帐号/邮箱</font></td>
        <td><font color="#666666"><%=customerInfo.getEmail()%></font></td>
        <td><font color="#666666">收货人姓名</font></td>
        <td><font color="#666666"><%=customerDetailInfo.getName()%></font></td>
      </tr>
      <tr>
        <td><font color="#666666">固定电话</font></td>
        <td><font color="#666666">
        <% 
        	if(customerDetailInfo.getTelphone() != null){
        		out.println(customerDetailInfo.getTelphone());
        	}
        	else{
        		out.println("无");
        	}
        %>
        </font></td>
        <td><font color="#666666">移动电话</font></td>
        <td><font color="#666666">
        <% 
        	if(customerDetailInfo.getMovePhone() != null){
        		out.println(customerDetailInfo.getMovePhone());
        	}
        	else{
        		out.println("无");
        	}
        %>
        </font></td>
      </tr>
      <tr>
        <td><font color="#666666">收货地址</font></td>
        <td colspan="3"><font color="#666666"><%=customerDetailInfo.getAddress()%></font></td>
        </tr>
    </table>
    </div></td>
  </tr>
</table>
<br />
<table  height="200" cellpadding="0" cellspacing="0" bordercolor="#999999" border="1" style="border:1px;font-size:13px;"  width='960px' align="center">
  <tr>
    <td height="32" bgcolor="#9999FF"><img src="../image/icon/item.gif" width="12" height="12" /><strong>订单信息</strong></td>
  </tr>
 <tr><td colspan="7" height="25" style="border-bottom: none;"></td></tr>
  <tr>
    <td style="border-top: none;border-bottom: none"><div align="center">
      <table width="895" height="160" cellpadding="0" cellspacing="0"  bordercolor="#9999FF" border="1">
        <tr>
          <td width="58" height="30"><font color="#666666">编号</font></td>
          <td colspan="2"><font color="#666666">商品名称</font></td>
          <td width="121"><font color="#666666">商品类型</font></td>
          <td width="95"><font color="#666666">价格</font></td>
          <td width="75"><font color="#666666">折扣</font></td>
          <td width="70"><font color="#666666">数量</font></td>
          <td width="95"><font color="#666666">小计</font></td>
        </tr>
        
        	<%
        		DecimalFormat df = new DecimalFormat("0.00");
        		float sumFee = 0;
        		ArrayList<GoodsInfo> shopList = (ArrayList<GoodsInfo>)session.getAttribute("shopList");
        		for(int i=0;i<shopList.size();i++){
        			GoodsInfo gd = shopList.get(i);
        			sumFee += gd.getCount()*gd.getDiscountPrice();
        			String prePrice = df.format(gd.getPrice());
        			String sum = df.format(gd.getCount()*gd.getDiscountPrice());
        			String discout = String.format("%.1f",gd.getDiscount());
        			if((int)gd.getDiscount() == 10){
        				discout = "全";
        			}
        			out.println("<tr>");
        			out.println("<td><font color='#666666'>"+gd.getGoodsId()+"</font></td>");
        			if(PublicToolCheckParam.checkNullAndEmpty(gd.getPhoto())){
        				out.println("<td width='87' style='border-right:none'><img src='../"+gd.getPhoto()+"' width='60' height='60' /></td>");
        			}
        			else{
        				out.println("<td width='87' height='60' style='border-right:none'><div align='center'><font color='#FF6699' size='2'>图片暂无</font></div></td>");
        			} 
        			out.println("<td width='276' style='border-left:none'><div align='left'><font color='#666666'>"+gd.getGoodsName()+"</font></div></td>");
        			out.println("<td><font color='#666666'>"+gd.getTypeDetailInfo()+"</font></td>");
        			out.println("<td><font color='#666666'>"+prePrice+"</font></td>"); 
        			out.println("<td><font color='#666666'>"+discout+"折</font></td>");
        			out.println("<td><font color='#666666'>"+gd.getCount()+"</font></td>");
        			out.println("<td><font color='#666666'>"+sum+"</font></td>");
        			out.println("</tr>");
        		}
        		String str_sumFee= df.format(sumFee);
        	 %>
        <tr>
          <td colspan="8" height="45"><div align="left"><font color="#666666">&nbsp;&nbsp;此订单中共有<font size="5" color="#FF6600"><strong><%=shopList.size()%></strong></font>件商品，总计金额<font size="5" color="#FF6600"><strong><%=str_sumFee%></strong></font>元！</font></div></td>
          </tr>
      </table>
    </div>
    </td>
  </tr>
  <tr><td colspan="7" height="25" style="border-top: none;"></td></tr>
</table>
<br />
<table height="35" border="0" cellpadding="0" cellspacing="0"  width='960px' align="center">
  <tr>
    <td><input type="button" value="确认订单" onclick="submitConfirmSendInfo()" style="width:80px; height:30px;padding-top: 3px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返  回" onclick="back()" style="width:80px; height:30px;padding-top: 3px"/></td>
  </tr>
</table>
<br/>
  <div id="footer"  style="height:60px; background-color:#369;clear:both; ">
  <p style="text-align: center;	padding-top:20px;	color:#FFF"> <a href="../servlet/About"  ><font color="#FFFFFF">网站简介</font></a>   <a href="../servlet/Contact" ><font color="#FFFFFF">联系我们</a></font> </p>
</div>

  </body>
</html>
