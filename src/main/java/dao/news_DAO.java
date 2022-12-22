package dao;

import java.util.List;



import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import dto.News_DTO;

public class news_DAO extends DBConnPool {
	
	public news_DAO() {
		super();
	}
	
	// 공지사항 데이터 받아 DB에 데이터 추가함
	// news에 데이터 입력시 조회수(newsViews)는 기본값이 0이기 때문에 입력 생략함
		public int insertWrite(News_DTO dto) {
		int result = 0;
		String sql = "insert into news_board (news_writer,news_subject,news_content,news_oimg,news_simg,news_date)"
				+ "values (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getNews_writer());
			psmt.setString(2, dto.getNews_subject());
			psmt.setString(3, dto.getNews_content());
			psmt.setString(4, dto.getNews_oimg());
			psmt.setString(5, dto.getNews_simg());
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("뉴스 추가 중 에러 발생");
			e.printStackTrace();
		}
		return result;
	}
	
		// 검색 조건에 맞는 게시물의 개수 반환 -> 결과 int
		// select count(*) from data_lib; 를 이용한 전체 개수 가져오기
		// 이 메소드는 매개변수로 테이블을 입력 받아서 해당 테이블의 전체 데이터의 개수를 int 타입으로 반환한다.
		public int selectCount (Map<String, Object>map) {
			int totalCount = 0; // 초기화 세팅
			
			String sql = "select count(*) from news_board ";
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
				System.out.println("뉴스 카운트 생성 에러");
				e.printStackTrace();
			}
			return totalCount;
		}
		
		// 검색 조건에 맞는 게시물 목록 반환
		// 컨트롤러에서 Map 컬렉션을 생성하고 목록에 출력할 게시물의 범위를 계산해 매개변수 컬렉션(map)에 추가하려고 함
		public List<News_DTO> selectListPage(Map<String, Object>map) {
			List<News_DTO> board = new Vector<News_DTO>();
			
			//	검색할 단어가 없으면 전체 게시물 중 내림차순으로 10개 출력
			String sql = "select * from news_board where news_num between ? and ? order by news_num desc ";
			
			String n_main = "select * from news_board where news_num";
			
			// 검색한 단어가 있으면 전체 게시물 중 개수 제한 없이 출력
			String query = "select * from news_board ";
				if (map.get("searchWord") != null) {
				query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' ";
				}
				query += " order by news_num desc ";
				// 검색할 단어가 없으면 sql, 있으면 query로 입력
				
			try {
				if (map.get("searchWord") != null ) {
					psmt = con.prepareStatement(query);
					System.out.println("query");
					rs = psmt.executeQuery();
				}else if(map.get("n_main") != null){
					psmt = con.prepareStatement(n_main);
					rs = psmt.executeQuery();
					
				}
				else {
				psmt = con.prepareStatement(sql);
				System.out.println("sql");
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				rs = psmt.executeQuery();
				}
				while (rs.next()) {
					News_DTO dto = new News_DTO();
					dto.setNews_num(rs.getString(1));
					dto.setNews_subject(rs.getString(2));
					dto.setNews_content(rs.getString(3));
					dto.setNews_writer(rs.getString(4));
					dto.setNews_date(rs.getDate(5));
					dto.setNews_oimg(rs.getString(6));
					dto.setNews_simg(rs.getString(7));
					dto.setNews_view(rs.getInt(8));
					dto.setNews_down(rs.getInt(9));
					board.add(dto);
				}
			} catch (Exception e) {
				System.out.println("뉴스 조회 중 예외 발생");
				e.printStackTrace();
			}
			return board;
		}
		
		
		// 공지사항 상세 페이지
		public News_DTO selectView(String n_PostNum) {
			News_DTO dto = new News_DTO();
			
			String sql = "select * from news_board where news_num=?"; // 공지사항 번호에 해당하는 데이터를 모두 가져옴
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, n_PostNum);
				rs = psmt.executeQuery();
				
				if(rs.next()) { // 가져온 결과를 DTO 객체에 저장
					dto.setNews_num(rs.getString(1));
					dto.setNews_subject(rs.getString(2));
					dto.setNews_content(rs.getString(3));
					dto.setNews_writer(rs.getString(4));
					dto.setNews_date(rs.getDate(5));
					dto.setNews_oimg(rs.getString(6));
					dto.setNews_simg(rs.getString(7));
					dto.setNews_view(rs.getInt(8));
					
				}
			} catch (Exception e) {
				System.out.println("뉴스 번호 데이터 가져오기 에러");
				e.printStackTrace();
			}
			return dto;
		}
		
		
		// 공지사항 조회수 증가
		public void updateVisitCount(String news_num) { 
			String sql = "update news_board set news_view = news_view + 1 where news_num=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, news_num);
				psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("뉴스 조회수 증가 오류");
				e.printStackTrace();
			}
		}
		
		// 파일 다운로드 횟수 중가
		public void downCountPlus(int news_num) {
			String sql = "update news_board set news_down = news_down + 1 where news_num=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, news_num);
				psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("뉴스 다운횟수 증가 오류");
				e.printStackTrace();
			}
		}
		
		// 공지사항 삭제
		public int deletePost(String news_num) {
			int result = 0;
			
			try {
			String sql = "delete from news_board where news_num=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, news_num);
			result = psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("뉴스 게시물 삭제 오류");
				e.printStackTrace();
			}
			return result; // 정상적으로 삭제되었으면 result 결과는 1을 반환함 (true)
		}
		
		public int updatePost(News_DTO dto) {
			int result = 0;
			
			try {
				String sql = "update news_board set "
						+ " news_subject=?, news_writer=?, news_content=?, news_oimg=?, news_simg=? "
						+ " where news_num=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getNews_subject());
				psmt.setString(2, dto.getNews_writer());
				psmt.setString(3, dto.getNews_content());
				psmt.setString(4, dto.getNews_oimg());
				psmt.setString(5, dto.getNews_simg());
				psmt.setString(6, dto.getNews_num());
				result = psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("뉴스 게시물 수정 오류");
				e.printStackTrace();
			}
			return result;
		}
		
		public News_DTO news() {
			News_DTO dto = new News_DTO();
			try {
				String sql1 = "select news_subject, news_oimg, news_num from news_board where news_num between 0 and 999 order by news_num desc limit 0, 1";
				psmt = con.prepareStatement(sql1);
				rs = psmt.executeQuery();
				if (rs.next()) {
					dto.setNews_subject1(rs.getString(1));
					dto.setNews_oimg1(rs.getString(2));
					dto.setNews_num1(rs.getString(3));
				}
				String sql2 = "select news_subject, news_oimg, news_num from news_board where news_num between 0 and 999 order by news_num desc limit 1, 1";
				psmt = con.prepareStatement(sql2);
				rs = psmt.executeQuery();
				if (rs.next()) {
					dto.setNews_subject2(rs.getString(1));
					dto.setNews_oimg2(rs.getString(2));
					dto.setNews_num2(rs.getString(3));
				}
				String sql3 = "select news_subject, news_oimg, news_num from news_board where news_num between 0 and 999 order by news_num desc limit 2, 1";
				psmt = con.prepareStatement(sql3);
				rs = psmt.executeQuery();
				if (rs.next()) {
					dto.setNews_subject3(rs.getString(1));
					dto.setNews_oimg3(rs.getString(2));
					dto.setNews_num3(rs.getString(3));
				}
			} catch (Exception e) {
				System.out.println("이미지,제목 불러오기 오류");
				e.printStackTrace();
			}
			return dto;
		}
		
		
		
	
	
	
	
}
