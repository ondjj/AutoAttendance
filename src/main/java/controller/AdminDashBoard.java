package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dao.MemberDAO;
import dto.memberDTO;

@WebServlet("/AdminDashBoard.do")
public class AdminDashBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String id = (String)request.getSession().getAttribute("id");
		String face = request.getParameter("data");
		MemberDAO mdao = new MemberDAO();
		memberDTO mdto = mdao.getMember(id);
		
		
		System.out.println(mdto.getId_picture() + "이름");
		request.setAttribute("mdto", mdto);
		request.setAttribute("face", face);
		request.setAttribute("img", mdto.getId_picture());
//		System.out.println(face + " Python");
		RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
		dis.forward(request, response);
	}

}
