package net.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class MgrReplyView implements Action  {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		
		//글번호 파라미터 값을 변수에 저장
		int num = Integer.parseInt(request.getParameter("num"));
		
		//글의 내용을 dao에서 읽은 후 결과를 boarddata 객체에 저장
		boarddata = boarddao.getDetail(num);
		
		if(boarddata==null) {
			System.out.println("글이 존재하지 않습니다.");
			forward.setRedirect(false);
			request.setAttribute("message", "글이 존재하지 않습니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		System.out.println("답변 페이지 이동 완료");
		
		//답변 폼 페이지로 이동할 때 원본 글 내용을 보여주기 위해 
		//boarddata 객체를 request 객체에 저장한다
		request.setAttribute("boarddata", boarddata);
		
		forward.setRedirect(false);
		forward.setPath("board/boardReply.jsp");
		return forward;
	}
}
