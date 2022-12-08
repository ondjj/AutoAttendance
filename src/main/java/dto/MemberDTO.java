package dto;

import java.sql.Date;

public class MemberDTO {
	
	private int idMEMBER; // 학번
	private int age; // 나이
	private boolean adminKey; // 관리자 or 사용자 인지 구별
	private String password; // 비밀번호
	private String phoneNumber; // 휴대폰번호
	private Date registe; // 등록일자
	private String email; // 이메일아이디
	private boolean sex; // 성별
	private String name; // 이름
	private String address; // 주소
	private String img; // 이미지
	private String privateNumber; // 주민번호
	
	
	public int getIdMEMBER() {
		return idMEMBER;
	}

	public void setIdMEMBER(int idMEMBER) {
		this.idMEMBER = idMEMBER;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean isAdminKey() {
		return adminKey;
	}

	public void setAdminKey(boolean adminKey) {
		this.adminKey = adminKey;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getRegiste() {
		return registe;
	}

	public void setRegiste(Date registe) {
		this.registe = registe;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPrivateNumber() {
		return privateNumber;
	}

	public void setPrivateNumber(String privateNumber) {
		this.privateNumber = privateNumber;
	}

}
