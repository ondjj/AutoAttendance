package dao;

import dto.MemberDTO;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import common.DBConnPool;


public class UserUpdateDAO extends DBConnPool{
	
	public MemberDTO SelectUser(int id) {
		String sql = "select * from member where idmember=" + id;
		
		try {
			
			psmt =con.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				dto.setIdMEMBER(rs.getInt(1));
				dto.setAge(rs.getInt(2));
				dto.setPassword(rs.getString(4));
				dto.setPhoneNumber(rs.getString(5));
				dto.setEmail(rs.getString(7));
				dto.setName(rs.getString(9));
				dto.setAddress(rs.getString(10));
				dto.setImg(rs.getString(11));
				dto.setPrivateNumber(rs.getString(12));
				
				rs.close();
				psmt.close();
				con.close();
				return dto;
			}
			
		}catch(Exception e) {
			System.out.println("사용자 세부정보 불러오기 오류");
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	public void UserUpdate(MemberDTO dto) {
			int idmember = dto.getIdMEMBER();
			String passowrd = dto.getPassword();
			String address = dto.getAddress();
			int age = dto.getAge();
			String phoneNumber = dto.getPhoneNumber();
			String email = dto.getEmail();
			String img = dto.getImg();
			
			
		try {
			String sql = "update member set password=?,age=?,phoneNumber=?, email=?,"
					+ "address=?,img=? where idmember=?";
			
			psmt =con.prepareStatement(sql);
			psmt.setString(1, passowrd);
			psmt.setInt(2, age);
			psmt.setString(3,phoneNumber);
			psmt.setString(4, email);
			psmt.setString(5, address);
			psmt.setString(6, img);
			psmt.setInt(7, idmember);
			psmt.executeUpdate();
			
			psmt.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("개인정보변경 중 오류발생");
			e.printStackTrace();
		}
		
	
	}	
	
	

}
