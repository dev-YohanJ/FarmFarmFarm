package net.order.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException ;
}