package net.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.QnaBean;
import net.admin.db.QnaDAO;

public class QnaDetailAction  implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws SecurityException, IOException {
		QnaDAO qnadao=new QnaDAO();
		QnaBean qnadata=new QnaBean();
		
		//글번호 파라미터 값을 num변수에 저장합니다.
		int num=Integer.parseInt(request.getParameter("num"));
		
		//내용을 확인할 글의 조회수를 증가시킵니다.
		qnadao.setReadCountUpdate(num);
		
		//글의 내용을 DAO에서 읽은 후 얻은 결과를 qnadata 객체에 저장합니다.
		qnadata=qnadao.getDetail(num);
		
		//qnadate=null;//error테스트를 위한 값 설정
		//DAO에서 글은 내용을 읽지 못했을 경우 null값을 반환합니다.
		if(qnadata==null){
			System.out.println("상세보기 실패");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "데이터를 읽지 못했습니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("상세보기 성공");
		
		//qnadata 객체를 request 객체에 저장합니다.
		request.setAttribute("qnadata", qnadata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/qnaView.jsp"); //글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
		return forward;
	}
}