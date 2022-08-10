package net.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.NoticeBean;
import net.admin.db.NoticeDAO;


public class NoticeDetailAction  implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws SecurityException, IOException {
		NoticeDAO noticedao=new NoticeDAO();
		NoticeBean noticedata=new NoticeBean();
		
		//글번호 파라미터 값을 num변수에 저장합니다.
		int num=Integer.parseInt(request.getParameter("num"));
		
		//내용을 확인할 글의 조회수를 증가시킵니다.
		noticedao.setReadCountUpdate(num);
		
		//글의 내용을 DAO에서 읽은 후 얻은 결과를 noticedata 객체에 저장합니다.
		noticedata=noticedao.getDetail(num);
		
		//noticedata=null;//error테스트를 위한 값 설정
		//DAO에서 글은 내용을 읽지 못했을 경우 null값을 반환합니다.
		if(noticedata==null){
			System.out.println("상세보기 실패");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "데이터를 읽지 못했습니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("상세보기 성공");
		
		//noticedata 객체를 request 객체에 저장합니다.
		request.setAttribute("noticedata", noticedata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("board/board_noticeView.jsp"); //글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
		return forward;
	}
}