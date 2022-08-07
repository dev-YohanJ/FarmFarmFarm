package net.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.NoticeDAO;

public class NoticeDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		boolean result=false;
		boolean usercheck=false;
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO noticedao=new NoticeDAO();
		//글 삭제 명령을 요청한 사용자가 글을 작성한 사용자인지 판단하기 위해
		//입력한 비밀번호와 저장된 비밀번호를 비교하여 일치하면 삭제합니다.
		usercheck=noticedao.isnoticeWriter(num, request.getParameter("notice_pass"));
		
		//비밀번호 일치하지 않는 경우
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
	     result=noticedao.noticeDelete(num);
	     
	     //삭제 처리 실패한 경우
	     if(result==false) {
	         System.out.println("게시판 삭제 실패");
	         ActionForward forward = new ActionForward();
	         forward.setRedirect(false);
	         request.setAttribute("message", "데이터를 삭제하지 못했습니다.");
	         forward.setPath("error/error.jsp");
	         return forward;
	     }
	     //삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
	     System.out.println("공시사항 게시굴 삭제 성공");
	     response.setContentType("text/html;charset=utf-8");
	     PrintWriter out = response.getWriter();
	     out.println("<script>");
	     out.println("alert('삭제 되었습니다.');");
	     out.println("location.href='NoticeList.mgr';");
	     out.println("</script>");
	     out.close();
	     return null;
	}
}
