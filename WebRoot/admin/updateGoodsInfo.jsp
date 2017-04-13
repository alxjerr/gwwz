<%@ page language="java" import="java.util.*,com.entity.BulletinInfo" pageEncoding="utf-8"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="com.entity.GoodsInfo"%>
<%@page import="com.entity.GoodsTypeDetail"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<%
	String typeName = (String)request.getAttribute("typeName");
	GoodsInfo goodsInfo = (GoodsInfo)request.getAttribute("goodsInfo");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>查看/修改商品信息</title>
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
  <body onload= "document.form1.goodsTypeId.onchange() " >
  <form action="../servlet/ManageGoodsInfo?method=update&goodsId=<%=goodsInfo.getGoodsId()%>&submit=1" method="post" onSubmit="return checkGoodsInfo()" name="form1">
   	<table style="font-size:13px;margin-left: 40px" width="800" height="390">
  <tr>
    <td colspan="2"><strong><font size="6" color="#0099FF">□</font><font color="#666666" size="3">&nbsp;查看/修改商品信息</font></strong></td>
  </tr>
  <tr>
    <td height="15" colspan="2"><hr  width="100%" style="height: 2px;"/></td>
  </tr>
  <tr>
    <td><strong>商品名称：</strong></td>
    <td><input id="goodsName" type="text" name="goodsName" style="width:350px; height:25px;padding-top: 2px;" value="<%=goodsInfo.getGoodsName()%>"/></td>
  </tr>
  <tr>
     <td><strong>商品分类：</strong></td>
    <td>
    	<select name="goodsTypeId"  onChange="sendRequest()">
    		<%
    			ArrayList<GoodsType> typeList = (ArrayList<GoodsType>)request.getAttribute("typeList");
    			if(typeList != null){
    				for(int i=0;i<typeList.size();i++){
    					GoodsType gt = typeList.get(i);
    					out.println("<option value='"+gt.getTypeId()+"'>"+gt.getTypeName()+"</option>");
    				}
    				
    			}
    		 %>
    	</select>
        <script> document.form1.goodsTypeId.selectedIndex=0 </script>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<select name="typeDetailInfo">
    		<%
    			ArrayList<GoodsTypeDetail> typeDetailInfoList = (ArrayList<GoodsTypeDetail>)request.getAttribute("typeDetailInfoList");
    			if(typeDetailInfoList != null){
    				for(int i=0;i<typeDetailInfoList.size();i++){
    					GoodsTypeDetail gtd = typeDetailInfoList.get(i);
    					out.println("<option value='"+gtd.getId()+"'>"+gtd.getTypeDetailInfo()+"</option>");
    				}
    				
    			}
    		 %>
    	</select>
    	
    	
    </td>
  </tr>
  <tr>
    <td><strong>商品价格/折扣：</strong></td>
    <td>
    	价格：<input id="title" type="text" name="price"  style="width:80px; height:25px;padding-top: 2px" value="<%=goodsInfo.getPrice()%>"/>&nbsp;&nbsp;元
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	折扣：<input id="title" type="text" name="discount"  style="width:80px; height:25px;padding-top: 2px" value="<%=goodsInfo.getDiscount()%>"/>&nbsp;&nbsp;折
    	&nbsp;&nbsp;&nbsp;&nbsp;
    	<font color="#FF6699">格式如：8.8折</font>
    	&nbsp;&nbsp;&nbsp;&nbsp;
    	<%
    		int countRequire = goodsInfo.getCountRequire();
    		if(countRequire == 0){
    			countRequire = 1;
    		}
    		out.println("数量：<input id='countRequire' type='text' name='countRequire'  style='width:60px; height:25px;padding-top: 2px' value='"+countRequire+"'/>&nbsp;&nbsp;件");
    	 %>
    </td>
  </tr>
 
  <tr>
    <td><strong>上架/推荐/新品：</strong></td>
    <td>
    	<%
    		if(goodsInfo.getStatus() == 0){
    			out.println("<input type='checkbox' name='ckb' value='status' checked='checked'>上架");
    		}
    		else{
    			out.println("<input type='checkbox' name='ckb' value='status'>上架");
    		}
    		if(goodsInfo.getIsRecommend() == 0){
    			out.println("<input type='checkbox' name='ckb' value='isRecommend' checked='checked'>推荐");
    		}
    		else{
    			out.println("<input type='checkbox' name='ckb' value='isRecommend'>推荐");
    		}
    		if(goodsInfo.getIsNew() == 0){
    			out.println("<input type='checkbox' name='ckb' value='isNew' checked='checked'>新品");
    		}
    		else{
    			out.println("<input type='checkbox' name='ckb' value='isNew'>新品");
    		}
    	 %>
    	</td>
  </tr>
  <tr>
    <td><strong>商品图片：</strong></td>
    <td><input id="photo" type="text" name="photo"  style="width:500px; height:26px;padding-top: 4px"  readonly="readonly" value="<%=goodsInfo.getPhoto()%>"/>
    
						        <input type="button" value="上传" onClick="up()"/>
						        <input type="hidden" name="fujianYuanshiming" id="fujianYuanshiming"/>
    </td>
  </tr>
  <tr>
    <td><strong>商品描述：</strong></td>
    <td><textarea name="remark" style="width:500px; height:70px;"><%=goodsInfo.getRemark()%></textarea></td>
  </tr>
  <tr>
    <td colspan="2" style="padding-left:280px"><input type="submit" name="Submit" value="确定" style="height: 28px;width: 50px;padding-top: 2px"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="返回" style="height: 28px;width: 50px;padding-top: 2px" onClick="back()"/></td>
  </tr>
</table>
</form>
  </body>
</html>
