package com.control.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BulletinDAO;
import com.entity.PageModel;
import com.util.PublicToolPageModel;

public class Bulletin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 576120301744910058L;

	/**
	 * Constructor of the object.
	 */
	public Bulletin() {
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
		
		String cp = request.getParameter("cp");
		
		BulletinDAO bdao = new BulletinDAO();
		int sumBulletinCount = bdao.getSumBulletinCount();
		
		//���÷�ҳPageModel����
		PageModel pm = PublicToolPageModel.getPageInfo(request, sumBulletinCount,12,cp);
			
		//��ѯ���е���Ʒ��Ϣ		
		ArrayList<Object>  moreBulletinInfoList = bdao.getPageModel(pm);
		
		//��moreProductInfoList��Ϣ�����Request��,Ȼ����ת����ʾҳ��
		request.setAttribute("moreBulletinInfoList", moreBulletinInfoList);
		request.getRequestDispatcher("../web/moreBulletin.jsp").forward(request, response);
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
