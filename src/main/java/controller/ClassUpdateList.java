package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClassDAO;
import dto.ClassDTO;

@WebServlet("/ClassUpdateList.do")
public class ClassUpdateList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClassUpdateList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		if(num != 0) {
		ClassDAO dao = new ClassDAO();
		ClassDTO cdto = dao.selectView(num);
		request.setAttribute("cdto", cdto);
		request.getRequestDispatcher("/manager_classUpdate.jsp").forward(request, response);
		}
		
		
	}
}
