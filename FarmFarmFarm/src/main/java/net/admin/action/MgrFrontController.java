package net.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class MgrFrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);
		
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		
		ActionForward forward = null;
		Action action = null;
		
		switch (command) {
			case "/BoardList.bo":
				action = new BoardListAction();
				break;
			case "/BoardWrite.bo":
				action = new BoardWriteAction();
				break;
			case "/BoardAddAction.bo":
				action = new BoardAddAction();
				break;
			case "/BoardDetailAction.bo":
				action = new BoardDetailAction();
				break;
			case "/BoardModifyView.bo":
				action = new BoardModifyView();
				break;
			case "/BoardModifyAction.bo":
				action = new BoardModifyAction();
				break;
			case "/BoardReplyView.bo":
				action = new BoardReplyView();
				break;
			case "/BoardReplyAction.bo":
				action = new BoardReplyAction();
				break;
			case "/BoardDeleteAction.bo":
				action = new BoardDeleteAction();
				break;

		}
		forward = action.execute(request, response);
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
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