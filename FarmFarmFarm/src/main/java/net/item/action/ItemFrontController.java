package net.item.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.tem")
public class ItemFrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/*
		 * 요청된 전체 URL 중에서 포트 번호 다음부터 마지막 문자열까지 반환된다
		 * 예) contextPath가 "/JspProject"인 경우
		 * 		http://localhost:8088/JspProject/login.net으로 요청하면 getRequestURI()는
		 * 		"/JspProject/login.net"이 반환된다
		 */
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);
		
		//contextPath는 "/JspProject"가 반환된다
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		//requestURI에서 컨텍스트 경로 길이 값의 인덱스 위치의 문자부터 마지막 위치 문자까지 추출한다
		//command는 "/login.net" 반환된다
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		
		//초기화
		ActionForward forward = null;
		Action action = null;
		
		switch (command) {
			case "/detail.tem":
				action = new ItemDetailAction();
				break;
				
			case "/list.tem":
				action = new ItemListAction();
				break;
			
		}
		forward = action.execute(request, response);
		
		if (forward != null) {
			if (forward.isRedirect()) {		//redirect
				response.sendRedirect(forward.getPath());
			} else {		//forwarding
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	//doProcess()메서드를 구현하여 요청이 get이든 post이든 같은 메서드에서 요청을 처리할 수 있도록 한다
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doProcess(request, response);
	}
}
