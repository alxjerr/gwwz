<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>找回密码</title>
<style type="text/css">
<!--
#Layer1 {
	position:relative;
	left:600px;
	top:-210px;
	z-index:1;
}
#Layer2 {
	position:relative;
	top:-190px;
	z-index:2;
}
-->
</style>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
  <body>
  <iframe src="../web/top.jsp" width="100%" height="170" frameborder="0"></iframe>
    <table border="0" cellspacing="0" cellpadding="0" style="margin-left:120px">
  <tr height="60">
    <td><font size="2" color="#999999">您现在所在位置：<a href="../">网站首页</a>&gt; 找回密码</font></td>
  </tr>
</table>
  <form action="../servlet/DoMethod?method=lost" method="post" onsubmit="return checkRegister()">
<table width="690" height="251" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="75" colspan="4">找回密码</td>
  </tr>
  <tr>
    <td width="106" height="45"><font color="#666666" size="2">用户帐户/邮箱：</font></td>
    <td width="223"><input id="regEmail" type="text" name="email" style="width:200px; height:19px;padding-top: 3pxx" value="<%String regEmail = (String)request.getAttribute("regEmail");if(regEmail != null){out.println(regEmail);}%>" onblur="return sendRequest()"/></td>
    <td width="20"></td>
    <td width="180">&nbsp;&nbsp;&nbsp;<font id="msg" size="2" color="#FF0000"></font></td>
  </tr>
  <TR class=black >
    <td height="45"><font color="#666666" size="2">密码提示问题：</font></td>
                <TD width="304"  height=30 align=left>
				<INPUT class=inputb   size=22 name=question  style="width:200px;height:19px;padding-top: 3px"/ >
				</TD>
    <td colspan="2"><font color="#666666" size="2"></font></td>
				</TR>
              <TR class=black >
    <td height="45"><font color="#666666" size="2">密码提示答案：</font></td>
                <TD width="304"  height=30 align=left>
				<INPUT class=inputb  size=22 name=answer  style="width:200px;height:19px;padding-top: 3px"/> 
				</TD>
    <td colspan="2"><font color="#666666" size="2"></font></td>
				</TR>
    <tr>
    <td height="40" colspan="4" align="center">
    	<%
    		String error = (String)request.getAttribute("error");
    		if(error != null){
    			out.println("<font color='#FF0000' size='2'>"+error+"</font>");
    		}
    	 %>
    </td>
  </tr>
  
  
<tr valign="middle">
    <td colspan="4" align="center"><input type="image" style="cursor: pointer;" src="../image/icon/payOnline.jpg" align="middle"/></td>
  </tr>
</table>
  <table style="margin-left: 150px">
  
</table>

</form>
  <div id="footer"  style="height:60px; background-color:#369;clear:both; ">
  <p style="text-align: center;	padding-top:20px;	color:#FFF"> <a href="../servlet/About"  ><font color="#FFFFFF">网站简介</font></a>   <a href="../servlet/Contact" ><font color="#FFFFFF">联系我们</a></font> </p>
</div>
  </body>
</html>
