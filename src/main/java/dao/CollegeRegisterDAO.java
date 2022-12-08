package dao;

import common.DBConnPool;
import dto.CollegeDTO;

public class CollegeRegisterDAO extends DBConnPool{
	
	public void CollegeRegister(CollegeDTO cdto) {
		
		String sql = "insert into CollegeRegister values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, cdto.getIdMEMBER());
			psmt.setString(2, cdto.getK_name());
			psmt.setString(3, cdto.getE_name());
			psmt.setInt(4, cdto.getAge());
			psmt.setBoolean(5, cdto.isSex());
			psmt.setString(6, cdto.getPrivateNumber());
			psmt.setInt(7, cdto.getGrade());
			psmt.setString(8, cdto.getPhoneNumber());
			psmt.setString(9, cdto.getCollege());
			psmt.setString(10, cdto.getMajor());
			psmt.setInt(11, cdto.getSemester());
			psmt.setString(12, cdto.getDivision());
			psmt.setString(13, cdto.getC_state());
			psmt.setString(14, cdto.getDual_major());
			psmt.executeUpdate();
			psmt.close();
			
			
		}catch(Exception e) {
			System.out.println("인적사항 등록 중 오류 발생");
			e.printStackTrace();
		}
		
		
	}
	
	
}
