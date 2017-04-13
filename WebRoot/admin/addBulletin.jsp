<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>发布公告</title>
    <script type="text/javascript" src="../js/admin/addBulletin.js" charset="gb2312"></script>
  </head>
  <body>
  <form action="../servlet/ManageBulletin?method=insert" method="post" onsubmit="return checkText()">
   	<table style="font-size:13px;margin-left: 40px" >
  <tr>
    <td colspan="2"><strong><font size="6" color="#0099FF">□</font><font color="#666666" size="3">&nbsp;发布公告信息</font></strong></td>
  </tr>
  <tr>
    <td height="15" colspan="2"><hr  width="100%" style="height: 2px;"/></td>
  </tr>
  <tr>
    <td width="50" height="60"><font color="#666666">标题：</font></td>
    <td width="689"><input id="title" type="text" name="title"  style="width:480px; height:28px;padding-top: 3px"/></td>
  </tr>
  <tr>
    <td><font color="#666666">内容：</font></td>
    <td><textarea id="content" name="content" style="width:600px; height:190px"></textarea></td>
  </tr>
  <tr>
    <td height="68" colspan="2" style="padding-left:280px"><input type="submit" name="Submit" value="确定" style="height: 28px;width: 50px;padding-top: 2px"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" value="重置" style="height: 28px;width: 50px;padding-top: 2px"/></td>
  </tr>
</table>
</form>
  </body>
</html>
