<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.GoodsEvaluate"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="com.util.PublicToolShowDetailTypeList"%>
<%@page import="com.util.PublicToolGetTypeDetailInfo"%>
<%@page import="com.dao.GoodsTypeDetailInfoDAO"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="com.entity.GoodsTypeDetail"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.entity.SalesGoods"%>
<%@page import="com.util.PublicToolShowGooodsTypeList"%>
<%
	String email = (String)session.getAttribute("email");
	String thirdemail = (String)session.getAttribute("thirdemail");
 %>
 
 
 
 


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0051)http://mall.wl-expo.com/relaxationShop_index.action -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>橘子购物网</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link rel="stylesheet" href="../webstyle/base.css" type="text/css" media="screen">
<link rel="stylesheet" href="../webstyle/common.css" type="text/css" media="screen">
<link rel="stylesheet" href="../webstyle/mall.css" type="text/css" media="screen">
<script type="text/javascript" src="../js/web/top.js" charset="gb2312"></script>
<script type="text/javascript">
	function checkLogin(){
		if("<%=email%>" == "" || "<%=email%>" == "null"){
			alert("请先登陆!");
			return false;
		}
		else{
			top.location.href = "../servlet/DoMethod?method=showMyInformation";
				return true;
		}
	}
	function checkUserLogin(){
		if("<%=email%>" == "" || "<%=email%>" == "null"){
			alert("请先登陆!");
			return false;
		}
		else{
			top.location.href = "../servlet/DoChatMethod?method=login";
			return true;
		}
	}
</script>
</head>
<body>

<div id="wrap">
  <div id="header">
   
    <div class="fl logo"> <img src="../webstyle/logo.jpg" > </div>
    <div class="fr searchbox">
       <input type="text" id="key"  class="fl sinput" /> <input  type="button" onClick="getKey()" class="fl sbtn"/> 
        <div class="fl adsearch"> </div>
      <div class="clr"></div>
      <p class="keywords">热门商品：服装配饰、美容保养、寝居必备、食品攻略、数码电子、文化体育、各类服务... </p>
   &nbsp;&nbsp;</td>
      			<td></td>
    
    
    
    
    
    
    </div>
    <div class="clr"></div>
    <div class="navbar">
      <ul class="fl">
       
        <li class="nobg"><a href="../" target="_top">首页</a></li>
		
       
       
       
       
        <% PublicToolShowGooodsTypeList.showGoodsallTypeList(request, response);
 ArrayList<GoodsType> goodsTypeList = (ArrayList<GoodsType>)request.getAttribute("goodsTypeList");
      	if(goodsTypeList == null || goodsTypeList.toString().equals("[]")){
      		out.println("<td colspan='5' height='30'><div align='center'>当前无任何商品类型信息!</div></td>");
      	}
      	else{
      		for(int i=0;i<goodsTypeList.size();i++){
      			GoodsType gt = goodsTypeList.get(i);
      			String typeName = gt.getTypeName();
				%>
      		<%
											
	
			PublicToolShowDetailTypeList.showDetailallTypeList(request, response,gt.getTypeId());

			ArrayList<GoodsTypeDetail> goodsTypeList1 = (ArrayList<GoodsTypeDetail>)request.getAttribute("goodsDetailallTypeList");
            	if(goodsTypeList1 == null || goodsTypeList1.toString().equals("[]")){
            		out.println("<div align='center'>当前无任何商品类型信息!</td>");
            	}
            	else{
            		
            			GoodsTypeDetail gt1 = goodsTypeList1.get(0);
            			String typeName1 = gt1.getTypeDetailInfo();
            			int Id=gt1.getId();
            			%>
            <li><a href="../servlet/typelist?typeid=<%=Id%>"  target="_top"><%=typeName%></a>  </li>
            		
					
					<%
            	}%>
			
			
		
			
			<%	}
			
	                  
		
      }
       %>
       
        
        
        <li>		<a href="cart.jsp" target="_top">购物车</a></li>
<!--        <li>    <a href="#" onClick="return checkUserLogin()">在线客户交流</a></li>
-->		<li>		<a href="JavaScript:window.external.addFavorite('#','网站')">收藏本站</a></li>
       

      </ul>
      <span class="fr">
      <%
				if(email != null){
					out.println("<font color='#ffffff'>"+email+"&nbsp;&nbsp;您好，欢迎光临橘子购物网! </font><a href='#' onClick='return checkLogin()'><font color='#ffffff'>我的信息</font></a> <a href='../servlet/DoMethod?method=loginOut' target='_top'><font color='#ffffff'>退出</font></a>");
				}
				else{
					out.println("<font color='#ffffff'>您好，欢迎光临橘子购物网! </font><a href='loginOrRegister.jsp' target='_top'><font color='#ffffff'>请登录</font></a> <a href='loginOrRegister.jsp' target='_top'> <font color='#ffffff'>免费注册</font></a>  <a href='loginthirdRegister.jsp' target='_top'> <font color='#ffffff'>商户注册</font></a> ");
				}
			 %>
      
    
       
        </span> </div>
  </div>
 </div>
</body>
</html>

