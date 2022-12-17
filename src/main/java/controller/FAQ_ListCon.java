package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FAQ_DAO;
import dto.FAQ_DTO;
import utils.BoardPage;

@WebServlet("/faq_list.do")
public class FAQ_ListCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqList(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqList(request, response);
	}

	protected void reqList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); 
		
		FAQ_DAO dao = new FAQ_DAO(); // DAO 객체 생성

		Map<String, Object> map = new HashMap<String, Object>(); // 뷰 파일에 전달할 매개변수 저장용 맵 생성

		String category = request.getParameter("category");
		
		if(category != null) { // 전달 받은 매개변수 중 선택한 카테고리를 map에 해당값 저장
			map.put("category", category);
		}
		
		// 게시물 목록 받기
		List<FAQ_DTO> datalist = dao.selectListPage(map);
		dao.close();
		
		request.setAttribute("datalist", datalist);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/Main_FAQ.jsp").forward(request, response);
	}
	
}
