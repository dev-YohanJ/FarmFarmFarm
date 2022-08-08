package net.member.action;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.member.db.Member;
import net.member.db.MemberDAO;

public class MemberJoinProcessAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		Member m = new Member();
		m.setId(id);		m.setPassword(pass);		m.setName(name);
		m.setAge(age);		m.setGender(gender);		m.setEmail(email);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDAO mdao = new MemberDAO();
		
		int result = mdao.insert(m);
		
//		result=0;
		if(result==0) {
			System.out.println("회원 가입 실패입니다.");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);	
			request.setAttribute("message", "회원 가입 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		out.println("<script>");
		if (result == 1) {	//삽입이 된 경우
			out.println("alert('회원 가입을 축하합니다.');");
			out.println("location.href='login.net';");
		} else if (result == -1) {
			out.println("alert('아이디가 중복되었습니다. 다시 입력하세요');");
			//새로고침되어 이전에 입력한 데이터가 나자나지 않는다
			//out.println("location.href='join.net';");
			out.println("history.back()");	//비밀번호를 제외한 다른 데이터는 유지되어 있다
		}
		out.println("</script>");
		out.close();
		return null;
	}
	

}
