package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ColDAO;
import dao.GradeDAO;
import dao.MemberDAO;
import dto.ColMemberDTO;
import dto.memberDTO;

@WebServlet("/AdminDashBoard.do")
public class AdminDashBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy. MM. dd a hh:mm:ss");
		String rd = sf.format(nowTime);

		String id = (String)request.getSession().getAttribute("id");
		String face = request.getParameter("data");
		
		System.out.println(face +  "플라스크");
		
		MemberDAO mdao = new MemberDAO();
		ColDAO cdao = new ColDAO();
		ColMemberDTO cdto = cdao.getCol(id);
		memberDTO mdto = mdao.getMember(id);
		
		
		System.out.println(mdto.getId_picture() + "jsp");
		
		request.setAttribute("cdto", cdto);
		request.setAttribute("mdto", mdto);
		request.setAttribute("face", face);
		request.setAttribute("img", mdto.getId_picture());
		request.setAttribute("rd", rd);
		
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
		//RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
		//dis.forward(request, response);
	}

}
