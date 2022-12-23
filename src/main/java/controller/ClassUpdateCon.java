package controller;
import java.io.IOException;
import java.net.URLEncoder;
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

@WebServlet("/ClassUpdate.do")
public class ClassUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClassUpdateCon() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=UTF-8"); 
			
			String professor = request.getParameter("professor");
			String lecture_name = request.getParameter("lecture_name");
			int postNum = Integer.parseInt(request.getParameter("postNum"));
			String subject = request.getParameter("subject");
			
			ClassDAO dao = new ClassDAO();
			ClassDTO cdto = new ClassDTO();
			cdto.setProfessor(professor);
			cdto.setLecture_name(lecture_name);
			cdto.setPostNum(postNum);
			int result = dao.updateClass(cdto);
			dao.close();
			
			if (result == 1) {
//				request.setCharacterEncoding("utf-8");
				String test = URLEncoder.encode(subject, "UTF-8");
				response.setContentType("text/html;charset=UTF-8"); 
				System.out.println("수정완료!!!!");
				response.sendRedirect("ClassView.do?subject=" + test);
			}
		}
		
		
		
	}
	
	
	

