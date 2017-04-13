<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>登陆/注册</title>
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
<script type="text/javascript" src="../js/web/loginthirdRegister.js" charset="gb2312"></script>
  </head>
  <body>
  <iframe src="../web/top.jsp" width="100%" height="170" frameborder="0"></iframe>
  <table border="0" cellspacing="0" cellpadding="0" width="960PX"  align="center">
  <tr height="60">
       <td align="left"><font size="2" color="#999999">您现在所在位置：<a href="../">网站首页</a>&gt; 注册/登陆</font></td>
    </tr>
  </table>
<table  border="0" cellspacing="0" cellpadding="0" width="960PX"  align="center">
  <tr>
    <td valign="top">
  <form action="../servlet/DoMethod?method=checkLogin" method="post" onsubmit="return checkLogin()">
<table width="427" height="171" border="0" cellpadding="0" cellspacing="0"   align="center">
      <tr>
        <td height="81" colspan="4"><img src="../image/icon/login_logo.gif" width="230" height="47" /></td>
      </tr>
      <tr>
        <td width="120" height="45"><font color="#666666" size="2" >用户帐户/邮箱：</font></td>
        <td width="218"><input id="email" name="email" style="width:200px; height:19px;padding-top: 3px"/></td>
        <td width="136" colspan="2" rowspan="2" style="padding-top: 10px"><input type="image" src="../image/icon/btn_login.gif" style="cursor: pointer;"/></td>
      </tr>
      <tr>
        <td><font color="#666666" size="2">用户密码：</font></td>
        <td><input id="pwd" type="password" name="pwd" style="width:200px;height:19px;padding-top: 3px"/></td>
      </tr>
      <tr>
        <td height="40" colspan="4"><%
    		String error = (String)request.getAttribute("error");
    		if(error != null){
    			out.println("<font color='#FF0000' size='2'>"+error+"</font>");
    		}
    	 %></td>
      </tr>
    </table>
  </form>
    
    
    </td>
    
    
    
    <td>
    
    <form action="../servlet/DoMethodThird?method=register" method="post" onsubmit="return checkRegister()">
      <table width="590" height="251" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="75" colspan="4"><img src="../image/icon/register_logo.gif" width="230" height="47"/>注册</td>
        </tr>
        <tr>
          <td width="106" height="45"><font color="#666666" size="2">用户帐户/邮箱：</font></td>
          <td width="223"><input id="regEmail" type="text" name="regEmail" style="width:200px; height:19px;padding-top: 3pxx" value="<%String regEmail = (String)request.getAttribute("regEmail");if(regEmail != null){out.println(regEmail);}%>" onblur="return sendRequest()"/></td>
          <td width="20"><input type="button" value="检测邮箱" style="height: 30px;cursor:pointer" onclick="return sendRequest()"/></td>
          <td width="180">&nbsp;&nbsp;&nbsp;<font id="msg" size="2" color="#FF0000"></font></td>
        </tr>
        <tr>
          <td height="45"><font color="#666666" size="2">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</font></td>
          <td><input id="regPwd" type="password" name="regPwd" style="width:200px;height:19px;padding-top: 3px"/></td>
          <td colspan="2"><font color="#666666" size="2">登陆密码</font></td>
        </tr>
        <tr>
          <td height="43"><font color="#666666" size="2">确认密码：</font></td>
          <td><input id="regConPwd" type="password" name="regConPwd" style="width:200px;height:19px;padding-top: 3px"/></td>
          <td colspan="2"><font color="#666666" size="2">请再次输入密码</font></td>
        </tr>
      </table>
      <br>
      <table id="detail" height="180" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="80"><font color="#666666" size="2">商户名称：</font></td>
          <td width="320"><input id="thirdName" type="text" name="thirdName" style="width:170px;height:19px;padding-top: 3px"/></td>
          <td width="247" colspan="2"><font color="#666666" size="2"></font></td>
        </tr>
        <tr>
          <td><font color="#666666" size="2">联系电话：</font></td>
          <td><input id="phone" type="text" name="phone" style="width:170px;height:19px;padding-top: 3px"/></td>
          <td colspan="2"><font color="#666666" size="2">电话必须填写</font></td>
        </tr>
        <tr>
          <td><font color="#666666" size="2">联系地址：</font></td>
          <td><input id="address" type="text" name="address" style="width:300px;height:19px;padding-top: 3px"/></td>
          <td colspan="2"><font color="#666666" size="2">请正确填写</font></td>
        </tr>
      </table>
      <table style="margin-left: 150px">
        <tr>
          <td colspan="4"><input type="image" src="../image/icon/btn_register.gif" style="cursor: pointer;"/></td>
        </tr>
      </table>
    </form>
    </td>
  </tr>
</table>
<div id="footer"  style="height:60px; background-color:#369;clear:both; ">
  <p style="text-align: center;	padding-top:20px;	color:#FFF"> <a href="../servlet/About"  ><font color="#FFFFFF">网站简介</font></a> <a href="../servlet/Contact" ><font color="#FFFFFF">联系我们</a></font> </p>
</div>
</body>
</html>
