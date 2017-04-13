﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>菜单</title>
    <link rel="stylesheet" href="../css/base.css" type="text/css"/>
    <script language='javascript'>var curopenItem = '1';</script>
    <script language="javascript" type="text/javascript" src="../js/leftmenu.js"></script>
    <style>
        div {
            padding: 0px;
            margin: 0px;
        }

        body {
            padding: 0px;
            margin: auto;
            text-align: center;
            background-color: #eff5ed;
            background: url(../images/leftmenu_bg.gif);
            padding-left: 3px;
            overflow: scroll;
            overflow-x: hidden;
            scrollbar-face-color: #eff8e6;
            scrollbar-shadow-color: #edf2e3;
            scrollbar-highlight-color: #ffffff;
            scrollbar-3dlight-color: #F2F2F2;
            scrollbar-darkshadow-color: #bdbcbd;
            scrollbar-arrow-color: #bdbcbd
        }

        dl.bitem {
            clear: both;
            width: 140px;
            margin: 0px 0px 5px 12px;
            background: url(../images/menunewbg.gif) repeat-x;
        }

        dl.bitem2 {
            clear: both;
            width: 140px;
            margin: 0px 0px 5px 12px;
            background: url(../images/menunewbg2.gif) repeat-x;
        }

        dl.bitem dt, dl.bitem2 dt {
            height: 25px;
            line-height: 25px;
            padding-left: 35px;
            cursor: pointer;
        }

        dl.bitem dt b, dl.bitem2 dt b {
            color: #4D6C2F;
        }

        dl.bitem dd, dl.bitem2 dd {
            padding: 3px 3px 3px 3px;
            background-color: #fff;
        }

        div.items {
            clear: both;
            padding: 0px;
            height: 0px;
        }

        .fllct {
            float: left;
            width: 85px;
        }

        .flrct {
            padding-top: 3px;
            float: left;
        }

        .sitemu li {
            padding: 0px 0px 0px 18px;
            line-height: 22px;
            background: url(../images/arr4.gif) no-repeat 5px 9px;
        }

        ul {
            padding-top: 3px;
        }

        li {
            height: 22px;
        }

        a.mmac div {
            background: url(../images/leftbg2.gif) no-repeat;
            height: 37px !important;
            height: 47px;
            padding: 6px 4px 4px 10px;
            word-wrap: break-word;
            word-break: break-all;
            font-weight: bold;
            color: #325304;
        }

        a.mm div {
            background: url(../images/leftmbg1.gif) no-repeat;
            height: 37px !important;
            height: 47px;
            padding: 6px 4px 4px 10px;
            word-wrap: break-word;
            word-break: break-all;
            font-weight: bold;
            color: #475645;
            cursor: pointer;
        }

        a.mm:hover div {
            background: url(../images/leftbg2.gif) no-repeat;
            color: #4F7632;
        }

        .mmf {
            height: 1px;
            padding: 5px 7px 5px 7px;
        }

        #mainct {
            padding-top: 8px;
            background: url(../images/idnbg1.gif) repeat-y;
        }
    </style>
    <base target="main"/>
</head>
<body target="main" onLoad="CheckOpenMenu();">
<form id="form1" runat="server">
    <table width="180" align="left" border='0' cellspacing='0' cellpadding='0' style="text-align:left;">
        <tr>

            <td width="10"></td>
            <td width='160' id='mainct' valign="top">


                <% String role = (String) session.getAttribute("role");

                    if (role.equals("0")) {%>
                <div id='ct1'> <!-- Item 2 Strat -->
                    <!-- Item 6 End --><!-- Item 7 Strat -->
                    <dl class='bitem' id='sunitems6_1'>
                        <dt onClick='showHide("items6_1")'><b>公告管理</b></dt>
                        <dd style='display:block' class='sitem' id='items6_1'>
                            <ul class='sitemu'>
                                <li><a href="../servlet/ManageBulletin?method=showAddBulletinPage"
                                       target="iframe">发布公告</a></li>
                                <li><a href="../servlet/ManageBulletin?method=showManageBulletinPage" target="iframe">公告管理</a>
                                </li>
                            </ul>
                        </dd>
                    </dl>

                    <%}%>

                    <dl class='bitem' id='sunitems1_1' runat=server>
                        <dt onClick='showHide("items1_1")'><b>商品管理</b></dt>
                        <dd style='display:block' class='sitem' id='items1_1'>
                            <ul class='sitemu'>


                                <li><a href="../servlet/ManageGoodsInfo?method=showAddGoodsInfoPage" target="iframe">添加商品</a>
                                </li>
                                <li><a href="../servlet/ManageGoodsInfo?method=showManageGoodsInfoPage" target="iframe">商品信息管理</a>
                                </li>
                                <li><a href="../servlet/ManageGoodsType?method=showAddGoodsTypePage" target="iframe">添加商品类型</a>
                                </li>
                                <li><a href="../servlet/ManageGoodsType?method=showManageGoodsTypePage" target="iframe">商品类型管理</a>
                                </li>
                                <li><a href="../servlet/ManageGoodsInfo?method=showManageEvaluate"
                                       target="iframe">评论管理</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <!-- Item 2 End --><!-- Item 3 Strat -->
                    <dl class='bitem' id='sunitems2_1' runat=server>
                        <dt onClick='showHide("items2_1")'><b>订单管理</b></dt>
                        <dd style='display:block' class='sitem' id='items2_1'>
                            <ul class='sitemu'>
                                <li><a href="../servlet/ManageOrder?method=showManageOrderPage"
                                       target="iframe">订单信息管理</a></li>

                            </ul>
                        </dd>
                    </dl>
                    <!-- Item 3 End --><!-- Item 4 Strat -->
                    <dl class='bitem' id='sunitems3_1' runat=server>
                        <dt onClick='showHide("items3_1")'><b>用户管理</b></dt>
                        <dd style='display:block' class='sitem' id='items3_1'>
                            <ul class='sitemu'>
                                <li><a href="../servlet/ManageCustomerInfo?method=showManageCustomerInfoPage"
                                       target="iframe">客户信息管理</a></li>
                                <li><a href="../servlet/ManageThirdInfo?method=showManageThirdInfoPage" target="iframe">商户信息管理</a>
                                </li>

                            </ul>
                        </dd>
                    </dl>
                    <!-- Item 4 End --><!-- Item 5 Strat -->

                    <% if (role.equals("0")) {%>

                    <dl class='bitem' id='sunitems4_1' runat=server>
                        <dt onClick='showHide("items4_1")'><b>系统管理</b></dt>
                        <dd style='display:block' class='sitem' id='items4_1'>
                            <ul class='sitemu'>
                                <li><a href="../servlet/UpdateUserInfo?method=showUpdatePasswordPage" target="iframe">修改密码</a>
                                </li>
                                <li><a href="../servlet/UpdateUserInfo?method=showUpdateUserNamedPage" target="iframe">修改用户名</a>
                                </li>
                                <li><a href="../servlet/UpdateUserInfo?method=showManageUserInfoPage" target="iframe">系统用户管理</a>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <%}%>

                    <!-- Item 7 End -->

                    <!-- Item 7 End -->


                </div>
                <div id='ct100'></div>
                <div id='ct3'></div>
                <div id='ct5'></div>
                <div id='ct6'></div>
                <div id='ct7'></div>
                <div id='ct20'></div>
                <div id='ct10'></div>
            </td>
        </tr>
        <tr>
            <td width="10"></td>
            <td width='160' valign='top'><img src='../images/idnbgfoot.gif'/></td>
        </tr>
    </table>
</form>
</body>
</html>