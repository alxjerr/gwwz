package com.dao;

import com.common.DBConn;
import com.entity.GoodsInfo;
import com.entity.PageModel;
import com.util.PublicToolCheckParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * @author student
 */
public class GoodsInfoDAO {

    public void addGoodsInfo(String typeDetailInfo, String goodsName, double price, float discount, int isNew, int isRecommend, int status, String photo, String remark, int countRequire, String thirdId, String iscoold) {

        String sql = null;
        if (!PublicToolCheckParam.checkNullAndEmpty(remark)) {
            remark = "��";
        }
        //if(!PublicToolCheckParam.checkNullAndEmpty(thirdId)){
        //	thirdId = null;
        //}

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String createdate = sdf.format(new Date());

        if (PublicToolCheckParam.checkNullAndEmpty(photo)) {
            if (PublicToolCheckParam.checkNullAndEmpty(thirdId)) {


                sql = "insert into GoodsInfo (`typeDetailInfo`, `goodsName`, `price`, `discount`, `isNew`, `isRecommend`, `status`, `photo`, `remark`, `countRequire`, `createdate`, `userid`, `isCooled`) values('" + typeDetailInfo + "','" + goodsName + "'," + price + "," + discount + "," + isNew + "," + isRecommend + "," + status + ",'" + photo + "','" + remark + "'," + countRequire + ",'" + createdate + "','" + thirdId + "','" + iscoold + "')";
            } else {
                sql = "insert into GoodsInfo (`typeDetailInfo`, `goodsName`, `price`, `discount`, `isNew`, `isRecommend`, `status`, `photo`, `remark`, `countRequire`, `createdate`, `userid`, `isCooled`) values('" + typeDetailInfo + "','" + goodsName + "'," + price + "," + discount + "," + isNew + "," + isRecommend + "," + status + ",'" + photo + "','" + remark + "'," + countRequire + ",'" + createdate + "'," + null + ",'" + iscoold + "')";
            }


        } else {
            if (PublicToolCheckParam.checkNullAndEmpty(thirdId)) {

                sql = "insert into GoodsInfo (`typeDetailInfo`, `goodsName`, `price`, `discount`, `isNew`, `isRecommend`, `status`, `photo`, `remark`, `countRequire`, `createdate`, `userid`, `isCooled`) values('" + typeDetailInfo + "','" + goodsName + "'," + price + "," + discount + "," + isNew + "," + isRecommend + "," + status + "," + null + ",'" + remark + "'," + countRequire + ",'" + createdate + "','" + thirdId + "','" + iscoold + "')";
            } else {

                sql = "insert into GoodsInfo (`typeDetailInfo`, `goodsName`, `price`, `discount`, `isNew`, `isRecommend`, `status`, `photo`, `remark`, `countRequire`, `createdate`, `userid`, `isCooled`) values('" + typeDetailInfo + "','" + goodsName + "'," + price + "," + discount + "," + isNew + "," + isRecommend + "," + status + "," + null + ",'" + remark + "'," + countRequire + ",'" + createdate + "'," + null + ",'" + iscoold + "')";

            }
        }

        DBConn.ExecuteUD(sql);
    }


    public void deleteGoodsInfo(int goodsId) {

        String sql = "delete from GoodsInfo where goodsId=" + goodsId;
        DBConn.ExecuteUD(sql);

    }


    public ArrayList<Object> getNewGoodsInfo() {

        String sql = "select * from GoodsInfo where status = 0 and iscooled = 0   order by goodsId desc  limit 0,8";


        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }


    public ArrayList<Object> getPageModel(PageModel pm, String typeDetailInfo) {

	/*	int everyPageProductCount = pm.getEveryPageCount();//ÿҳ��ʾ����Ʒ��
        int currentPage = pm.getCurrentPage();//��ǰҳ
		
		if(pm.getSumCount()%everyPageProductCount != 0 && currentPage == pm.getLastPage()){
			
			everyPageProductCount = pm.getSumCount()%everyPageProductCount;
			
		}
		else if(pm.getSumCount() < pm.getEveryPageCount()){
			
			everyPageProductCount = pm.getSumCount();
			
		}
	*/        //��������
        String sql = "select *   from GoodsInfo where typeDetailInfo = '" + typeDetailInfo + "'   limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());

        return DBConn.ExecuteQuery(sql, new GoodsInfo());

    }


    //admin show all goods
    public ArrayList<Object> getPageModelOfAllGoods(PageModel pm) {

        int everyPageProductCount = pm.getEveryPageCount();//ÿҳ��ʾ����Ʒ��
        int currentPage = pm.getCurrentPage();//��ǰҳ

        if (pm.getSumCount() % everyPageProductCount != 0 && currentPage == pm.getLastPage()) {

            everyPageProductCount = pm.getSumCount() % everyPageProductCount;

        } else if (pm.getSumCount() < pm.getEveryPageCount()) {

            everyPageProductCount = pm.getSumCount();

        }            //��������
        String sql = "select * from   GoodsInfo    limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());
/*if(pm.getCurrentPage()==1){	 sql  = "select * from ( select ROW_NUMBER() OVER(order by goodsId desc) as RowNum,* from GoodsInfo  ) as b where RowNum between "+((pm.getCurrentPage()-1)*pm.getEveryPageCount())+","+(pm.getEveryPageCount()*pm.getCurrentPage());
	}else{	
	 sql  = "select * from ( select ROW_NUMBER() OVER(order by goodsId desc) as RowNum,* from GoodsInfo  ) as b where RowNum between "+((pm.getCurrentPage()-1)*pm.getEveryPageCount()+1)+" and "+(pm.getEveryPageCount()*pm.getCurrentPage()+1);}
	*/
        return DBConn.ExecuteQuery(sql, new GoodsInfo());

    }

    //show third goods
    public ArrayList<Object> getPageModelOfAllGoodsforthirdId(PageModel pm, String thirdId) {

        int everyPageProductCount = pm.getEveryPageCount();//ÿҳ��ʾ����Ʒ��
        int currentPage = pm.getCurrentPage();//��ǰҳ

        if (pm.getSumCount() % everyPageProductCount != 0 && currentPage == pm.getLastPage()) {

            everyPageProductCount = pm.getSumCount() % everyPageProductCount;

        } else if (pm.getSumCount() < pm.getEveryPageCount()) {

            everyPageProductCount = pm.getSumCount();

        }            //��������
        String sql = "select * from  GoodsInfo  where userid='" + thirdId + "'   limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());
        return DBConn.ExecuteQuery(sql, new GoodsInfo());

    }

    /**
     * @return
     */
    public GoodsInfo getQueryGoodsInfo(int gid) {

        String sql = "select * from GoodsInfo where goodsId=" + gid;

        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsInfo());

        return (GoodsInfo) list.get(0);
    }


    /**
     * @return
     */
    public ArrayList<Object> getRecommendGoodsInfo() {

        String sql = "select  * from GoodsInfo where isRecommend = 0 and status = 0 and iscooled=0 order by goodsId desc limit 0,9";

        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }


    public int getSearchSumGoodsCount(String key) {

        String sql = "select * from GoodsInfo where goodsName like '%" + key + "%'";
        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsInfo());
        if (list != null) {
            return list.size();
        }

        return 0;
    }


    public int gettypelistGoodsCount(String typeid) {

        String sql = "select * from GoodsInfo where typeDetailInfo ='" + typeid + "'";
        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsInfo());
        if (list != null) {
            return list.size();
        }

        return 0;
    }


    public int getSearchSumGoodsCountforthirdId(String key, String thirdId) {

        String sql = "select * from GoodsInfo where goodsName like '%" + key + "%' and userid='" + thirdId + "'";
        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsInfo());
        if (list != null) {
            return list.size();
        }

        return 0;
    }


    public ArrayList<Object> getSpecialGoodsInfo() {

        String sql = "select   * from GoodsInfo where status = 0  and iscooled=0 order by discount limit 0,9";


        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }


    public int getSumGoodsCount() {

        String sql = "select * from GoodsInfo";
        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsInfo());
        if (list != null) {
            return list.size();
        }

        return 0;
    }


    //get third goods numb
    public int getSumGoodsCountforthirdId(String thirdId) {

        String sql = "select * from GoodsInfo where userid='" + thirdId + "'";
        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsInfo());
        if (list != null) {
            return list.size();
        }

        return 0;
    }


    public int getSumProductCount(String typeDetailInfo) {

        String sql = "select * from GoodsInfo where typeDetailInfo = '" + typeDetailInfo + "'";

        if (DBConn.ExecuteQuery(sql, new GoodsInfo()) != null) {
            return (DBConn.ExecuteQuery(sql, new GoodsInfo())).size();
        }
        return 0;

    }

    public ArrayList<Object> getTypeGoodsInfo(String typeDetailInfo) {

        String sql = "select * from GoodsInfo where typeDetailInfo = '" + typeDetailInfo + "'";


        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }


    public boolean isGoodsExistInGooodsType(int typeId) {

        String sql = "select * from GoodsInfo where typeId=" + typeId;

        if (DBConn.ExecuteQuery(sql, new GoodsInfo()) != null) {
            return true;
        }
        return false;

    }


    public ArrayList<Object> searchProduct(String key) {

        String sql = "select * from GoodsInfo where goodsName like '%" + key + "%'";


        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }

    //ǰ̨����
    public ArrayList<Object> searchProductPageModelweb(PageModel pm, String key, String order) {
        String strorder = "";
        strorder = " order by goodsId desc";
        if (order.equals("price")) {
            strorder = " order by price desc";
        } else if (order.equals("createdate")) {
            strorder = " order by createdate desc";
        }
        int everyPageProductCount = pm.getEveryPageCount();//ÿҳ��ʾ����Ʒ��
        int currentPage = pm.getCurrentPage();//��ǰҳ

        if (pm.getSumCount() % everyPageProductCount != 0 && currentPage == pm.getLastPage()) {

            everyPageProductCount = pm.getSumCount() % everyPageProductCount;

        }            //��������

        String sql = "select * from   GoodsInfo  where goodsName like '%" + key + "%'   limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());

        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }

    //ǰ̨�����б���Ʒ
    public ArrayList<Object> typelistProductPageModelweb(PageModel pm, String typeid, String order) {
        String strorder = "";
        strorder = " order by goodsId desc";
        if (order.equals("price")) {
            strorder = " order by price desc";
        } else if (order.equals("createdate")) {
            strorder = " order by createdate desc";
        }
        int everyPageProductCount = pm.getEveryPageCount();//ÿҳ��ʾ����Ʒ��
        int currentPage = pm.getCurrentPage();//��ǰҳ

        if (pm.getSumCount() % everyPageProductCount != 0 && currentPage == pm.getLastPage()) {

            everyPageProductCount = pm.getSumCount() % everyPageProductCount;

        }
        String sql = "select * from  GoodsInfo  where typeDetailInfo='" + typeid + "'  limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());
        //��������

        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }


    //show admin all goods for search
    public ArrayList<Object> searchProductPageModel(PageModel pm, String key) {

        int everyPageProductCount = pm.getEveryPageCount();//ÿҳ��ʾ����Ʒ��
        int currentPage = pm.getCurrentPage();//��ǰҳ

        if (pm.getSumCount() % everyPageProductCount != 0 && currentPage == pm.getLastPage()) {

            everyPageProductCount = pm.getSumCount() % everyPageProductCount;

        }            //��������
        String sql = "select * from GoodsInfo  where goodsName like '%" + key + "%'   limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());

        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }

    //show third all goods for search
    public ArrayList<Object> searchProductPageModelforthirdId(PageModel pm, String key, String thirdId) {

        int everyPageProductCount = pm.getEveryPageCount();//ÿҳ��ʾ����Ʒ��
        int currentPage = pm.getCurrentPage();//��ǰҳ

        if (pm.getSumCount() % everyPageProductCount != 0 && currentPage == pm.getLastPage()) {

            everyPageProductCount = pm.getSumCount() % everyPageProductCount;

        }            //��������

        String sql = "select * from   GoodsInfo  where goodsName like '%" + key + "%' and userid=" + thirdId + "   limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());

        return DBConn.ExecuteQuery(sql, new GoodsInfo());
    }


    public void updateGoodsInfo(int goodsId, String typeDetailInfo, String goodsName, double price, float discount, int isNew, int isRecommend, int status, String photo, String remark, int countRequire, String iscool) {

        String sql = null;
        if (!PublicToolCheckParam.checkNullAndEmpty(remark)) {
            remark = "��";
        }
        if (PublicToolCheckParam.checkNullAndEmpty(photo)) {
            sql = "update GoodsInfo set typeDetailInfo='" + typeDetailInfo + "',goodsName='" + goodsName + "',price=" + price + ",discount=" + discount + ",isNew=" + isNew + ",isRecommend=" + isRecommend + ",status=" + status + ",photo='" + photo + "',remark='" + remark + "',countRequire=" + countRequire + ",iscooled=" + iscool + " where goodsId=" + goodsId;

        } else {
            sql = "update GoodsInfo set typeDetailInfo='" + typeDetailInfo + "',goodsName='" + goodsName + "',price=" + price + ",discount=" + discount + ",isNew=" + isNew + ",isRecommend=" + isRecommend + ",status=" + status + ",photo=" + null + ",remark='" + remark + "',countRequire=" + countRequire + ",iscooled=" + iscool + " where goodsId=" + goodsId;
        }

        DBConn.ExecuteUD(sql);
    }


    //�����û�����ȷ�Ϻ󣬼�����Ʒ����
    public void updateOrderGoodscount(int goodsId, int countRequire) {

        String sql = null;

        sql = "update GoodsInfo set countRequire=countRequire-" + countRequire + " where goodsId=" + goodsId;


        DBConn.ExecuteUD(sql);
    }

    public void coolGoods(int goodsId, int isCooled) {

        if (isCooled == 1) {
            isCooled = 0;
        } else {
            isCooled = 1;
        }

        String sql = "update GoodsInfo set isCooled = " + isCooled + " where goodsid=" + goodsId;

        DBConn.ExecuteUD(sql);
    }

    public boolean isCooled(int goodsId) {

        String sql = "select * from GoodsInfo where goodsid=" + goodsId;

        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsInfo());
        if (list != null) {
            if (list.size() == 1) {
                int isCooled = ((GoodsInfo) list.get(0)).getIsCooled();
                if (isCooled == 1) {
                    return true;
                }
            }
        }
        return false;
    }


}
