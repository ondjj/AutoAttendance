package dao;

import java.util.ArrayList;

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
	
	public void delClass(String name) {
		
		try {
			
			String sql = "delete from classRoom where professor=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.executeUpdate();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
