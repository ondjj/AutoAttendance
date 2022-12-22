package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnA_DAO;
import dto.QnA_DTO;

@WebServlet("/qna_write.do")
public class QnA_WriteCon extends HttpServlet {

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
		QnA_DTO dto = new QnA_DTO();
		QnA_DAO dao = new QnA_DAO();
		
		dto.setQna_writer(request.getParameter("writer"));
		dto.setQna_question(request.getParameter("question"));
		
		// dao를 통해서 db에 개시물 내용 저장
		int result = dao.insertWrite(dto);
		dao.close();
		
		if (result == 1) {
			response.sendRedirect("./qna_list.do");
		} else {
			response.sendRedirect("./qna_list.do");
		}
		
	}

}
