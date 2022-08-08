package net.cart.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int itemid = Integer.parseInt(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String memid = (String) request.getSession().getAttribute("id");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);	
		forward.setPath("cart/cart.jsp");
		return forward;
	}
}
