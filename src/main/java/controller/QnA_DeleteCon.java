package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnA_DAO;
import utils.JSFunction;

@WebServlet("/qna_delete.do")
public class QnA_DeleteCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqDelete(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqDelete(request, response);
	}
	
	protected void reqDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		request.setAttribute("num", request.getParameter("num"));
		
		String num = request.getParameter("num");
		QnA_DAO dao = new QnA_DAO();
		int result = dao.deletePost(num);
		dao.close();
		
		if (result == 1) {
		}
		JSFunction.alertLocation(response, "삭제 완료", "./qna_list.do");
		
	}

}
