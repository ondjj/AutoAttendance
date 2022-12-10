package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GradeDAO;
import dto.GradeDTO;

@WebServlet("/DashBoardController")
public class DashBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DashBoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 이전 학기 성적 가져오는 DAO
		System.out.println("Controller");
		GradeDAO dao = new GradeDAO();
		String tempid = request.getParameter("id");
		
		List<String> year_term_list = new ArrayList();
		year_term_list = dao.year_term_list(tempid);
		
		List<Map<String, Object>> dashList = new ArrayList<>();
		dashList = dao.call_dashGrade(year_term_list, tempid);
		
		List<Object> grade_footer = new ArrayList();
		grade_footer = dao.dash_grade_footer(dashList);
		
		request.setAttribute("dashList", dashList);
		request.setAttribute("total_lecture", grade_footer.get(0));
		request.setAttribute("total_grade", grade_footer.get(1));
		request.getRequestDispatcher("/admin.jsp").forward(request, response);
	}
	
}
