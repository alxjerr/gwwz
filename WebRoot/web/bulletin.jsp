<%@ page language="java" import="com.entity.BulletinInfo" pageEncoding="utf-8"%>
<%@page import="com.util.Validate"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>公告信息</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
  </head>
  
  <body>
  <iframe src="../web/top.jsp" width="100%" height="170" frameborder="0"></iframe>
    <table border="0" cellspacing="0" cellpadding="0" width='960px' align="center">
  <tr height="60">
    <td><font size="2" color="#999999">您现在所在位置：<a href="../" target="_top">网站首页</a>&gt; <a href="../servlet/Bulletin" target="_top">网站公告</a>&gt; 公告信息</font></td>
  </tr>
</table>
<br/>
<table  height="137" cellpadding="0" cellspacing="0" style="border:solid #0099FF 1px" width='960px' align="center">
	<%
  		BulletinInfo bulletinInfo = (BulletinInfo)request.getAttribute("bulletinInfo");
  		out.println("<tr><td height='40' colspan='3'><div align='center'><strong>"+bulletinInfo.getTitle()+"</strong></div></td></tr>");
		  Validate v = new Validate();
  

  		out.println("<tr><td height='45' colspan='3'><div align='center'><font size='2' color='#666666'>"+v.datemmdd(bulletinInfo.getCreateTime())+"&nbsp;&nbsp;&nbsp;发布者："+request.getAttribute("ur")+"</font></div></td></tr>");
  		out.println("<tr><td width='80'>&nbsp;</td><td style='font-size:14px' width='800'>"+bulletinInfo.getContent()+"</td><td width='50'>&nbsp;</td></tr>");
  		out.println("<tr><td height='40'>&nbsp;</td></tr>");
	%> 
</table>
<br/>
  <div id="footer"  style="height:60px; background-color:#369;clear:both; ">
  <p style="text-align: center;	padding-top:20px;	color:#FFF"> <a href="../servlet/About"  ><font color="#FFFFFF">网站简介</font></a>   <a href="../servlet/Contact" ><font color="#FFFFFF">联系我们</a></font> </p>
</div>
  </body>
</html>
