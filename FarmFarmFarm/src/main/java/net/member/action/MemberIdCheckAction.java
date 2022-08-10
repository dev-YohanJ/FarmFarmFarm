package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/idcheck.net")
public class MemberIdCheckAction extends HttpServlet {
	private static final long serialVersionUID=1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		PrintWriter out = response.getWriter();
		System.out.println("값이올까요? userId = " + userId);
		MemberDAO dao = new MemberDAO();
		
		int idcheck = dao.isID_exit(userId);
		System.out.println("idcheck = "+idcheck);
		if(idcheck==0) {
				System.out.println("사용 가능한 아이디입니다.");
		}else if(idcheck==1) {
			System.out.println("사용중인 아이디입니다.");
		}
		out.write(idcheck +""); 

	}
	
}