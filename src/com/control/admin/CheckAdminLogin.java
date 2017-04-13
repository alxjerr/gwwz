package com.control.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserInfoDAO;
import com.entity.UserInfo;

public class CheckAdminLogin extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = -1918708208545995271L;

    public static void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("pwd");
        UserInfoDAO udao = new UserInfoDAO();
        boolean isExist = udao.checkAdminLogin(userName, pwd);
        if (isExist == true) {
            //取得当前的时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentTime = sdf.format(new Date());
            //取权限
            UserInfo ur = udao.getUserId(userName);
            int role = ur.getRole();
            session.setAttribute("role", String.valueOf(role));
            session.setAttribute("userName", userName);
            session.setAttribute("currentTime", currentTime);
            request.getRequestDispatcher("../admin/systemManage.jsp").forward(request, response);
        } else {
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript' content='text/html; charset=UTF-8'>alert('Your Password Wrong');window.location.href='../admin.jsp';</script>");
        }
    }

    public static void loginOut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("userName");
        session.removeAttribute("role");
        response.sendRedirect("../admin.jsp");
    }

    /**
     * Constructor of the object.
     */
    public CheckAdminLogin() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method = request.getParameter("method");
        if (method.equals("login")) {
            login(request, response);
        } else if (method.equals("loginOut")) {
            loginOut(request, response);
        }
    }

    public void init() throws ServletException {
        // Put your code here
    }

}
