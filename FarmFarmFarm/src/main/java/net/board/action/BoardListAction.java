package net.board.action;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardListAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		BoardDAO boarddao = new BoardDAO();
		List<BoardBean> boardlist = new ArrayList<BoardBean>();
		
		//로그인 성공시 파라미터 page가 없어서 초기값이 필요함
		int page = 1;	//보여줄 page
		int limit = 10;	//한 페이지에 보여줄 게시판 목록의 수
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지 = " + page);
		
		//추가
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		System.out.println("넘어온 limit = " + limit);
		
		//총 리스트 수를 받아온다
		int listcount = boarddao.getListCount();
		
		//리스트를 받아온다
		boardlist = boarddao.getBoardList(page, limit);
		
		/*
		 *  1-10 : 1pages
		 * 11-20 : 2pages
		 * 21-30 : 3pages
		 */
		int maxpage = (listcount + limit - 1) / limit;
		System.out.println("총 페이지수 = " + maxpage);
		
		/*
		 * startpage : 현재 페이지 그룹에서 맨 처음에 표시될 페이지 수를 의미
		 * 보여줄 페이지가 30개일 경우 다 표시하기에는 너무 많기 때문에 
		 * 보통 한 페이지에는 10페이지 정도까지 이동할 수 있게 표시한다
		 * [1][2][3][4][5][6][7][8][9][10]
		 * 페이지그룹의 시작 페이지는 startpage에 마지막 페이지는 endpage에 구한다
		 */
		int startpage = ((page - 1) / 10) * 10 + 1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 : " + startpage);
		
		//endpage : 현재 페이지 그룹에서 보여줄 마지막 페이지 수
		int endpage = startpage + 10 - 1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 : " + endpage);
		
		/*
		 * 마지막 그룹의 마지막 페이지 값은 최대 페이지 값이다
		 * 예로 마지막 페이지 그룹이 21-30인 경우
		 * 시작페이지는 21, 마지막페이지는 30이지만
		 * 최대 페이지가 25라면 21-25까지만 표시되도록 한다
		 */
		if (endpage > maxpage)
			endpage = maxpage;
		
		String state = request.getParameter("state");
		
		if (state == null) {
			System.out.println("state==null");
			request.setAttribute("page", page);				//현재 페이지 수
			request.setAttribute("maxpage", maxpage);		//최대 페이지 수
			request.setAttribute("startpage", startpage);	//현재 페이지에 표시할 첫 페이지 수
			request.setAttribute("endpage", endpage);		//현재 페이지에 표시할 끝 페이지 수
			request.setAttribute("listcount", listcount);	//총 글의 수
			request.setAttribute("boardlist", boardlist);	//해당 페이지의 글 목록을 갖고 있는 리스트
			request.setAttribute("limit", limit);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("board/boardList.jsp");
			return forward;
			
		} else {
			System.out.println("state==ajax");
			
			//위에서 request로 담았던 것을 JsonObject에 담는다
			JsonObject object = new JsonObject();
			object.addProperty("page", page);	//{"page" : page의 값} 형식으로 저장
			object.addProperty("maxpage", maxpage);		
			object.addProperty("startpage", startpage);	
			object.addProperty("endpage", endpage);		
			object.addProperty("listcount", listcount);	
			object.addProperty("limit", limit);
			/*
			 * JsonObject에 List 형식을 담을 수 있는 addProperty()는 존재하지 않는다
			 * void com.google.gson.JsonObject.add(String property, JsonElement value)
			 * 메서드를 통해서 저장한다
			 * List 형식을 JsonElement로 바꾸어 주어야 object에 저장 가능
			 * List => JsonElement
			 */
			JsonElement je = new Gson().toJsonTree(boardlist);
			System.out.println("boardlist = " + je.toString());
			object.add("boardlist", je);
			
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append(object.toString());
			System.out.println(object.toString());
			return null;
		}
	}
}
