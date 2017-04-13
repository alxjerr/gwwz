<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="UTF-8"%>
<%@page import="com.entity.BulletinInfo"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.entity.GoodsInfo"%>
<%@page import="com.dao.ThirdInfoDAO"%>
<%@page import="com.entity.ThirdInfo"%>
<%@page import="com.util.Validate"%>

<%@page import="com.util.PublicToolGetGoodsTypeName"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品信息管理</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/third/manageGoodsInfo.js" charset="gb2312"></script>
  </head>
  
  <body>
  <form action="../servlet/ManageGoodsInfo?method=deleteMore" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:13px;">
  <tr>
    <td width="100%" height="36"><strong><font size="6" color="#0099FF">□&nbsp;</font><font color="#666666" size="3">商品信息管理</font></strong></td>
    <td height="36"><div align="right"><input type="text" name="key"  id="key" style="height: 24px;width: 250px;padding-top: 2px;padding-left:20px;background-image: url(../image/icon/key_search.gif);background-repeat: no-repeat"/></div></td>
    <td><input type="button" value="查询" style="height: 26px;width: 70px;padding-top: 2px" onClick="return searchGoodsInfo()"/></td>
    <td><input type="submit" value="删除商品" style="height: 26px;width: 70px;padding-top: 2px" onClick="return deletMoreGoodsInfo()"/></td>
 
 </tr>
  <tr>
    <td height="40" colspan="5"><hr  width="100%"/></td>
  </tr>
  <tr>
    <td height="147" colspan="12">
    <table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px"  bordercolor="#9999FF"> 
      <tr height="30">
        <td width="40"><div align="center"><font color="#666666">全选</font></div></td>
        <td width="35"><div align="center"><input type="checkbox" id="checkAll" value="checkbox" onClick="selectAll()"/></div></td>
        <td width="55"><div align="center"><font color="#666666">商品编号</font></div></td>
        <td width="85"><div align="center"><font color="#666666">商品类别</font></div></td>
        <td><div align="center"><font color="#666666">商品名称</font></div></td>
        <td width="65"><div align="center"><font color="#666666">商品价格</font></div></td>
        <td width="55"><div align="center"><font color="#666666">发布时间</font></div></td>
        <td width="110"><div align="center"><font color="#666666">剩余数量</font></div></td>
              <td width="110"><div align="center"><font color="#666666">所属商户</font></div></td>
        <td width="55"><div align="center"><font color="#666666">商品状态</font></div></td>
        <td><div align="center"><font color="#666666">审核状态</font></div></td>
        <td width="70"><div align="center"><font color="#666666">操作</font></div></td>
      </tr>
      <%
      	String isSearching = (String)request.getAttribute("isSearching");
 		ArrayList<GoodsInfo> goodsInfoList = (ArrayList<GoodsInfo>)request.getAttribute("goodsInfoList");
      	if(goodsInfoList == null || goodsInfoList.toString().equals("[]")){
      		out.println("<td colspan='12' height='30'><div align='center'>当前无任何商品信息!</div></td>");
      	}
      	else{
      		DecimalFormat df = new DecimalFormat("0.00");
      		for(int i=0;i<goodsInfoList.size();i++){
      			GoodsInfo gd = goodsInfoList.get(i);
      			String goodsName = gd.getGoodsName();
      			if(goodsName.length() >19){
      				goodsName = goodsName.substring(0,18)+"...";
      			}
      			String price = df.format(gd.getPrice());
      			String createdate=gd.getCreatedate();
      			int countrequire=gd.getCountRequire();
      			String userid=gd.getUserid();
      	
				 String thirdName ="";
				if(userid == null){
      				userid = "管理员";
      			}else{
					
		
				ThirdInfoDAO udao = new ThirdInfoDAO();
				ThirdInfo ThirdInfo = udao.getThirdInfo(Integer.parseInt(userid));
			    thirdName = ThirdInfo.getthirdName();
					
					}
      			/*String discount = "全折";
      			if((int)gd.getDiscount() != 10){
      				discount = String.format("%.1f",gd.getDiscount());
      			}
      			String photo = gd.getPhoto();
      			if(photo == null){
      				photo = "暂无";
      			}
      			String isNew = "新品";
      			if(gd.getIsNew() == 1){
      				isNew = "非新品";
      			}*/
      			String isRecommend = "推荐";
      			if(gd.getIsRecommend() == 1){
      				isRecommend = "不推荐";
      			}
      			String status = "上架";
      			if(gd.getStatus() == 1){
      				status = "下架";
      			}
      			out.println("<tr height='30'>");
	      		out.println("<td><div align='center'>勾选</div></td>");
	      		out.println("<td><div align='center'><input id='ckb' type='checkbox' name='ckb' value='"+gd.getGoodsId()+"' /></div></td>");
	      		out.println("<td><div align='center'>"+gd.getGoodsId()+"</div></td>");
	      		out.println("<td><div align='center'>"+PublicToolGetGoodsTypeName.getGoodDetailTypeName(Integer.parseInt(gd.getTypeDetailInfo()))+"</div></td>");
	      		out.println("<td><div align='center'>"+goodsName+"</div></td>");
	      		out.println("<td><div align='center'>￥"+price+"</div></td>");
	      	  Validate v = new Validate();
  
	
	      		out.println("<td><div align='center'>"+v.datemmdd(createdate)+"</div></td>");
	      		out.println("<td><div align='center'>"+countrequire+"</div></td>");
	      		out.println("<td><div align='center'>"+thirdName+"</div></td>");
	      		
	      		out.println("<td><div align='center'>"+status+"</div></td>");
	      		//out.println("<td><div align='center'>"+gd.getGoodsId()+"</div></td>");
	      		if(gd.getIsCooled() == 1){
	      			out.println("<td><div align='center'><font color='#FF0000'>未审核</font></div></td>");
	      		}
	      		else{
	      			out.println("<td><div align='center'>已审核</div></td>");
	      		}
				out.println("<td><div align='center'>");
				if(PublicToolCheckParam.checkNullAndEmpty(isSearching) && goodsInfoList.size() > 1){
	      			out.println("<a href='../servlet/tManageGoodsInfo?method=update&goodsId=" + gd.getGoodsId() + "&thirdId="+session.getAttribute("thirdId")+"'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteGoodsInfoOfSearching("+gd.getGoodsId()+","+request.getAttribute("key")+","+session.getAttribute("thirdId")+")>删除</a>");
	      		
				}
			
	      		else{
	      			out.println("<a href='../servlet/tManageGoodsInfo?method=update&goodsId="+gd.getGoodsId()+"&thirdId="+session.getAttribute("thirdId")+"'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteGoodsInfo("+gd.getGoodsId()+","+session.getAttribute("thirdId")+")>删除</a>");
	      		    

			
			
				}
	      		
	      		out.println("</div></td></tr>");
      		}
      	}
       %>
      <tr><td colspan="13" height="50"><div align="center">共找到<%=request.getAttribute("sumCount")%>条记录
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第<%=request.getAttribute("currentPage")%>/<%=request.getAttribute("sumPageCount")%>页
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/tManageGoodsInfo?thirdId=<%=session.getAttribute("thirdId")%>&method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}
	  else{out.println("showManageGoodsInfoPage");}%>&cp=<%=request.getAttribute("indexPage")%>">首页</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/tManageGoodsInfo?thirdId=<%=session.getAttribute("thirdId")%>&method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching))
	  {out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsInfoPage");}%>&cp=<%=request.getAttribute("upPage")%>">上一页</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/tManageGoodsInfo?thirdId=<%=session.getAttribute("thirdId")%>&method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching))
	  {out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsInfoPage");}%>&cp=<%=request.getAttribute("nextPage")%>">下一页</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../servlet/tManageGoodsInfo?thirdId=<%=session.getAttribute("thirdId")%>&method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching))
	  {out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsInfoPage");}%>&cp=<%=request.getAttribute("lastPage")%>">尾页</a> </div></td></tr>
    </table>
    </td>
  </tr>
</table>
</form>
  </body>
</html>
