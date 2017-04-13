package com.util;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.GoodsTypeDAO;

import com.dao.GoodsTypeDetailInfoDAO;
import com.entity.PageModel;

public class PublicToolShowGooodsTypeList {

    public static void searchGoodsType(HttpServletRequest request, HttpServletResponse response, String cp, String key) {
        GoodsTypeDAO gtdao = new GoodsTypeDAO();
        int sumCount = gtdao.getSumSearchGoodsTypeCount(key);
        //���÷�ҳPageModel����
        PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount, 7, cp);
        //��ѯ���е���Ʒ��Ϣ
        ArrayList<Object> goodsTypeList = gtdao.searchGoodsType(pm, key);
        request.setAttribute("goodsTypeList", goodsTypeList);
    }


    //�б�������
    public static void showGoodsTypeList(HttpServletRequest request, HttpServletResponse response, String cp) {
        GoodsTypeDAO gtdao = new GoodsTypeDAO();
        int sumCount = gtdao.getSumGoodsTypeCount();
        //���÷�ҳPageModel����
        PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount, 7, cp);
        //��ѯ���е���Ʒ��Ϣ
        ArrayList<Object> goodsTypeList = gtdao.getPageModel(pm);
        request.setAttribute("goodsTypeList", goodsTypeList);
    }

    //ǰ̨�б�����������
    public static void showGoodsallTypeList(HttpServletRequest request, HttpServletResponse response) {


        GoodsTypeDAO gtdao = new GoodsTypeDAO();

        //int sumCount = gtdao.getSumGoodsTypeCount();

        //���÷�ҳPageModel����
        //PageModel pm = PublicToolPageModel.getPageInfo(request, sumCount,7,cp);

        //��ѯ���е���Ʒ��Ϣ
        ArrayList<Object> goodsTypeList = gtdao.getalltype();
        request.setAttribute("goodsTypeList", goodsTypeList);

    }


}
