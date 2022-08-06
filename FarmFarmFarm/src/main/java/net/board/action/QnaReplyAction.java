package net.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardReplyAction implements Action  {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		ActionForward forward = new ActionForward();
		int result = 0;	

		boarddata.setBoard_name(request.getParameter("board_name"));
		boarddata.setBoard_pass(request.getParameter("board_pass"));
		boarddata.setBoard_subject(request.getParameter("board_subject"));
		boarddata.setBoard_content(request.getParameter("board_content"));
		boarddata.setBoard_re_ref(Integer.parseInt(request.getParameter("board_re_ref")));
		boarddata.setBoard_re_lev(Integer.parseInt(request.getParameter("board_re_lev")));
		boarddata.setBoard_re_seq(Integer.parseInt(request.getParameter("board_re_seq")));
		
		result = boarddao.boardReply(boarddata);
		
		if (result==0) {
			System.out.println("답장 저장 실패");
			forward = new ActionForward();
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "답장 저장 실패입니다.");
			forward.setRedirect(false);
			return forward;
		}
		System.out.println("답장 완료");
		forward.setRedirect(true);
		forward.setPath("BoardDetailAction.bo?num=" + result);
		return forward;
	}
}
