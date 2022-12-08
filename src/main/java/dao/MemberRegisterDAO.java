package dao;

import common.DBConnPool;
import dto.memberDTO;

public class MemberRegisterDAO extends DBConnPool{
	
	public void MemberRegister(memberDTO mdto) {
		
		String sql = "insert into member (id, password, private_num, kr_name, en_name, id_picture, phone_num, email, address, admin_key, age, college_year,gender)"
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
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
			psmt.close();
			
		}catch(Exception e) {
			System.out.println("member 등록 중 오류 발생");
			e.printStackTrace();
		}
	}
	
	
	
	
}
