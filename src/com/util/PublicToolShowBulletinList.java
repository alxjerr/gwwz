package com.util;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BulletinDAO;
import com.dao.UserInfoDAO;
import com.entity.BulletinInfo;
import com.entity.PageModel;
import com.entity.UserInfo;

public class PublicToolShowBulletinList {
	
	public static void searchBulletin(HttpServletRequest request, HttpServletResponse response,String cp,String key){
		
		
		UserInfoDAO udao = new UserInfoDAO();
		BulletinDAO bdao = new BulletinDAO();
		

		int sumCount =  bdao.getSumSearchBulletinCount(key);
		
		//���÷�ҳPageModel����
		PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
			
		//��ѯ���е���Ʒ��Ϣ		
		ArrayList<Object>  bulletinList = bdao.searchBulletin(pm, key);
		ArrayList<String> userNameList = new ArrayList<String>();
		if(bulletinList != null){
			for(int i=0;i<bulletinList.size();i++){
				int userId = ((BulletinInfo)bulletinList.get(i)).getUserId();
				UserInfo userInfo = udao.getUserName(userId);
				userNameList.add(userInfo.getUserName());
			}
		}
		request.setAttribute("userNameList",userNameList);
		request.setAttribute("bulletinList", bulletinList);
	}
	
	
	public static void showBulletinList(HttpServletRequest request, HttpServletResponse response,String cp){
		
		
		UserInfoDAO udao = new UserInfoDAO();
		BulletinDAO bdao = new BulletinDAO();
	
		int sumCount = bdao.getSumBulletinCount();

		//���÷�ҳPageModel����
		PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);
			
		//��ѯ���е���Ʒ��Ϣ		
		ArrayList<Object>  bulletinList = bdao.getPageModel(pm);
		ArrayList<String> userNameList = new ArrayList<String>();
		if(bulletinList != null){
			for(int i=0;i<bulletinList.size();i++){
				int userId = ((BulletinInfo)bulletinList.get(i)).getUserId();
				UserInfo userInfo = udao.getUserName(userId);
				userNameList.add(userInfo.getUserName());
			}
		}
		request.setAttribute("userNameList",userNameList);
		request.setAttribute("bulletinList", bulletinList);

	}

}
