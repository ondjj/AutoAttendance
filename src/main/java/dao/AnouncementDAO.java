package dao;

import java.util.List;

import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import dto.AnouncementDTO;

public class AnouncementDAO extends DBConnPool {
	
	public AnouncementDAO() {
		super();
	}
	
	// 공지사항 데이터 받아 DB에 데이터 추가함
	// Anouncement에 데이터 입력시 조회수(anounceViews)는 기본값이 0이기 때문에 입력 생략함
		public int insertWrite(AnouncementDTO dto) {
		int result = 0;
		String sql = "insert into anounce_board (anounce_writer,anounce_subject,anounce_content,anounce_ofile,anounce_sfile,anounce_date)"
				+ "values (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getAnounce_writer());
			psmt.setString(2, dto.getAnounce_subject());
			psmt.setString(3, dto.getAnounce_content());
			psmt.setString(4, dto.getAnounce_ofile());
			psmt.setString(5, dto.getAnounce_sfile());
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("공지사항 추가 중 에러 발생");
			e.printStackTrace();
		}
		return result;
	}
	
		// 검색 조건에 맞는 게시물의 개수 반환 -> 결과 int
		// select count(*) from data_lib; 를 이용한 전체 개수 가져오기
		// 이 메소드는 매개변수로 테이블을 입력 받아서 해당 테이블의 전체 데이터의 개수를 int 타입으로 반환한다.
		public int selectCount (Map<String, Object>map) {
			int totalCount = 0; // 초기화 세팅
			
			String sql = "select count(*) from anounce_board ";
			// 공지사항에서 전체 개수 가져오기
			
			if (map.get("searchWord") != null) {
				sql += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
			}
			
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				rs.next();
				totalCount = rs.getInt(1);
			} catch (Exception e) {
				System.out.println("공지사항 카운트 생성 에러");
				e.printStackTrace();
			}
			return totalCount;
		}
		
		// 검색 조건에 맞는 게시물 목록 반환
		// 컨트롤러에서 Map 컬렉션을 생성하고 목록에 출력할 게시물의 범위를 계산해 매개변수 컬렉션(map)에 추가하려고 함
		public List<AnouncementDTO> selectListPage(Map<String, Object>map) {
			List<AnouncementDTO> board = new Vector<AnouncementDTO>();
			
			//	검색할 단어가 없으면 전체 게시물 중 내림차순으로 10개 출력
			String sql = "select * from anounce_board where anounce_num between ? and ? order by anounce_num desc ";
			
			String main = "select * from anounce_board where anounce_num order by anounce_num desc limit 0,5";
			
			// 검색한 단어가 있으면 전체 게시물 중 개수 제한 없이 출력
			String query = "select * from anounce_board ";
				if (map.get("searchWord") != null) {
				query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
				}
				query += " order by anounce_num desc ";
				
			try {
				// 검색할 단어가 없으면 sql, 있으면 query로 입력
				if (map.get("main") != null) {
					psmt = con.prepareStatement(main);
					rs = psmt.executeQuery();
					
				} else if (map.get("searchWord") != null ) {
					psmt = con.prepareStatement(query);
					rs = psmt.executeQuery();
				}
				else {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				rs = psmt.executeQuery();
				}
				while (rs.next()) {
					AnouncementDTO dto = new AnouncementDTO();
					dto.setAnounce_num(rs.getString(1));
					dto.setAnounce_subject(rs.getString(2));
					dto.setAnounce_content(rs.getString(3));
					dto.setAnounce_writer(rs.getString(4));
					dto.setAnounce_date(rs.getDate(5));
					dto.setAnounce_ofile(rs.getString(6));
					dto.setAnounce_sfile(rs.getString(7));
					dto.setAnounce_view(rs.getInt(8));
					dto.setAnounce_down(rs.getInt(9));
					board.add(dto);
				}
			} catch (Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			return board;
		}
		
		
		// 공지사항 상세 페이지
		public AnouncementDTO selectView(String am_PostNum) {
			AnouncementDTO dto = new AnouncementDTO();
			
			String sql = "select * from anounce_board where anounce_num=?"; // 공지사항 번호에 해당하는 데이터를 모두 가져옴
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, am_PostNum);
				rs = psmt.executeQuery();
				
				if(rs.next()) { // 가져온 결과를 DTO 객체에 저장
					dto.setAnounce_num(rs.getString(1));
					dto.setAnounce_subject(rs.getString(2));
					dto.setAnounce_content(rs.getString(3));
					dto.setAnounce_writer(rs.getString(4));
					dto.setAnounce_date(rs.getDate(5));
					dto.setAnounce_ofile(rs.getString(6));
					dto.setAnounce_sfile(rs.getString(7));
					dto.setAnounce_view(rs.getInt(8));
					dto.setAnounce_down(rs.getInt(9));
				}
			} catch (Exception e) {
				System.out.println("공지사항 번호 데이터 가져오기 에러");
				e.printStackTrace();
			}
			return dto;
		}
		
		
		// 공지사항 조회수 증가
		public void updateVisitCount(String anounce_num) { 
			String sql = "update anounce_board set anounce_view = anounce_view + 1 where anounce_num=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, anounce_num);
				psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("공지사항 조회수 증가 오류");
				e.printStackTrace();
			}
		}
		
		// 파일 다운로드 횟수 중가
		public void downCountPlus(int anounce_num) {
			String sql = "update anounce_board set anounce_down = anounce_down + 1 where anounce_num=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, anounce_num);
				psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("공지사항 다운횟수 증가 오류");
				e.printStackTrace();
			}
		}
		
		// 공지사항 삭제
		public int deletePost(String anounce_num) {
			int result = 0;
			
			try {
			String sql = "delete from anounce_board where anounce_num=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, anounce_num);
			result = psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("공지사항 게시물 삭제 오류");
				e.printStackTrace();
			}
			return result; // 정상적으로 삭제되었으면 result 결과는 1을 반환함 (true)
		}
		
		public int updatePost(AnouncementDTO dto) {
			int result = 0;
			
			try {
				String sql = "update anounce_board set "
						+ " anounce_subject=?, anounce_writer=?, anounce_content=?, anounce_ofile=?, anounce_sfile=? "
						+ " where anounce_num=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getAnounce_subject());
				psmt.setString(2, dto.getAnounce_writer());
				psmt.setString(3, dto.getAnounce_content());
				psmt.setString(4, dto.getAnounce_ofile());
				psmt.setString(5, dto.getAnounce_sfile());
				psmt.setString(6, dto.getAnounce_num());
				result = psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("공지사항 게시물 수정 오류");
				e.printStackTrace();
			}
			return result;
		}
	
	
	
	
	
}
