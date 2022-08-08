package net.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.QnaDAO;

public class QnaDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		boolean result=false;
		boolean usercheck=false;
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		QnaDAO qnadao=new QnaDAO();
		//글 삭제 명령을 요청한 사용자가 글을 작성한 사용자인지 판단하기 위해
		//입력한 비밀번호와 저장된 비밀번호를 비교하여 일치하면 삭제합니다.
		usercheck=qnadao.isQnaWriter(num, request.getParameter("qna_pass"));
		
		//비밀번호 일지하지 않는 경우
	     if(usercheck == false) {
	         response.setContentType("text/html;charset=utf-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('비밀번호가 다릅니다.');");
	         out.println("history.back();");
	         out.println("</script>");
	         out.close();
	         return null;
	     }
	      
	     //비밀번호 일치하는 경우 삭제 처리 합니다.
	     result=qnadao.qnaDelete(num);
	     
	     //삭제 처리 실패한 경우
	     if(result==false) {
	         System.out.println("문의하기 게시판 삭제 실패");
	         ActionForward forward = new ActionForward();
	         forward.setRedirect(false);
	         request.setAttribute("message", "데이터를 삭제하지 못했습니다.");
	         forward.setPath("error/error.jsp");
	         return forward;
	     }
	     //삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
	     System.out.println("문의하기 게시판 삭제 성공");
	     response.setContentType("text/html;charset=utf-8");
	     PrintWriter out = response.getWriter();
	     out.println("<script>");
	     out.println("alert('삭제 되었습니다.');");
	     out.println("location.href='QnaList.bo';");
	     out.println("</script>");
	     out.close();
	     return null;
	}
}
