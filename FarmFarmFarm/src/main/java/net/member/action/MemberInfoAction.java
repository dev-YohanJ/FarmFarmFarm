package net.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.Member;
import net.member.db.MemberDAO;

public class MemberInfoAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		MemberDAO mdao = new MemberDAO();
		Member m = mdao.member_info(id);
		
		if(m==null) {
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "아이디에 해당하는 정보가 없습니다.");
			forward.setRedirect(false);
			return forward;
		}
		
		request.setAttribute("memberinfo", m);
		forward.setRedirect(false);	
		forward.setPath("member/memberInfo.jsp");
		return forward;
	}
}
