package net.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("*.mgr")
public class AdminFrontController extends javax.servlet.http.HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 요청된 전체 URL중에서 포트 버호 다음 부터 마지막 문자열까지 반환됩니다.
		 예) contextPath가 "/JspProject"인 경우 
		 	http://localhost:8088/JspProject/login.net로 요청하면 RequestURI는
		 	"/JspProject.login.net" 반환됩니다.
		 */
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);
		
		// getContextPath() : 컨텍스트 경로가 반환됩니다.
		// contextPath는 "/JspProject"가 반환됩니다.
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		// RequestURI에서 컨텍스트 영로 길이 값이 인텍스 위치의 문자부터
		// 마지막 위치 문자까지 추출합니다.
		// command는 "/login.net" 반환됩니다.
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		
		//초기화
		ActionForward forward = null;
		Action action = null;
		
		switch (command) {
			case "/NoticeList.mgr":
				action = new NoticeListAction();
				break;
			case "/NoticeWrite.mgr":
				action = new NoticeWriteAction();
				break;
			case "/NoticeAddAction.mgr":
				action = new NoticeAddAction();
				break;
			case "/NoticeDetailAction.mgr":
				action = new NoticeDetailAction();
				break;
			case "/NoticeModifyView.mgr":
				action = new NoticeModifyView();
				break;
			case "/NoticeModifyAction.mgr":
				action = new NoticeModifyAction();
				break;
			case "/NoticeReplyView.mgr":
				action = new NoticeReplyView();
				break;
			case "/NoticeReplyAction.mgr":
				action = new NoticeReplyAction();
				break;
			case "/NoticeDeleteAction.mgr":
				action = new NoticeDeleteAction();
				break;
			case "/QnaList.mgr":
				action = new QnaListAction();
				break;
			case "/QnaWrite.mgr":
				action = new QnaWriteAction();
				break;
			case "/QnaAddAction.mgr":
				action = new QnaAddAction();
				break;
			case "/QnaDetailAction.mgr":
				action = new QnaDetailAction();
				break;
			case "/QnaModifyView.mgr":
				action = new QnaModifyView();
				break;
			case "/QnaModifyAction.mgr":
				action = new QnaModifyAction();
				break;
			case "/QnaReplyView.mgr":
				action = new QnaReplyView();
				break;
			case "/QnaReplyAction.mgr":
				action = new QnaReplyAction();
				break;
			case "/QnaDeleteAction.mgr":
				action = new QnaDeleteAction();
				break; 

		}// switch end
		
		forward = action.execute(request, response);
		
		if (forward != null) {
			if (forward.isRedirect()) { // 리다이렉트 됩니다.
				response.sendRedirect(forward.getPath());
			} else {// 포워딩 됩니다.
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}//doProcess() end
	
	// doProcess(requset, response)메서드를 구현하여 요청이 Get방식이든
	// POST방식으로 전송되어 오든 같은 메서드에서 요청을 처리할 수 있도록 하였습니다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
	
}
