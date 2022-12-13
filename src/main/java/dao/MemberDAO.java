package dao;

import java.sql.SQLException;

import java.util.ArrayList;


import common.DBConnPool;
import dto.memberDTO;

public class MemberDAO extends DBConnPool{
	

	public void insertMember(memberDTO mdto) {
		
		String sql = "insert into member (id, password, private_num, kr_name, en_name, id_picture, phone_num, email, address, admin_key, age, college_year,gender)"
				+  "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,mdto.getId());
			psmt.setString(2, mdto.getPassword());
			psmt.setString(3, mdto.getPrivate_num());
			psmt.setString(4, mdto.getKr_name());
			psmt.setString(5, mdto.getEn_name());
			psmt.setString(6, mdto.getId_picture());
			psmt.setString(7, mdto.getPhone_num());
			psmt.setString(8, mdto.getEmail());
			psmt.setString(9, mdto.getAddress());
			psmt.setString(10, mdto.getAdmin_key());
			psmt.setInt(11, mdto.getAge());
			psmt.setInt(12, mdto.getCollege_year());
			psmt.setString(13, mdto.getGender());
			System.out.println("member 등록 완료");
			psmt.executeUpdate();
			
			con.close();
			
		}catch(Exception e) {
			System.out.println("member 등록 중 오류 발생");
			e.printStackTrace();
		}
	}
	
	public ArrayList<memberDTO> getAllMember(){
	
		ArrayList<memberDTO> arr = new ArrayList<>();
		
		try {
			String sql = "select * from member";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				memberDTO mdto = new memberDTO();
				mdto.setId(rs.getString(1));
				mdto.setPassword(rs.getString(2));
				mdto.setPrivate_num(rs.getString(3));
				mdto.setKr_name(rs.getString(4));
				mdto.setEn_name(rs.getString(5));
				mdto.setId_picture(rs.getString(6));
				mdto.setPhone_num(rs.getString(7));
				mdto.setEmail(rs.getString(8));
				mdto.setAddress(rs.getString(9));
				mdto.setAdmin_key(rs.getString(10));
				mdto.setAge(rs.getInt(11));
				mdto.setCollege_year(rs.getInt(12));
				mdto.setGender(rs.getString(13));
				
				arr.add(mdto);
			}
			
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}
	
	public memberDTO getMember(String id) {
		
		memberDTO mdto = new memberDTO();
		
		try {
			String sql = "select * from member where id=?";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				mdto.setId(rs.getString(1));
				mdto.setPassword(rs.getString(2));
				mdto.setPrivate_num(rs.getString(3));
				mdto.setKr_name(rs.getString(4));
				mdto.setEn_name(rs.getString(5));
				mdto.setId_picture(rs.getString(6));
				mdto.setPhone_num(rs.getString(7));
				mdto.setEmail(rs.getString(8));
				mdto.setAddress(rs.getString(9));
				mdto.setAdmin_key(rs.getString(10));
				mdto.setAge(rs.getInt(11));
				mdto.setCollege_year(rs.getInt(12));
				mdto.setGender(rs.getString(13));

			}
				con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mdto;
	}
	
	public void delMember(String id) {
		
		try {
			String sql = "delete from member where id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateMemer(memberDTO mdto) {
		
		try {
			String sql = "update member set password=?, private_num=?, kr_name=?, en_name=?, id_picture=?,"
					+ "phone_num=?, email=?, address=?, admin_key=?, age=?, college_year=?, gender=? where id=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, mdto.getPassword());
			psmt.setString(2, mdto.getPrivate_num());
			psmt.setString(3, mdto.getKr_name());
			psmt.setString(4, mdto.getEn_name());
			psmt.setString(5, mdto.getId_picture());
			psmt.setString(6, mdto.getPhone_num());
			psmt.setString(7, mdto.getEmail());
			psmt.setString(8, mdto.getAddress());
			psmt.setString(9, mdto.getAdmin_key());
			psmt.setInt(10, mdto.getAge());
			psmt.setInt(11, mdto.getCollege_year());
			psmt.setString(12, mdto.getGender());
			psmt.setString(13, mdto.getId());
			
			psmt.executeUpdate();
			
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 학적 변동 신청 화면에 현재 세션에 등록된 학생의 정보를 가져와서 보여주기 위한 메소드
	public memberDTO getMemberCol(String id) {
		
		memberDTO dto = new memberDTO();

		try {
			
			String sql = "select id, kr_name, en_name, private_num, gender, phone_num from member where id=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setKr_name(rs.getString("kr_name"));
				dto.setEn_name(rs.getString("en_name"));
				dto.setPrivate_num(rs.getString("private_num"));
				dto.setGender(rs.getString("gender"));
				dto.setPhone_num(rs.getString("phone_num"));
			}
			
			/*
			 * sql =
			 * "select col_faculty, col_major, col_complete, col_type, col_status, col_second_faculty from col_manage where id=?"
			 * ;
			 * 
			 * psmt = con.prepareStatement(sql); psmt.setString(1, id); rs =
			 * psmt.executeQuery();
			 * 
			 * if(rs.next()) { dto.set }
			 */
			
			con.close();
		}catch(Exception e) {
			System.out.println("member 등록 중 오류 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
}
