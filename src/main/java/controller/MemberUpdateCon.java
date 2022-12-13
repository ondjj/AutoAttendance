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

@WebServlet("/MemberUpdateCon.do")
public class MemberUpdateCon extends HttpServlet {
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
		
		memberDTO mdto = new memberDTO();
		
		mdto.setKr_name(request.getParameter("kr_name"));
		mdto.setEn_name(request.getParameter("en_name"));
		mdto.setId(request.getParameter("id"));
		mdto.setPassword(request.getParameter("password1"));
		mdto.setGender(request.getParameter("gender"));
		mdto.setAdmin_key(request.getParameter("admin_key"));
		mdto.setAge(Integer.valueOf(request.getParameter("age")));
		mdto.setCollege_year(Integer.valueOf(request.getParameter("col_reg_date")));
		mdto.setPrivate_num(request.getParameter("private_num"));
		mdto.setPhone_num(request.getParameter("phone_num"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setAddress(request.getParameter("address"));
		mdto.setId_picture(request.getParameter("id_picture"));
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.updateMemer(mdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("MemberInfoCon.do");
		dis.forward(request, response);
		
	}

}
