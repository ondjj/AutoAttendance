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
import dao.ObjectionDAO;
import dto.GradeDTO;

@WebServlet("/grade.do")
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
		
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		
		if(type.equals("2")) {
			System.out.println("insertcon진입");
		
			GradeDTO insert_dto = new GradeDTO();
			insert_dto.setMember_id(request.getParameter("member_id"));
			insert_dto.setYear_term(request.getParameter("year_term"));
			insert_dto.setName(request.getParameter("name"));
			insert_dto.setMajor(request.getParameter("major"));
			insert_dto.setSubject(request.getParameter("subject"));
			insert_dto.setScore1(Integer.parseInt(request.getParameter("score1")));
			insert_dto.setScore2(Integer.parseInt(request.getParameter("score2")));
			insert_dto.setScore3(Integer.parseInt(request.getParameter("score3")));
			
			GradeDAO dao = new GradeDAO();
			int result = dao.insert_grade(insert_dto);
			dao.close();
			response.sendRedirect("manager_gradeInsert.jsp");
		}else { // 성적 열람 페이지 진입 시 현재 학기 성적과 직전 학기 성적 출력해주는 기능
			GradeDAO dao = new GradeDAO();

			if(type.equals("1")) {
				
				String tempid = (String)request.getSession().getAttribute("id");
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
				
				
				dao.close();
				request.setAttribute("gradeList", gradeList);
				request.setAttribute("past_gradeList", past_gradeList);
				request.getRequestDispatcher("/GradeManagement.jsp").forward(request, response);
			}else if(type.equals("3")) {
				
				GradeDTO update_dto = new GradeDTO();
				update_dto.setMember_id(request.getParameter("member_id"));
				update_dto.setYear_term(request.getParameter("year_term"));
				update_dto.setName(request.getParameter("name"));
				update_dto.setMajor(request.getParameter("major"));
				update_dto.setSubject(request.getParameter("subject"));
				update_dto.setScore1(Integer.parseInt(request.getParameter("score1")));
				update_dto.setScore2(Integer.parseInt(request.getParameter("score2")));
				update_dto.setScore3(Integer.parseInt(request.getParameter("score3")));
				update_dto.setNum(Integer.parseInt(request.getParameter("grade_num")));
				
				int result = dao.update_grade(update_dto);
				
				ObjectionDAO obj_dao = new ObjectionDAO();
				obj_dao.objDelete(request.getParameter("obj_num"));
				
				
				dao.close();
				
				response.sendRedirect("ObjectionListCon.do?type=3");
				
			}
		
		}
		
		
	}
	
	
}
