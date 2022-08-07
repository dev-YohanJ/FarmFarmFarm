package net.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.NoticeBean;
import net.admin.db.NoticeDAO;

public class NoticeModifyView implements Action {
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException{
      
      ActionForward forward = new ActionForward();
      NoticeDAO noticedao = new NoticeDAO();
      NoticeBean noticedata = new NoticeBean();
      
      //파라미터로 전달받은 수정할 글 번호를 num변수에 저장합니다.
      int num = Integer.parseInt(request.getParameter("num"));
      //글 내용을 불러와서 noticedata객체에 저장합니다.
      noticedata = noticedao.getDetail(num);
      
      //글 내용 불러오기 실패한 경우입니다.
      if(noticedata == null) {
         System.out.println("(수정)상세보기 실패");
         forward = new ActionForward();
         forward.setRedirect(false);
         request.setAttribute("message", "공지사항 게시판 수정 상세 보기 실패입니다.");
         forward.setPath("error/error.jsp");
         return forward;
      }
      System.out.println("(수정)상세보기 성공");
      
      //수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 noticedata 객체를
      //request 객체에 저장합니다.
      request.setAttribute("noticedata", noticedata);
      forward.setRedirect(false);
      //글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
      forward.setPath("admin/noticeModify.jsp");
      return forward;
   }

}