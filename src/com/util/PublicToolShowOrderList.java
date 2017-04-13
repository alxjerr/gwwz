package com.util;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.OrderInfoDAO;
import com.entity.PageModel;


public class PublicToolShowOrderList {

//show all order for admin	
public static void searchOrder(HttpServletRequest request, HttpServletResponse response,String cp,String key){
	
	
	OrderInfoDAO odao = new OrderInfoDAO();
	
	int sumCount = odao.getSumSearchOrderCount(key);
	
	//���÷�ҳPageModel����
	PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
		
	//��ѯ���е���Ʒ��Ϣ		
	ArrayList<Object>  orderList = odao.searchBulletin(pm, key);
	
	request.setAttribute("orderInfoList", orderList);
	}
	
	
	public static void showOrderList(HttpServletRequest request, HttpServletResponse response,String cp){
			
			
			OrderInfoDAO odao = new OrderInfoDAO();
		
			int sumCount = odao.getSumOrderCount();
			//���÷�ҳPageModel����
			PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
				
			//��ѯ���е���Ʒ��Ϣ		
			ArrayList<Object>  orderList = odao.getPageModel(pm);
			request.setAttribute("orderInfoList",orderList);
		}











//show all order for third

public static void searchOrderforthird(HttpServletRequest request, HttpServletResponse response,String cp,String key,String thirdId){
	
	
	OrderInfoDAO odao = new OrderInfoDAO();
	
	int sumCount = odao.getSumSearchOrderCountforthird(key,thirdId);
	
	//���÷�ҳPageModel����
	PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
		
	//��ѯ���е���Ʒ��Ϣ		
	ArrayList<Object>  orderList = odao.searchBulletinforthird(pm, key,thirdId);
	
	request.setAttribute("orderInfoList", orderList);
	}
	
	
	public static void showOrderListforthird(HttpServletRequest request, HttpServletResponse response,String cp,String thirdId){
			
			
			OrderInfoDAO odao = new OrderInfoDAO();
		
			int sumCount = odao.getSumOrderCountforthird(thirdId);
			//���÷�ҳPageModel����
			PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
				
			//��ѯ���е���Ʒ��Ϣ		
			ArrayList<Object>  orderList = odao.getPageModelforthird(pm,thirdId);
			request.setAttribute("orderInfoList",orderList);
		}



}
