package com.control.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserInfoDAO;
import com.entity.UserInfo;
import com.util.PublicToolCheckParam;
import com.util.PublicToolPageModel;
import com.entity.PageModel;
import java.util.ArrayList;
import com.entity.PageModel;

public class UpdateUserInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6101002376282176066L;

	public static void checkOldUserPwd(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
			
			PrintWriter out = response.getWriter();
			String oldUserPwd = request.getParameter("oldUserPwd");
			HttpSession session = request.getSession();
			String userName = (String)session.getAttribute("userName");
			if(PublicToolCheckParam.checkNullAndEmpty(userName)){
				UserInfoDAO udao = new UserInfoDAO();
				UserInfo ur =  udao.getUserId(userName);
				if(udao.checkOldUserPwd(ur.getId(), oldUserPwd) == false){
					out.println("�����벻��ȷ!����������!");
				}
				else{
					out.println("��������ȷ!");
				}
		}
}

	public static void showUpdatePasswordPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		request.getRequestDispatcher("../admin/updatePassword.jsp").forward(request, response);
}

	public static void showUpdateUserNamedPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		request.getRequestDispatcher("../admin/updateUserName.jsp").forward(request, response);
}

	public static void updateUserName(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
			
			String newUserName = request.getParameter("userName");
			HttpSession session = request.getSession();
			String userName = (String)session.getAttribute("userName");
			if(PublicToolCheckParam.checkNullAndEmpty(userName)){
				UserInfoDAO udao = new UserInfoDAO();
				UserInfo ur =  udao.getUserId(userName);
				udao.updateUserName(ur.getId(), newUserName);
				request.setAttribute("url", "../admin/ok.jsp");
				session.setAttribute("userName", newUserName);
				session.setAttribute("msg", "�޸��û����ɹ�");
				request.getRequestDispatcher("../admin/systemManage.jsp").forward(request, response);
		}
}
	



//ɾ�� �û���Ϣ
public  static void deleteInfo(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
		String Id = request.getParameter("Id");
			UserInfoDAO udao = new UserInfoDAO();
			udao.deleteUserInfo(Integer.parseInt(Id));
						request.setAttribute("error", "�ɹ�ɾ����");
		request.getRequestDispatcher("../servlet/UpdateUserInfo?method=showManageUserInfoPage").forward(request, response);
			
	}


//���������û���Ϣ
public static void insertInfo(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
			String str_userName = request.getParameter("username");
			String str_userRole = request.getParameter("userrole");
			String str_userPwd = "123456";
			//String deadline = request.getParameter("deadline");
			UserInfoDAO udao = new UserInfoDAO();

				udao.addUserInfo(str_userName,str_userPwd, str_userRole);
						request.setAttribute("error", "�ɹ������û����û���ʼ����Ϊ123456 ��");
		
		request.getRequestDispatcher("../servlet/UpdateUserInfo?method=showManageUserInfoPage").forward(request, response);
		
	}


	//��ʾ�����û�ҳ��
	public static void showAddUserInfoPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		request.getRequestDispatcher("../admin/addUserInfo.jsp").forward(request, response);
}
	
	//��ʾϵͳ�û�����ҳ��
	
		public static void showManageUserInfoPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		String cp = request.getParameter("cp");
		
		
			UserInfoDAO udao = new UserInfoDAO();
			
			int sumCount = udao.getSumUserCount();
	
			//���÷�ҳPageModel����
			PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
				
			//��ѯ���е���Ϣ		
			ArrayList<Object>  userInfoList = udao.getPageModelOfAllUser(pm);
			request.setAttribute("userInfoList", userInfoList);
		
		
		request.getRequestDispatcher("../admin/manageUserInfo.jsp").forward(request, response);
	
	}





//�༭�û���Ϣ
	public static void edituserInfo(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		String submit = request.getParameter("submit");
		String userId = request.getParameter("Id");
		if(PublicToolCheckParam.checkNullAndEmpty(submit)){
				if(submit.equals("1")){
					
					String str_userName = request.getParameter("username");
					String str_userRole = request.getParameter("userrole");
					//String deadline = request.getParameter("deadline");
					UserInfoDAO udao = new UserInfoDAO();
					
					
					
					
					
					udao.updateUserInfo(Integer.parseInt(userId),str_userName, str_userRole);
					
					
					request.setAttribute("error", "�ɹ��޸��û� ��");		
					request.getRequestDispatcher("../servlet/UpdateUserInfo?method=showManageUserInfoPage").forward(request, response);
					
					
					
				
				}
		}else{
						//String userId = request.getParameter("Id");
					String str_userName = request.getParameter("username");
					String str_userRole = request.getParameter("userrole");
					 userId = request.getParameter("Id");
						request.setAttribute("userId", userId);
						request.setAttribute("userName", str_userName);
						request.setAttribute("userRole", str_userRole);
						request.getRequestDispatcher("../admin/updateUserInfo.jsp").forward(request, response);
				}
	}
	


	
	public static void updateUserPwd(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		String userPwd = request.getParameter("newUserPwd");
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		if(PublicToolCheckParam.checkNullAndEmpty(userName) && PublicToolCheckParam.checkNullAndEmpty(userPwd)){
			UserInfoDAO udao = new UserInfoDAO();
			UserInfo ur =  udao.getUserId(userName);
			udao.updateUserPwd(ur.getId(), userPwd);
			request.setAttribute("msg", "�޸�����ɹ�");
			request.getRequestDispatcher("../admin/ok.jsp").forward(request, response);
		}
}
	
	
	
	/**
	 * Constructor of the object.
	 */
	public UpdateUserInfo() {
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
			if(method.equals("showUpdatePasswordPage")){
				showUpdatePasswordPage(request, response);
			}
			else if(method.equals("showUpdateUserNamedPage")){
				showUpdateUserNamedPage(request, response);
			}
			else if(method.equals("updateUserPwd")){
				updateUserPwd(request, response);
			}
			else if(method.equals("updateUserName")){
				updateUserName(request, response);
			}
			else if(method.equals("checkOldUserPwd")){
				checkOldUserPwd(request, response);
			}
			else if(method.equals("showManageUserInfoPage")){
				showManageUserInfoPage(request, response);
			}
			else if(method.equals("showAddUserInfoPage")){
				showAddUserInfoPage(request, response);
			}
			
						else if(method.equals("insert")){
			
				insertInfo(request, response);
			}
			else if(method.equals("delete")){
				deleteInfo(request, response);
			}
			else if(method.equals("edituserInfo")){
				edituserInfo(request, response);
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

}
