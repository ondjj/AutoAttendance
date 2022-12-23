package controller;

import java.io.IOException;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import dao.news_DAO;
import dto.News_DTO;
import utils.BoardPage;

@WebServlet("/news_List2.do")
public class news_ListCon2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		news_DAO dao = new news_DAO(); // DAO 객체 생성
		
		Map<String, Object> map = new HashMap<String, Object>(); // 뷰 파일에 전달할 매개변수 저장용 맵 생성

		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null) { // 전달 받은 매개변수 중 검색 단어가 있다면 map에 해당값 저장
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		int totalCount = dao.selectCount(map); // 게시물의 개수 저장
		
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE")); // 페이지당 표시할 게시물 수
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK")); // 블록당 페이지 수
		// 페이지 설정 상수값 가져와서 페이지당 게시물 수와 블록당 페이지 수를 구함
		// 이후 현재 페이지를 확인한 후 목록에 출력할 게시물 범위 계산해서 컬렉션 map에 추가함
		
		// 현재 페이지 확인
		int pageNum = 1; // 초기값은 1로 설정
		String pageTemp = request.getParameter("pageNum");
		
		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		// 목록에 출력할 게시물 범위 확인
		int end = totalCount - (pageSize * (pageNum - 1)); // 첫 게시물 번호
		int start = end - (pageSize - 1); // 마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		
		// 게시물 목록 받기
		List<News_DTO> n_list = dao.selectListPage(map);
		dao.close();
		
		// 뷰에 전달할 매개변수 추가
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./news_List.do");
		
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		request.setAttribute("n_list", n_list);
		request.setAttribute("map", map);
		request.setAttribute("searchWord", map.get("searchWord"));
		
		
		request.getRequestDispatcher("/Main_news_List.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
