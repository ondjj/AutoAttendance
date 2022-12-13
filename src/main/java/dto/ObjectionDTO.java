package dto;

public class ObjectionDTO {
	
	private int obj_num; // 정정 신청 내역 고유번호
	private int obj_type; // 정정 신청 타입
	private String obj_memberid; // 정정 신청한 학번
	private String obj_name; // 신청 학생 이름
	private String obj_faculty; // 신청 학생 전공
	
	private String obj_date; // 출결 정정 신청 날짜
	private String obj_content; // 정정 신청 시 작성한 내용
	private String obj_subject; // 정정을 요하는 과목
	
	private String obj_start_term; // 학적 변경 시작 학기
	private String obj_col_type; // 학적 변동 종류
	private String obj_tuition; // 등록금 환불 유보 여부
	private String obj_back_year; // 복학 년도
	private String obj_back_term; // 복학 학기
	private String obj_refund_name; // 등록금 환불받는 예금주 이름
	private String obj_refund_bank; // 등록금 환불받는 은행
	private String obj_refund_num; // 등록금 환불받는 계좌번호
	
	private int obj_certifi_type; // 증명서 발급 종류
	private int obj_certifi_count; // 증명서 신청 매수
	private String obj_certifi_content; // 증명서 신청 사유
	
	
	
	public int getObj_num() {
		return obj_num;
	}
	public void setObj_num(int obj_num) {
		this.obj_num = obj_num;
	}
	public int getObj_type() {
		return obj_type;
	}
	public void setObj_type(int obj_type) {
		this.obj_type = obj_type;
	}
	public String getObj_memberid() {
		return obj_memberid;
	}
	public void setObj_memberid(String obj_memberid) {
		this.obj_memberid = obj_memberid;
	}
	public String getObj_name() {
		return obj_name;
	}
	public void setObj_name(String obj_name) {
		this.obj_name = obj_name;
	}
	public String getObj_faculty() {
		return obj_faculty;
	}
	public void setObj_faculty(String obj_faculty) {
		this.obj_faculty = obj_faculty;
	}
	public String getObj_date() {
		return obj_date;
	}
	public void setObj_date(String obj_date) {
		this.obj_date = obj_date;
	}
	public String getObj_content() {
		return obj_content;
	}
	public void setObj_content(String obj_content) {
		this.obj_content = obj_content;
	}
	public String getObj_subject() {
		return obj_subject;
	}
	public void setObj_subject(String obj_subject) {
		this.obj_subject = obj_subject;
	}
	public String getObj_start_term() {
		return obj_start_term;
	}
	public void setObj_start_term(String obj_start_term) {
		this.obj_start_term = obj_start_term;
	}
	public String getObj_col_type() {
		return obj_col_type;
	}
	public void setObj_col_type(String obj_col_type) {
		this.obj_col_type = obj_col_type;
	}
	public String getObj_tuition() {
		return obj_tuition;
	}
	public void setObj_tuition(String obj_tuition) {
		this.obj_tuition = obj_tuition;
	}
	public String getObj_back_year() {
		return obj_back_year;
	}
	public void setObj_back_year(String obj_back_year) {
		this.obj_back_year = obj_back_year;
	}
	public String getObj_back_term() {
		return obj_back_term;
	}
	public void setObj_back_term(String obj_back_term) {
		this.obj_back_term = obj_back_term;
	}
	public String getObj_refund_name() {
		return obj_refund_name;
	}
	public void setObj_refund_name(String obj_refund_name) {
		this.obj_refund_name = obj_refund_name;
	}
	public String getObj_refund_bank() {
		return obj_refund_bank;
	}
	public void setObj_refund_bank(String obj_refund_bank) {
		this.obj_refund_bank = obj_refund_bank;
	}
	public String getObj_refund_num() {
		return obj_refund_num;
	}
	public void setObj_refund_num(String obj_refund_num) {
		this.obj_refund_num = obj_refund_num;
	}
	public int getObj_certifi_type() {
		return obj_certifi_type;
	}
	public void setObj_certifi_type(int obj_certifi_type) {
		this.obj_certifi_type = obj_certifi_type;
	}
	public int getObj_certifi_count() {
		return obj_certifi_count;
	}
	public void setObj_certifi_count(int obj_certifi_count) {
		this.obj_certifi_count = obj_certifi_count;
	}
	public String getObj_certifi_content() {
		return obj_certifi_content;
	}
	public void setObj_certifi_content(String obj_certifi_content) {
		this.obj_certifi_content = obj_certifi_content;
	} 
	
	
}
