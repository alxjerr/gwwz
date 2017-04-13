<%@ page language="java" import="java.util.*,com.entity.GoodsInfo,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@page import="com.util.PublicToolCheckParam"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>    
    <title>更多商品</title>    
  	<link type="text/css" rel="stylesheet" href="../css/style.css" />
  	<script type="text/javascript" src="../js/web/checkGo.js" charset="gb2312"></script>
  </head>
  <body>
	<iframe src="../web/top.jsp" width="100%" height="170" frameborder="0"></iframe>
<table border="0" cellspacing="0" cellpadding="0" width='960px' align="center">
  <tr height="60">
    <td><font size="2" color="#999999">您现在所在位置：<a href="../" target="_top">网站首页</a>&gt; 分类商品</font></td>
  </tr>
</table>
	<table width='960px' align="center" border="0" cellpadding="0" cellspacing="0" >
		<%
			GoodsInfo moreProductInfo = null;
			DecimalFormat df = new DecimalFormat("0.00");
			ArrayList<GoodsInfo> moreProductInfoList = (ArrayList<GoodsInfo>)request.getAttribute("moreProductInfoList");
			for(int i=0;i<moreProductInfoList.size();i++){
				moreProductInfo = moreProductInfoList.get(i);
				String prePrice = df.format(moreProductInfo.getPrice());
	  			String currentPrice = df.format(moreProductInfo.getDiscountPrice());
	  			String discount = String.format("%.1f", moreProductInfo.getDiscount());
				if(i%2 == 0){
					out.println("<tr height='100'>");
				}
				if(PublicToolCheckParam.checkNullAndEmpty(moreProductInfo.getPhoto())){
					out.println("<td width='78'><a href='ProductInfo?gid="+moreProductInfo.getGoodsId()+"'><img src='../"+moreProductInfo.getPhoto()+"' width='70' height='70' border='0'/></a></td>");
				}
				else{
					out.println("<td width='78'><div align='center'><font color='#FF6699' size='2'>图片暂无</font></div></td>");
				}
		  		
		  		if((int)moreProductInfo.getDiscount() == 10){
		  			out.println("<td width='183'><a href='ProductInfo?gid="+moreProductInfo.getGoodsId()+"'>"+moreProductInfo.getGoodsName()+"</a><br /><font color='#FF6633'><font size='2'>￥</font>"+currentPrice+"</font></td>");
		  		}
		  		else{
		  			out.println("<td width='183'><font color='#FF3399' size='5'>"+discount+"</font>折<br /><a href='ProductInfo?gid="+moreProductInfo.getGoodsId()+"'>"+moreProductInfo.getGoodsName()+"</a><br /><font style='text-decoration: line-through' color='#999999'><font size='2'>￥</font>"+prePrice+"</font>&nbsp;&nbsp;<font color='#FF6633'><font size='2'>￥</font>"+currentPrice+"</font></td>");
		  		}
		  		if(i%2 == 1){
					out.println("</tr>");
				}
			}
		%> 	
	</table>
	<br/><br/>
	<form id="form1" name="form1" method="post" action="../servlet/MoreProductInfo?typeDetailInfo=<%=moreProductInfo.getTypeDetailInfo()%>" onsubmit="return checkGo()">
	<table style="font-size: 13px;margin-left: 390px">
	<tr>
		<td>
			共有<%=request.getAttribute("sumCount")%>件商品
			&nbsp;&nbsp;&nbsp;
			第<%=request.getAttribute("currentPage")%>/<%=request.getAttribute("sumPageCount")%>页
			&nbsp;&nbsp;&nbsp;
			<a href="../servlet/MoreProductInfo?cp=<%=request.getAttribute("indexPage")%>&typeDetailInfo=<%=moreProductInfo.getTypeDetailInfo()%>">首页</a>
			&nbsp;&nbsp;
			<a href="../servlet/MoreProductInfo?cp=<%=request.getAttribute("upPage")%>&typeDetailInfo=<%=moreProductInfo.getTypeDetailInfo()%>">上一页</a>
			&nbsp;&nbsp;<a href="../servlet/MoreProductInfo?cp=<%=request.getAttribute("nextPage")%>&typeDetailInfo=<%=moreProductInfo.getTypeDetailInfo()%>">下一页</a>
			&nbsp;&nbsp;
			<a href="../servlet/MoreProductInfo?cp=<%=request.getAttribute("lastPage")%>&typeDetailInfo=<%=moreProductInfo.getTypeDetailInfo()%>">尾页</a>
		</td>
		<td width="40" style="padding-left: 15px">跳至第</td>
		<td><input id="go" type="text" name="cp" style="width: 35px"/></td>
		<td width="13" align="center">页</td>
		<td width="30" align="center"><input type="submit" value="go" style="width: 30px;cursor:pointer;"/></td>
	</tr>
</table>
</form>
  <div id="footer"  style="height:60px; background-color:#369;clear:both; ">
  <p style="text-align: center;	padding-top:20px;	color:#FFF"> <a href="../servlet/About"  ><font color="#FFFFFF">网站简介</font></a>   <a href="../servlet/Contact" ><font color="#FFFFFF">联系我们</a></font> </p>
</div>
  </body>
</html>
