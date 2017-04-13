<%@ page language="java" import="com.entity.GoodsInfo,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.GoodsEvaluate"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="com.util.PublicToolShowDetailTypeList"%>
<%@page import="com.util.PublicToolGetTypeDetailInfo"%>
<%@page import="com.dao.GoodsTypeDetailInfoDAO"%>
<%@page import="com.entity.GoodsType"%>
<%@page import="com.entity.GoodsTypeDetail"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.entity.SalesGoods"%>
<%
	GoodsInfo productInfo = (GoodsInfo)request.getAttribute("productInfo");
	String email = (String)session.getAttribute("email");
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0051)http://mall.wl-expo.com/relaxationShop_index.action -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类列表</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link rel="stylesheet" href="../webstyle/base.css" type="text/css" media="screen">
<link rel="stylesheet" href="../webstyle/common.css" type="text/css" media="screen">
<link rel="stylesheet" href="../webstyle/mall.css" type="text/css" media="screen">
<script type="text/javascript" src="../js/web/checkGo.js" charset="gb2312"></script>
</head>
<body >
<div id="wrap">
  <iframe src="../web/top.jsp" width="100%" frameborder="0"></iframe>
  
  <!-- end header-->
  <div id="main" class="mt10">
    <div class="fl lsort">
      <div class="sort">
        <h2>选择分类</h2>
        <div class="sortbox">
          <%  ArrayList<GoodsType> goodsTypeList = (ArrayList<GoodsType>)request.getAttribute("goodsTypeList");
      	if(goodsTypeList == null || goodsTypeList.toString().equals("[]")){
      		out.println("<td colspan='5' height='30'><div align='center'>当前无任何商品类型!</div></td>");
      	}
      	else{
      		for(int i=0;i<goodsTypeList.size();i++){
      			GoodsType gt = goodsTypeList.get(i);
      			String typeName = gt.getTypeName();
				%>
          <h3><%=typeName%></h3>
          <ul>
            <%
												
	
			PublicToolShowDetailTypeList.showDetailallTypeList(request, response,   gt.getTypeId());

			ArrayList<GoodsTypeDetail> goodsTypeList1 = (ArrayList<GoodsTypeDetail>)request.getAttribute("goodsDetailallTypeList");
            	if(goodsTypeList1 == null || goodsTypeList1.toString().equals("[]")){
            		out.println("<div align='center'>当前无任何商品类型信息!</td>");
            	}
            	else{
            		for(int ii=0;ii<goodsTypeList1.size();ii++){
            			GoodsTypeDetail gt1 = goodsTypeList1.get(ii);
            			String typeName1 = gt1.getTypeDetailInfo();
            			int Id=gt1.getId();
            			%>
            <li><a href="../servlet/typelist?typeid=<%=Id%>"><%=typeName1%></a> </li>
            <%}
            	}%>
          </ul>
          <%	}
			
	                  
		
      }
       %>
        </div>
      </div>
    </div>
    <div class="fr rightbox">
      <div class="position"> 您当前的位置: <a href="../" target="_top">首页</a> &gt;&gt;商品分类列表 </div>
      <div class="mt10 arrangement"> <span class="fl">排列方式</span>
        <ul class="fl ml10">
          <li> <a href='../servlet/typelist?typeid=<%=request.getAttribute("typeid")%>&order=price'>价格</a> </li>
          
          <li style="border-right: 1px solid #d9d9d9;"> <a href='../servlet/typelist?typeid=<%=request.getAttribute("typeid")%>&order=createdate'>时间</a> </li>
        </ul>
      </div>
      <div class="mt10 listbox">
        <ul>
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
		  
		  
		
			if(PublicToolCheckParam.checkNullAndEmpty(gd.getPhoto())){
				
				%>
          <li>
            <div class="bor1 plistinfo"> <a href='ProductInfo?gid=<%=gd.getGoodsId()%>'><img src='../<%=gd.getPhoto()%>' width='220' height='220' border='0'/></a> <span class="pltitle"> <a href='ProductInfo?gid=<%=gd.getGoodsId()%>'><%=gd.getGoodsName()%> </a> </span>
              <div class="plprice"> <span class="pnormal">￥<%=price%></span> </div>
            </div>
            <div class="clr"></div>
          </li>
          <%
			}
			
			else{
				
				%>
          <li>
            <div class="bor1 plistinfo"> <a href='ProductInfo?gid=<%=gd.getGoodsId()%>'><img src='../webstyle/defaultpic.gif'  height='220' width='220' /></a> <span class="pltitle"> <a href='ProductInfo?gid=<%=gd.getGoodsId()%>'><%=gd.getGoodsName()%> </a> </span>
              <div class="plprice"> <span class="pnormal">￥<%=price%></span> </div>
            </div>
            <div class="clr"></div>
          </li>
          <%}
	  		
	  		
	  		
			
		}
	  		
	%>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="productpage">
        <%	
		out.println("共有"+request.getAttribute("sumCount")+"件商品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.println("第"+request.getAttribute("currentPage")+"/"+request.getAttribute("sumPageCount")+"页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.println("<a href='../servlet/typelist?cp="+request.getAttribute("indexPage")+"&typeid="+request.getAttribute("typeid")+"'>首页</a>&nbsp;&nbsp;&nbsp;");
		out.println("<a href='../servlet/typelist?cp="+request.getAttribute("upPage")+"&typeid="+request.getAttribute("typeid")+"'>上一页</a>&nbsp;&nbsp;&nbsp;");
		out.println("<a href='../servlet/typelist?cp="+request.getAttribute("nextPage")+"&typeid="+request.getAttribute("typeid")+"'>下一页</a>&nbsp;&nbsp;&nbsp;");
		out.println("<a href='../servlet/typelist?cp="+request.getAttribute("lastPage")+"&typeid="+request.getAttribute("typeid")+"'>尾页</a>");
		
  		}
%>
      </div>
    </div>
  </div>
  
  <!--end footer-->
  
</div>


  <div id="footer"  style="height:60px; background-color:#369;clear:both; ">
  <p style="text-align: center;	padding-top:20px;	color:#FFF"> <a href="../servlet/About"  ><font color="#FFFFFF">网站简介</font></a>   <a href="../servlet/Contact" ><font color="#FFFFFF">联系我们</a></font> </p>
</div>
</body>
</html>
