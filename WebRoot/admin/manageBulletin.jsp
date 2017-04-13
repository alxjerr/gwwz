<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.entity.BulletinInfo"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.util.Validate"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>公告管理</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/admin/manageBulletin.js" charset="gb2312"></script>
  </head>
  
  <body>
  <form action="../servlet/ManageBulletin?method=deleteMore" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:13px;">
  <tr>
    <td width="100%" height="36"><strong><font size="6" color="#0099FF">□&nbsp;</font><font color="#666666" size="3">公告信息管理</font></strong></td>
    <td height="36"><div align="right"><input type="text" name="key"  id="key" style="height: 24px;width: 250px;padding-top: 2px;padding-left:20px;background-image: url(../image/icon/key_search.gif);background-repeat: no-repeat"/></div></td>
    <td><input type="button" value="查询" style="height: 26px;width: 70px;padding-top: 2px" onclick="return searchBulletin()"/></td>
    <td><input type="button" value="添加公告" style="height: 26px;width: 70px;padding-top: 2px" onclick="showAddBulletinPage()"/></td>
    <td><input type="submit" value="删除公告" style="height: 26px;width: 70px;padding-top: 2px" onclick="return deletMoreBulletin()"/></td>
  </tr>
  <tr>
    <td height="40" colspan="5"><hr  width="100%"/></td>
  </tr>
  <tr>
    <td height="147" colspan="5">
    <table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px"  bordercolor="#9999FF"> 
      <tr height="30">
        <td><div align="center"><font color="#666666">全选</font></div></td>
        <td><div align="center"><input type="checkbox" id="checkAll" value="checkbox" onclick="selectAll()"/></div></td>
        <td><div align="center"><font color="#666666">公告编号</font></div></td>
        <td width="430"><div align="center"><font color="#666666">标题</font></div></td>
        <td width="100"><div align="center"><font color="#666666">发布者</font></div></td>
        <td width="150"><div align="center"><font color="#666666">发布时间</font></div></td>
        <td><div align="center"><font color="#666666">操作</font></div></td>
      </tr>
      <%
      	String isSearching = (String)request.getAttribute("isSearching");
 		ArrayList<BulletinInfo> bulletinList = (ArrayList<BulletinInfo>)request.getAttribute("bulletinList");
      	ArrayList<String> userNameList = (ArrayList<String>)request.getAttribute("userNameList");
      	if(bulletinList == null || bulletinList.toString().equals("[]")){
      		out.println("<td colspan='7' height='30'><div align='center'>当前无任何公告信息!</div></td>");
      	}
      	else{
      		for(int i=0;i<bulletinList.size();i++){
      			BulletinInfo bt = bulletinList.get(i);
      			String title = bt.getTitle();
      			if(title.length() >36){
      				title = title.substring(0,35)+"...";
      			}
      			out.println("<tr height='30'>");
	      		out.println("<td><div align='center'>勾选</div></td>");
	      		out.println("<td><div align='center'><input id='ckb' type='checkbox' name='ckb' value='"+bt.getId()+"' /></div></td>");
	      		out.println("<td><div align='center'>"+bt.getId()+"</div></td>");
	      		out.println("<td><div align='center'>"+title+"</div></td>");
	      		out.println("<td><div align='center'>"+userNameList.get(i)+"</div></td>");
	      		
	      		
  Validate v = new Validate();
	      		out.println("<td><div align='center'>"+ v.datemmdd(bt.getCreateTime())+"</div></td>");
	      		if(PublicToolCheckParam.checkNullAndEmpty(isSearching) && bulletinList.size() > 1){
	      			out.println("<td><div align='center'><a href='../servlet/ManageBulletin?method=update&bid="+bt.getId()+"'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteBulletinOfSearching("+bt.getId()+","+request.getAttribute("key")+")>删除</a></div></td>");
	      		}
	      		else{
	      			out.println("<td><div align='center'><a href='../servlet/ManageBulletin?method=update&bid="+bt.getId()+"'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteBulletin("+bt.getId()+")>删除</a></div></td>");
	      		}
	      		
	      		out.println("</tr>");
      		}
      	}
       %>
      <tr><td colspan="7" height="50"><div align="center">共找到<%=request.getAttribute("sumCount")%>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第<%=request.getAttribute("currentPage")%>/<%=request.getAttribute("sumPageCount")%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageBulletin?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageBulletinPage");}%>&cp=<%=request.getAttribute("indexPage")%>">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageBulletin?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageBulletinPage");}%>&cp=<%=request.getAttribute("upPage")%>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageBulletin?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageBulletinPage");}%>&cp=<%=request.getAttribute("nextPage")%>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/ManageBulletin?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageBulletinPage");}%>&cp=<%=request.getAttribute("lastPage")%>">尾页</a> </div></td></tr>
    </table>
    </td>
  </tr>
</table>
</form>
  </body>
</html>
