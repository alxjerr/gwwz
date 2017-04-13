package com.common;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConn {

    //�����ַ���
    private final static String USER = "root";

    private final static String PWD = "root";

    private final static String DRIVER = "com.mysql.jdbc.Driver";

    private final static String URL = "jdbc:mysql://localhost:3306/gwwz?characterEncoding=utf8";

    //�ر�����
    public static void CloseConn(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null && conn.isClosed() == false) {
                conn.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    /**
     * ��ѯ�ķ�װ
     *
     * @param sql
     * @param obj
     * @return
     */
    @SuppressWarnings("unchecked")
    public static ArrayList<Object> ExecuteQuery(String sql, Object obj) {

        //��ȡ���ݿ�����
        Connection conn = DBConn.getConn();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        try {
            //����ִ��SQL����pstmt����
            pstmt = conn.prepareStatement(sql);
            //ִ��SQL���,���ҷ��ؽ����
            rs = pstmt.executeQuery();
            while (rs.next()) { //���������
                //ʹ��Java������ƣ���ȡ������Ϣ�����ݶ���ķ�������̬�������е�����set��������ɶ���ĸ�ֵ
                Class cla = Class.forName(obj.getClass().getName());//��̬������
                Method[] ms = cla.getMethods();//��ȡ��ķ���
                Object currentobj = cla.newInstance();//���������ʵ��

                for (int i = 0; i < ms.length; i++) {//�������еķ���
                    if (ms[i].getName().startsWith("set")) {//��ȡ��set��ͷ�ķ���
                        Class[] cc = ms[i].getParameterTypes();//��ȡ��ǰ�����Ĳ���
                        if (cc.length > 0) {//�жϲ����ĸ������Ƿ����0
                            if ("int".equals(cc[0].getName().toLowerCase())) {//��ȡ���������ͣ�int����
                                ms[i].invoke(currentobj, rs.getInt(ms[i].getName().substring(3)));
                            } else if ("float".equals(cc[0].getName().toLowerCase())) {//��ȡ���������ͣ�float����
                                ms[i].invoke(currentobj, rs.getFloat(ms[i].getName().substring(3)));
                            } else if ("double".equals(cc[0].getName().toLowerCase())) {//��ȡ���������ͣ�double����
                                ms[i].invoke(currentobj, rs.getDouble(ms[i].getName().substring(3)));
                            } else if ("char".equals(cc[0].getName().toLowerCase())) {//��ȡ���������ͣ�char����
                                ms[i].invoke(currentobj, new String(rs.getString(ms[i].getName().substring(3))).charAt(0));
                            } else if (cc[0].getName().indexOf("String") != 0) {//��ȡ���������ͣ�string����
                                ms[i].invoke(currentobj, rs.getString(ms[i].getName().substring(3)));
                            } else {
                                System.out.println("�����������Ͳ�ƥ�䣡��ֻ��֧�֣�int��float��double��char��String�������ͣ�");
                            }
                        } else { //set����û�д��ݲ���
                            System.out.println("set������������ֻ��һ��������");
                        }
                    }
                }
                list.add(currentobj);//������ӵ�ʵ���������List��
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //�ر�����
            DBConn.CloseConn(rs, pstmt, conn);
        }
        return null;
    }


    /**
     * ����ɾ���ĵķ�װ
     *
     * @param sql
     * @return
     */
    public static int ExecuteUD(String sql) {
        Connection conn = DBConn.getConn();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            DBConn.CloseConn(null, pstmt, conn);
        }
        return 0;
    }

    //������
    public static Connection getConn() {
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL, USER, PWD);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
