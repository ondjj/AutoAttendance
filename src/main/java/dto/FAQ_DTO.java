package dto;

public class FAQ_DTO {

	private String faq_num; // 번호
	private String faq_category; // 카테고리
	private String faq_subject; // 제목
	private String faq_content; // 내용

	public String getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(String faq_num) {
		this.faq_num = faq_num;
	}

	public String getFaq_category() {
		return faq_category;
	}

	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}

	public String getFaq_subject() {
		return faq_subject;
	}

	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

}
