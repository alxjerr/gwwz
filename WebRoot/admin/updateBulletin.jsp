<%@ page language="java" import="java.util.*,com.entity.BulletinInfo" pageEncoding="utf-8"%>
<%
	BulletinInfo bulletinInfo = (BulletinInfo)request.getAttribute("bulletinInfo");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>查看/修改公告信息</title>
     <script type="text/javascript" src="../js/admin/updateBulletin.js" charset="gb2312"></script>
    <style type="text/css">
<!--
#Layer1 {
	position:absolute;
	left:122px;
	top:83px;
	z-index:1;
}
-->
    </style>
  </head>
  <body>
  <div id="Layer1" style="width:100px;height: 20px"><font color="#999999"><strong><%=bulletinInfo.getId()%></strong></font></div>
  <form action="../servlet/ManageBulletin?method=update&submit=1&bid=<%=bulletinInfo.getId()%>" method="post" onsubmit="return checkNull()">
   	<table style="font-size:13px;margin-left: 40px" >
  <tr>
    <td colspan="2"><strong><font size="6" color="#0099FF">□</font><font color="#666666" size="3">&nbsp;查看/修改公告信息</font></strong></td>
  </tr>
  <tr>
    <td height="15" colspan="2"><hr  width="100%" style="height: 2px;"/></td>
  </tr>
  <tr>
    <td width="50" height="30"><font color="#666666">编号：</font></td>
    <td width="689"><input type="text" style="width:60px; height:26px;padding-top: 3px;" value="     "/></td>
  </tr>
  <tr>
    <td width="50" height="60"><font color="#666666">标题：</font></td>
    <td width="689"><input id="title" type="text" name="title"  style="width:480px; height:28px;padding-top: 3px" value="<%=bulletinInfo.getTitle()%>"/></td>
  </tr>
  <tr>
    <td><font color="#666666">内容：</font></td>
    <td><textarea id="content" name="content" style="width:600px; height:130px"><%=bulletinInfo.getContent()%></textarea></td>
  </tr>
  <tr>
    <td height="60"><font color="#666666">发布者：</font></td>
    <td><%=request.getAttribute("userName")%></td>
  </tr>
  <tr>
    <td colspan="2" style="padding-left:280px"><input type="submit" name="Submit" value="修改" style="height: 28px;width: 50px;padding-top: 2px"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="返回" style="height: 28px;width: 50px;padding-top: 2px" onclick="back()"/></td>
  </tr>
</table>
</form>
  </body>
</html>
