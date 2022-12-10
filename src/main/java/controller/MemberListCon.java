package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.memberDTO;

@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		MemberDAO mdao = new MemberDAO();
		
		ArrayList<memberDTO> arr = mdao.getAllMember();
		
		
		request.setAttribute("arr", arr);
		RequestDispatcher dis = request.getRequestDispatcher("manager_memberList.jsp");
		dis.forward(request, response);
	}

}