package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FAQ_DAO;
import dto.FAQ_DTO;

@WebServlet("/faq_write.do")
public class FAQ_WriteCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqWrite(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqWrite(request, response);
	}
	
	protected void reqWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// 폼에서 입력한 값을 dto 객체에 저장
		FAQ_DTO dto = new FAQ_DTO();

		dto.setFaq_category(request.getParameter("category"));
		dto.setFaq_subject(request.getParameter("subject"));
		dto.setFaq_content(request.getParameter("content"));
		
		// dao를 통해서 db에 개시물 내용 저장
		FAQ_DAO dao = new FAQ_DAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		if (result == 1) {
			response.sendRedirect("./faq_list.do");
		} else {
			response.sendRedirect("./faq_write.do");
		}
		
	}

}
