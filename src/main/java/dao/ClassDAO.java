package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import dto.ClassDTO;

public class ClassDAO extends DBConnPool{
	
	public void insertClass(ClassDTO cdto) {
		
		String sql = "insert into classRoom (postNum, lecture_name, lecture_check, subject, subject_img, subject_saveImg, class_date, professor)"
						+ "values (null, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, cdto.getLecture_name());
			psmt.setString(2, cdto.getLecture_check());
			psmt.setString(3, cdto.getSubject());
			psmt.setString(4, cdto.getSubject_img());
			psmt.setString(5, cdto.getSubject_saveImg());
			psmt.setString(6, cdto.getClass_date());
			psmt.setString(7, cdto.getProfessor());
			psmt.executeUpdate();
			con.close();

			
		}catch(Exception e) {
			System.out.println("ClassRoom Insert ERROR");
			e.printStackTrace();
		}
	}
	
	public ArrayList<ClassDTO> getAllClass(){
		
		ArrayList<ClassDTO> arr = new ArrayList<>();
		
		try {
			String sql = "select * from classRoom";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ClassDTO cdto = new ClassDTO();
				cdto.setPostNum(rs.getInt(1));
				cdto.setLecture_name(rs.getString(2));
				cdto.setLecture_check(rs.getString(3));
				cdto.setSubject(rs.getString(4));
				cdto.setSubject_img(rs.getString(5));
				cdto.setSubject_saveImg(rs.getString(6));
				cdto.setClass_date(rs.getString(7));
				
				
				arr.add(cdto);
			}
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	public ClassDTO getClass(String kr_name) {
		ClassDTO cdto = new ClassDTO();
		
		try {
			String sql = "select * from classRoom where professor=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, kr_name);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				cdto.setPostNum(rs.getInt(1));
				cdto.setLecture_name(rs.getString(2));
				cdto.setLecture_check(rs.getString(3));
				cdto.setSubject(rs.getString(4));
				cdto.setSubject_img(rs.getString(5));
				cdto.setSubject_saveImg(rs.getString(6));
				cdto.setClass_date(rs.getString(7));
				cdto.setProfessor(rs.getString(8));
				
			}
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cdto;
	}
	
	public void delClass(String lecture_name) {
		
		try {
			
			String sql = "delete from classRoom where lecture_name=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, lecture_name);
			psmt.executeUpdate();
			con.close();
			
		}catch(Exception e) {
			System.out.println("강의 삭제 오류");
			e.printStackTrace();
		}
	}
	// 상세정보 기능
	public List<ClassDTO> viewClass(Map<String,Object>map) {
		List<ClassDTO> board = new Vector<ClassDTO>();
		String sql = "select lecture_name,lecture_check,professor,postNum, subject  from classRoom where subject=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("subject").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				ClassDTO cdto = new ClassDTO();
				cdto.setLecture_name(rs.getString(1));
				cdto.setLecture_check(rs.getString(2));
				cdto.setProfessor(rs.getString(3));
				cdto.setPostNum(rs.getInt(4));
				cdto.setSubject(rs.getString(5));
				board.add(cdto);
			}
			con.close();
		}catch(Exception e) {
			System.out.println("강의 목록 불러오기 중 오류");
		}
		
		return board;
	}
	// 수정시 페이지에 보이도록 하는 기능
	public ClassDTO selectView(int num) {
		ClassDTO cdto = new ClassDTO();
		
		String sql = "select professor, lecture_name, postNum, subject from classRoom where postNum=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cdto.setProfessor(rs.getString(1));
				cdto.setLecture_name(rs.getString(2));
				cdto.setPostNum(rs.getInt(3));
				cdto.setSubject(rs.getString(4));
			}
		}catch(Exception e) {
			System.out.println("강의 selectView 오류 발생");
			e.printStackTrace();
		}
		
		
		return cdto;
	}
	
	public int updateClass(ClassDTO cdto) {
		int result = 0;
		String sql = "update classRoom set professor=?, lecture_name=? where postNum=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, cdto.getProfessor());
			psmt.setString(2, cdto.getLecture_name());
			psmt.setInt(3, cdto.getPostNum());
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("강의 수정 중 오류");
			e.printStackTrace();
		}
		return result;
	}
	
	
	

}
