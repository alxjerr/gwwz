package com.dao;

import java.util.ArrayList;
import com.common.DBConn;
import com.entity.GoodsType;
import com.entity.GoodsTypeDetail;
import com.entity.PageModel;

public class GoodsTypeDAO {

    public void addGoodsType(String typeName) {
        String sql = "insert into GoodsType  (`typeName`)  values('" + typeName + "')";
        DBConn.ExecuteUD(sql);
    }

    public void addGoodsType_c(String typeName, String typeId) {
        String sql = "INSERT INTO GoodsTypeDetailInfo (`typeId`, `typeDetailInfo`)   VALUES   ('" + typeId + "','" + typeName + "')";
        DBConn.ExecuteUD(sql);
    }

    public void deleteGoodsType(int typeId) {

        String sql = "delete from GoodsType where typeId=" + typeId;
        DBConn.ExecuteUD(sql);
    }

    public ArrayList<Object> getAllType() {
        String sql = "select * from GoodsType";
        return DBConn.ExecuteQuery(sql, new GoodsType());
    }


    public GoodsType getGoodsTypeInfo(int typeId) {
        String sql = "select * from GoodsType where typeId=" + typeId;
        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsType());
        return (GoodsType) list.get(0);
    }

    public ArrayList<Object> getPageModel(PageModel pm) {
        int everyPageGoodsTypeCount = pm.getEveryPageCount();//ÿҳ��ʾ�Ĺ�����
        int currentPage = pm.getCurrentPage();//��ǰҳ
        if (pm.getSumCount() % everyPageGoodsTypeCount != 0 && currentPage == pm.getLastPage()) {
            everyPageGoodsTypeCount = pm.getSumCount() % everyPageGoodsTypeCount;
        }
        String sql = "select * from   GoodsType order by typeId  limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());
        return DBConn.ExecuteQuery(sql, new GoodsType());
    }

    public ArrayList<Object> getalltype() {
        String sql = "select * from   GoodsType order by typeId";
        return DBConn.ExecuteQuery(sql, new GoodsType());
    }

    public int getSumGoodsTypeCount() {
        String sql = "select * from GoodsType";
        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsType());
        if (list != null) {
            return list.size();
        }
        return 0;
    }

    public int getSumSearchGoodsTypeCount(String key) {
        String sql = "select * from GoodsType where typeName like '%" + key + "%'";
        ArrayList<Object> list = DBConn.ExecuteQuery(sql, new GoodsType());
        if (list != null) {
            return list.size();
        }
        return 0;
    }


    public ArrayList<Object> searchGoodsType(PageModel pm, String key) {
        int everyPageGoodsTypeCount = pm.getEveryPageCount();//ÿҳ��ʾ�Ĺ�����
        int currentPage = pm.getCurrentPage();//��ǰҳ
        if (pm.getSumCount() % everyPageGoodsTypeCount != 0 && currentPage == pm.getLastPage()) {
            everyPageGoodsTypeCount = pm.getSumCount() % everyPageGoodsTypeCount;
        }
        String sql = "select * from GoodsType where typeName like '%" + key + "%' order by typeId  limit  " + ((pm.getCurrentPage() - 1) * pm.getEveryPageCount()) + "," + (pm.getEveryPageCount() * pm.getCurrentPage());
        return DBConn.ExecuteQuery(sql, new GoodsType());
    }


    public void updateGoodsType(int typeId, String typeName) {

        String sql = "update GoodsType set typeName = '" + typeName + "' where typeId=" + typeId;
        DBConn.ExecuteUD(sql);
    }


}
