package controller;

import java.io.IOException;

import java.lang.ref.ReferenceQueue;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.RemoteIpFilter.XForwardedRequest;

import dao.Col_manageRegisterDAO;
import dao.MemberDAO;
import dto.col_manageDTO;
import dto.memberDTO;

@WebServlet("/Register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		MemberDAO mdao = new MemberDAO();
		Col_manageRegisterDAO cdao = new Col_manageRegisterDAO();
		
		if (command.equals("/Register.do")) {
			
			// 멤버관련
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String private_num = request.getParameter("private_num");
			String kr_name = request.getParameter("kr_name");
			String en_name = request.getParameter("en_name");
			String id_picture = request.getParameter("id_picture");
			String phone_num = request.getParameter("phone_num");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String admin_key = request.getParameter("admin_key");
			int age = Integer.parseInt(request.getParameter("age"));
			int college_year = Integer.parseInt(request.getParameter("college_year"));
			String gender = request.getParameter("gender");
			
			
			//학적관련
			String col_status = request.getParameter("col_status");
			String col_faculty = request.getParameter("col_faculty");
			String col_major = request.getParameter("col_major");
			String col_type = request.getParameter("col_type");
			String col_second_faculty = request.getParameter("col_second_faculty");
			String col_complete = request.getParameter("col_complete");
			
			col_manageDTO cdto = new col_manageDTO(col_status, col_faculty, col_major, col_type, col_second_faculty, col_complete,id);
			cdao.Col_manageRegister(cdto);

		}else if(command.equals("/Memberlist.do")) {
			
		}

	}

}
