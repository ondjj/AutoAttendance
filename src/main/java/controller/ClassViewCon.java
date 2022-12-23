package controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClassDAO;
import dto.ClassDTO;

@WebServlet("/ClassView.do")
public class ClassViewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClassViewCon() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ClassDAO dao = new ClassDAO();
		Map<String, Object> map = new HashMap<String, Object>();
		String subject = request.getParameter("subject");
		
		map.put("subject", subject);
		List<ClassDTO> list = dao.viewClass(map);
		dao.close();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Stu_ClassView.jsp").forward(request, response);
		
		
		
		
		
		
		
		
		
	}
	
	
	

}
