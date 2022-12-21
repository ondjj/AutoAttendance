package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnA_DAO;
import dto.QnA_DTO;

@WebServlet("/qna_list.do")
public class QnA_ListCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqList(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqList(request, response);
	}
	
	protected void reqList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); 
		
		QnA_DAO dao = new QnA_DAO(); // DAO 객체 생성

		Map<String, Object> map = new HashMap<String, Object>(); // 뷰 파일에 전달할 매개변수 저장용 맵 생성
		
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null) { // 전달 받은 매개변수 중 검색한 단어를 map에 해당값 저장
			map.put("searchWord", searchWord);
		}
		
		// 게시물 데이터 전체 받기
		List<QnA_DTO> datalist = dao.selectListPage(map);
		dao.close();
		
		request.setAttribute("datalist", datalist);
		request.setAttribute("searchWord", searchWord);
		request.getRequestDispatcher("/Main_QnA.jsp").forward(request, response);
	}

}
