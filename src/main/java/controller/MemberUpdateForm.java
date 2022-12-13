package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.memberDTO;

@WebServlet("/MemberUpdateForm.do")
public class MemberUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		MemberDAO mdao = new MemberDAO(); 
		memberDTO mdto = mdao.getMember(id);
		request.setAttribute("mdto", mdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("manager_stuUpdate.jsp");
		dis.forward(request, response);
	}

}
