package dto;

public class memberDTO {

	private String id; // 학번(PK)
	private String password; // 비밀번호
	private String private_num; // 주민번호
	private String kr_name; // 한글 이름
	private String en_name; // 영어 이름
	private String id_picture; // 사진
	private String phone_num; // 휴대폰번호
	private String email; // 이메일
	private String address; // 주소
	private String admin_key; // 관리자 인지 아닌지 판별하는 변수 (0:관리자, 1:학생)
	private int age; // 나이
	private int college_year; // 입학년도
	private String gender; // 성별
	private String id_savePicture;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrivate_num() {
		return private_num;
	}

	public void setPrivate_num(String private_num) {
		this.private_num = private_num;
	}

	public String getKr_name() {
		return kr_name;
	}

	public void setKr_name(String kr_name) {
		this.kr_name = kr_name;
	}

	public String getEn_name() {
		return en_name;
	}

	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}

	public String getId_picture() {
		return id_picture;
	}

	public void setId_picture(String id_picture) {
		this.id_picture = id_picture;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAdmin_key() {
		return admin_key;
	}

	public void setAdmin_key(String admin_key) {
		this.admin_key = admin_key;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getCollege_year() {
		return college_year;
	}

	public void setCollege_year(int college_year) {
		this.college_year = college_year;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId_savePicture() {
		return id_savePicture;
	}

	public void setId_savePicture(String id_savePicture) {
		this.id_savePicture = id_savePicture;
	}

}
