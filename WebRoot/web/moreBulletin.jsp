<%@ page language="java" import="java.util.*,com.entity.BulletinInfo" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>更多公告</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/web/checkGo.js" charset="gb2312"></script>
  </head>
  
  <body>
  <iframe src="../web/top.jsp" width="100%" height="170" frameborder="0"></iframe>
    <table border="0" cellspacing="0" cellpadding="0" width='960px' align="center">
  <tr height="60">
    <td><font size="2" color="#999999">您现在所在位置：<a href="../" target="_top">网站首页</a>&gt; 网站公告</font></td>
  </tr>
</table>
<form id="form1" name="form1" method="post" action="../servlet/Bulletin" onsubmit="return checkGo()">
<table  height="110" border="0" cellpadding="0" cellspacing="0" style="font-size:13px; " width='960px' align="center">
  <%
		ArrayList<BulletinInfo> moreBulletinInfoList = (ArrayList<BulletinInfo>)request.getAttribute("moreBulletinInfoList");
			for(int i=0;i<moreBulletinInfoList.size();i++){
				BulletinInfo bulletin = moreBulletinInfoList.get(i);
				out.println("<tr><td width='296' height='24'><a href='ShowBulletinInfo?id="+bulletin.getId()+"'>"+bulletin.getTitle()+"</a></td><td width='804'><font color='#666666'>"+bulletin.getCreateTime()+"</font></td></tr>");
			}
	%> 	
  <tr>
    <td colspan="2" width="1080" align="right">
    共有<%=request.getAttribute("sumCount")%>条公告
    &nbsp;&nbsp;&nbsp;
    第<%=request.getAttribute("currentPage")%>/<%=request.getAttribute("sumPageCount")%>页
    &nbsp;&nbsp;&nbsp;
    <a href="../servlet/Bulletin?cp=<%=request.getAttribute("indexPage")%>">首页</a>
    &nbsp;&nbsp;
    <a href="../servlet/Bulletin?cp=<%=request.getAttribute("upPage")%>">上一页</a>
    &nbsp;&nbsp;
    <a href="../servlet/Bulletin?cp=<%=request.getAttribute("nextPage")%>">下一页</a>
    &nbsp;&nbsp;
    <a href="../servlet/Bulletin?cp=<%=request.getAttribute("lastPage")%>">尾页</a>
    &nbsp;&nbsp;&nbsp;
    跳至第&nbsp;&nbsp;<input type="text" id="go" name="cp" style="width: 35px"/>&nbsp;&nbsp;页
    <input type="submit" value="go" style="width: 30px;cursor:pointer;"/></td>
  </tr>
</table>
</form>
  <div id="footer"  style="height:60px; background-color:#369;clear:both; ">
  <p style="text-align: center;	padding-top:20px;	color:#FFF"> <a href="../servlet/About"  ><font color="#FFFFFF">网站简介</font></a>   <a href="../servlet/Contact" ><font color="#FFFFFF">联系我们</a></font> </p>
</div>
  </body>
</html>
