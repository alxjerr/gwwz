package com.util;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;


public class Validate {
	
	/**
	 * �Ƿ�Ϊ���ֺ�Ӣ����֤
	 *
	 */
	public int getIntAndChar(String str){
		char c;
		int i;
		for (i = 0; i<str.length(); i++){
			c = str.charAt(i);
			if(!((c>='0' && c<='9') || (c>='a' && c<='z') || (c>='A' && c<='Z'))){
				break;
			}
		}//�ж��ַ��Ƿ���ĳ������
		if(i < str.length()){
			return -1;
		}else{
			return 0;
		}
	}
	
	/**
	 * �Ƿ�Ϊ������֤
	 *
	 */
	public int getInt(String str){
		char c;
		int i;
		for (i = 0; i<str.length(); i++){
			c = str.charAt(i);
			if(!(c>='0' && c<='9')){
				break;
			}
		}//�ж��ַ��Ƿ���ĳ������
		if(i < str.length()){
			return -1;
		}else{
			return 0;
		}
	}
	
	/**
	 * �Ƿ�Ϊ�Ƿ��ַ���֤
	 *
	 */
	public boolean getLawlessChar(String str){
		boolean flag = false;
		char c;
		for(int i = 0;i < str.length();i++){
			c = str.charAt(i);
			switch(c){
			case '<' : flag = true; break;
			case '>' : flag = true; break;
			case '"' : flag = true; break;
			case '&' : flag = true; break;
			case ' ' : flag = true; break;
			}
		}
		return flag;
	}
	
	/**
	 * ����ת��
	 * ��gb2312����ת����unicode����
	 */
	public String getUnicode(String str) {
		if(str != null){
			try {
				return new String(str.getBytes("iso8859_1"),"gb2312");
			} catch (UnsupportedEncodingException e) {
				// TODO �Զ����� catch ��
				e.printStackTrace();
				return str;
			}
		}else{
			return null;
		}
	}
	
	/**
	 * ����ת��
	 * ��unicode����ת����gb2312����
	 */
	public String getGb2312(String str) {
		if(str != null){
			try {
				return new String(str.getBytes("gb2312"),"iso8859_1");
			} catch (UnsupportedEncodingException e) {
				// TODO �Զ����� catch ��
				e.printStackTrace();
				return str;
			}
		}else{
			return null;
		}
	}
	
	/**
	 * ��ʽ������ ��-��-�� Сʱ��0-23��:����:��
	 */
	public static String getSystemDate(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return df.format(date);
	}
	
	//���ڱȽ�   ���ڵ�ǰ���ڷ���TRUE ,�ȵ�ǰ���ڳ�,���ؼ�
	public  boolean getDateIfNow(String date) throws ParseException {
		
			String nowdate=getSystemDate();
		
			
			SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			Date ddd= new Date();
			ddd=formatDate.parse(date);   //���������
			
			
			Date xxx=new Date();
			xxx=formatDate.parse(nowdate);   //��ǰ����
			
		 boolean flag = ddd.before(xxx);
		 //if(flag)System.out.print("���ڽ���");else
		 //System.out.print("���ڽ���");
		return flag;
	}
		
	
/**     * DateתString  
   *      * @param count  
   * @return     
 * @throws ParseException */  
     public String datemmdd(String date) throws ParseException {  
	      
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd"); 
		Date ddd= new Date();
		ddd=formatDate.parse(date);
		formatDate = new SimpleDateFormat("MM��dd��");
		String str = formatDate.format(ddd);        
		String time;
		
		return str; 
	}
	
     public String datemmddtime(String date) throws ParseException {  
	      
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Date ddd= new Date();
		ddd=formatDate.parse(date);
		formatDate = new SimpleDateFormat("MM��dd��  HH:mm"); 
		String str = formatDate.format(ddd);        
		String time;
		
		return str; 
	}
	
	
	
	/**
	 * ��ʽ������ ��-��
	 */
	public String getSystemDatemmdd(){
		SimpleDateFormat df = new SimpleDateFormat("MM��dd��");
		Date date = new Date();
		return df.format(date);
	}
	
	
	
	
	/**
	 * ��������
	 */
	public float getRround(float f){
		int tem = (int)(f*100+0.5);
		float ff = ((float)tem/100);
		return ff;
	}
}
