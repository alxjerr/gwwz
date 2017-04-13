package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import com.common.DBConn;
import com.entity.OrderInfo;
import com.entity.PageModel;
import com.util.PublicToolCheckParam;
public class OrderInfoDAO {
	
	public OrderInfo addAndGetOrderInfo(int customerId){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String orderTime = sdf.format(new Date());
		String sql  = "insert into OrderInfo  (`customerId`, `status`, `orderTime`)  values("+customerId+",0,'"+orderTime+"')";
		Connection conn = DBConn.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = conn.prepareStatement("select * from OrderInfo where orderId = @@identity");   
			rs = pstmt.executeQuery();   
			
			if(rs.next()){							
				OrderInfo od = new OrderInfo();				
				od.setOrderId(rs.getInt("orderId"));
				od.setCustomerId(rs.getInt("customerId"));
				od.setStatus(rs.getInt("status"));
				od.setOrderTime(rs.getString("orderTime"));
				
				return od;
			}
			
			return null;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			
			DBConn.CloseConn(rs, pstmt, conn);
		}
		return null;
	}
	
	
	public void deleteOrder(int orderId){
		String sql1 = "delete from OrderGoodsInfo where orderId="+orderId;
		DBConn.ExecuteUD(sql1);
		String sql2 = "delete from OrderInfo where orderId="+orderId;
		DBConn.ExecuteUD(sql2);
	}
	
	public OrderInfo getOrderInfo(int orderId){
		
		String sql = "select * from OrderInfo where orderId="+orderId;
		ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
		
		if(list != null){
			if(list.size() == 1){
				return (OrderInfo)list.get(0);
			}
		}
		return null;
	}
	
	
public ArrayList<Object> getOrderInfoByCustomerId(int customerId){
		
		String sql = "select * from OrderInfo where customerId="+customerId;
		return DBConn.ExecuteQuery(sql, new OrderInfo());
	}
	


	
//****************show all order for admin	*******************
public ArrayList<Object> getPageModel(PageModel pm){
		
		//int everyPageBulletinCount = pm.getEveryPageCount();//
		
		//int currentPage = pm.getCurrentPage();//��ǰҳ
		
		//if(pm.getSumCount()%everyPageBulletinCount != 0 && currentPage == pm.getLastPage()){
			
		//	everyPageBulletinCount = pm.getSumCount()%everyPageBulletinCount;
			
		//}
		
		//Debug.println("sql",sql);
String sql  = "select * from   OrderInfo  limit "+((pm.getCurrentPage()-1)*pm.getEveryPageCount())+","+(pm.getEveryPageCount()*pm.getCurrentPage());
		//Debug.println("sql",sql);
		return DBConn.ExecuteQuery(sql, new OrderInfo());
	}



public int getSumOrderCount(){

	String sql = "select * from OrderInfo";
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	
	if(list != null){
		return list.size();
	}
	return 0;
}

//��ȷ������
public int getqueren(){

	String sql = "select * from OrderInfo where status=1";
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	
	if(list != null){
		return list.size();
	}
	return 0;
}
//δȷ������
public int getwqueren(){

	String sql = "select * from OrderInfo where status=0";
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	
	if(list != null){
		return list.size();
	}
	return 0;
}
//�˻�����
public int gettuihuo(){

	String sql = "select * from OrderInfo where status=101";
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	
	if(list != null){
		return list.size();
	}
	return 0;
}



public int getSumSearchOrderCount(String key){
	
	String sql  = "select * from OrderInfo where orderTime like '%"+key+"%'";
	
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	if(list != null){
		return list.size();
	}
	return 0;

}

//��ȷ������
public int getsqueren(String key){

	String sql = "select * from OrderInfo where status=1 and  orderTime like '%"+key+"%'";
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	
	if(list != null){
		return list.size();
	}
	return 0;
}
//δȷ������
public int getswqueren(String key){

	String sql = "select * from OrderInfo where status=0  and  orderTime like '%"+key+"%'";
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	
	if(list != null){
		return list.size();
	}
	return 0;
}
//�˻�����
public int getstuihuo(String key){

	String sql = "select * from OrderInfo where status=101 and  orderTime like '%"+key+"%'";
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	
	if(list != null){
		return list.size();
	}
	return 0;
}









public ArrayList<Object> searchBulletin(PageModel pm,String key){
	
	
    String sql  = "select * from   OrderInfo where orderTime like '%"+key+"%'  limit  "+((pm.getCurrentPage()-1)*pm.getEveryPageCount())+","+(pm.getEveryPageCount()*pm.getCurrentPage());
 	return DBConn.ExecuteQuery(sql, new OrderInfo());
}

//****************show all order for admin	*******************



	
//****************show all order for third	*******************
public ArrayList<Object> getPageModelforthird(PageModel pm,String thirdId){
		
	
		
    String sql  = "select * from   OrderInfo where ";

 		 //�༶��ѯ�ȴ���Ʒ���ѯ����������Ʒ��Ȼ��Ӷ�����ϸ���ѯ��Ӧ�Ķ˿ڵĶ����ţ�Ȼ�󵽶������ѯ��Ӧ�Ķ����� 
		sql=sql+ " orderid in (select orderid from OrdergoodsInfo where  goodsid in (select goodsid from goodsinfo where userid='"+thirdId+"')) ";
		
	sql=sql+  "   limit  "+((pm.getCurrentPage()-1)*pm.getEveryPageCount())+","+(pm.getEveryPageCount()*pm.getCurrentPage());
		//sql=sql+ "order by orderId desc) as a order by orderId desc) as b order by orderId desc";
		return DBConn.ExecuteQuery(sql, new OrderInfo());
	}





public int getSumOrderCountforthird(String thirdId){

	String sql = "select * from OrderInfo where   orderid in (select orderid from OrdergoodsInfo where  goodsid in (select goodsid from goodsinfo where userid='"+thirdId+"')) ";
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	
	if(list != null){
		return list.size();
	}
	return 0;
}



public int getSumSearchOrderCountforthird(String key,String thirdId){
	
	String sql  = "select * from OrderInfo where orderTime like '%"+key+"%' and  orderid in (select orderid from OrdergoodsInfo where  goodsid in (select goodsid from goodsinfo where userid='"+thirdId+"')) ";
	
	ArrayList<Object> list = DBConn.ExecuteQuery(sql, new OrderInfo());
	if(list != null){
		return list.size();
	}
	return 0;

}


public ArrayList<Object> searchBulletinforthird(PageModel pm,String key,String thirdId){
	

    String sql  = "select * from   OrderInfo where orderTime like '%"+key+"%'  and   orderid in (select orderid from OrdergoodsInfo where  goodsid in (select goodsid from goodsinfo where userid='"+thirdId+"')   limit "+((pm.getCurrentPage()-1)*pm.getEveryPageCount())+","+(pm.getEveryPageCount()*pm.getCurrentPage());

 	return DBConn.ExecuteQuery(sql, new OrderInfo());
}

//****************show all order for third	*******************










public void updateOrderStatus(int orderId,int status){
	
	if(PublicToolCheckParam.checkNullAndEmpty(status)){
		if(status == 1){
			status = 0;
		}
		else if(status == 0){
			status = 1;
		}
	}
	
	String sql  = "update OrderInfo set status = "+status+" where orderId="+orderId;
	DBConn.ExecuteUD(sql);
}



}
