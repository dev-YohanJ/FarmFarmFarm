package net.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminpageAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pagefile = request.getParameter("pagefile");
		
		if( request.getAttribute("pagefile") != null ) {
			pagefile = (String) request.getAttribute("pagefile");
		}
		
		
		if(pagefile == null) {
			pagefile = "admin_notice";
		}
		
		request.setAttribute("pagefile", pagefile);

		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_notice.jsp");
		return forward;
	}
}
