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

@WebServlet("/ColJoinCon.do")
public class ColJoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ColMemberDTO cdto = new ColMemberDTO();
		
		cdto.setMember_id(request.getParameter("id"));
		cdto.setCol_status(request.getParameter("col_status"));
		cdto.setCol_faculty(request.getParameter("col_faculty"));
		cdto.setCol_major(request.getParameter("col_major"));
		cdto.setCol_second_faculty(request.getParameter("col_second_faculty"));
		cdto.setCol_type(request.getParameter("col_type"));
		cdto.setCol_complete(request.getParameter("col_complete"));
	
		ColDAO cdao = new ColDAO();
		cdao.Col_manageRegister(cdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("MemberListCon.do");
		dis.forward(request, response);
	}

}
