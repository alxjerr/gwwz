package com.util;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CustomerInfoDAO;
import com.entity.PageModel;

public class PublicToolShowCustomerInfoList {

	
public static void searchCustomerInfo(HttpServletRequest request, HttpServletResponse response,String cp,String key){
	
	
	CustomerInfoDAO  cdao = new CustomerInfoDAO();
	
	int sumCount = cdao.getSumSearchCustomerCount(key);
	
	//���÷�ҳPageModel����
	PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
		
	//��ѯ���е���Ʒ��Ϣ		
	ArrayList<Object>  customerInfoList = cdao.searchCustomerInfo(pm, key);
	request.setAttribute("customerInfoList",customerInfoList);
	}
	
	
	public static void showCustomerInfoList(HttpServletRequest request, HttpServletResponse response,String cp){
			
			
			CustomerInfoDAO  cdao = new CustomerInfoDAO();
		
			int sumCount = cdao.getSumCustomerCount();
			//���÷�ҳPageModel����
			PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
				
			//��ѯ���е���Ʒ��Ϣ		
			ArrayList<Object>  customerInfoList = cdao.getPageModel(pm);
			request.setAttribute("customerInfoList",customerInfoList);
		}
}
