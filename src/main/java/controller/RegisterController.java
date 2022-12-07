package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CollegeRegisterDAO;
import dto.CollegeDTO;

@WebServlet("/RegisterController")
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
		CollegeRegisterDAO cdao = new CollegeRegisterDAO();

		if (command.equals("/UserRegister.do")) {

			int idMEMBER = Integer.parseInt(request.getParameter("idMEMBER"));
			String K_name = request.getParameter("K_name");
			String E_name = request.getParameter("E_name");
			int age = Integer.parseInt(request.getParameter("age"));
			boolean sex = Boolean.valueOf(request.getParameter("sex"));
			String privateNumber = request.getParameter("privateNumber");
			int grade = Integer.parseInt(request.getParameter("grade"));
			String phoneNumber = request.getParameter("phoneNumber");
			String college = request.getParameter("college");
			String major = request.getParameter("major");
			int semester = Integer.parseInt(request.getParameter("semester"));
			String division = request.getParameter("division");
			String C_state = request.getParameter("C_state");
			String dual_major = request.getParameter("dual_major");

			CollegeDTO cdto = new CollegeDTO(idMEMBER, K_name, E_name, age, sex, privateNumber, grade, phoneNumber,
					college, major, semester, division, C_state, dual_major);
			cdao.CollegeRegister(cdto);
			
			response.sendRedirect("Main_Login.jsp");

		}

	}

}
