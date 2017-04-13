<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.entity.OrderGoodsInfo"%>
<%@page import="com.dao.GoodsInfoDAO"%>
<%@page import="com.entity.GoodsInfo"%>
<%@page import="com.entity.OrderDetailInfo"%>
<%@page import="com.entity.ServiceAssessment"%>
<%@page import="com.util.Validate"%>
<%
	String orderId = (String)request.getAttribute("orderId");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>订单信息</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/web/cart.js" charset="gb2312"></script>
     <script type="text/javascript" src="../js/web/orderinfo.js" charset="gb2312"></script>
 </head>
  
  <body>
  <iframe src="../web/top.jsp" width="100%" height="170" frameborder="0"></iframe>
  <table border="0" cellspacing="0" cellpadding="0"  width='960px' align="center">
  <tr height="60">
    <td><font size="2" color="#999999">您现在所在位置：<a href="../" target="_top">网站首页</a>&gt; <a href="../servlet/DoMethod?method=showMyInformation" target="_top">我的信息</a>&gt; 查看订单信息</font></td>
  </tr>
</table>
    <table  width='960px' align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#9999FF" style="font-size:13px;">
  <tr bgcolor="#CCFFFF">
    <td height="25" colspan="2"><div align="center">商品名称</div></td>
    <td width="99"><div align="center">商品类型</div></td>
    <td width="101"><div align="center">价格</div></td>
    <td width="80"><div align="center">折扣</div></td>
    <td width="122"><div align="center">数量</div></td>
    <td width="143"><div align="center">小计</div></td>
  </tr>
   <%
   		ArrayList<OrderGoodsInfo> orderList =(ArrayList<OrderGoodsInfo>) request.getAttribute("orderList");
   		DecimalFormat df = new DecimalFormat("0.00");
   		GoodsInfoDAO gdao = new GoodsInfoDAO();
   		double sumFee = 0;
   		for(int i=0;i<orderList.size();i++){
   			OrderGoodsInfo orderInfo = orderList.get(i);
   			int goodsId = orderInfo.getGoodsId();
   			GoodsInfo goodsInfo = gdao.getQueryGoodsInfo(goodsId);
   			String price = df.format(goodsInfo.getPrice());
   			sumFee += goodsInfo.getDiscountPrice()*orderInfo.getQuantity();
   			String sum = df.format(goodsInfo.getDiscountPrice()*orderInfo.getQuantity());
   			String discout = String.format("%.1f",goodsInfo.getDiscount());
   			if((int)goodsInfo.getDiscount() == 10){
   				discout = "全";
   			}
   			out.println("<tr>");
   			if(PublicToolCheckParam.checkNullAndEmpty(goodsInfo.getPhoto())){
   				out.println("<td style='border-right:none'><img src='../"+goodsInfo.getPhoto()+"' width='50' height='50'/></td>");
   			}
   			else{
   				out.println("<td style='border-right:none' width='50' height='50'/><div align='center'><font color='#FF6699'>暂无</font></div></td>");
   			}
   			out.println("<td width='400' style='border-left:none'>"+goodsInfo.getGoodsName()+"</td>");
   			out.println("<td><div align='center'>"+goodsInfo.getTypeDetailInfo()+"</div></td>");
   			out.println("<td><div align='center'>"+price+"元</div></td>");
   			out.println("<td><div align='center'>"+discout+"折</div></td>");
   			out.println("<td><div align='center'>"+orderInfo.getQuantity()+"</div></td>");
   			out.println("<td><div align='center'>"+sum+"元</div></td>");
     		out.println("</tr>");        
   		}
       %>     
</table>
<table height="82" style="font-size:13px; "  width='960px' align="center">
	<tr>
		<%
			String str_sum = df.format(sumFee);
			out.println("<td>商品金额总计：<font color='#FF6633' size='5'><strong>￥"+str_sum+"</strong></font></td>");
		 %>
	</tr>
	
    <tr><td>
    
    
     <p>&nbsp;</p>
  <table style="font-size:13px;" width="100%" height="168">
    <tr>
      <td width="690" height="43"><strong><font size="6" color="#0099FF">□</font><font color="#666666" size="3">&nbsp;订单物流信息</font></strong></td>
    </tr>
    <tr>
      <td height="15"><hr  width="100%" style="height: 2px;"/></td>
    </tr>
    <tr>
      <td height="100"><table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px; text-align: center;"  bordercolor="#9999FF">
        <% 		
Validate v = new Validate();
	ArrayList<OrderDetailInfo> orderWuliuInfoList = (ArrayList<OrderDetailInfo>)request.getAttribute("orderWuliuInfoList");

	      		if(orderWuliuInfoList != null){
					%>
					
        <tr height="30">
          <td><div align="center"><font color="#666666">操作日期</font></div></td>
          <td><div align="center"><font color="#666666">物流信息</font></div></td>
        </tr>
					<%
	      			for(int i=0;i<orderWuliuInfoList.size();i++){
      			OrderDetailInfo wd = orderWuliuInfoList.get(i);
	      				out.println("<tr height='30'>");
	      				out.println("<td><div align='center'><font color='#666666'>"+v.datemmdd(wd.getaddtime())+"</font></div></td>");
	      				out.println("<td><div><font color='#666666'>"+wd.getremark()+"</font></div></td>");
	      				out.println("</tr>");
	      			}
	      		}else{
	       %>
        <tr height="40">
          <td colspan="2"><font color='#FF6633' size='5'><strong>未添加物流信息</strong></font></td>
        </tr><%}%>
      </table></td>
    </tr>
  </table>
    
    
    
    
    </td></tr>
    
    <%
	    		ArrayList<ServiceAssessment> serviceAssessmentList = (ArrayList<ServiceAssessment>)request.getAttribute("serviceAssessmentList");

	out.println("<tr><td height='40' style='padding-left:20px'><font color='#666666'><strong>历史服务评价记录：</strong></font></td></tr>");
			if(serviceAssessmentList.size() == 0){
				out.println("<tr><td style='padding-left:40px' colspan='2'><div id='serviceAssessmentTable'>您还未进行任何的服务评价!</div></td></tr>");
			}
			else{
				out.print("<tr><td style='padding-left:40px' colspan='2'><div id='serviceAssessmentTable'>");
			
				for(int i=0;i< serviceAssessmentList.size();i++){
					ServiceAssessment assessmentInfo = serviceAssessmentList.get(i);
					out.print(""+v.datemmdd(assessmentInfo.getAssessmentTime())+"&nbsp;&nbsp;&nbsp;&nbsp;您评价道：&nbsp;&nbsp;"+assessmentInfo.getServiceAssessment()+"<br/><br/>");
				}
				out.println("</div></td></tr>");
			}
			out.println("<tr><td height='40' style='padding-left:20px' colspan='2'><font color='#666666'><strong>服务评价：</strong></font></td></tr>");
			out.println("<tr><td style='padding-left:40px' colspan='2'><textarea id='serviceAssessment' name='serviceAssessment' style='width:500px;height:100px'></textarea></td></tr>");
			out.println("<tr><td style='padding-left:40px' colspan='2'><input type='button' value='提交评价' style='height: 30px;padding-top: 3px' onclick='return sendRequest("+orderId+")'/></td></tr>");
			out.println("<tr><td colspan='2'><hr color='#FF6699' style='height:1px'/></td></tr");
    %>
    
    
    <tr><td><input type="button" value="返&nbsp;&nbsp;&nbsp;回" style="height:30px;padding-top: 1px;width: 80px" onclick="history.go(-1)"/></td></tr>
</table>
<br />


  <div id="footer"  style="height:60px; background-color:#369;clear:both; ">
  <p style="text-align: center;	padding-top:20px;	color:#FFF"> <a href="../servlet/About"  ><font color="#FFFFFF">网站简介</font></a>   <a href="../servlet/Contact" ><font color="#FFFFFF">联系我们</a></font> </p>
</div>
  </body>
</html>
