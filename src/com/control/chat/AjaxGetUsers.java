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

@SuppressWarnings("serial")
public class AjaxGetUsers extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AjaxGetUsers() {
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
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		
		String email = (String)session.getAttribute("email");
		//��ȡ��ǰ���û��б���û�ͷ����б�
		ArrayList<String> emailList = (ArrayList<String>)application.getAttribute("emailList");

		//����û��б�Ϊ��
		if(emailList == null){
			out.println("<h5><font color='#996699'size='2'>�����û�</font><font color='#FF6699' size='2'>["+0+"]</font></h5>");
		}
		//����û��б�Ϊ�գ��򽫵�ǰ����������ֵ��current_userNum
		else{
			out.println("<h5><font color='#996699'size='2'>�����û�</font><font color='#FF6699' size='2'>["+emailList.size()+"]</font></h5>");
		}
		out.println("<table>");
		//���ú���ʾ���찴ť��Q����������
		if(email != null){
			for(int i=0;i<emailList.size();i++){
				//����û��б���ĳ���û����͵�ǰ���û����ǳ���ͬ������ø����찴ť
				if(emailList.get(i).equals(email)){
					out.println("<tr><td><font size='2' color='#FF6600'><strong>"+emailList.get(i)+"</strong></font></td><td><input id='"+emailList.get(i)+"' type='button' disabled='true' value='Q��(��)'/></td></tr>");
				}
				//��֮��ʣ�µ����찴ť������Ϊ��ʾ
				else{
					out.println("<tr><td><font size='2' color='#FF6600'><strong>"+emailList.get(i)+"</strong></font></td><td><input onclick='getBtnVal()' id='"+emailList.get(i)+"' type='button' value='Q��(��)'/></td></tr>");
				}
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
