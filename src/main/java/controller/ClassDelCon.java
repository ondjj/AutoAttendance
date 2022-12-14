package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClassDAO;

@WebServlet("/ClassDelCon.do")
public class ClassDelCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lecture_name = request.getParameter("lecture_name");
		
		ClassDAO cdao = new ClassDAO();
		cdao.delClass(lecture_name);
		
		String test = URLEncoder.encode(request.getParameter("subject"), "UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		response.sendRedirect("ClassView.do?subject=" + test);
		
	}

}
