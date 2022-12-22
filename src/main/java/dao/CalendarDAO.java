package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.DBConnPool;
import dto.CalendarDTO;

public class CalendarDAO extends DBConnPool {
	
	// 캘린더 초기 데이터 불러오기
	public String load_calendar(){
		
		System.out.println("load_calendar");
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		// List<Map<String, Object>> jsonArr = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		try {
			String sql = "select * from calendar";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				map.put("_id", rs.getString("num"));
				map.put("title", rs.getString("title"));
				map.put("description", rs.getString("description"));
				map.put("start", rs.getString("start"));
				map.put("end", rs.getString("end"));
				map.put("backgroundColor", rs.getString("backgroundcolor"));
				map.put("textColor", rs.getString("textcolor"));
				map.put("allDay", rs.getString("allday"));
				
				
				jsonObj = new JSONObject(map);
				jsonArr.add(jsonObj);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		String json = jsonArr.toJSONString();
		//return jsonArr;
		
		return json;
		
	}
	
	public String resize_calendar(String id, String start, String end) {
		
		System.out.println("resize_calendar");
		String result = "";
		try {
			String sql = "update calendar set start=?, end=? where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, start);
			psmt.setString(2, end);
			psmt.setString(3, id);
			psmt.executeUpdate();
			result = "success";
			
		}catch(Exception e) {
			result = "failed";
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String update_calendar(CalendarDTO dto) {
		
		System.out.println("update_calendar");
		String result = "";
		try {
			String sql = "update calendar set title=?, description=?, start=?, end=?, backgroundcolor=?, allday=? where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getDescription());
			psmt.setString(3, dto.getStart());
			psmt.setString(4, dto.getEnd());
			psmt.setString(5, dto.getBackgroundcolor());
			psmt.setInt(6, dto.getAllday());
			psmt.setInt(7, dto.getNum());
			psmt.executeUpdate();
			result = "success";
			
		}catch(Exception e) {
			result = "failed";
			e.printStackTrace();
		}
		return result;
	}
	
	public String delete_calendar(String num) {
		
		System.out.println("delete_calendar");
		String result = "";
		try {
			String sql = "delete from calendar where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeUpdate();
			result = "success";
			
		}catch(Exception e) {
			result = "failed";
			e.printStackTrace();
		}
		return result;
	}
	
	public String insert_calendar(CalendarDTO dto) {
		
		System.out.println("insert_calendar");
		String result = "";
		try {
			String sql = "insert into calendar (title, description, start, end, backgroundcolor, textcolor, allday) values(?,?,?,?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getDescription());
			psmt.setString(3, dto.getStart());
			psmt.setString(4, dto.getEnd());
			psmt.setString(5, dto.getBackgroundcolor());
			psmt.setString(6, dto.getTextcolor());
			psmt.setInt(7, dto.getAllday());
			psmt.executeUpdate();
			result = "success";
			
		}catch(Exception e) {
			result = "failed";
			e.printStackTrace();
		}
		return result;
	}
	
	public List<CalendarDTO> main_cal(String today) {
		
		System.out.println("Main Calendar");
		System.out.println(today);
		List<CalendarDTO> list = new ArrayList<>();
		String sql = "SELECT title, start, end FROM calendar WHERE start >= DATE_FORMAT(?, '%Y-%m-%d') or end >= DATE_FORMAT(?, '%Y-%m-%d') order by start limit 5";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, today);
			psmt.setString(2, today);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CalendarDTO dto = new CalendarDTO();
				dto.setTitle(rs.getString("title"));
				dto.setStart(rs.getString("start"));
				dto.setEnd(rs.getString("end"));
				
				list.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(list.get(0).getStart());
		return list;
	}
}
