package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import dto.QnA_DTO;
import dto.data_lib_DTO;

public class QnA_DAO extends DBConnPool {
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; // 초기화 세팅

		// 전체 게시물 개수 가져오기
		String sql = "select count(*) from qna_board ";
		
		// 이름 검색 > 검색된 게시물 개수 가져오기
		if (map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("QnA 카운트 생성 에러");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<QnA_DTO> selectListPage(Map<String, Object> map) {
		List<QnA_DTO> board = new Vector<QnA_DTO>();
		
		// 전체 QnA 출력
		String sql = "select * from qna_board where qna_num order by qna_num desc ";
		
		// 검색
		String query = "select * from qna_board where qna_writer like '%" + map.get("searchWord") + "%' order by qna_num desc";

		// 메인 페이지 QnA 5개 출력
		String main = "select * from qna_board where qna_num order by qna_num desc limit 0, 5 ";
		
		try {
			// 전체 QnA = sql, 메인페이지 = main, 검색 = query
			if (map.get("main") != null) {
				psmt = con.prepareStatement(main);
				rs = psmt.executeQuery();
			} else if (map.get("searchWord") != null) {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery();
			} else {
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
			}
			while (rs.next()) {
				QnA_DTO dto = new QnA_DTO();
				dto.setQna_num(rs.getString(1));
				dto.setQna_question(rs.getString(2));
				dto.setQna_answer(rs.getString(3));
				dto.setQna_writer(rs.getString(4));
				dto.setQna_date(rs.getDate(5));
				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("QnA 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}

	// 게시판 데이터 받아 DB에 데이터 추가함
	public int insertWrite(QnA_DTO dto) {
		int result = 0;
		try {
			// 질문만 등록되었을 때
			if (dto.getQna_answer() == null) {
				String sql = "insert into qna_board (qna_writer, qna_question, qna_date) values (?, ?, CURRENT_TIMESTAMP)";
	
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getQna_writer());
				psmt.setString(2, dto.getQna_question());
				result = psmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("QnA 추가 중 에러 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시물 전체 데이터
	public QnA_DTO selectView(String qna_num) {
		QnA_DTO dto = new QnA_DTO();
		
		String sql = "select * from qna_board where qna_num=?"; // 게시물 번호에 해당하는 데이터를 모두 가져옴
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, qna_num);
			rs = psmt.executeQuery();
			
			if(rs.next()) { // 가져온 결과를 DTO 객체에 저장
				dto.setQna_num(rs.getString(1));
				dto.setQna_question(rs.getString(2));
				dto.setQna_answer(rs.getString(3));
				dto.setQna_writer(rs.getString(4));
				dto.setQna_date(rs.getDate(5));
			}
		} catch (Exception e) {
			System.out.println("게시물 번호 데이터 가져오기 에러");
			e.printStackTrace();
		}
		return dto;
	}
	
	// 게시물 수정
	public int updatePost(QnA_DTO dto) {
		int result = 0;
		
		try {
			// 답변이 등록되지 않았을 때 질문 수정
			if (dto.getQna_question() != null) {
				String sql = "update qna_board set qna_question = ? where qna_num = ?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getQna_question());
				psmt.setString(2, dto.getQna_num());
				result = psmt.executeUpdate();
			}
			// 답변이 등록되었을 때 답변 수정
			if (dto.getQna_answer() != null) {
				String query = "update qna_board set qna_answer = ? where qna_num = ?";
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getQna_answer());
				psmt.setString(2, dto.getQna_num());
				result = psmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("게시물 수정 오류");
			e.printStackTrace();
		}
		return result;
	}
	
	// QnA 삭제
	public int deletePost(String qna_num) {
		int result = 0;
		try {
		String sql = "delete from qna_board where qna_num=?";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, qna_num);
		result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 오류");
			e.printStackTrace();
		}
		return result; // 정상적으로 삭제되었으면 result 결과는 1을 반환함 (true)
		}
	
}
