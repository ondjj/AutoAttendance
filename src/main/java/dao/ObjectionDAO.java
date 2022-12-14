package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;
import dto.ObjectionDTO;

public class ObjectionDAO extends DBConnPool{
	
	public int selectCount (Map<String, Object>map, int type) {
		int totalCount = 0; // 초기화 세팅
		
		String sql = "select count(*) from obj_board where obj_type="+type;
		// 게시판에서 전체 개수 가져오기
		
		if (map.get("searchWord") != null) {
			sql += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시판 카운트 생성 에러");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 출결 1
	// 출결 1
	// 출결 1
	// 출결 정정 신청 내역 insert
	public int insert_attenObj(ObjectionDTO dto) {
		
		String sql = "insert into obj_board(obj_type, obj_memberid, obj_name, obj_faculty, obj_subject, obj_date, obj_content) values(?,?,?,?,?,?,?)";
		int result = 0;
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getObj_type());
			psmt.setString(2, dto.getObj_memberid());
			psmt.setString(3, dto.getObj_name());
			psmt.setString(4, dto.getObj_faculty());
			psmt.setString(5, dto.getObj_subject());
			psmt.setString(6, dto.getObj_date());
			psmt.setString(7, dto.getObj_content());
			result = psmt.executeUpdate();
			
			con.close();
		}catch(Exception e) {
			System.out.println("Objection Insert Error in ObjectionDAO_Attendance");
			e.printStackTrace();
		}
		return result;
	}
	// 출결 정정 신청 내역 List 가져오기
		public List<ObjectionDTO> atten_ObjList(Map<String, Object> map){
			
			List<ObjectionDTO> obj_list = new ArrayList<>();
			
			// 검색할 단어가 없으면 전체 게시물 중 내림차순으로 10개 출력
			String sql = "select obj_num, obj_type, obj_memberid, obj_name, obj_faculty, obj_subject, obj_date, obj_content from obj_board where obj_type=1 limit ?,?";
			
			
			// 검색할 단어가 있으면
			String query = "select obj_num, obj_type, obj_memberid, obj_name, obj_faculty, "
					+ "obj_subject, obj_date, obj_content from obj_board where obj_type=1";
					
			
			if (map.get("searchWord") != null) {
				query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
			}
			query += " limit ?,?";
			
			
			try {
				System.out.println(map.get("pageNum"));
				
				// 검색할 단어가 없으면 sql, 있으면 query로 입력
				if (map.get("searchWord") != null ) {
					psmt = con.prepareStatement(query);
					psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
					psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
					rs = psmt.executeQuery();
				}
				else {
					psmt = con.prepareStatement(sql);
					psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
					psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
					rs = psmt.executeQuery();
				}	
				
				while(rs.next()) {
					ObjectionDTO dto = new ObjectionDTO();
					
					dto.setObj_num(rs.getInt(1));
					dto.setObj_type(rs.getInt(2));
					dto.setObj_memberid(rs.getString(3));
					dto.setObj_name(rs.getString(4));
					dto.setObj_faculty(rs.getString(5));
					dto.setObj_subject(rs.getString(6));
					dto.setObj_date(rs.getString(7));
					dto.setObj_content(rs.getString(8));
					System.out.println("dao : " + rs.getString(2));
					obj_list.add(dto);
				}
				
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return obj_list;
		}
		// 출결 정정 신청 내역 View 가져오기
		public ObjectionDTO attenObjView(String obj_num){
			
			ObjectionDTO dto = new ObjectionDTO();
			String sql = "select obj_type, obj_memberid, obj_name, obj_faculty, obj_subject, obj_date, obj_content from obj_board where obj_num=?";
			
			try {
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, obj_num);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					
					dto.setObj_num(Integer.parseInt(obj_num));
					dto.setObj_type(rs.getInt("obj_type"));
					dto.setObj_memberid(rs.getString("obj_memberid"));
					dto.setObj_name(rs.getString("obj_name"));
					dto.setObj_faculty(rs.getString("obj_faculty"));
					dto.setObj_subject(rs.getString("obj_subject"));
					dto.setObj_date(rs.getString("obj_date"));
					dto.setObj_content(rs.getString("obj_content"));
					
				}
				
				con.close();
			}catch(Exception e) {
				System.out.println("Objection View Error in ObjectionDAO_attendance");
				e.printStackTrace();
			}
			
			
			return dto;
		}
		
		// 학적 2
		// 학적 2
		// 학적 2
		// 학적 정정 신청 내역 insert
		public int insert_colObj(ObjectionDTO dto) {
			
			String sql = "insert into obj_board(obj_type, obj_memberid, obj_name, obj_start_term, obj_col_type, obj_tuition, obj_back_year, obj_back_term, obj_refund_name, obj_refund_bank, obj_refund_num) values(?,?,?,?,?,?,?,?,?,?,?)";
			int result = 0;
			
			try {
				
				psmt = con.prepareStatement(sql);
				
				psmt.setInt(1, dto.getObj_type());
				psmt.setString(2, dto.getObj_memberid());
				psmt.setString(3, dto.getObj_name());
				psmt.setString(4, dto.getObj_start_term());
				psmt.setString(5, dto.getObj_col_type());
				psmt.setString(6, dto.getObj_tuition());
				psmt.setString(7, dto.getObj_back_year());
				psmt.setString(8, dto.getObj_back_term());
				psmt.setString(9, dto.getObj_refund_name());
				psmt.setString(10, dto.getObj_refund_bank());
				psmt.setString(11, dto.getObj_refund_num());
				result = psmt.executeUpdate();
				
				con.close();
			}catch(Exception e) {
				System.out.println("Objection Insert Error in ObjectionDAO_College");
				e.printStackTrace();
			}
			return result;
		}
		// 학적 변경 신청 내역 List 가져오기
		public List<ObjectionDTO> colObjList(Map<String, Object> map){
			
			List<ObjectionDTO> obj_list = new ArrayList<>();
			
			// 검색할 단어가 없으면 전체 게시물 중 내림차순으로 10개 출력
			String sql = "select obj_num, obj_type, obj_memberid, obj_name, obj_start_term, obj_col_type, obj_tuition, obj_back_year, obj_back_term, obj_refund_name, obj_refund_bank, obj_refund_num from obj_board where obj_type=2 limit ?,?";
			
			
			// 검색할 단어가 있으면
			String query = "select obj_num, obj_type, obj_memberid, obj_name, obj_start_term, obj_col_type, obj_tuition, obj_back_year, obj_back_term, obj_refund_name, obj_refund_bank, obj_refund_num "
					+ "from obj_board where obj_type=2";
			
			if (map.get("searchWord") != null) {
				query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
			}
			query += " limit ?,?";
			
			try {
				System.out.println(map.get("pageNum"));
				
				// 검색할 단어가 없으면 sql, 있으면 query로 입력
				if (map.get("searchWord") != null ) {
					psmt = con.prepareStatement(query);
					psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
					psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
					rs = psmt.executeQuery();
				}
				else {
					psmt = con.prepareStatement(sql);
					psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
					psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
					rs = psmt.executeQuery();
				}	
				
				while(rs.next()) {
					ObjectionDTO dto = new ObjectionDTO();
					
					
					dto.setObj_num(rs.getInt(1));
					dto.setObj_type(rs.getInt(2));
					dto.setObj_memberid(rs.getString(3));
					dto.setObj_name(rs.getString(4));
					dto.setObj_start_term(rs.getString(5));
					
					if(rs.getString(6).equals("1")) {
						dto.setObj_col_type("병역휴학");
					}else if(rs.getString(6).equals("2")) {
						dto.setObj_col_type("해외연수휴학");
					}else if(rs.getString(6).equals("3")) {
						dto.setObj_col_type("해외근무");
					}else if(rs.getString(6).equals("4")) {
						dto.setObj_col_type("임신출산");
					}else if(rs.getString(6).equals("5")) {
						dto.setObj_col_type("육아휴학");
					}else if(rs.getString(6).equals("6")) {
						dto.setObj_col_type("장기요양");
					}else if(rs.getString(6).equals("7")) {
						dto.setObj_col_type("가족간호");
					}else if(rs.getString(6).equals("8")) {
						dto.setObj_col_type("기타총장인정사유");
					}
					
					dto.setObj_tuition(rs.getString(7));
					dto.setObj_back_year(rs.getString(8));
					dto.setObj_back_term(rs.getString(9));
					dto.setObj_refund_name(rs.getString(10));
					dto.setObj_refund_bank(rs.getString(11));
					dto.setObj_refund_num(rs.getString(12));
					System.out.println("dao : " + rs.getString(2));
					obj_list.add(dto);
				}
				
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return obj_list;
		}
		// 학적 변경 신청 내역 View 가져오기
		public ObjectionDTO colObjView(String obj_num){
					
			ObjectionDTO dto = new ObjectionDTO();
			String sql = "select obj_num, obj_type, obj_memberid, obj_name, obj_start_term, obj_col_type, obj_tuition, obj_back_year, obj_back_term, obj_refund_name, obj_refund_bank, obj_refund_num from obj_board where obj_num=?";
					
			try {
						
				psmt = con.prepareStatement(sql);
				psmt.setString(1, obj_num);
				rs = psmt.executeQuery();
						
				while(rs.next()) {
							
					dto.setObj_num(Integer.parseInt(obj_num));
					dto.setObj_type(rs.getInt("obj_type"));
					dto.setObj_memberid(rs.getString("obj_memberid"));
					dto.setObj_name(rs.getString("obj_name"));
					dto.setObj_start_term(rs.getString("obj_start_term"));
					
					if(rs.getString("obj_col_type").equals("1")) {
						dto.setObj_col_type("병역휴학");
					}else if(rs.getString("obj_col_type").equals("2")) {
						dto.setObj_col_type("해외연수휴학");
					}else if(rs.getString("obj_col_type").equals("3")) {
						dto.setObj_col_type("해외근무");
					}else if(rs.getString("obj_col_type").equals("4")) {
						dto.setObj_col_type("임신출산");
					}else if(rs.getString("obj_col_type").equals("5")) {
						dto.setObj_col_type("육아휴학");
					}else if(rs.getString("obj_col_type").equals("6")) {
						dto.setObj_col_type("장기요양");
					}else if(rs.getString("obj_col_type").equals("7")) {
						dto.setObj_col_type("가족간호");
					}else if(rs.getString("obj_col_type").equals("8")) {
						dto.setObj_col_type("기타총장인정사유");
					}
					
					dto.setObj_tuition(rs.getString("obj_tuition"));
					dto.setObj_back_year(rs.getString("obj_back_year"));
					dto.setObj_back_term(rs.getString("obj_back_term"));
					dto.setObj_refund_name(rs.getString("obj_refund_name"));
					dto.setObj_refund_bank(rs.getString("obj_refund_bank"));
					dto.setObj_refund_num(rs.getString("obj_refund_num"));
				}
						
				con.close();
			}catch(Exception e) {
				System.out.println("Objection View Error in ObjectionDAO_college");
				e.printStackTrace();
			}
					
					
			return dto;
		}
		
		
		
		// 성적 3
		// 성적 3
		// 성적 3
	// 성적 정정 신청 내역 insert
	public int insert_gradeObj(ObjectionDTO dto) {
		
		String sql = "insert into obj_board(obj_type, obj_memberid, obj_name, obj_faculty, obj_subject, obj_content) values(?,?,?,?,?,?)";
		int result = 0;
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getObj_type());
			psmt.setString(2, dto.getObj_memberid());
			psmt.setString(3, dto.getObj_name());
			psmt.setString(4, dto.getObj_faculty());
			psmt.setString(5, dto.getObj_subject());
			psmt.setString(6, dto.getObj_content());
			result = psmt.executeUpdate();
			
			con.close();
		}catch(Exception e) {
			System.out.println("Objection Insert Error in ObjectionDAO_Grade");
			e.printStackTrace();
		}
		return result;
	}
	// 성적 정정 신청 내역 List 가져오기
	public List<ObjectionDTO> gradeObjList(Map<String, Object> map){
		
		List<ObjectionDTO> obj_list = new ArrayList<>();
		
		// 검색할 단어가 없으면 전체 게시물 중 내림차순으로 10개 출력
		String sql = "select obj_num, obj_type, obj_memberid, obj_name, obj_faculty, obj_subject, obj_content from obj_board where obj_type=3 limit ?,?";
		
		
		// 검색할 단어가 있으면
		String query = "select obj_num, obj_type, obj_memberid, obj_name, obj_faculty, obj_subject, obj_content "
				+ "from obj_board where obj_type=3";
		
		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
		}
		query += " limit ?,?";
		
		System.out.println(map.get("pageNum"));
		
		
		try {
			// 검색할 단어가 없으면 sql, 있으면 query로 입력
			if (map.get("searchWord") != null ) {
				psmt = con.prepareStatement(query);
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				rs = psmt.executeQuery();
			}
			else {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				rs = psmt.executeQuery();
			}	
			
			while(rs.next()) {
				ObjectionDTO dto = new ObjectionDTO();
				
				dto.setObj_num(rs.getInt(1));
				dto.setObj_type(rs.getInt(2));
				dto.setObj_memberid(rs.getString(3));
				dto.setObj_name(rs.getString(4));
				dto.setObj_faculty(rs.getString(5));
				dto.setObj_subject(rs.getString(6));
				dto.setObj_content(rs.getString(7));
				System.out.println("dao : " + rs.getString(2));
				obj_list.add(dto);
			}
			
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return obj_list;
	}
	// 성적 정정 신청 내역 View 가져오기
	public ObjectionDTO gradeObjView(String obj_num){
		
		ObjectionDTO dto = new ObjectionDTO();
		String sql = "select obj_type, obj_memberid, obj_name, obj_faculty, obj_subject, obj_content from obj_board where obj_num=?";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, obj_num);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
			dto.setObj_num(Integer.parseInt(obj_num));
			dto.setObj_type(rs.getInt("obj_type"));
			dto.setObj_memberid(rs.getString("obj_memberid"));
			dto.setObj_name(rs.getString("obj_name"));
			dto.setObj_faculty(rs.getString("obj_faculty"));
			dto.setObj_subject(rs.getString("obj_subject"));
			dto.setObj_content(rs.getString("obj_content"));
			
			}
			
			con.close();
		}catch(Exception e) {
			System.out.println("Objection View Error in ObjectionDAO_Grade");
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	// 증명서 4
	// 증명서 4
	// 증명서 4
	// 증명서 신청 insert 밑작업하기
	// 성적 정정 신청 내역 insert
		public void insert_certifiObj(String member_id, String name, List<Integer> type_list, List<Integer> count_list, List<String> content_list) {
			
			String sql = "insert into obj_board(obj_type, obj_memberid, obj_name, obj_certifi_type, obj_certifi_count, obj_certifi_content) values(?,?,?,?,?,?)";
			
			try {
				psmt = con.prepareStatement(sql);
				
				for (int i = 0; i < count_list.size(); i++) {
					
					System.out.println(type_list.get(i));
					psmt.setInt(1, 4);
					psmt.setString(2, member_id);
					psmt.setString(3, name);
					psmt.setInt(4, type_list.get(i));
					psmt.setInt(5, count_list.get(i));
					System.out.println(count_list.get(i));
					psmt.setString(6, content_list.get(i));
					psmt.executeUpdate();
					psmt.clearParameters();
					
				}
			}catch(Exception e) {
				System.out.println("Objection Insert Error in ObjectionDAO_Grade");
				e.printStackTrace();
			}
		}
		// 증명서 신청 내역 List 가져오기
		public List<ObjectionDTO> certifiObjList(Map<String, Object> map){
			
			List<ObjectionDTO> obj_list = new ArrayList<>();
			
			// 검색할 단어가 없으면 전체 게시물 중 내림차순으로 10개 출력
			String sql = "select obj_num, obj_type, obj_memberid, obj_name, obj_certifi_type, obj_certifi_count, obj_certifi_content from obj_board where obj_type=4 limit ?,?";
			
			
			// 검색할 단어가 있으면
			String query = "select obj_num, obj_type, obj_memberid, obj_name, obj_certifi_type, obj_certifi_count, obj_certifi_content "
					+ "from obj_board where obj_type=4";
			
			if (map.get("searchWord") != null) {
				query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
			}
			query += " limit ?,?";
			
			System.out.println(map.get("pageNum"));
			
			
			try {
				// 검색할 단어가 없으면 sql, 있으면 query로 입력
				if (map.get("searchWord") != null ) {
					psmt = con.prepareStatement(query);
					psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
					psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
					rs = psmt.executeQuery();
				}
				else {
					psmt = con.prepareStatement(sql);
					psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
					psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
					rs = psmt.executeQuery();
				}	
				
				while(rs.next()) {
					ObjectionDTO dto = new ObjectionDTO();
					
					dto.setObj_num(rs.getInt(1));
					dto.setObj_type(rs.getInt(2));
					dto.setObj_memberid(rs.getString(3));
					dto.setObj_name(rs.getString(4));
					dto.setObj_certifi_type(rs.getInt(5));
					if(rs.getInt(5)==1) {
						dto.setObj_col_type("교육비 납입 증명서");
					}else if(rs.getInt(5)==2) {
						dto.setObj_col_type("성적 증명서");
					}else if(rs.getInt(5)==3) {
						dto.setObj_col_type("수강 신청 확인서");
					}else if(rs.getInt(5)==4) {
						dto.setObj_col_type("수기 증명서");
					}else if(rs.getInt(5)==5) {
						dto.setObj_col_type("수료 증명서");
					}else if(rs.getInt(5)==6) {
						dto.setObj_col_type("장학금 수혜 확인서");
					}else if(rs.getInt(5)==7) {
						dto.setObj_col_type("졸업 예정 증명서");
					}else if(rs.getInt(5)==8) {
						dto.setObj_col_type("휴학 증명서");
					}else if(rs.getInt(5)==9) {
						dto.setObj_col_type("학력 인정 증명서");
					}
					dto.setObj_certifi_count(rs.getInt(6));
					dto.setObj_certifi_content(rs.getString(7));
					System.out.println("dao : " + rs.getString(2));
					obj_list.add(dto);
				}
				
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return obj_list;
		}
		// 성적 정정 신청 내역 View 가져오기
		public ObjectionDTO certifiObjView(String obj_num){
			
			ObjectionDTO dto = new ObjectionDTO();
			String sql = "select obj_type, obj_memberid, obj_name, obj_certifi_type, obj_certifi_count, obj_certifi_content from obj_board where obj_num=?";
			
			try {
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, obj_num);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					
				dto.setObj_num(Integer.parseInt(obj_num));
				dto.setObj_type(rs.getInt("obj_type"));
				dto.setObj_memberid(rs.getString("obj_memberid"));
				dto.setObj_name(rs.getString("obj_name"));
				dto.setObj_certifi_type(rs.getInt("obj_certifi_type"));
				dto.setObj_certifi_count(rs.getInt("obj_certifi_count"));
				dto.setObj_certifi_content(rs.getString("obj_certifi_content"));
				
				}
				
				con.close();
			}catch(Exception e) {
				System.out.println("Objection View Error in ObjectionDAO_certificate");
				e.printStackTrace();
			}
			
			
			return dto;
		}
	
	
	
	
	
	// 정정 신청 내역 삭제하기
	public void objDelete(String obj_num) {
		
		String sql = "delete from obj_board where obj_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, obj_num);
			psmt.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("Objection Delete Error in ObjectionDAO");
			e.printStackTrace();
		}
	}
	
	
	
}
