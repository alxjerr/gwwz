<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.entity.BulletinInfo" %>
<%@page import="com.util.PublicToolCheckParam" %>
<%@page import="com.util.PublicToolGetTypeDetailInfo" %>

<%@page import="com.entity.GoodsType" %>
<%@page import="com.entity.GoodsTypeDetail" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>商品类型管理</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <script type="text/javascript" src="../js/admin/manageGoodsType.js" charset="gb2312"></script>
</head>

<body>
<form action="../servlet/ManageGoodsType?method=deleteMore" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:13px;">
        <tr>
            <td width="100%" height="36"><strong><font size="6" color="#0099FF">□&nbsp;</font><font color="#666666"
                                                                                                    size="3">商品类型管理</font></strong>
            </td>
            <td height="36">
                <div align="right">
                    <input type="text" name="key" id="key" style="height: 24px;width: 250px;padding-top: 2px;padding-left:20px;background-image: url(../image/icon/key_search.gif);background-repeat: no-repeat"/>
                </div>
            </td>
            <td>
                <input type="button" value="查询" style="height: 26px;width: 70px;padding-top: 2px" onClick="return searchGoodsType()"/>
            </td>
            <td>
                <input type="submit" value="删除类型" style="height: 26px;width: 70px;padding-top: 2px" onClick="return deletMoreGoodsType()"/>
            </td>
        </tr>
        <tr>
            <td height="40" colspan="5">
                <hr width="100%"/>
            </td>
        </tr>
        <tr>
            <td height="147" colspan="5">
                <table width="100%" border="1" cellpadding="0" cellspacing="0" style="font-size:13px"
                       bordercolor="#9999FF">
                    <tr height="30">
                        <td>
                            <div align="center"><font color="#666666">全选</font></div>
                        </td>
                        <td>
                            <div align="center"><input type="checkbox" id="checkAll" value="checkbox"
                                                       onClick="selectAll()"/></div>
                        </td>
                        <td>
                            <div align="center"><font color="#666666">类型编号</font></div>
                        </td>
                        <td width="430">
                            <div align="center"><font color="#666666">类型名称</font></div>
                        </td>
                        <td>
                            <div align="center"><font color="#666666">操作</font></div>
                        </td>
                    </tr>
                    <%
                        String isSearching = (String) request.getAttribute("isSearching");
                        ArrayList<GoodsType> goodsTypeList = (ArrayList<GoodsType>) request.getAttribute("goodsTypeList");
                        if (goodsTypeList == null || goodsTypeList.toString().equals("[]")) {
                            out.println("<td colspan='5' height='30'><div align='center'>当前无任何商品类型信息!</div></td>");
                        } else {
                            for (int i = 0; i < goodsTypeList.size(); i++) {
                                GoodsType gt = goodsTypeList.get(i);
                                String typeName = gt.getTypeName();
                                if (typeName.length() > 40) {
                                    typeName = typeName.substring(0, 39) + "...";
                                }
                                out.println("<tr height='30'>");
                                out.println("<td><div align='center'>勾选</div></td>");
                                out.println("<td><div align='center'><input id='ckb' type='checkbox' name='ckb' value='" + gt.getTypeId() + "' /></div></td>");
                                out.println("<td><div align='center'>" + gt.getTypeId() + "</div></td>");
                                out.println("<td><div align='center'>" + typeName + "</div></td>");
                                if (PublicToolCheckParam.checkNullAndEmpty(isSearching) && goodsTypeList.size() > 1) {
                                    out.println("<td><div align='center'><a href='../servlet/ManageGoodsType?method=update&typeId=" + gt.getTypeId() + "'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteGoodsTypeOfSearching(" + gt.getTypeId() + "," + request.getAttribute("key") + ")>删除</a></div></td>");
                                } else {
                                    out.println("<td><div align='center'><a href='../servlet/ManageGoodsType?method=update&typeId=" + gt.getTypeId() + "'>修改</a>");
                                    if (PublicToolGetTypeDetailInfo.getTypeDetailnumb(gt.getTypeId()) != 0)
                                        out.println("&nbsp;&nbsp;&nbsp;&nbsp;<a href='../servlet/ManageDetailType?method=showManageDetailTypePage&typeId=" + gt.getTypeId() + "'>查看子分类</a>");
                                    out.println("&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=deleteGoodsType(" + gt.getTypeId() + ")>删除</a></div></td>");
                                }
                                out.println("</tr>");
                            }
                        }
                    %>
                    <tr>
                        <td colspan="5" height="50">
                            <div align="center">共找到<%=request.getAttribute("sumCount")%>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第<%=request.getAttribute("currentPage")%>
                                /<%=request.getAttribute("sumPageCount")%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                        href="../servlet/ManageGoodsType?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsTypePage");}%>&cp=<%=request.getAttribute("indexPage")%>">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                        href="../servlet/ManageGoodsType?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsTypePage");}%>&cp=<%=request.getAttribute("upPage")%>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                        href="../servlet/ManageGoodsType?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsTypePage");}%>&cp=<%=request.getAttribute("nextPage")%>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                        href="../servlet/ManageGoodsType?method=<%if(PublicToolCheckParam.checkNullAndEmpty(isSearching)){out.println("search&key="+request.getAttribute("key")+"");}else{out.println("showManageGoodsTypePage");}%>&cp=<%=request.getAttribute("lastPage")%>">尾页</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
