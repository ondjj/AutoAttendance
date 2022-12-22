package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClassDAO;
import dao.ColDAO;
import dao.MemberDAO;
import dto.ClassDTO;
import dto.ColMemberDTO;
import dto.memberDTO;


@WebServlet("/ClassListCon.do")
public class ClassListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mdao = new MemberDAO();
		
		ArrayList<ClassDTO> cla_arr = new ArrayList<>();
		
		ArrayList<memberDTO> mem = mdao.getAllAdmin();
		
		ArrayList<ColMemberDTO> colarr = new ArrayList<>();
		
		for(int i=0; i<mem.size(); i++) {
			String id = mem.get(i).getId();
			ColDAO coldao = new ColDAO();
			ColMemberDTO cdto = coldao.getCol(id);
			colarr.add(cdto);
			
			String mem_name = mem.get(i).getKr_name();
			ClassDAO cla_dao = new ClassDAO();
			ClassDTO cla_dto = cla_dao.getClass(mem_name);
			cla_arr.add(cla_dto);
			
		}
		
		request.setAttribute("mem", mem);
		request.setAttribute("arr", cla_arr);
		request.setAttribute("cdto", colarr);
		
		RequestDispatcher dis = request.getRequestDispatcher("Stu_ClassList.jsp");
		dis.forward(request, response);
	}

}
