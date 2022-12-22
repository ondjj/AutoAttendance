package dto;

import java.sql.Date;

public class News_DTO {

	private String news_num; // 뉴스 게시글 번호
	private String news_subject; // 뉴스 제목
	private String news_content; // 뉴스 내용
	private String news_writer; // 뉴스 작성자
	private Date news_date; // 작성일
	private String news_oimg; // 뉴스 원본이미지
	private String news_simg; // 뉴스 저장된 이미지
	private int news_view; // 조회수
	private int news_down;
	///////////////////////////////////////
	// 메인 페이지 뉴스변수
	private String news_subject1;
	private String news_subject2;
	private String news_subject3;
	
	private String news_oimg1;
	private String news_oimg2;
	private String news_oimg3;
	
	private String news_num1;
	private String news_num2;
	private String news_num3;
	
	
	
	public String getNews_num1() {
		return news_num1;
	}

	public void setNews_num1(String news_num1) {
		this.news_num1 = news_num1;
	}

	public String getNews_num2() {
		return news_num2;
	}

	public void setNews_num2(String news_num2) {
		this.news_num2 = news_num2;
	}

	public String getNews_num3() {
		return news_num3;
	}

	public void setNews_num3(String news_num3) {
		this.news_num3 = news_num3;
	}

	public String getNews_subject1() {
		return news_subject1;
	}

	public void setNews_subject1(String news_subject1) {
		this.news_subject1 = news_subject1;
	}

	public String getNews_subject2() {
		return news_subject2;
	}

	public void setNews_subject2(String news_subject2) {
		this.news_subject2 = news_subject2;
	}

	public String getNews_subject3() {
		return news_subject3;
	}

	public void setNews_subject3(String news_subject3) {
		this.news_subject3 = news_subject3;
	}

	public String getNews_oimg1() {
		return news_oimg1;
	}

	public void setNews_oimg1(String news_oimg1) {
		this.news_oimg1 = news_oimg1;
	}

	public String getNews_oimg2() {
		return news_oimg2;
	}

	public void setNews_oimg2(String news_oimg2) {
		this.news_oimg2 = news_oimg2;
	}

	public String getNews_oimg3() {
		return news_oimg3;
	}

	public void setNews_oimg3(String news_oimg3) {
		this.news_oimg3 = news_oimg3;
	}

	public String getNews_num() {
		return news_num;
	}

	public int getNews_down() {
		return news_down;
	}

	public void setNews_down(int news_down) {
		this.news_down = news_down;
	}

	public void setNews_num(String news_num) {
		this.news_num = news_num;
	}

	public String getNews_subject() {
		return news_subject;
	}

	public void setNews_subject(String news_subject) {
		this.news_subject = news_subject;
	}

	public String getNews_content() {
		return news_content;
	}

	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}

	public String getNews_writer() {
		return news_writer;
	}

	public void setNews_writer(String news_writer) {
		this.news_writer = news_writer;
	}

	public Date getNews_date() {
		return news_date;
	}

	public void setNews_date(Date news_date) {
		this.news_date = news_date;
	}

	public String getNews_oimg() {
		return news_oimg;
	}

	public void setNews_oimg(String news_oimg) {
		this.news_oimg = news_oimg;
	}

	public String getNews_simg() {
		return news_simg;
	}

	public void setNews_simg(String news_simg) {
		this.news_simg = news_simg;
	}

	public int getNews_view() {
		return news_view;
	}

	public void setNews_view(int news_view) {
		this.news_view = news_view;
	}

}
