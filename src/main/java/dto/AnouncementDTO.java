package dto;

import java.sql.Date;

public class AnouncementDTO {

	private String anounce_num; // 공지사항 번호
	private String anounce_subject; // 공지사항 제목
	private String anounce_content; // 공지사항 내용
	private String anounce_writer; // 작성자
	private Date anounce_date; // 공지사항 작성일
	private String anounce_ofile; // 공지사항 원본파일
	private String anounce_sfile; // 공지사항 수정파일
	private int anounce_view; // 공지사항 조회수
	private int anounce_down; // 공지사항 다운로드 횟수

	public String getAnounce_num() {
		return anounce_num;
	}

	public void setAnounce_num(String anounce_num) {
		this.anounce_num = anounce_num;
	}

	public String getAnounce_subject() {
		return anounce_subject;
	}

	public void setAnounce_subject(String anounce_subject) {
		this.anounce_subject = anounce_subject;
	}

	public String getAnounce_content() {
		return anounce_content;
	}

	public void setAnounce_content(String anounce_content) {
		this.anounce_content = anounce_content;
	}

	public String getAnounce_writer() {
		return anounce_writer;
	}

	public void setAnounce_writer(String anounce_writer) {
		this.anounce_writer = anounce_writer;
	}

	public Date getAnounce_date() {
		return anounce_date;
	}

	public void setAnounce_date(Date anounce_date) {
		this.anounce_date = anounce_date;
	}

	public String getAnounce_ofile() {
		return anounce_ofile;
	}

	public void setAnounce_ofile(String anounce_ofile) {
		this.anounce_ofile = anounce_ofile;
	}

	public String getAnounce_sfile() {
		return anounce_sfile;
	}

	public void setAnounce_sfile(String anounce_sfile) {
		this.anounce_sfile = anounce_sfile;
	}

	public int getAnounce_view() {
		return anounce_view;
	}

	public void setAnounce_view(int anounce_view) {
		this.anounce_view = anounce_view;
	}

	public int getAnounce_down() {
		return anounce_down;
	}

	public void setAnounce_down(int anounce_down) {
		this.anounce_down = anounce_down;
	}

}
