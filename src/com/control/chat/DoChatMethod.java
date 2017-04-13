package com.control.chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.PublicToolCheckParam;

public class DoChatMethod extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6060042764707582905L;

	/**
	 * Constructor of the object.
	 */
	public DoChatMethod() {
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
			if(method.equals("login")){
				login(request,response);
			}
			else if(method.equals("loginOut")){
				loginOut(request,response);
			}
		}
		
	}
	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	
	@SuppressWarnings("unchecked")
	public void login(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		
		String email = (String)session.getAttribute("email");
		
		ArrayList<String> messageList = null;
		ArrayList<String> emailList = null;
		String message = null;
		synchronized(application){
			//获取在线用户列表
			messageList = (ArrayList<String>)application.getAttribute("messageList");
			if(messageList == null){
				//如果用户列表，则重新new一个ArrayList
				messageList = new ArrayList<String>();
			}
	
			message = "<font size='2' color='#FF0000'>【系统提示】</font><font color='#0099CC' size='2'>用户【"+email+"】进入聊天室</font><br />";
	
			messageList.add(message);
			//同时存储用户列表和用户头像
			application.setAttribute("messageList",messageList);
			
			
			emailList = (ArrayList<String>)application.getAttribute("emailList");
			if(emailList == null){
				emailList = new ArrayList<String>();
			}
			if(!emailList.contains(email)){
				emailList.add(email);
				application.setAttribute("emailList", emailList);
			}
			
		}
		response.sendRedirect("../chat/index.jsp");
	}

	@SuppressWarnings("unchecked")
	public void loginOut(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		String email = (String)session.getAttribute("email");
		String message = null;
		if(email != null){
			ArrayList<String> emailList = (ArrayList<String>)application.getAttribute("emailList");
			if(emailList != null){
				//设置用户下线的信息提示格式
				message = "<font font size='2' color='#FF0000'>【系统提示】</font><font color='#666666' size='2'>用户【"+email+"】离开聊天室</font><br />";
				//将当前用户从用户列表中移除
				emailList.remove(email);

				ArrayList<String> messageList = null;
				synchronized(application){
					//获取所有的群聊消息
					messageList = (ArrayList<String>)application.getAttribute("messageList");
					if(messageList==null){
						//如果群聊消息为空，则重新new一个ArrayList
						messageList = new ArrayList<String>();
					}
					//将用户下线提示信息加入到群聊消息列表中去
					messageList.add(message);
					//将群聊消息列表、用户列表、用户头像列表存放到application中
					application.setAttribute("messageList", messageList);
					application.setAttribute("emailList",emailList);
					
				}
				//跳转至登陆页面
				response.sendRedirect("../servlet/DisplayInfo");
			}
		}	
}

}
