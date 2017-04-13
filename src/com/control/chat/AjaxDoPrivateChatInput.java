package com.control.chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AjaxDoPrivateChatInput extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 678682689821693876L;

	/**
	 * Constructor of the object.
	 */
	public AjaxDoPrivateChatInput() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//定义一个session和application
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		
		//获取当前用户的昵称
		String email = (String)session.getAttribute("email");
		//获取当前用户输入的信息
		String privateChatMessage = request.getParameter("privateChatMessage");
		//获取接收私聊信息对象
		String sendToWho = request.getParameter("sendToWho");
		//获取发送私聊信息对象
		String receiveFromWho = request.getParameter("receiveFromWho");	
		
		//取得当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(new Date());
		
		
		//将所有的表情代码放在一条字符串里，用逗号隔开
		String faceCode = "『wx』,『pz』,『se』,『fd』,『dy』,『ll』,『hx』,『bz』,『shui』,『dk』,『gg』,『fn』,『tp』,『cy』,『jy』,『ng』,『kuk』,『lengh』,『zk』,『tuu』,『tx』,『ka』,『baiy』,『am』,『jie』,『kun』,『jk』,『lh』,『hanx』,『db』,『fendou』,『zhm』,『yiw』,『wx』,『xu』,『yun』,『zhem』,『shuai』,『kl』,『qiao』,『zj』,『ch』,『kb』,『gz』,『qd』,『huaix』,『zhh』,『yhh』,『hq』,『bs』,『wq』,『kk』,『yx』,『qq』,『xia』,『kel』,『cd』,『xig』,『pj』,『lq』,『pp』,『kf』,『fan』,『zt』,『mg』,『sa』,『xin』,『xs』,『dg』,『shd』,『zhd』,『dao』,『zq』,『pch』,『bb』,『yl』,『ty』,『lw』,『yb』,『qiang』,『ruo』,『ws』,『shl』,『bq』,『gy』,『qt』,『cj』,『aini』,『bu』,『hd』,『aiq』,『fw』,『tiao』,『fad』,『oh』,『zhq』,『kt』,『ht』,『tsh』,『hsh』,『jd』,『jw』,『xw』,『zuotj』,『youtj』";
		//以逗号为分隔标志，将每个表情代码依次放到数组中去
		String faceURL[] = faceCode.split(",");
	
		for(int i=0;i<faceURL.length;i++){
			//将表情代码转换成对应的图片地址
			privateChatMessage = privateChatMessage.replaceAll(faceURL[i],"<img src='../face/"+faceURL[i].replace("『", "").replace("』", "")+".gif'/>");
		}
		
		//设置私聊信息的格式
		privateChatMessage = "<tr ><td id='"+sendToWho+"&"+receiveFromWho+"'><font size='2' color='#006600'>"+email+"&nbsp;&nbsp;"+currentTime+"</font><br />&nbsp;&nbsp;&nbsp;<font size='2'>"+privateChatMessage+"</font></td></tr>";
		
		
		ArrayList<String> privateChatMessageList = null;
		ArrayList<String> sendToWhoList = null;
		ArrayList<String> receiveFromWhoList = null;
		synchronized (application) {
			//获取所有的私聊信息
			privateChatMessageList = (ArrayList<String>)application.getAttribute("privateChatMessageList");
			//获取所有接受私聊信息对象
			sendToWhoList = (ArrayList<String>)application.getAttribute("sendToWhoList");
			//获取所有发送私聊信息对象
			receiveFromWhoList = (ArrayList<String>)application.getAttribute("receiveFromWhoList");
			if(privateChatMessageList==null){
				//如果私聊信息为空，重新new一个ArrayList
				privateChatMessageList = new ArrayList<String>();
				sendToWhoList = new ArrayList<String>();
				receiveFromWhoList = new ArrayList<String>();
			}
			//将获取到的信息存进列表里去
			privateChatMessageList.add(privateChatMessage);
			sendToWhoList.add(sendToWho);
			receiveFromWhoList.add(receiveFromWho);
			//将信息列表存放在application中
			application.setAttribute("privateChatMessageList", privateChatMessageList);
			application.setAttribute("sendToWhoList", sendToWhoList);
			application.setAttribute("receiveFromWhoList", receiveFromWhoList);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
