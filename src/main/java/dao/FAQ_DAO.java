package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import dto.FAQ_DTO;

public class FAQ_DAO extends DBConnPool {

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; // 초기화 세팅

		// 전체 카테고리의 게시물 개수 가져오기
		String sql = "select count(*) from faq_board ";

		// 카테고리 선택 > 선택된 카테고리 개수 가져오기
		if (map.get("category") != null) {
			sql += " where faq_category = '" + map.get("category") + "' ";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("FAQ 카운트 생성 에러");
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<FAQ_DTO> selectListPage(Map<String, Object> map) {
		List<FAQ_DTO> board = new Vector<FAQ_DTO>();
		
		// 카테고리 선택 X 전체 게시물 출력
		String sql = "select * from faq_board where faq_num order by faq_num desc ";

		// 카테고리 선택 O 선택된 카테고리에 포함된 전체 게시물 출력
		String query = "select * from faq_board ";
		if (map.get("category") != null) {
			query += " where faq_category = '" + map.get("category") + "'";
		}

		try {
			// 카테고리 선택X = sql, 카테고리 선택O = query로 입력
			if (map.get("category") == null || Integer.parseInt(map.get("category").toString()) == 0) {
				psmt = con.prepareStatement(sql);
				System.out.println("sql");
				rs = psmt.executeQuery();
			} else {
				psmt = con.prepareStatement(query);
				System.out.println("query");
				rs = psmt.executeQuery();
			}
			while (rs.next()) {
				FAQ_DTO dto = new FAQ_DTO();
				dto.setFaq_num(rs.getString(1));
				dto.setFaq_category(rs.getString(2));
				dto.setFaq_subject(rs.getString(3));
				dto.setFaq_content(rs.getString(4));
				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("FAQ 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}

	// 게시판 데이터 받아 DB에 데이터 추가함
	public int insertWrite(FAQ_DTO dto) {
		int result = 0;
		try {
			String sql = "insert into faq_board (faq_category, faq_subject, faq_content) values (?, ?, ?)";

			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getFaq_category());
			psmt.setString(2, dto.getFaq_subject());
			psmt.setString(3, dto.getFaq_content());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("FAQ 추가 중 에러 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// FAQ 삭제
	public int deletePost(String faq_num) {
		int result = 0;
		try {
		String sql = "delete from faq_board where faq_num=?";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, faq_num);
		result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 오류");
			e.printStackTrace();
		}
		return result; // 정상적으로 삭제되었으면 result 결과는 1을 반환함 (true)
	}

}
