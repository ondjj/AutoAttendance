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

import com.mysql.cj.Session;

import dao.GradeDAO;
import dto.GradeDTO;

@WebServlet("/dashboard.do")
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

		System.out.println("Dash_Controller");
		String id = (String)request.getSession().getAttribute("id");
		System.out.println("load_dash_session_id : " + id);
		
		GradeDAO dao = new GradeDAO();
		
		// 성적 개요 출력
		List<String> year_term_list = new ArrayList();
		year_term_list = dao.year_term_list(id);
		
		List<Map<String, Object>> dashList = new ArrayList<>();
		dashList = dao.call_dashGrade(year_term_list, id);

		if(dashList.size()==0) {
			request.setAttribute("dashList", dashList);
			request.getRequestDispatcher("/admin.jsp").forward(request, response);
		}else {
			List<Object> grade_footer = new ArrayList();
			grade_footer = dao.dash_grade_footer(dashList);
			request.setAttribute("dashList", dashList);
			request.setAttribute("total_lecture", grade_footer.get(0));
			request.setAttribute("total_grade", grade_footer.get(1));
			request.getRequestDispatcher("/admin.jsp").forward(request, response);
		}
	}
	
}
