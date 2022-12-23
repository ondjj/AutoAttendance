package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GradeDAO;
import dao.ObjectionDAO;
import dto.GradeDTO;
import dto.ObjectionDTO;
import utils.ObjectionBoardPage;

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
		
		ObjectionDAO dao = new ObjectionDAO();
		
		Map<String, Object> map = new HashMap<String, Object>(); // 뷰 파일에 전달할 매개변수 저장용 맵 생성

		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null) { // 전달 받은 매개변수 중 검색 단어가 있다면 map에 해당값 저장
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE")); // 페이지당 표시할 게시물 수
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK")); // 블록당 페이지 수
		// 페이지 설정 상수값 가져와서 페이지당 게시물 수와 블록당 페이지 수를 구함
		// 이후 현재 페이지를 확인한 후 목록에 출력할 게시물 범위 계산해서 컬렉션 map에 추가함
		
		// 현재 페이지 확인
		int pageNum = 1; // 초기값은 1로 설정
		String pageTemp = request.getParameter("pageNum");
		
		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		int end = 10;
		int start = 0;
		
		// 목록에 출력할 게시물 범위 확인
		if(pageNum==1) {
			start = 0;
		}else if(pageNum==2) {
			start = 10;
		}else if(pageNum==3) {
			start = 20;
		}else if(pageNum==4) {
			start = 30;
		}else if(pageNum==5) {
			start = 40;
		}
		
		if(request.getParameter("type")!=null) { // 정정 신청 내역 List
			
			String obj_type = request.getParameter("type");
			
			if(obj_type.equals("1")) { // 출결
				System.out.println("obj_type : 출결 정정 신청 내역");
				
				int totalCount = dao.selectCount(map, 1); // 게시물의 개수 저장
				// 출결정정 type 1전달
				System.out.println("totalCount : " + totalCount);
				
				map.put("start", start);
				map.put("end", end);
				
				List<ObjectionDTO> atten_objList = new ArrayList<>();
				atten_objList = dao.atten_ObjList(map);
				
				// 뷰에 전달할 매개변수 추가
				String pagingImg = ObjectionBoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./ObjectionListCon.do?type=1");
				
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("pageSize", pageSize);
				map.put("pageNum", pageNum);
				
				request.setAttribute("objList", atten_objList);
				request.setAttribute("map", map);
				
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_attendanceObjection.jsp");
				dis.forward(request, response);
				
			}else if(obj_type.equals("2")) { // 학적
				System.out.println("obj_type : 학적 정정 신청 내역");
				
				int totalCount = dao.selectCount(map, 2); // 게시물의 개수 저장
				// 학적정정 type 2전달
				System.out.println("totalCount : " + totalCount);
				
				map.put("start", start);
				map.put("end", end);
				
				List<ObjectionDTO> col_objList = new ArrayList<>();
				col_objList = dao.colObjList(map);
				
				// 뷰에 전달할 매개변수 추가
				String pagingImg = ObjectionBoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./ObjectionListCon.do?type=2");
				
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("pageSize", pageSize);
				map.put("pageNum", pageNum);
				
				request.setAttribute("objList", col_objList);
				request.setAttribute("map", map);
				
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_updateCollege.jsp");
				dis.forward(request, response);
			}else if(obj_type.equals("3")) { // 성적
				System.out.println("obj_type : 성적 정정 신청 내역");
				
				int totalCount = dao.selectCount(map, 3); // 게시물의 개수 저장
				// 성적 정정 type 3 전달
				System.out.println("totalCount : " + totalCount);
				
				map.put("start", start);
				map.put("end", end);
				
				List<ObjectionDTO> grade_objList = new ArrayList<>();
				grade_objList = dao.gradeObjList(map);
				
				// 뷰에 전달할 매개변수 추가
				String pagingImg = ObjectionBoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./ObjectionListCon.do?type=3");
				
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("pageSize", pageSize);
				map.put("pageNum", pageNum);
				
				request.setAttribute("objList", grade_objList);
				request.setAttribute("map", map);
				
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_gradeObjection.jsp");
				dis.forward(request, response);
				
				
				
			}else { // 증명서
				System.out.println("obj_type : 증명서 발급 신청 내역");
				
				int totalCount = dao.selectCount(map, 4); // 게시물의 개수 저장
				// 성적 정정 type 3 전달
				System.out.println("totalCount : " + totalCount);
				
				map.put("start", start);
				map.put("end", end);
				
				List<ObjectionDTO> certifi_objList = new ArrayList<>();
				certifi_objList = dao.certifiObjList(map);
				
				// 뷰에 전달할 매개변수 추가
				String pagingImg = ObjectionBoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./ObjectionListCon.do?type=4");
				
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("pageSize", pageSize);
				map.put("pageNum", pageNum);
				
				request.setAttribute("objList", certifi_objList);
				request.setAttribute("map", map);
				
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_certificate.jsp");
				dis.forward(request, response);
			}
			
		}else if(request.getParameter("obj_type")!=null){ // 정정 신청 내역 Detail View
			
			String obj_type = request.getParameter("obj_type");
			String obj_num = request.getParameter("obj_num");
			
			if(obj_type.equals("1")) { // 출결
				System.out.println("obj_type : 출결 정정 신청 내역 View");
				
				ObjectionDTO dto = new ObjectionDTO();
				
				dto = dao.attenObjView(obj_num);
				
				dao.close();
				request.setAttribute("dto", dto);
				RequestDispatcher dis = request.getRequestDispatcher("manager_attendanceObjectionView.jsp");
				dis.forward(request, response);
				
			}else if(obj_type.equals("2")) { // 학적
				System.out.println("obj_type : 학적 정정 신청 내역 View");
				
				ObjectionDTO dto = new ObjectionDTO();
				
				dto = dao.colObjView(obj_num);
				
				dao.close();
				request.setAttribute("dto", dto);
				RequestDispatcher dis = request.getRequestDispatcher("manager_colObjectionView.jsp");
				dis.forward(request, response);
				
			}else if(obj_type.equals("3")) { // 성적
				System.out.println("obj_type : 성적 정정 신청 내역 View");
				
				ObjectionDTO dto = new ObjectionDTO();
				
				dto = dao.gradeObjView(obj_num);
				
				dao.close();
				request.setAttribute("dto", dto);
				RequestDispatcher dis = request.getRequestDispatcher("manager_gradeObjectionView.jsp");
				dis.forward(request, response);
				
			}else { // 증명서
				System.out.println("obj_type : 증명서 발급 신청 내역 View");
				
				ObjectionDTO dto = new ObjectionDTO();
				
				dto = dao.certifiObjView(obj_num);
				request.setAttribute("obj_type_name", request.getParameter("type_name"));
				request.setAttribute("dto", dto);
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_certifiObjectionView.jsp");
				dis.forward(request, response);
			}
			
			
		}else { // Grade Objection View에서 정정신청내역 Delete
			System.out.println("Objection Delete 진입");
			
			String obj_num = request.getParameter("view_del");
			String view_type = request.getParameter("view_type");
			
			if(view_type.equals("1")){ // 출결 리스트로 되돌리기
				
				dao.objDelete(obj_num);
				
				int totalCount = dao.selectCount(map, 1); // 게시물의 개수 저장
				// 출결정정 type 1전달
				System.out.println("totalCount : " + totalCount);
				
				map.put("start", start);
				map.put("end", end);
				
				List<ObjectionDTO> atten_objList = new ArrayList<>();
				atten_objList = dao.atten_ObjList(map);
				
				// 뷰에 전달할 매개변수 추가
				String pagingImg = ObjectionBoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./ObjectionListCon.do?type=1");
				
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("pageSize", pageSize);
				map.put("pageNum", pageNum);
				
				request.setAttribute("objList", atten_objList);
				request.setAttribute("map", map);
				
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_attendanceObjection.jsp");
				dis.forward(request, response);
				
			}else if(view_type.equals("2")) { // 학적 리스트로 되돌리기
				
				dao.objDelete(obj_num);
				
				int totalCount = dao.selectCount(map, 2); // 게시물의 개수 저장
				// 학적정정 type 2전달
				System.out.println("totalCount : " + totalCount);
				
				map.put("start", start);
				map.put("end", end);
				
				List<ObjectionDTO> col_objList = new ArrayList<>();
				col_objList = dao.colObjList(map);
				
				// 뷰에 전달할 매개변수 추가
				String pagingImg = ObjectionBoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./ObjectionListCon.do?type=2");
				
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("pageSize", pageSize);
				map.put("pageNum", pageNum);
				
				request.setAttribute("objList", col_objList);
				request.setAttribute("map", map);
				
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_updateCollege.jsp");
				dis.forward(request, response);
				
				
			}else if(view_type.equals("3")) { // 성적 수정으로 보내기
				
				ObjectionDTO obj_dto = new ObjectionDTO();
				obj_dto = dao.gradeObjView(obj_num);
				
				GradeDAO grade_dao = new GradeDAO();
				GradeDTO grade_dto = new GradeDTO();
				grade_dto = grade_dao.get_target_grade(obj_dto.getObj_memberid(), obj_dto.getObj_faculty(), obj_dto.getObj_subject());
				
				
				request.setAttribute("obj_dto", obj_dto);
				request.setAttribute("grade_dto", grade_dto);
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_gradeObjectionUpdate.jsp");
				dis.forward(request, response);
				
				
			}else { // 증명서 리스트로 되돌리기
				
				dao.objDelete(obj_num);
				
				int totalCount = dao.selectCount(map, 4); // 게시물의 개수 저장
				// 증명서 정정 신청 type 4 전달
				System.out.println("totalCount : " + totalCount);
				
				map.put("start", start);
				map.put("end", end);
				
				List<ObjectionDTO> certifi_objList = new ArrayList<>();
				certifi_objList = dao.certifiObjList(map);
				
				// 뷰에 전달할 매개변수 추가
				String pagingImg = ObjectionBoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./ObjectionListCon.do?type=4");
				
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("pageSize", pageSize);
				map.put("pageNum", pageNum);
				
				request.setAttribute("objList", certifi_objList);
				request.setAttribute("map", map);
				
				dao.close();
				RequestDispatcher dis = request.getRequestDispatcher("manager_certificate.jsp");
				dis.forward(request, response);
			}
			
			
		}
		
	}

}
