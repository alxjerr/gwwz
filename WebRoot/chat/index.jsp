<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>在线客户交流系统</title>
	<script type="text/javascript" src="../js/chat/index.js" charset="gb2312"></script>
	<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	left:360px;
	top:60px;
	width:500;
	height:300;
	z-index:1;
}
#Layer3 {
	position:absolute;
	left:720px;
	top:327px;
	z-index:3;
}
#Layer4 {
	position:absolute;
	left:6px;
	top:55px;
	z-index:4;
}
#Layer5 {
	position:absolute;
	left:5px;
	top:240px;
	z-index:50;
}
#Layer6 {
	position:absolute;
	left:6px;
	top:260px;
	z-index:6;
}
#Layer8 {
	position:absolute;
	left:10px;
	top:31px;
	z-index:8;
}
#Layer9 {
	position:absolute;
	left:30px;
	top:27px;
	z-index:9;
}
#Layer10 {
	position:absolute;
	left:10px;
	top:11px;
	z-index:10;
}
#Layer11 {
	position:absolute;
	left:11px;
	top:57px;
	z-index:11;
}
#Layer12 {
	position:absolute;
	left:470px;
	top:5px;
	z-index:12;
}
#Layer13 {
	position:absolute;
	left:1048px;
	top:473px;
	z-index:13;
	display: none;
}
#Layer14 {
	position:absolute;
	left:2px;
	top:2px;
	z-index:14;
}
#Layer15 {
	position:absolute;
	left:23px;
	top:8px;
	z-index:15;
}
#Layer16 {
	position:absolute;
	left:2px;
	top:27px;
	z-index:16;
}
#Layer17 {
	position:absolute;
	left:4px;
	top:6px;
	z-index:17;
}
#Layer18 {
	position:absolute;
	left:10px;
	top:40px;
	z-index:18;
}
#Layer19 {
	position:absolute;
	left:100px;
	top:80px;
	z-index:19;
}
#Layer20 {
	position:absolute;
	left:148px;
	top:80px;
	z-index:20;
}
#Layer24 {
	position:absolute;
	left:175px;
	top:1px;
	z-index:24;
}
#Layer25 {
	position:absolute;
	left:6px;
	top:207px;
	z-index:25;
}
#Layer26 {
	position:absolute;
	left:6px;
	top:207px;
	z-index:26;
}
#Layer27 {
	position:absolute;
	left:6px;
	top:207px;
	z-index:27;
}
-->
</style>
	</head>
	<body onload="page_load();MM_dragLayer('Layer1','',0,0,0,0,true,false,-1,-1,-1,-1,false,false,200,'',false,'');">
	<OBJECT id="dlgHelper" CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px"></OBJECT>
	<div id="Layer13" style="width:198px; height:110px;background-color:#FF9999;">
		<div id="Layer14" style="width:194px; height:23px;background-color:#FF6699"></div>
		<div id="Layer17"><img src="../image/icon/chat.png" width="16" height="16"/></div>
		<div id="Layer15"><font size="2" color="#FFFFFF"><strong>消息提示</strong></font></div>
		<div id="Layer16" style="width:194px; height:81px;background-color:#FFFFFF"></div>
		<div id="Layer18"><font size="2">您有私聊消息啦！<br />来自：</font><font id="receiveFromWho" size="2" color="#FF6600"></font></div>
		<div id="Layer19"><input type="button" value="查&nbsp;看" onclick="showPrivateChatDiv()" style="height: 24px;padding-top: 1px"/></div>
		<div id="Layer20"><input type="button" value="忽&nbsp;略" onclick="ignorePrivateChatMessage()" style="height: 24px;padding-top: 1px"/></div>
		<div id="Layer24" onclick="ignorePrivateChatMessage()" style="cursor:pointer"><font size="5" color="#FF0033"><strong>×</strong></font></div>	
	</div>
	<div id="Layer3" style="cursor: pointer;">
				<table id="face" width="455" height="183" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="background-color:#FFFFFF;display: none" onclick="getFaceValue()">
					  <tr>
						<td><div align='center'><img id='aini' src='../face/aini.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='aiq' src='../face/aiq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='am' src='../face/am.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='baiy' src='../face/baiy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bb' src='../face/bb.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bq' src='../face/bq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bs' src='../face/bs.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bu' src='../face/bu.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bz' src='../face/bz.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='cd' src='../face/cd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ch' src='../face/ch.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='cj' src='../face/cj.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='cy' src='../face/cy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='dao' src='../face/dao.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='db' src='../face/db.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='dg' src='../face/dg.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='dk' src='../face/dk.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='dx' src='../face/dx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='dy' src='../face/dy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fad' src='../face/fad.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fan' src='../face/fan.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fd' src='../face/fd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fendou' src='../face/fendou.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fn' src='../face/fn.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fw' src='../face/fw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='gg' src='../face/gg.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='gy' src='../face/gy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='gz' src='../face/gz.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='hanx' src='../face/hanx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='hd' src='../face/hd.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='hq' src='../face/hq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='hsh' src='../face/hsh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ht' src='../face/ht.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='huaix' src='../face/huaix.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='hx' src='../face/hx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jd' src='../face/jd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jie' src='../face/jie.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jk' src='../face/jk.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jw' src='../face/jw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jy' src='../face/jy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ka' src='../face/ka.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kb' src='../face/kb.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kel' src='../face/kel.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kf' src='../face/kf.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kk' src='../face/kk.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='kl' src='../face/kl.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kt' src='../face/kt.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kuk' src='../face/kuk.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kun' src='../face/kun.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='lengh' src='../face/lengh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='lh' src='../face/lh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ll' src='../face/ll.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='lq' src='../face/lq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='lw' src='../face/lw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='mg' src='../face/mg.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ng' src='../face/ng.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='oh' src='../face/oh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='pch' src='../face/pch.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='pj' src='../face/pj.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='pp' src='../face/pp.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='pz' src='../face/pz.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qd' src='../face/qd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qiang' src='../face/qiang.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qiao' src='../face/qiao.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qq' src='../face/qq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qt' src='../face/qt.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ruo' src='../face/ruo.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='sa' src='../face/sa.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='se' src='../face/se.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='shd' src='../face/shd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='shl' src='../face/shl.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='shuai' src='../face/shuai.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='shui' src='../face/shui.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='tiao' src='../face/tiao.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='tp' src='../face/tp.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='tsh' src='../face/tsh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='tuu' src='../face/tuu.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='tx' src='../face/tx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ty' src='../face/ty.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='wq' src='../face/wq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ws' src='../face/ws.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='wx' src='../face/wx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xia' src='../face/xia.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xig' src='../face/xig.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xin' src='../face/xin.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xs' src='../face/xs.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xu' src='../face/xu.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xw' src='../face/xw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yb' src='../face/yb.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yhh' src='../face/yhh.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='yiw' src='../face/yiw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yl' src='../face/yl.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='youtj' src='../face/youtj.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yun' src='../face/yun.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yx' src='../face/yx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhd' src='../face/zhd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhem' src='../face/zhem.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhh' src='../face/zhh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhm' src='../face/zhm.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhq' src='../face/zhq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zj' src='../face/zj.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zk' src='../face/zk.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zq' src='../face/zq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zt' src='../face/zt.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zuotj' src='../face/zuotj.gif' width='24' height='24'></div></td>
						</tr>

				</table>
</div>
	<div id="Layer1">
	  <table id="privateChatDiv" border="1" bordercolor="#999933"  bgcolor="#96C2G9" style="border:inherit;display: none" width="500" height="300">
   		<tr>
   			<td>
				<div id="Layer10">
					<font id="userName" color='#333333' size='2'></font>
				</div>
				<div id="Layer8" >
					<img src="../image/chatIcon/announcement.jpg" width="15" height="15"/>
				</div>
				<div id="Layer9" >
					<font size="1" color="#FFFFFF">系统公告：欢迎使用在线客户交流系统!</font>
				</div>
				<div id="Layer12" onclick="hidePrivateChatDiv()" style="cursor:pointer">
					<font size="5" color="#336600"><strong>×</strong></font>
				</div>
				<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><br /><br />
				<div id="Layer4">
					<iframe name="privateChatMessage" src="../chat/privateChatMessage.jsp" width="488" height="180" scrolling="auto" frameborder="0"></iframe> 
		 		</div>
		 		<div id="Layer5">
		 			<table width="100">
		 				<tr>
		 					<td id="faceIconBgcolor" onmouseover="changeFaceIconBgcolor()" onmouseout="changeFaceIconBgcolor()">
		 						<div align="center"><img src="../image/chatIcon/faceIcon.gif" onclick="showPrivateChatFace()" style="cursor:pointer"/></div>
		 					</td>
		 					<td>
		 						&nbsp;<input type="button" value="声音设置" style="width:65px;height: 26;padding-top: 3px;cursor:pointer" onclick="showAndHideSoundDiv()"/>
		 					</td>
		 				</tr>
		 			</table>	
			
				</div>
				<div id="Layer27">
					<table id="sound" bgcolor="#CCCC33" style="display: none;font-size: 13px;" height="35" width="488">
						<tr>
							<td style="padding-left: 155px">
								消息声音：<input name="messageSound" type="radio" value="on" checked="checked"/>开启<input name="messageSound" type="radio" value="off" />关闭
				  			</td>
						</tr>
					</table>
				</div>
		 		<p>&nbsp;</p><br /><br /><br />
		 		<div id="Layer6">
		 			<iframe name="privateChatInput" src="../chat/privateChatInput.jsp" width="488" height="100" scrolling="no" frameborder="0"></iframe>
		 		</div>
		 		<p>&nbsp;</p>
				<div id="Layer11" style="cursor: pointer;">
				<table id="privateChatFace" width="455" height="183" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="background-color:#FFFFFF;display: none;" onclick="getPrivateChatFaceValue()">
					 <tr>
						<td><div align='center'><img id='aini' src='../face/aini.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='aiq' src='../face/aiq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='am' src='../face/am.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='baiy' src='../face/baiy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bb' src='../face/bb.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bq' src='../face/bq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bs' src='../face/bs.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bu' src='../face/bu.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='bz' src='../face/bz.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='cd' src='../face/cd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ch' src='../face/ch.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='cj' src='../face/cj.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='cy' src='../face/cy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='dao' src='../face/dao.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='db' src='../face/db.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='dg' src='../face/dg.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='dk' src='../face/dk.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='dx' src='../face/dx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='dy' src='../face/dy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fad' src='../face/fad.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fan' src='../face/fan.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fd' src='../face/fd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fendou' src='../face/fendou.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fn' src='../face/fn.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='fw' src='../face/fw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='gg' src='../face/gg.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='gy' src='../face/gy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='gz' src='../face/gz.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='hanx' src='../face/hanx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='hd' src='../face/hd.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='hq' src='../face/hq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='hsh' src='../face/hsh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ht' src='../face/ht.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='huaix' src='../face/huaix.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='hx' src='../face/hx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jd' src='../face/jd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jie' src='../face/jie.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jk' src='../face/jk.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jw' src='../face/jw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='jy' src='../face/jy.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ka' src='../face/ka.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kb' src='../face/kb.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kel' src='../face/kel.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kf' src='../face/kf.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kk' src='../face/kk.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='kl' src='../face/kl.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kt' src='../face/kt.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kuk' src='../face/kuk.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='kun' src='../face/kun.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='lengh' src='../face/lengh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='lh' src='../face/lh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ll' src='../face/ll.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='lq' src='../face/lq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='lw' src='../face/lw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='mg' src='../face/mg.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ng' src='../face/ng.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='oh' src='../face/oh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='pch' src='../face/pch.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='pj' src='../face/pj.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='pp' src='../face/pp.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='pz' src='../face/pz.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qd' src='../face/qd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qiang' src='../face/qiang.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qiao' src='../face/qiao.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qq' src='../face/qq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='qt' src='../face/qt.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ruo' src='../face/ruo.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='sa' src='../face/sa.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='se' src='../face/se.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='shd' src='../face/shd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='shl' src='../face/shl.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='shuai' src='../face/shuai.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='shui' src='../face/shui.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='tiao' src='../face/tiao.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='tp' src='../face/tp.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='tsh' src='../face/tsh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='tuu' src='../face/tuu.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='tx' src='../face/tx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ty' src='../face/ty.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='wq' src='../face/wq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='ws' src='../face/ws.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='wx' src='../face/wx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xia' src='../face/xia.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xig' src='../face/xig.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xin' src='../face/xin.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xs' src='../face/xs.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xu' src='../face/xu.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='xw' src='../face/xw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yb' src='../face/yb.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yhh' src='../face/yhh.gif' width='24' height='24'></div></td>
						</tr>
						<tr>
						<td><div align='center'><img id='yiw' src='../face/yiw.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yl' src='../face/yl.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='youtj' src='../face/youtj.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yun' src='../face/yun.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='yx' src='../face/yx.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhd' src='../face/zhd.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhem' src='../face/zhem.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhh' src='../face/zhh.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhm' src='../face/zhm.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zhq' src='../face/zhq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zj' src='../face/zj.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zk' src='../face/zk.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zq' src='../face/zq.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zt' src='../face/zt.gif' width='24' height='24'></div></td>
						<td><div align='center'><img id='zuotj' src='../face/zuotj.gif' width='24' height='24'></div></td>
						</tr>

					</table>
				</div>
   			</td>
   		</tr>
   	</table>
</div>
<div style="width: 1239px;height: 570px">
	<iframe name="top" src="top.jsp" width="100%" height="72" scrolling="no" frameborder="0" style="border:3px solid #95D1E5;border-left: 6px solid #95D1E5;border-top: 6px solid #95D1E5;border-right: 6px solid #95D1E5"></iframe>
	<iframe name="message" src="message.jsp" width="850" height="390" scrolling="auto" frameborder="0" style="border:3px solid #95D1E5;border-left: 6px solid #95D1E5;border-bottom: 3px solid #95D1E5;"></iframe> 
	<iframe name="users" src="users.jsp" width="371" height="390" scrolling="auto" frameborder="0" style="border:3px solid #95D1E5;border-bottom: 3px solid #95D1E5;border-right: 6px solid #95D1E5"></iframe> 
	<iframe name="input" src="input.jsp" width="100%" height="82" scrolling="no" frameborder="0" style="border:3px solid #95D1E5;border-bottom: 6px solid #95D1E5;border-right: 6px solid #95D1E5;border-left: 6px solid #95D1E5;"></iframe> 
</div>	
	</body>
</html>
