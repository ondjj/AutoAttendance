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

import dao.ObjectionDAO;
import dto.ObjectionDTO;

@WebServlet("/ObjectionListCon.do")
public class ObjectionListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(request.getParameter("type")!=null) { // 정정 신청 내역 List
			
			String obj_type = request.getParameter("type");
			
			if(obj_type.equals("1")) { // 출결
				System.out.println("obj_type : 출결 정정 신청 내역");
				
				ObjectionDAO dao = new ObjectionDAO();
				List<ObjectionDTO> atten_objList = new ArrayList<>();
				
				atten_objList = dao.atten_ObjList();
				
				
				request.setAttribute("objList", atten_objList);
				RequestDispatcher dis = request.getRequestDispatcher("manager_attendanceObjection.jsp");
				dis.forward(request, response);
				
				
			}else if(obj_type.equals("2")) { // 학적
				System.out.println("obj_type : 학적 정정 신청 내역");
				
				ObjectionDAO dao = new ObjectionDAO();
				List<ObjectionDTO> col_objList = new ArrayList<>();
				
				col_objList = dao.colObjList();
				
				
				request.setAttribute("objList", col_objList);
				RequestDispatcher dis = request.getRequestDispatcher("manager_updateCollege.jsp");
				dis.forward(request, response);
				
				
				
			}else if(obj_type.equals("3")) { // 성적
				System.out.println("obj_type : 성적 정정 신청 내역");
				
				ObjectionDAO dao = new ObjectionDAO();
				List<ObjectionDTO> grade_objList = new ArrayList<>();
				
				grade_objList = dao.gradeObjList();
				
				
				request.setAttribute("objList", grade_objList);
				RequestDispatcher dis = request.getRequestDispatcher("manager_gradeObjection.jsp");
				dis.forward(request, response);
				
			}else { // 증명서
				System.out.println("obj_type : 증명서 발급 신청 내역");
			}
			
			
			
			
			
			
		}else if(request.getParameter("obj_type")!=null){ // 정정 신청 내역 Detail View
			
			String obj_type = request.getParameter("obj_type");
			String obj_num = request.getParameter("obj_num");
			
			if(obj_type.equals("1")) { // 출결
				System.out.println("obj_type : 출결 정정 신청 내역 View");
				
				ObjectionDAO dao = new ObjectionDAO();
				ObjectionDTO dto = new ObjectionDTO();
				
				
				dto = dao.attenObjView(obj_num);
				
				
				request.setAttribute("dto", dto);
				RequestDispatcher dis = request.getRequestDispatcher("manager_attendanceObjectionView.jsp");
				dis.forward(request, response);
				
			}else if(obj_type.equals("2")) { // 학적
				System.out.println("obj_type : 학적 정정 신청 내역 View");
				
				ObjectionDAO dao = new ObjectionDAO();
				ObjectionDTO dto = new ObjectionDTO();
				
				
				dto = dao.colObjView(obj_num);
				
				
				request.setAttribute("dto", dto);
				RequestDispatcher dis = request.getRequestDispatcher("manager_colObjectionView.jsp");
				dis.forward(request, response);
				
			}else if(obj_type.equals("3")) { // 성적
				System.out.println("obj_type : 성적 정정 신청 내역 View");
				
				ObjectionDAO dao = new ObjectionDAO();
				ObjectionDTO dto = new ObjectionDTO();
				
				
				dto = dao.gradeObjView(obj_num);
				
				
				request.setAttribute("dto", dto);
				RequestDispatcher dis = request.getRequestDispatcher("manager_gradeObjectionView.jsp");
				dis.forward(request, response);
				
			}else { // 증명서
				System.out.println("obj_type : 증명서 발급 신청 내역 View");
			}
			
			
		}else { // Grade Objection View에서 정정신청내역 Delete
			System.out.println("Objection Delete 진입");
			
			String obj_num = request.getParameter("view_del");
			String view_type = request.getParameter("view_type");
			
			ObjectionDAO dao = new ObjectionDAO();
			dao.objDelete(obj_num);
			
			if(view_type.equals("1")){ // 출결 리스트로 되돌리기
				
				List<ObjectionDTO> atten_objList = new ArrayList<>();
				atten_objList = dao.atten_ObjList();
				
				request.setAttribute("objList", atten_objList);
				RequestDispatcher dis = request.getRequestDispatcher("manager_attendanceObjection.jsp");
				dis.forward(request, response);
				
			}else if(view_type.equals("2")) { // 학적 리스트로 되돌리기
				
				List<ObjectionDTO> col_objList = new ArrayList<>();
				col_objList = dao.colObjList();
				
				request.setAttribute("objList", col_objList);
				RequestDispatcher dis = request.getRequestDispatcher("manager_updateCollege.jsp");
				dis.forward(request, response);
				
				
			}else if(view_type.equals("3")) { // 성적 리스트로 되돌리기
				
				List<ObjectionDTO> grade_objList = new ArrayList<>();
				grade_objList = dao.gradeObjList();
				
				request.setAttribute("objList", grade_objList);
				RequestDispatcher dis = request.getRequestDispatcher("manager_gradeObjection.jsp");
				dis.forward(request, response);
				
			}else { // 증명서 리스트로 되돌리기
				
			}
			
			
		}
		
	}

}
