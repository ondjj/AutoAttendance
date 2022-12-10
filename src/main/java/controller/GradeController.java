package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GradeDAO;
import dto.GradeDTO;

@WebServlet("/GradeController")
public class GradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GradeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GradeDAO dao = new GradeDAO();
		String tempid = request.getParameter("id");
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String format_now = now.format(formatter);
		
		String this_year = format_now.split("/")[0];
		String this_term = null;
		
		int month = Integer.parseInt(format_now.split("/")[1]);
		if(month>=9 || month<3) {
			this_term = "2";
		}else {
			this_term = "1";
		}
		
		String this_semester = this_year + "-" + this_term;
		
		List<GradeDTO> gradeList = new ArrayList();
		gradeList = dao.call_gradeList(tempid, this_semester);
		
		List<GradeDTO> past_gradeList = new ArrayList();
		past_gradeList = dao.call_pastgradeList(tempid, this_semester);
		
		
		request.setAttribute("gradeList", gradeList);
		request.setAttribute("past_gradeList", past_gradeList);
		request.getRequestDispatcher("/GradeManagement.jsp").forward(request, response);
		// List.jsp : View파일
		
		
	}
	
	
}
