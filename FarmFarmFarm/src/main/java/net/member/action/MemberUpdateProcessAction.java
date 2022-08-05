package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.member.db.Member;
import net.member.db.MemberDAO;

public class MemberUpdateProcessAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String realFolder = "";
		//webapp 아래에 폴더 생성
		String saveFolder = "memberupload";
		
		int fileSize = 5*1024*1024;
		
		//실제 저장 경로 지정
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		System.out.println("realFolder= [" + realFolder);
		try{
			MultipartRequest multi = new MultipartRequest(
									request, realFolder, fileSize, "UTF-8", 
									new DefaultFileRenamePolicy());
			
			String id = multi.getParameter("id");
			String name = multi.getParameter("name");
			int age = Integer.parseInt(multi.getParameter("age"));
			String gender = multi.getParameter("gender");
			String email = multi.getParameter("email");
			String memberfile = multi.getFilesystemName("memberfile");
			Member m = new Member();
			m.setId(id);			m.setName(name);		m.setAge(age);
			m.setGender(gender);	m.setEmail(email);		m.setMemberfile(memberfile);
			
			MemberDAO mdao = new MemberDAO();
			int result = mdao.update(m);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			//삽입이 된 경우
			if (result == 1) {
				out.println("alert('수정되었습니다.');");
				out.println("location.href = 'BoardList.bo';");
			} else {
				out.println("alert('회원 정보 수정에 실패했습니다.');");
				out.println("history.back()");	//비밀번호를 제외한 다른 데이터는 유지
			}
			out.println("</script>");
			out.close();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			ActionForward forward = new ActionForward();
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "실패입니다.");
			forward.setRedirect(false);
			return forward;
		}
	}
}
