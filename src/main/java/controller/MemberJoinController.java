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

@WebServlet("/MemberJoinController.do")
public class MemberJoinController extends HttpServlet {
       

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		memberDTO mdto = new memberDTO();
		
		mdto.setId(request.getParameter("id"));
		String pass1 = request.getParameter("password1");
		String pass2 = request.getParameter("password2");
		mdto.setPassword(pass1);
		mdto.setPrivate_num(request.getParameter("private_num"));
		mdto.setKr_name(request.getParameter("kr_name"));
		mdto.setEn_name(request.getParameter("en_name"));
		mdto.setId_picture(request.getParameter("id_picture"));
		mdto.setPhone_num(request.getParameter("phone_num"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setAddress(request.getParameter("address"));
		mdto.setAdmin_key(request.getParameter("admin_key"));
		mdto.setAge(Integer.valueOf(request.getParameter("age")));
		mdto.setCollege_year(Integer.valueOf(request.getParameter("col_reg_date")));
		mdto.setGender(request.getParameter("gender"));
		
		if(pass1.equals(pass2)) {
			MemberDAO mdao = new MemberDAO();
			mdao.insertMember(mdto);
			
			RequestDispatcher dis = request.getRequestDispatcher("MemberListCon.do");
			dis.forward(request, response);
		}
		else {
			request.setAttribute("msg", "패스워드가 일치하지않습니다.");
			RequestDispatcher dis = request.getRequestDispatcher("401.jsp");
			dis.forward(request, response);
		}
	
	}

}
