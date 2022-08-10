package net.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.NoticeBean;
import net.admin.db.NoticeDAO;

public class NoticeReplyAction implements Action {
	public ActionForward execute(HttpServletRequest request,
								 HttpServletResponse response)
	throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		NoticeDAO noticedao=new NoticeDAO();
		NoticeBean noticedata=new NoticeBean();
		int result=0;
		
		//파라미터로 넘어온 값들을 noticedata 객체에 저장합니다.
	      noticedata.setNotice_name(request.getParameter("notice_name"));
	      noticedata.setNotice_pass(request.getParameter("notice_pass"));
	      noticedata.setNotice_subject(request.getParameter("notice_subject"));
	      noticedata.setNotice_content(request.getParameter("notice_content"));
	      noticedata.setNotice_re_ref(Integer.parseInt(request.getParameter("notice_re_ref")));
	      noticedata.setNotice_re_lev(Integer.parseInt(request.getParameter("notice_re_lev")));
	      noticedata.setNotice_re_seq(Integer.parseInt(request.getParameter("notice_re_seq")));
	      
	      //답변을 DB에 저장하기 위해 noticedata 객체를 파라미터로 전달하고
	      //DAO의 메서드 NoticeReply를 호출합니다.
	      result=noticedao.noticeReply(noticedata);
	      
	      //답변 저장에 실패한 경우
	      if(result==0){
	         System.out.println("답장 저장 실패");
	         forward = new ActionForward();
	         forward.setRedirect(false);
	         request.setAttribute("message", "답장 저장 실패 입니다.");
	         forward.setPath("error/error.jsp");
	         return forward;
	      }
	      
	    //답변 저장에 실패한 경우
	      if(result==0) {
	         System.out.println("답장 저장 실패");
	         forward = new ActionForward();
	         forward.setRedirect(false);         
	         request.setAttribute("message", "답장 저장 실패입니다.");
	         forward.setPath("error/error.jsp");
	         return forward;
	      }
	      
	      //답변 저장이 제대로 된 경우
	      System.out.println("답장 저장 완료");   
	      forward.setRedirect(true);
	      //답변 글 내용을 확인하기 위해 글 내용 보기 페이지를 경로로 설정합니다.
	      forward.setPath("NoticeDetailAction.bo?num="+result);
	      return forward;
	   }
	}