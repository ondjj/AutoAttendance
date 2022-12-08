package dto;

public class col_manageDTO {

	private String col_status; // 학적상태(휴학,재학)
	private String col_faculty; // 학부
	private String col_major; // 전공
	private String col_type; // 입학구분(신입,편입)
	private String col_second_faculty; // 복수전공
	private String col_complete; // 이수학기
	private String member_id; // 학번(FK)
	
	public col_manageDTO(String col_status, String col_faculty, String col_major, String col_type, String col_second_faculty, String col_complete, String member_id) {
		
		this.col_status = col_status;
		this.col_faculty = col_faculty;
		this.col_major = col_major;
		this.col_type = col_type;
		this.col_second_faculty = col_second_faculty;
		this.col_complete = col_complete;
		this.member_id = member_id;
		
	}
	
	
	
	public String getCol_status() {
		return col_status;
	}

	public void setCol_status(String col_status) {
		this.col_status = col_status;
	}

	public String getCol_faculty() {
		return col_faculty;
	}

	public void setCol_faculty(String col_faculty) {
		this.col_faculty = col_faculty;
	}

	public String getCol_major() {
		return col_major;
	}

	public void setCol_major(String col_major) {
		this.col_major = col_major;
	}

	public String getCol_type() {
		return col_type;
	}

	public void setCol_type(String col_type) {
		this.col_type = col_type;
	}

	public String getCol_second_faculty() {
		return col_second_faculty;
	}

	public void setCol_second_faculty(String col_second_faculty) {
		this.col_second_faculty = col_second_faculty;
	}

	public String getCol_complete() {
		return col_complete;
	}

	public void setCol_complete(String col_complete) {
		this.col_complete = col_complete;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
