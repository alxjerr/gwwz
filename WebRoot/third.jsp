<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dt">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/login.css" rel="stylesheet" type="text/css" />
  	 <base href="<%=basePath%>">
    <title>商户登陆</title>
    <script type="text/javascript" src="js/third/third.js" charset="gb2312"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  </head>

  <body>
 			<form action="servlet/CheckThirdLogin?method=login" method="post" onsubmit="return checkLogin()">

  <div id="login-box">
    <div class="login-top"></div>
    <div class="login-main">
      <dl>
        <dt>用户名：</dt>
        <dd>
		<input id="email" name="email" style="width:160px; height:19px;padding-top: 3px"/></td>
        </dd>
        <dt>密&nbsp;&nbsp;码：</dt>
        <dd>
          <input id="pwd" type="password" name="pwd" style="width:160px; height:20px;padding-top: 4px"/>
        </dd>


        <dt>&nbsp;</dt>
        <dd>
         <input type="image" src="images/login-btn.jpg" style="cursor: pointer;"/>
        </dd>
      </dl>
    </div>
     <div class="login-power"><%
    				String error = (String)request.getAttribute("thirdLoginError");
    				if(error != null){
    					out.println("<font color='#FF0000' size='2'>"+error+"</font>");
    				}
    				 %>
				 </div>
  </div>
</form>




  </body>
</html>
