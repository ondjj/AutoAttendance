package dto;

import java.sql.Date;

public class data_lib_DTO {

	private String data_num; // 게시물 번호
	private String data_subject; // 제목
	private String data_content; // 내용
	private String data_writer; // 작성자
	private Date data_date; // 작성일
	private String data_ofile; // 원본 파일명
	private String data_sfile; // 저장된 파일명
	private int data_view; // 조회수
	private int data_down; // 다운로드 횟수

	public String getData_num() {
		return data_num;
	}

	public void setData_num(String data_num) {
		this.data_num = data_num;
	}

	public String getData_subject() {
		return data_subject;
	}

	public void setData_subject(String data_subject) {
		this.data_subject = data_subject;
	}

	public String getData_content() {
		return data_content;
	}

	public void setData_content(String data_content) {
		this.data_content = data_content;
	}

	public String getData_writer() {
		return data_writer;
	}

	public void setData_writer(String data_writer) {
		this.data_writer = data_writer;
	}

	public Date getData_date() {
		return data_date;
	}

	public void setData_date(Date data_date) {
		this.data_date = data_date;
	}

	public String getData_ofile() {
		return data_ofile;
	}

	public void setData_ofile(String data_ofile) {
		this.data_ofile = data_ofile;
	}

	public String getData_sfile() {
		return data_sfile;
	}

	public void setData_sfile(String data_sfile) {
		this.data_sfile = data_sfile;
	}

	public int getData_view() {
		return data_view;
	}

	public void setData_view(int data_view) {
		this.data_view = data_view;
	}

	public int getData_down() {
		return data_down;
	}

	public void setData_down(int data_down) {
		this.data_down = data_down;
	}

}
