<%@ page language="java" import="java.util.*,com.entity.BulletinInfo" pageEncoding="utf-8"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="com.entity.GoodsInfo"%>
<%@page import="com.entity.GoodsTypeDetail"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<%

    		String username = (String)request.getAttribute("userName");
    		String userrole = (String)request.getAttribute("userRole");
    		String userid = (String)request.getAttribute("userId");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改用户信息</title>
     <script type="text/javascript" src="../js/admin/addGoodsInfo.js" charset="gb2312"></script>
  <script type="text/javascript" src="../js/popup.js"></script>
<script language="javascript">
            function up()
		    {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
		    }
        </script>
 </head>
  <body >
  <form action="../servlet/UpdateUserInfo?method=edituserInfo&submit=1" method="post"  name="form1">
   	<table style="font-size:13px;margin-left: 40px" width="800" height="390">
  <tr>
    <td colspan="2"><strong><font size="6" color="#0099FF">□</font><font color="#666666" size="3">&nbsp;修改用户信息</font></strong></td>
  </tr>
  <tr>
    <td height="15" colspan="2"><hr  width="100%" style="height: 2px;"/></td>
  </tr>
  <tr>
    <td><strong>用户名称：</strong></td>
  
     <td><input id="username" type="text" name="username" style="width:350px; height:25px;padding-top: 2px;"  value="<%=username%>"/></td>
  </tr>
  <tr>
    <td><strong>用户分类：</strong></td>
    <td>
    	<select name="userrole"  >
    		<option value="0" <%if(userrole.equals("0")){%> selected<%}%>>系统管理员</option>
    		<option value="1" <%if(userrole.equals("1")){%> selected<%}%>>系统操作员</option>            
    	</select>

 
  </tr>
  <tr>
    <td colspan="2" style="padding-left:280px">
    <input type="hidden" name=Id value="<%=userid%>">
    <input type="submit" name="Submit" value="确定" style="height: 28px;width: 50px;padding-top: 2px"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="返回" style="height: 28px;width: 50px;padding-top: 2px" onClick="back()"/></td>
  </tr>
</table>
</form>
  </body>
</html>
