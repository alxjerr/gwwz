package com.control.chat;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AjaxCurrentPrivateChatState extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7711766133059169898L;

	/**
	 * Constructor of the object.
	 */
	public AjaxCurrentPrivateChatState() {
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
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//定义输出流
		PrintWriter out = response.getWriter();
		//定义一个session和application
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		
		ArrayList<String> sendToWhoList = (ArrayList<String>)application.getAttribute("sendToWhoList");
		ArrayList<String> receiveFromWhoList = (ArrayList<String>)application.getAttribute("receiveFromWhoList");
		String currentPrivateChatState = null;
		
		String receiveFromWho = null;
		String email = (String)session.getAttribute("email");
		
		if(sendToWhoList != null){
			for(int i=0;i<sendToWhoList.size();i++){
				if(email.equals(sendToWhoList.get(i))){
					currentPrivateChatState = "1";
					receiveFromWho = receiveFromWhoList.get(i);
				}
			}
		}
		//将各个变量组成的动态字符串返回到页面
		out.println(currentPrivateChatState+"&"+email+"&"+receiveFromWho);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
