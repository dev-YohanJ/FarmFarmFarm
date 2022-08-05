package net.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;

public class BoardDeleteAction implements Action  {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		boolean result = false;
		boolean usercheck = false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO boarddao = new BoardDAO();
		
		//글 삭제 명령을 요청한 사용자가 작성자인지 판단하기 위해 비밀번호 비교
		usercheck = boarddao.isBoardWriter(num, request.getParameter("board_pass"));
		
		if (usercheck == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		//비밀번호 일치하는 경우 삭제 처리
		result = boarddao.boardDelete(num);
		
		if (result==false) {
			System.out.println("게시판 삭제 실패");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "데이터를 삭제하지 못했습니다.");
			return forward;
		}
		
		System.out.println("게시판 삭제 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 되었습니다.');");
		out.println("location.href='BoardList.bo';");
		out.println("</script>");
		out.close();
		return null;
	}
}
