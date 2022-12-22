package dao;

import java.util.ArrayList;

import common.DBConnPool;
import dto.ColMemberDTO;
import dto.memberDTO;

public class ColDAO extends DBConnPool{
	
	public void Col_manageRegister(ColMemberDTO cdto) {
		String sql = "insert into col_manage values (? ,? ,? ,? ,? ,?, ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, cdto.getCol_status());
			psmt.setString(2, cdto.getCol_faculty());
			psmt.setString(3, cdto.getCol_major());
			psmt.setString(4, cdto.getCol_type());
			psmt.setString(5, cdto.getCol_second_faculty());
			psmt.setString(6, cdto.getCol_complete());
			psmt.setString(7, cdto.getMember_id());
			System.out.println("col_manage 등록 완료");
			psmt.executeUpdate();
			psmt.close();
			
		}catch(Exception e) {
			
			System.out.println("col_manage 등록 중 오류 발생");
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<ColMemberDTO> getAllCol(){
		
		ArrayList<ColMemberDTO> arr = new ArrayList<>();
		
		try {
			String sql = "select * from col_manage";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ColMemberDTO cdto = new ColMemberDTO();
				
				cdto.setCol_status(rs.getString(1));
				cdto.setCol_faculty(rs.getString(2));
				cdto.setCol_major(rs.getString(3));
				cdto.setCol_type(rs.getString(4));
				cdto.setCol_second_faculty(rs.getString(5));
				cdto.setCol_complete(rs.getString(6));
				cdto.setMember_id(rs.getString(7));
				
				arr.add(cdto);
			}
			
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	
	}
	
	public ColMemberDTO getCol(String id) {
		ColMemberDTO cdto = new ColMemberDTO();
		try {
			String sql = "select * from col_manage where member_id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				cdto.setCol_status(rs.getString(1));
				cdto.setCol_faculty(rs.getString(2));
				cdto.setCol_major(rs.getString(3));
				cdto.setCol_type(rs.getString(4));
				cdto.setCol_second_faculty(rs.getString(5));
				cdto.setCol_complete(rs.getString(6));
				cdto.setMember_id(rs.getString(7));
			}
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cdto;
	}
	
	public void updateCol(ColMemberDTO cdto) {
		try {
			String sql = "update col_manage set col_status=?, col_faculty=?, col_major=?, col_type=?, col_second_faculty=?, col_complete=? where member_id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, cdto.getCol_status());
			psmt.setString(2, cdto.getCol_faculty());
			psmt.setString(3, cdto.getCol_major());
			psmt.setString(4, cdto.getCol_status());
			psmt.setString(5, cdto.getCol_second_faculty());
			psmt.setString(6, cdto.getCol_complete());
			psmt.setString(7, cdto.getMember_id());
			
			psmt.executeUpdate();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void delCol(String id) {
		
		try {
			
			String sql = "delete from col_manage where member_id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();

			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
