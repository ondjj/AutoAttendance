package dto;

import java.sql.Date;

public class QnADTO {

	private String qna_num; // QnA 번호
	private String anounce_subject; // QnA 제목
	private String anounce_content; // QnA 내용
	private String anounce_writer; // 작성자
	private Date anounce_date; // QnA 작성일
	private int anounce_view; // QnA 조회수
	
	
	public String getQna_num() {
		return qna_num;
	}
	
	public void setQna_num(String qna_num) {
		this.qna_num = qna_num;
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

	public int getAnounce_view() {
		return anounce_view;
	}

	public void setAnounce_view(int anounce_view) {
		this.anounce_view = anounce_view;
	}

}
