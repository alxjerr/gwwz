<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>个人信息</title> 
<style type="text/css">
<!--
#Layer2 {
	position:absolute;
	left:10px;
	top:14px;
	z-index:2;
}
#Layer3 {
	position:absolute;
	left:38px;
	top:42px;
	z-index:3;
}
#Layer4 {
	position:absolute;
	left:10px;
	top:43px;
	z-index:4;
}
-->
</style>
  </head>
  <body>
  <div id="Layer2" >
  	<strong><font id="userName" color='#666666'><%=session.getAttribute("email")%></font></strong>
  </div>
  <div id="Layer3" >
  	<font size="2" color="#FF3366">系统公告：欢迎使用在线客户交流系统!</font>
  </div>
  <div id="Layer4" >
  	<img src="../image/chatIcon/announcement.jpg"/>
  </div>
  </body>
</html>
