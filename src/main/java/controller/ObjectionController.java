package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.ObjectionDAO;
import dto.ObjectionDTO;
import dto.ColMemberDTO;
import dto.memberDTO;

@WebServlet("/objection.do")
public class ObjectionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 정정 신청 입력하기
		String obj_type = request.getParameter("obj_type");
		if(obj_type.equals("1")) {
			
			System.out.println("obj_type : 출결 정정 신청");
			
			ObjectionDTO dto = new ObjectionDTO();
			dto.setObj_type(Integer.parseInt(request.getParameter("obj_type")));
			dto.setObj_memberid(request.getParameter("member_id"));
			dto.setObj_name(request.getParameter("name"));
			dto.setObj_faculty(request.getParameter("faculty"));
			dto.setObj_subject(request.getParameter("subject"));
			dto.setObj_date(request.getParameter("date"));
			dto.setObj_content(request.getParameter("content"));
			
			ObjectionDAO dao = new ObjectionDAO();
			dao.insert_attenObj(dto);
			
			response.sendRedirect("AttendanceManagement.jsp");
			
			
		}else if(obj_type.equals("2")) {
			System.out.println("obj_type : 학적 정정 신청");
			
			ObjectionDTO dto = new ObjectionDTO();
			dto.setObj_memberid(request.getParameter("idMEMBER"));
			System.out.println(request.getParameter("idMEMBER"));
			dto.setObj_type(2);
			dto.setObj_name(request.getParameter("kr_name"));
			System.out.println(request.getParameter("kr_name"));
			// 학적 관련 colDTO처리해서 다시 입력할것
			dto.setObj_start_term(request.getParameter("obj_start_term"));
			dto.setObj_col_type(request.getParameter("obj_col_type"));
			dto.setObj_tuition(request.getParameter("obj_tuition"));
			dto.setObj_back_year(request.getParameter("obj_back_year"));
			dto.setObj_back_term(request.getParameter("obj_back_term"));
			dto.setObj_refund_name(request.getParameter("obj_refund_name"));
			dto.setObj_refund_bank(request.getParameter("obj_refund_bank"));
			dto.setObj_refund_num(request.getParameter("obj_refund_num"));
			
			ObjectionDAO dao = new ObjectionDAO();
			dao.insert_colObj(dto);
			
			response.sendRedirect("objection.do?obj_type=5");
			
			
		}else if(obj_type.equals("3")) {
			System.out.println("obj_type : 성적 정정 신청");
			
			ObjectionDTO dto = new ObjectionDTO();
			dto.setObj_type(Integer.parseInt(request.getParameter("obj_type")));
			dto.setObj_memberid(request.getParameter("member_id"));
			dto.setObj_name(request.getParameter("name"));
			dto.setObj_faculty(request.getParameter("faculty"));
			dto.setObj_subject(request.getParameter("subject"));
			dto.setObj_content(request.getParameter("content"));
			
			ObjectionDAO dao = new ObjectionDAO();
			dao.insert_gradeObj(dto);
			
			response.sendRedirect("GradeManagement.jsp");
			
		}else if(obj_type.equals("4")){
			System.out.println("obj_type : 증명서 발급 신청");
			ObjectionDAO odao = new ObjectionDAO();
			
			// 신청 학생 이름 가져오기
			String id = (String)request.getSession().getAttribute("id");
			String password = (String)request.getSession().getAttribute("pass");
			
			memberDTO mdto = new memberDTO();
			MemberDAO mdao = new MemberDAO();
			mdto = mdao.getMember(id);			
			
			List<Integer> count_list = new ArrayList<>();
			List<String> content_list = new ArrayList<>();
			List<Integer> type_list = new ArrayList<>();
			
			if(!request.getParameter("obj_certifi_count1").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count1")));
				content_list.add(request.getParameter("obj_certifi_content1"));
				type_list.add(1);
			}
			if(!request.getParameter("obj_certifi_count2").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count2")));
				content_list.add(request.getParameter("obj_certifi_content2"));
				type_list.add(2);
			}
			if(!request.getParameter("obj_certifi_count3").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count3")));
				content_list.add(request.getParameter("obj_certifi_content3"));
				type_list.add(3);
			}
			if(!request.getParameter("obj_certifi_count4").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count4")));
				content_list.add(request.getParameter("obj_certifi_content4"));
				type_list.add(4);
			}
			if(!request.getParameter("obj_certifi_count5").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count5")));
				content_list.add(request.getParameter("obj_certifi_content5"));
				type_list.add(5);
			}
			if(!request.getParameter("obj_certifi_count6").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count6")));
				content_list.add(request.getParameter("obj_certifi_content6"));
				type_list.add(6);
			}if(!request.getParameter("obj_certifi_count7").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count7")));
				content_list.add(request.getParameter("obj_certifi_content7"));
				type_list.add(7);
			}
			if(!request.getParameter("obj_certifi_count8").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count8")));
				content_list.add(request.getParameter("obj_certifi_content8"));
				type_list.add(8);
			}
			if(!request.getParameter("obj_certifi_count9").equals("")) {
				count_list.add(Integer.parseInt(request.getParameter("obj_certifi_count9")));
				content_list.add(request.getParameter("obj_certifi_content9"));
				type_list.add(9);
			}
			odao.insert_certifiObj(id, mdto.getKr_name(), type_list, count_list, content_list);
			
			response.sendRedirect("certificate.jsp");
			
		}else { // 학적 정정 신청 학생 정보 가져오기
			
			String member_id = (String)request.getSession().getAttribute("id");
			
			MemberDAO dao = new MemberDAO();
			memberDTO member_dto = new memberDTO();
			
			member_dto = dao.getMemberCol(member_id);
			
			request.setAttribute("member_dto", member_dto);
			RequestDispatcher dis = request.getRequestDispatcher("updateCollege.jsp");
			dis.forward(request, response);
		}
	
	
	
	
	}	
}
