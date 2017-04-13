package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.util.PublicToolCheckParam;

public class CheckAdminLoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		String userName = (String)session.getAttribute("userName");
		if(!PublicToolCheckParam.checkNullAndEmpty(userName)){
			((HttpServletRequest)request).getRequestDispatcher("../admin.jsp").forward(request,response);
		}
		else{
			//������ת
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
