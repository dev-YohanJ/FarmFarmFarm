package net.cart.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.cart.db.Cart;
import net.cart.db.CartDAO;

public class CartAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CartDAO dao = new CartDAO();
		Cart cart = new Cart();
		String memid = (String) request.getSession().getAttribute("id");
		int itemid = Integer.parseInt(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		cart.setCart_mem_id(memid);
		cart.setCart_item_id(itemid);
		cart.setCart_quantity(quantity);
		dao.addCart(cart);
		ArrayList<Cart> list = dao.getCartList(memid);
		
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);	
		forward.setPath("cart/cartList.jsp");
		return forward;
	}
}
