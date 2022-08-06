package net.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class NoticeDetailAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		
		//글번호 파라미터 값을 변수에 저장
		int num = Integer.parseInt(request.getParameter("num"));
		
		//내용을 확인할 글의 조회수를 증가시킨다
		boarddao.setReadCountUpdate(num);
		
		//글의 내용을 dao에서 읽은 후 결과를 boarddata 객체에 저장
		boarddata = boarddao.getDetail(num);
		
		if(boarddata==null) {
			System.out.println("상세보기 실패");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "데이터를 읽지 못했습니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("boarddata", boarddata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("board/boardView.jsp");
		return forward;
	}
}
