package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import dao.UserUpdateDAO;
import dto.MemberDTO;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		UserUpdateDAO dao = new UserUpdateDAO();
		MemberDTO dto = new MemberDTO();

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		if (command.equals("/UserDetail.do")) {
			int id = 1561782;
			dto = dao.SelectUser(id);

			if (dto.getName() == null) {
				RequestDispatcher rd = request.getRequestDispatcher("Main_Login.jsp");
				rd.forward(request, response);
			}

			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher("UserUpdate.jsp");
			rd.forward(request, response);

		} else if (command.equals("/UserUpdate.do")) {

			RequestDispatcher rd = request.getRequestDispatcher("UserUpdate.jsp");
			rd.forward(request, response);

		}

	}

}
