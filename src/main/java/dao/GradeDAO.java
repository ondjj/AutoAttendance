package dao;

import java.util.*;
import common.DBConnPool;
import dto.GradeDTO;

public class GradeDAO extends DBConnPool{

	// 현재 학기 성적 가져오기
	public List<GradeDTO> call_gradeList(String temp, String this_term) {
		
		String sql = "select * from grade_manage where member_id=? and year_term=?";
		
		List<GradeDTO> board = new ArrayList();
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, temp);
			psmt.setString(2, this_term);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				GradeDTO dto = new GradeDTO();
				dto.setMember_id(rs.getString(1));
				dto.setYear_term(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setMajor(rs.getString(4));
				dto.setSubject(rs.getString(5));
				dto.setScore1(rs.getInt(6));
				dto.setScore2(rs.getInt(7));
				dto.setScore3(rs.getInt(8));
				dto.setGrade(grade_result(rs.getInt(6), rs.getInt(7), rs.getInt(8)));
				board.add(dto);
			}
		}catch(Exception e) {
			System.out.println("Exception in DAO");
			e.printStackTrace();
		}
		return board;
	}
	
	// 성적 평균에 따라 등급
	public String grade_result(int score1, int score2, int score3) {
		
		String result = null;
		double avg = (score1+score2+score3)/3;
		
		if(avg>=90) {
			result = "A";
		}else if(avg>=80 && avg<90) {
			result = "B";
		}else if(avg>=70 && avg<80) {
			result = "C";
		}else if(avg>=60 && avg<70) {
			result = "D";
		}else {
			result = "F";
		}
		return result;
	}
	
	// 직전 학기 성적 가져오기
	public List<GradeDTO> call_pastgradeList(String temp, String this_term) {
		
		String sql = "select * from grade_manage where member_id=? and year_term=?";
		String year = this_term.split("-")[0];
		String term = this_term.split("-")[1];
		String past_term = null;
		
		if(term.equals("2")) {
			past_term = year+"-1";
			System.out.println(past_term);
		}else {
			int past_year = (Integer.parseInt(year)-1);
			past_term = past_year + "-2";
			System.out.println(past_term);
		}
		List<GradeDTO> board = new ArrayList();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, temp);
			psmt.setString(2, past_term);
			rs = psmt.executeQuery();
			while (rs.next()) {
				GradeDTO dto = new GradeDTO();
				dto.setMember_id(rs.getString(1));
				dto.setYear_term(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setMajor(rs.getString(4));
				dto.setSubject(rs.getString(5));
				dto.setScore1(rs.getInt(6));
				dto.setScore2(rs.getInt(7));
				dto.setScore3(rs.getInt(8));
				dto.setGrade(grade_result(rs.getInt(6), rs.getInt(7), rs.getInt(8)));
				board.add(dto);
				con.close();
			}
		}catch(Exception e) {
			System.out.println("Exception in DAO");
			e.printStackTrace();
		}
		return board;
	}
	
	// DashBoard 이전 학기들 가져오기
	public List<String> year_term_list(String tempid){
		
		System.out.println("DAO실행");
		List<String> year_term_list = new ArrayList();
		String sql = "select distinct year_term from grade_manage where member_id=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, tempid);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				year_term_list.add(rs.getString(1));
				System.out.println(rs.getString(1));
			}
		}catch(Exception e) {
			System.out.println("Exception in DAO");
			e.printStackTrace();
		}
		
		return year_term_list;
	}
	
	// DashBoard 이전 학기들, 이수과목수, 평균 성적 가져오기
	public List<Map<String, Object>> call_dashGrade(List<String> year_term_list, String tempid){
		
		String sql = "select * from grade_manage where member_id=? and year_term=?";
		
		List<Map<String, Object>> board = new ArrayList();
		
		for (int i = 0; i < year_term_list.size(); i++) {
			
			try {
				Map<String, Object> map = new HashMap<>();
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, tempid);
				psmt.setString(2, year_term_list.get(i));
				System.out.println("dao : "+year_term_list.get(i));
				rs = psmt.executeQuery();
				
				int total_lecture = 0;
				int sum_score = 0;
				
				while (rs.next()) {
					
					total_lecture += 1;
					sum_score += Integer.parseInt(rs.getString("score1"));
					sum_score += Integer.parseInt(rs.getString("score2"));
					sum_score += Integer.parseInt(rs.getString("score3"));
				}
				
				String result = null;
				double avg = sum_score/(3*total_lecture);
				
				if(avg>=90) {
					result = "A";
				}else if(avg>=80 && avg<90) {
					result = "B";
				}else if(avg>=70 && avg<80) {
					result = "C";
				}else if(avg>=60 && avg<70) {
					result = "D";
				}else {
					result = "F";
				}
				
				map.put("target_term", year_term_list.get(i));
				map.put("total_lecture", total_lecture);
				map.put("score_avg", Math.round((avg*10)/10.0));
				map.put("result_grade", result);
				
				board.add(map);
				con.close();
				
			}catch(Exception e) {
				System.out.println("Exception in DAO");
				e.printStackTrace();
			}
		}
		return board;
	}
	
	public List<Object> dash_grade_footer(List<Map<String, Object>> dashList){
		
		List<Object> footer_result = new ArrayList();
		Map<String, Object> map = new HashMap<>();
		
		int sum_total_lecture = 0;
		int total_avg = 0;
		
		for (int i = 0; i < dashList.size(); i++) {
			map = dashList.get(i);
			sum_total_lecture += (int)map.get("total_lecture");
			total_avg += Integer.parseInt(String.valueOf(map.get("score_avg")));
		}
		
		String result = null;
		double avg = total_avg/dashList.size();
		
		if(avg>=90) {
			result = "A";
		}else if(avg>=80 && avg<90) {
			result = "B";
		}else if(avg>=70 && avg<80) {
			result = "C";
		}else if(avg>=60 && avg<70) {
			result = "D";
		}else {
			result = "F";
		}
		
		footer_result.add(sum_total_lecture);
		footer_result.add(result);
		System.out.println(sum_total_lecture);
		System.out.println(avg);
		System.out.println(result);
		
		
		return footer_result;
	}
	
	// manager_성적 입력
	public int insert_grade(GradeDTO dto) {
		
		String sql = "insert into grade_manage(member_id, year_term, name, major, subject, score1, score2, score3) values(?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getMember_id());
			psmt.setString(2, dto.getYear_term());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getMajor());
			psmt.setString(5, dto.getSubject());
			psmt.setInt(6, dto.getScore1());
			psmt.setInt(7, dto.getScore2());
			psmt.setInt(8, dto.getScore3());
			result = psmt.executeUpdate();
			
			con.close();
		}catch(Exception e) {
			System.out.println("Grade_Insert Error in GradeDAO");
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
	
}
