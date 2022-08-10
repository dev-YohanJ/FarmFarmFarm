package net.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.QnaBean;
import net.board.db.QnaDAO;

public class QnaModifyView implements Action {
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException{
      
      ActionForward forward = new ActionForward();
      QnaDAO qnadao = new QnaDAO();
      QnaBean qnadata = new QnaBean();
      
      //파라미터로 전달받은 수정할 글 번호를 num변수에 저장합니다.
      int num = Integer.parseInt(request.getParameter("num"));
      //글 내용을 불러와서 qnadata객체에 저장합니다.
      qnadata = qnadao.getDetail(num);
      
      //글 내용 불러오기 실패한 경우입니다.
      if(qnadata == null) {
         System.out.println("(수정)상세보기 실패");
         forward = new ActionForward();
         forward.setRedirect(false);
         request.setAttribute("message", "문의하기 게시판 수정 상세 보기 실패입니다.");
         forward.setPath("error/error.jsp");
         return forward;
      }
      System.out.println("(수정)상세보기 성공");
      
      //수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 qnadata 객체를
      //request 객체에 저장합니다.
      request.setAttribute("qnadata", qnadata);
      forward.setRedirect(false);
      //글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
      forward.setPath("board/board_qnaModify.jsp");
      return forward;
   }

}