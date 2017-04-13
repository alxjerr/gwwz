package com.util;
public class PublicToolCheckParam {
	
	public static boolean checkNullAndEmpty(Object obj){
		
		if(obj != null && !obj.toString().trim().equals("")){
			return true;
		}
		return false;
	}
}
