package net.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberIdCheckAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		int result = dao.isId(request.getParameter("id"));
		response.getWriter().append(Integer.toString(result));
		System.out.println(result);
		return null;
	}
}
