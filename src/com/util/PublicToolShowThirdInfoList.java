package com.util;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ThirdInfoDAO;
import com.entity.PageModel;

public class PublicToolShowThirdInfoList {

	
public static void searchThirdInfo(HttpServletRequest request, HttpServletResponse response,String cp,String key){
	
	
	ThirdInfoDAO  cdao = new ThirdInfoDAO();
	
	int sumCount = cdao.getSumSearchThirdCount(key);
	
	//���÷�ҳPageModel����
	PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
		
	//��ѯ���е���Ʒ��Ϣ		
	ArrayList<Object>  ThirdInfoList = cdao.searchThirdInfo(pm, key);
	request.setAttribute("ThirdInfoList",ThirdInfoList);
	}
	
	
	public static void showThirdInfoList(HttpServletRequest request, HttpServletResponse response,String cp){
			
			
			ThirdInfoDAO  cdao = new ThirdInfoDAO();
		
			int sumCount = cdao.getSumThirdCount();
			//���÷�ҳPageModel����
			PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
				
			//��ѯ���е���Ʒ��Ϣ		
			ArrayList<Object>  ThirdInfoList = cdao.getPageModel(pm);
			request.setAttribute("ThirdInfoList",ThirdInfoList);
		}
}
