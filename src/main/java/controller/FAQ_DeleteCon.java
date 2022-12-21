package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FAQ_DAO;
import dto.FAQ_DTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/faq_delete.do")
public class FAQ_DeleteCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqDelete(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqDelete(request, response);
	}
	
	protected void reqDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("num", request.getParameter("num"));
		
		String num = request.getParameter("num");
		FAQ_DAO dao = new FAQ_DAO();
		int result = dao.deletePost(num);
		dao.close();
		
		if (result == 1) {
		}
		JSFunction.alertLocation(response, "삭제 완료", "./faq_list.do");
	}

}
