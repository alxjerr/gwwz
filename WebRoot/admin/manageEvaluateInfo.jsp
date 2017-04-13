<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.PublicToolCheckParam"%>
<%@page import="com.entity.OrderInfo"%>
<%@page import="com.entity.CustomerDetailInfo"%>
<%@page import="com.dao.CustomerDetailInfoDAO"%>
<%@page import="com.dao.CustomerInfoDAO"%>
<%@page import="com.entity.CustomerInfo"%>

<%@page import="com.util.Validate"%>

<%@page import="com.entity.ServiceAssessment"%>
<%@page import="com.dao.CustomerInfoDAO"%>

			<%@page import="com.dao.CustomerInfoDAO"%>
<%@page import="com.entity.CustomerInfo"%>		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>评论信息管理</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    
    <script type="text/javascript" charset="gb2312">
    
function deleteeva(Id){
	if(confirm("您确定要删除当前所选信息?")){
		window.location.href = "../servlet/ManageGoodsInfo?method=deleteEva&Id="+Id+"";
	}
}

    </script>
    
  </head>
  
  <body>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:13px;">
  <tr>
    <td width="100%" height="36"><strong><font size="6" color="#0099FF">□&nbsp;</font><font color="#666666" size="3">评论信息管理</font></strong></td>
    <td height="36"><div align="right"></div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="40" colspan="4"><hr  width="100%"/></td>
  </tr>
  <tr>
    <td height="147" colspan="4"><table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px"  bordercolor="#9999FF"> 
      <tr height="30">
        <td><div align="center"><font color="#666666">编号</font></div></td>
        <td><div align="center"><font color="#666666">评论内容</font></div></td>
        <td><div align="center"><font color="#666666">评论日期</font></div></td>
        <td><div align="center"><font color="#666666">评论客户</font></div></td>
        <td  width="70"><div align="center"><font color="#666666">操作</font></div></td>
      </tr>
      <%
      	
		
					
	    		ArrayList<ServiceAssessment> serviceAssessmentList = (ArrayList<ServiceAssessment>)request.getAttribute("serviceAssessmentList");

			if(serviceAssessmentList.size() == 0){
				out.println("<tr><td style='padding-left:40px' colspan='5'><div id='serviceAssessmentTable'>暂无用户评价</div></td></tr>");
			}
			else{
			
				for(int i=0;i< serviceAssessmentList.size();i++){
					ServiceAssessment assessmentInfo = serviceAssessmentList.get(i);
						//客户信息
 		CustomerDetailInfoDAO cddao = new CustomerDetailInfoDAO();
CustomerDetailInfo customerDetailInfo = cddao.getCustomerDetailInfo(assessmentInfo.getCustomerId());	
					
					
					
				out.print("<tr><td style='padding-left:40px' ><div id='serviceAssessmentTable'>");
					
					
					out.print(""+assessmentInfo.getId()+"");
				
				
					out.println("</div></td>");




					
				out.print("<td style='padding-left:40px' ><div id='serviceAssessmentTable'>");
					
					
					out.print(""+assessmentInfo.getServiceAssessment()+"");
				
				
					out.println("</div></td>");



					
				out.print("<td style='padding-left:40px' ><div id='serviceAssessmentTable'>");
					
				 Validate v = new Validate();


	      	
					out.print(""+v.datemmdd(assessmentInfo.getAssessmentTime())+"");
				
				
					out.println("</div></td>");
					
				
				out.print("<td style='padding-left:40px' ><div id='serviceAssessmentTable'>");
					
					
					out.print(""+customerDetailInfo.getName()+"");
				
				
					out.println("</div></td>");
			
				
				
				
		      				out.println("<td><div align='center'><a href='#' onclick=deleteeva("+assessmentInfo.getId()+")>删除</a></div></td>");
	      			
	      		out.println("</tr>");
			
				}
			
			
			
			
			}
				
		
		
		
	      	
      		
      
       %>
 
    </table>
    </td>
  </tr>
</table>
</form>
  </body>
</html>
