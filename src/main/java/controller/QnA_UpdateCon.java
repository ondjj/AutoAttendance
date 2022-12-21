package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnA_DAO;
import dao.data_lib_DAO;
import dto.QnA_DTO;

@WebServlet("/qna_update.do")
public class QnA_UpdateCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqUpdate(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqUpdate(request, response);
	}
	
	protected void reqUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); 
		
		String num = request.getParameter("num");
		QnA_DTO dto = new QnA_DTO();
		
		if (request.getParameter("question") != null) {
			String question = request.getParameter("question");
			dto.setQna_num(num);
			dto.setQna_question(question);
		}
		if (request.getParameter("answer") != null) {
			String answer = request.getParameter("answer");
			dto.setQna_num(num);
			dto.setQna_answer(answer);
		}
		
		// DB에 수정 내용 반영
		QnA_DAO dao = new QnA_DAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		request.setAttribute("dto", dto);
		if (result == 1) {
			response.sendRedirect("/qna_list.do");
		}
	}

}
