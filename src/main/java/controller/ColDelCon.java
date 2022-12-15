package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ColDAO;
import dao.MemberDAO;


//임시 저장 memberdelcon으로 작동 되면 삭제 가능
@WebServlet("/ColDelCon.do")
public class ColDelCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		ColDAO cdao = new ColDAO();
		MemberDAO mdao = new MemberDAO();
		cdao.delCol(id);
		mdao.delMember(id);
		
		RequestDispatcher dis = request.getRequestDispatcher("MemberListCon.do");
		dis.forward(request, response);
		
	}

}
