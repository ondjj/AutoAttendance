package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ColDAO;
import dto.ColMemberDTO;

@WebServlet("/ColUpdateForm.do")
public class ColUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		ColDAO cdao = new ColDAO();
		ColMemberDTO cdto = cdao.getCol(id);
		
		request.setAttribute("code_id", id);
		request.setAttribute("cdto", cdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("manager_colUpdate.jsp");
		dis.forward(request, response);
		
	}

}
