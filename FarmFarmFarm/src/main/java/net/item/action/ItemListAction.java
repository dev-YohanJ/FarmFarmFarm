package net.item.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.item.db.Item;
import net.item.db.ItemDAO;

public class ItemListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
				ActionForward forward = new ActionForward();
				ItemDAO dao = new ItemDAO();
				
				int page = 1;		//보여줄 페이지 
				int limit = 6;		//한 페이지에 보여줄 게시판 목록 수 ##중요!!!
				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				System.out.println("넘어온 페이지 = " + page);
				
				List<Item> list = dao.getList(page, limit);		//목록 불러오기 
				int listcount =  dao.getListCount();			//전체 글수 확인 
				
				
				int maxpage = (listcount + limit -1) /limit;
				System.out.println("총 페이지수 = " + maxpage);
				
				int startpage = ((page - 1 )/10) * 10 + 1;
				System.out.println("현재 페이지에 보여줄 시작 페이지 수 : " + startpage);
				
				int endpage = startpage +10 -1;
				System.out.println("현재 페이지에 보여줄 마지막 페이지 수 : " + endpage);
				
				if(endpage > maxpage)
					endpage = maxpage;
				
				request.setAttribute("page", page);			//현재 페이지 수 
				request.setAttribute("maxpage", maxpage);	//최대 페이지 수 
				
				//현재 페이지에 표시할 첫 페이지 수 
				request.setAttribute("startpage", startpage);
				
				//현재 페이지에 표시할 끝 페이지 수 
				request.setAttribute("endpage", endpage);
				
				request.setAttribute("listcount", listcount);	//총 글의 수  
				
				//해당 페이지의 글 목록을 갖고 있는 리스트 
				request.setAttribute("totallist", list);
				
				
				//글 목록 페이지로 이동하기 위해 경로를 설정합니다. 
				forward.setPath("item/list.jsp");
				forward.setRedirect(false);
				return forward;		
	}

}
