package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.memberDTO;

@WebServlet("/LoginCon.do")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); 

		MemberDAO mdao = new MemberDAO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");

		memberDTO result = mdao.getMember(id);
		
		String Lid = result.getId();
		String Lpw = result.getPassword();
		String rige_name = result.getId_picture();
		String kr_name = result.getKr_name();
		
		if((id.equals(Lid) && pw.equals(Lpw))) {
			HttpSession session = request.getSession();

			session.setAttribute("id", id);
			System.out.println(id);
			session.setAttribute("admin_key", result.getAdmin_key());
			session.setAttribute("rige_name", rige_name);
			session.setAttribute("kr_name", kr_name);
			System.out.println(result.getAdmin_key());

			session.setMaxInactiveInterval(60*60);
			RequestDispatcher dis = request.getRequestDispatcher("MainPage.jsp");
			dis.forward(request, response);
		}
		if(!id.equals(Lid) || !pw.equals(Lpw)) {
            PrintWriter out1 = response.getWriter(); 
            out1.println("<script type='text/javascript'>"); 
            out1.println("alert('Login failed Please check your ID or Password');"); 
            out1.println("history.back();"); 
            out1.println("</script>"); 
            out1.close();
            response.sendRedirect("Main_Login.jsp");
		}
	}

}
