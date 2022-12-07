package dto;

public class CollegeDTO {

	private int idMEMBER; // 학번
	private String K_name; // 한글 이름
	private String E_name; // 영어 이름
	private int age; // 나이
	private boolean sex; // 성별
	private String privateNumber; // 주민번호
	private int grade; // 학년
	private String phoneNumber; // 휴대폰번호
	private String college; // 학부
	private String major; // 전공
	private int semester; // 이수학기
	private String division; // 입학구분
	private String C_state; // 학적상태
	private String dual_major; // 복수전공
	
	
	public CollegeDTO(int idMEMBER,String K_name,String E_name,int age, boolean sex, String privateNumber,
			          int grade, String phoneNumber,String college,String major,int semester,String division,String C_state,String dual_major) {
		
		this.idMEMBER = idMEMBER;
		this.K_name = K_name;
		this.E_name = E_name;
		this.age = age;
		this.sex = sex;
		this.privateNumber = privateNumber;
		this.grade = grade;
		this.phoneNumber = phoneNumber;
		this.college = college;
		this.major = major;
		this.semester = semester;
		this.division = division;
		this.C_state = C_state;
		this.dual_major = dual_major;
		
	}
	
	public int getIdMEMBER() {
		return idMEMBER;
	}

	public void setIdMEMBER(int idMEMBER) {
		this.idMEMBER = idMEMBER;
	}

	public String getK_name() {
		return K_name;
	}

	public void setK_name(String k_name) {
		K_name = k_name;
	}

	public String getE_name() {
		return E_name;
	}

	public void setE_name(String e_name) {
		E_name = e_name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean isSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public String getPrivateNumber() {
		return privateNumber;
	}

	public void setPrivateNumber(String privateNumber) {
		this.privateNumber = privateNumber;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getC_state() {
		return C_state;
	}

	public void setC_state(String c_state) {
		C_state = c_state;
	}

	public String getDual_major() {
		return dual_major;
	}

	public void setDual_major(String dual_major) {
		this.dual_major = dual_major;
	}

}
