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

public class AjaxDoInput extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8436758686061914030L;

	/**
	 * Constructor of the object.
	 */
	public AjaxDoInput() {
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
		
		//获取当前用户输入的信息和昵称
		String message = request.getParameter("message");
		String email = (String)session.getAttribute("email");
		
		
		//取得当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(new Date());
		
		
		//将所有的表情代码放在一条字符串里，并用逗号隔开
		String faceCode = "『wx』,『pz』,『se』,『fd』,『dy』,『ll』,『hx』,『bz』,『shui』,『dk』,『gg』,『fn』,『tp』,『cy』,『jy』,『ng』,『kuk』,『lengh』,『zk』,『tuu』,『tx』,『ka』,『baiy』,『am』,『jie』,『kun』,『jk』,『lh』,『hanx』,『db』,『fendou』,『zhm』,『yiw』,『wx』,『xu』,『yun』,『zhem』,『shuai』,『kl』,『qiao』,『zj』,『ch』,『kb』,『gz』,『qd』,『huaix』,『zhh』,『yhh』,『hq』,『bs』,『wq』,『kk』,『yx』,『qq』,『xia』,『kel』,『cd』,『xig』,『pj』,『lq』,『pp』,『kf』,『fan』,『zt』,『mg』,『sa』,『xin』,『xs』,『dg』,『shd』,『zhd』,『dao』,『zq』,『pch』,『bb』,『yl』,『ty』,『lw』,『yb』,『qiang』,『ruo』,『ws』,『shl』,『bq』,『gy』,『qt』,『cj』,『aini』,『bu』,『hd』,『aiq』,『fw』,『tiao』,『fad』,『oh』,『zhq』,『kt』,『ht』,『tsh』,『hsh』,『jd』,『jw』,『xw』,『zuotj』,『youtj』";
		//以逗号为分隔标志，将每个表情代码依次放到数组中去
		String faceURL[] = faceCode.split(",");
		
		//如果message的值不为空（只适用用于页面第一次加载）
		if(request.getParameter("message")!=""){
			for(int i=0;i<faceURL.length;i++){
				//将表情代码转换成对应的图片地址
				message = message.replaceAll(faceURL[i],"<img src='../face/"+faceURL[i].replace("『", "").replace("』", "")+".gif'/>");
			}
			//设置消息的格式
			message = "<font size='2' color='#006600'><strong>["+currentTime+"]</strong></font>&nbsp;<font size='2' color='#666666'><strong>"+email+"说:&nbsp;&nbsp;&nbsp;</strong></font><font font size='2'>"+message+"</font><br />";
			
			
			ArrayList<String> messageList = null;
			synchronized (application) {
				//获取群聊信息
				messageList = (ArrayList<String>)application.getAttribute("messageList");
				//如果群聊信息为空，重新new一个ArrayList
				if(messageList==null){
					messageList = new ArrayList<String>();
				}
				//将新的消息加入到messageList里去
				messageList.add(message);
				//只保存最新的22聊天群聊消息
				if(messageList != null){
					if(messageList.size() > 23){
						messageList.remove(0);
					}
				}
				//将消息存放在application中
				application.setAttribute("messageList", messageList);
			}
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
