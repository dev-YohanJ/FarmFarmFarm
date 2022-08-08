package net.item.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.item.db.Item;
import net.item.db.ItemDAO;

public class ItemDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ItemDAO dao = new ItemDAO();
		Item item = dao.item_info(id);
		request.setAttribute("iteminfo", item);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);	
		forward.setPath("item/itemDetail.jsp");
		return forward;
	}
}
