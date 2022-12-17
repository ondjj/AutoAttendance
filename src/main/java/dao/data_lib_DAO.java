package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import dto.data_lib_DTO;

public class data_lib_DAO extends DBConnPool {
	
	public data_lib_DAO() {
		super();
	}
	
	// 검색 조건에 맞는 게시물의 개수 반환 -> 결과 int
	// select count(*) from data_lib; 를 이용한 전체 개수 가져오기
	// 이 메소드는 매개변수로 테이블을 입력 받아서 해당 테이블의 전체 데이터의 개수를 int 타입으로 반환한다.
	public int selectCount (Map<String, Object>map) {
		int totalCount = 0; // 초기화 세팅
		
		String sql = "select count(*) from data_library ";
		// 게시판에서 전체 개수 가져오기
		
		if (map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
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
	
	// 검색 조건에 맞는 게시물 목록 반환
	// 컨트롤러에서 Map 컬렉션을 생성하고 목록에 출력할 게시물의 범위를 계산해 매개변수 컬렉션(map)에 추가하려고 함
	public List<data_lib_DTO> selectListPage(Map<String, Object>map) {
		List<data_lib_DTO> board = new Vector<data_lib_DTO>();
		
		//	검색할 단어가 없으면 전체 게시물 중 내림차순으로 10개 출력
		String sql = "select * from data_library where data_num between ? and ? order by data_num desc ";
		
		// 검색한 단어가 있으면 전체 게시물 중 개수 제한 없이 출력
		String query = "select * from data_library ";
			if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' "
					+ " order by data_num desc limit ?, ? ";
			}
	
		try {
			// 검색할 단어가 없으면 sql, 있으면 query로 입력
			if (map.get("searchWord") != null ) {
				psmt = con.prepareStatement(query);
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				rs = psmt.executeQuery();
				System.out.println("query, 검색했음");
			}
			else {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
				System.out.println("sql, 검색안함");
			}
			while (rs.next()) {
				data_lib_DTO dto = new data_lib_DTO();
				dto.setData_num(rs.getString(1));
				dto.setData_subject(rs.getString(2));
				dto.setData_content(rs.getString(3));
				dto.setData_writer(rs.getString(4));
				dto.setData_date(rs.getDate(5));
				dto.setData_ofile(rs.getString(6));
				dto.setData_sfile(rs.getString(7));
				dto.setData_view(rs.getInt(8));
				dto.setData_down(rs.getInt(9));
				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}

	// 게시판 데이터 받아 DB에 데이터 추가함
	// dataroom에 데이터 입력시 조회수(dataViews)는 기본값이 0이기 때문에 입력 생략함
	public int insertWrite(data_lib_DTO dto) {
		int result = 0;
		try {
			String sql = "insert into data_library "
					+ " (data_writer, data_subject, data_content, data_ofile, data_sfile, data_date) "
					+ " values (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getData_writer());
			psmt.setString(2, dto.getData_subject());
			psmt.setString(3, dto.getData_content());
			psmt.setString(4, dto.getData_ofile());
			psmt.setString(5, dto.getData_sfile());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 추가 중 에러 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시물 상세 페이지
	public data_lib_DTO selectView(String dataPostNum) {
		data_lib_DTO dto = new data_lib_DTO();
		
		String sql = "select * from data_library where data_num=?"; // 게시물 번호에 해당하는 데이터를 모두 가져옴
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dataPostNum);
			rs = psmt.executeQuery();
			
			if(rs.next()) { // 가져온 결과를 DTO 객체에 저장
				dto.setData_num(rs.getString(1));
				dto.setData_subject(rs.getString(2));
				dto.setData_content(rs.getString(3));
				dto.setData_writer(rs.getString(4));
				dto.setData_date(rs.getDate(5));
				dto.setData_ofile(rs.getString(6));
				dto.setData_sfile(rs.getString(7));
				dto.setData_view(rs.getInt(8));
				dto.setData_down(rs.getInt(9));
			}
		} catch (Exception e) {
			System.out.println("게시물 번호 데이터 가져오기 에러");
			e.printStackTrace();
		}
		return dto;
	}
	
	// 게시물의 조회수 증가
	public void updateVisitCount(String data_num) { 
		String sql = "update data_library set data_view = data_view + 1 where data_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, data_num);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("조회수 증가 오류");
			e.printStackTrace();
		}
	}
	
	
	// 파일 다운로드 횟수 중가
	public void downCountPlus(int data_num) {
		String sql = "update data_library set data_down = data_down + 1 where data_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, data_num);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("다운횟수 증가 오류");
			e.printStackTrace();
		}
	}
	
	// 게시물 삭제
	public int deletePost(String data_num) {
		int result = 0;
		try {
		String sql = "delete from data_library where data_num=?";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, data_num);
		result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 오류");
			e.printStackTrace();
		}
		return result; // 정상적으로 삭제되었으면 result 결과는 1을 반환함 (true)
	}
	
	public int updatePost(data_lib_DTO dto) {
		int result = 0;
		
		try {
			String sql = "update data_library set "
					+ " data_subject=?, data_writer=?, data_content=?, data_ofile=?, data_sfile=? "
					+ " where data_num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getData_subject());
			psmt.setString(2, dto.getData_writer());
			psmt.setString(3, dto.getData_content());
			psmt.setString(4, dto.getData_ofile());
			psmt.setString(5, dto.getData_sfile());
			psmt.setString(6, dto.getData_num());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 오류");
			e.printStackTrace();
		}
		return result;
	}
	
}
