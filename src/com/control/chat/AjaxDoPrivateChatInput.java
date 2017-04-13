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

		//����һ��session��application
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		
		//��ȡ��ǰ�û����ǳ�
		String email = (String)session.getAttribute("email");
		//��ȡ��ǰ�û��������Ϣ
		String privateChatMessage = request.getParameter("privateChatMessage");
		//��ȡ����˽����Ϣ����
		String sendToWho = request.getParameter("sendToWho");
		//��ȡ����˽����Ϣ����
		String receiveFromWho = request.getParameter("receiveFromWho");	
		
		//ȡ�õ�ǰ��ʱ��
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(new Date());
		
		
		//�����еı���������һ���ַ�����ö��Ÿ���
		String faceCode = "��wx��,��pz��,��se��,��fd��,��dy��,��ll��,��hx��,��bz��,��shui��,��dk��,��gg��,��fn��,��tp��,��cy��,��jy��,��ng��,��kuk��,��lengh��,��zk��,��tuu��,��tx��,��ka��,��baiy��,��am��,��jie��,��kun��,��jk��,��lh��,��hanx��,��db��,��fendou��,��zhm��,��yiw��,��wx��,��xu��,��yun��,��zhem��,��shuai��,��kl��,��qiao��,��zj��,��ch��,��kb��,��gz��,��qd��,��huaix��,��zhh��,��yhh��,��hq��,��bs��,��wq��,��kk��,��yx��,��qq��,��xia��,��kel��,��cd��,��xig��,��pj��,��lq��,��pp��,��kf��,��fan��,��zt��,��mg��,��sa��,��xin��,��xs��,��dg��,��shd��,��zhd��,��dao��,��zq��,��pch��,��bb��,��yl��,��ty��,��lw��,��yb��,��qiang��,��ruo��,��ws��,��shl��,��bq��,��gy��,��qt��,��cj��,��aini��,��bu��,��hd��,��aiq��,��fw��,��tiao��,��fad��,��oh��,��zhq��,��kt��,��ht��,��tsh��,��hsh��,��jd��,��jw��,��xw��,��zuotj��,��youtj��";
		//�Զ���Ϊ�ָ���־����ÿ������������ηŵ�������ȥ
		String faceURL[] = faceCode.split(",");
	
		for(int i=0;i<faceURL.length;i++){
			//���������ת���ɶ�Ӧ��ͼƬ��ַ
			privateChatMessage = privateChatMessage.replaceAll(faceURL[i],"<img src='../face/"+faceURL[i].replace("��", "").replace("��", "")+".gif'/>");
		}
		
		//����˽����Ϣ�ĸ�ʽ
		privateChatMessage = "<tr ><td id='"+sendToWho+"&"+receiveFromWho+"'><font size='2' color='#006600'>"+email+"&nbsp;&nbsp;"+currentTime+"</font><br />&nbsp;&nbsp;&nbsp;<font size='2'>"+privateChatMessage+"</font></td></tr>";
		
		
		ArrayList<String> privateChatMessageList = null;
		ArrayList<String> sendToWhoList = null;
		ArrayList<String> receiveFromWhoList = null;
		synchronized (application) {
			//��ȡ���е�˽����Ϣ
			privateChatMessageList = (ArrayList<String>)application.getAttribute("privateChatMessageList");
			//��ȡ���н���˽����Ϣ����
			sendToWhoList = (ArrayList<String>)application.getAttribute("sendToWhoList");
			//��ȡ���з���˽����Ϣ����
			receiveFromWhoList = (ArrayList<String>)application.getAttribute("receiveFromWhoList");
			if(privateChatMessageList==null){
				//���˽����ϢΪ�գ�����newһ��ArrayList
				privateChatMessageList = new ArrayList<String>();
				sendToWhoList = new ArrayList<String>();
				receiveFromWhoList = new ArrayList<String>();
			}
			//����ȡ������Ϣ����б���ȥ
			privateChatMessageList.add(privateChatMessage);
			sendToWhoList.add(sendToWho);
			receiveFromWhoList.add(receiveFromWho);
			//����Ϣ�б�����application��
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
