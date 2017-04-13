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
			//��ȡ�����û��б�
			messageList = (ArrayList<String>)application.getAttribute("messageList");
			if(messageList == null){
				//����û��б�������newһ��ArrayList
				messageList = new ArrayList<String>();
			}
	
			message = "<font size='2' color='#FF0000'>��ϵͳ��ʾ��</font><font color='#0099CC' size='2'>�û���"+email+"������������</font><br />";
	
			messageList.add(message);
			//ͬʱ�洢�û��б���û�ͷ��
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
				//�����û����ߵ���Ϣ��ʾ��ʽ
				message = "<font font size='2' color='#FF0000'>��ϵͳ��ʾ��</font><font color='#666666' size='2'>�û���"+email+"���뿪������</font><br />";
				//����ǰ�û����û��б����Ƴ�
				emailList.remove(email);

				ArrayList<String> messageList = null;
				synchronized(application){
					//��ȡ���е�Ⱥ����Ϣ
					messageList = (ArrayList<String>)application.getAttribute("messageList");
					if(messageList==null){
						//���Ⱥ����ϢΪ�գ�������newһ��ArrayList
						messageList = new ArrayList<String>();
					}
					//���û�������ʾ��Ϣ���뵽Ⱥ����Ϣ�б���ȥ
					messageList.add(message);
					//��Ⱥ����Ϣ�б��û��б��û�ͷ���б��ŵ�application��
					application.setAttribute("messageList", messageList);
					application.setAttribute("emailList",emailList);
					
				}
				//��ת����½ҳ��
				response.sendRedirect("../servlet/DisplayInfo");
			}
		}	
}

}
