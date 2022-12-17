package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AnouncementDAO;
import dto.AnouncementDTO;


@WebServlet("/Anouncement_View2.do")
public class Anouncement_ViewCon2 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnouncementDAO dao = new AnouncementDAO(); // dao 객체 생성
		String num = request.getParameter("num"); // 게시물 번호 가져오기
		dao.updateVisitCount(num); // 게시물 조회수 증가
		AnouncementDTO dto = dao.selectView(num); // 게시물 세부정보 보기 호출
		dao.close();
		
		// 게시물 dto 객체 저장 후 뷰 파일(게시물 세부정보)로 포워드 시킴
		request.setAttribute("dto", dto);
		
		request.getRequestDispatcher("/Main_Ano_View.jsp").forward(request, response);
	}


}
