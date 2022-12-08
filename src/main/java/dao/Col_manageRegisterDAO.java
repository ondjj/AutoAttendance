package dao;

import common.DBConnPool;
import dto.col_manageDTO;

public class Col_manageRegisterDAO extends DBConnPool{
	
	public void Col_manageRegister(col_manageDTO cdto) {
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
}
