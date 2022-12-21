package dto;

import java.sql.Date;

public class QnA_DTO {

	private String qna_num; // QnA 번호
	private String qna_question; // QnA 제목
	private String qna_answer; // QnA 내용
	private String qna_writer; // 작성자
	private Date qna_date; // QnA 작성일

	public String getQna_num() {
		return qna_num;
	}

	public void setQna_num(String qna_num) {
		this.qna_num = qna_num;
	}

	public String getQna_question() {
		return qna_question;
	}

	public void setQna_question(String qna_question) {
		this.qna_question = qna_question;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public String getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

}
