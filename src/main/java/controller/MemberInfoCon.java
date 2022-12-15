package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.memberDTO;

@WebServlet("/MemberInfoCon.do")
public class MemberInfoCon extends HttpServlet {
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
		MemberDAO mdao = new MemberDAO();
		
		String id = request.getParameter("id");
		
		System.out.println(id);
		memberDTO mdto = mdao.getMember(id);
		
		String kr_name = mdto.getKr_name();
		String en_name = mdto.getEn_name();
		String code_id = mdto.getId();
		String pass = mdto.getPassword();
		String gender = mdto.getGender();
		String key = mdto.getAdmin_key();
		int age = mdto.getAge();
		int date = mdto.getCollege_year();
		String priNum = mdto.getPrivate_num();
		String phNum = mdto.getPhone_num();
		String email = mdto.getEmail();
		String address = mdto.getAddress();
		String face = mdto.getId_picture();
		
		request.setAttribute("kr_name", kr_name);
		request.setAttribute("en_name", en_name);
		request.setAttribute("code_id", code_id);
		request.setAttribute("key", key);
		request.setAttribute("gender", gender);
		request.setAttribute("pass", pass);
		request.setAttribute("age", age);
		request.setAttribute("date", date);
		request.setAttribute("priNum", priNum);
		request.setAttribute("phNum", phNum);
		request.setAttribute("email", email);
		request.setAttribute("address", address);
		request.setAttribute("face", face);
		
		RequestDispatcher dis = request.getRequestDispatcher("manager_memberInfo.jsp");
		dis.forward(request, response);
	}
}
