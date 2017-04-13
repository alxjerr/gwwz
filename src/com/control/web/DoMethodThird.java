package com.control.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CustomerDetailInfoDAO;
import com.dao.CustomerInfoDAO;
import com.dao.GoodsEvaluateDAO;
import com.dao.OrderInfoDAO;
import com.dao.ServiceAssessmentDAO;
import com.dao.ThirdInfoDAO;
import com.entity.ThirdInfo;
import com.entity.ServiceAssessment;
import com.util.PublicToolCheckParam;
import com.util.PublicToolParam;

public class DoMethodThird extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 712262377940917206L;

	public static void checkEmail(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String regEmail = request.getParameter("regEmail");
		CustomerInfoDAO cdao = new CustomerInfoDAO();
		boolean isRegEmailExist = cdao.checkEmail(regEmail);
		if(isRegEmailExist == true){
			out.println("该邮箱已被注册!请换个邮箱!");
			
		}
		else{
			out.println("该邮箱未被注册!");
		}
	}

	public static void checkLogin(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		CustomerInfoDAO cdao = new CustomerInfoDAO();
		boolean isRegisted = cdao.checkLogin(email, pwd);
		if(isRegisted == false){
			
			request.setAttribute("error", "用户名或密码不正确,请重新输入!");
			request.getRequestDispatcher(PublicToolParam.LOGINORREGISTER).forward(request, response);
		}
		else{
			boolean isCooled = cdao.isCooled(email);
			if(isCooled == true){
				request.setAttribute("error", "该账号未被审核!请换用其他账号登陆或等待审核!");
				request.getRequestDispatcher(PublicToolParam.LOGINORREGISTER).forward(request, response);
			}
			else{
				session.setAttribute("email",email);
				response.sendRedirect("../");
			}
		}
	
}

	public static void loginOut(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		session.removeAttribute("thirdemail");
		session.removeAttribute(PublicToolParam.SHOPLIST);
		response.sendRedirect("../");
	
}

	@SuppressWarnings("static-access")
	public static void register(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String regEmail = request.getParameter("regEmail");
		String regPwd = request.getParameter("regPwd");
		String thirdName = request.getParameter("thirdName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		ThirdInfoDAO cdao = new ThirdInfoDAO();
		cdao.addThird(regEmail, regPwd,thirdName,phone,address);
		ThirdInfo ThirdInfo = cdao.getThirdInfo(regEmail);
		int thirdId = ThirdInfo.getId();
		//ThirdDetailInfoDAO cddao = new ThirdDetailInfoDAO();
		//cddao.addCustomerDetailInfo(customerId, "无", "无", "无", "无");
		//if(name != null){
		//	if(!PublicToolCheckParam.checkNullAndEmpty(telephone)){
		//		telephone = "无";
		//	}
		//	if(!PublicToolCheckParam.checkNullAndEmpty(movePhone)){
	//			movePhone = "无";
	//		}
	//		cddao.updateCustomerDdtailInfo(customerId, name, telephone, movePhone, address);
		//}
		//session.setAttribute("thirdemail", regEmail);
		response.sendRedirect("../filterWeb/ok1third.jsp");
}
	
	
	/**
	 * Constructor of the object.
	 */
	public DoMethodThird() {
		super();
	}
	
	
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");
		if(PublicToolCheckParam.checkNullAndEmpty(method)){
			if(method.equals("checkEmail")){
				checkEmail(request, response);
			}
			else if(method.equals("checkLogin")){
				checkLogin(request, response);
			}
			else if(method.equals("register")){
				register(request, response);
			}
			else if(method.equals("loginOut")){
				loginOut(request, response);
			}
			/*else if(method.equals("showMyInformation")){
				showMyInformation(request, response);
			}*/
		}
	}
	
	
/*	@SuppressWarnings("static-access")
	public static void showMyInformation(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		if(email != null){
			ThirdInfoDAO cdao = new ThirdInfoDAO();
			ThirdInfo ThirdInfo = cdao.getThirdInfo(email);
			int thirdId = ThirdInfo.getId();
			
		//	CustomerDetailInfoDAO cddao = new CustomerDetailInfoDAO();
		//	CustomerDetailInfo customerDetailInfo = cddao.getCustomerDetailInfo(customerId);
			
			OrderInfoDAO odao = new OrderInfoDAO();
			ArrayList<Object> orderList = odao.getOrderInfoByCustomerId(customerId);
			
			GoodsEvaluateDAO gedao = new GoodsEvaluateDAO();
			ArrayList<Object> goodsEvaluateList = gedao.selectGoodsEvaluateInfoByEmail(email);
			
			ServiceAssessmentDAO sdao = new ServiceAssessmentDAO();
			String isInsert = request.getParameter("isInsert");
			if(isInsert != null){
				if(isInsert.equals("insert")){
					String serviceAssessment = request.getParameter("serviceAssessment");
					sdao.insertServiceAssessment(customerId, serviceAssessment);
					ArrayList<Object> serviceAssessmentList = sdao.selectServiceAssessment(customerId);
					if(serviceAssessmentList != null){
						for(int i=0;i<serviceAssessmentList.size();i++){
							ServiceAssessment serviceAssessmentInfo = (ServiceAssessment)serviceAssessmentList.get(i);
							out.println(""+serviceAssessmentInfo.getAssessmentTime()+"&nbsp;&nbsp;&nbsp;&nbsp;您评价道：&nbsp;&nbsp;"+serviceAssessmentInfo.getServiceAssessment()+"<br/><br/>");
						}
					}
				}
			}
			else{
				ArrayList<Object> serviceAssessmentList = sdao.selectServiceAssessment(customerId);
				
				request.setAttribute("serviceAssessmentList", serviceAssessmentList);
				request.setAttribute("goodsEvaluateList", goodsEvaluateList);
				request.setAttribute("orderList", orderList);
				request.setAttribute("customerDetailInfo", customerDetailInfo);
				request.setAttribute("customerInfo", customerInfo);
				request.getRequestDispatcher("../filterWeb/myInformation.jsp").forward(request, response);
			}
		}
}
*/

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
