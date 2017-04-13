package com.control.chat;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxGetPrivateChatMessage extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5165812798522426194L;
	public static int isNewPrivateChatMessage = -1;

	/**
	 * Constructor of the object.
	 */
	public AjaxGetPrivateChatMessage() {
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

		//���������
		PrintWriter out = response.getWriter();
		//����һ��application
		ServletContext application = getServletContext();
		
		ArrayList<String> privateChatMessageList = (ArrayList<String>)application.getAttribute("privateChatMessageList");
		out.println("<table id='privateChatMessageList'");
		if(privateChatMessageList!=null ){
			for(String privateChatMsg:privateChatMessageList){
				//��������������Ϣ��ҳ��
				out.println(privateChatMsg);
			}
			if(isNewPrivateChatMessage<privateChatMessageList.size()){
				//���������Ϣ�����ӣ������һ����Ϣ����
				out.println("<bgsound src='../sound/message.wav' />");
				isNewPrivateChatMessage=privateChatMessageList.size();
			}		
		}
		out.println("</table>");
		out.flush();
		out.close();
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
