package member.model.vo;

import java.sql.*;

// DB 테이블의 컬럼과 동일 해야함
// 직렬화가 필요
public class Member implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id; /* 아이디 */
	private String classCode; /* 구분 코드 */
	private String pwd; /* 비밀번호 */
	private String name; /* 이름 */
	private String email; /* 이메일 */
	private String gender; /* 성별 */
	private Date birthday; /* 생년월일 */

	private String phone; /* 전화번호 */
	private String address; /* 주소 */
	private Date signDate; /* 가입일 */
	private String profileImg; /* 프로필 이미지 */
	private int point; /* 포인트 */
	private String nickName; /* 별명 */
	
	public Member(){}
	
	// 가입일 제외
	public Member(String id, String classCode, String pwd, String name, Date birthday, String email, String phone, String address, String profileImg, int point, String nickName) {
		super();
		this.id = id;
		this.classCode = classCode;
		this.pwd = pwd;
		this.name = name;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.profileImg = profileImg;
		this.point = point;
		this.nickName = nickName;
	}

	// UPDATE 용 생성자
	public Member(String id, String pwd, String email, String phone, String address, int age, String profileImg, String address2, String img) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.profileImg = profileImg;
	}

	// 전체 값 받는 생성자
	public Member(String id, String classCode, String pwd, String name, Date birthday, String email, String phone, String address, Date signDate, String profileImg, int point, String nickName) {
		this.id = id;
		this.classCode = classCode;
		this.pwd = pwd;
		this.name = name;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.signDate = signDate;
		this.profileImg = profileImg;
		this.point = point;
		this.nickName = nickName;
	}
	
	public Member(String id, String classCode, String pwd, String name, String email, String gender, Date birthday,
			String phone, String address, String profileImg) {
		this.id = id;
		this.classCode = classCode;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.profileImg = profileImg;
	}

public Member(String id, String classCode, String pwd, String name, String email, String gender, Date birthday,
			String phone, String address, String profileImg, String nickName) {
		this.id = id;
		this.classCode = classCode;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.profileImg = profileImg;
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", classCode=" + classCode + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", gender=" + gender + ", birthday=" + birthday + ", phone=" + phone + ", address=" + address
				+ ", signDate=" + signDate + ", profileImg=" + profileImg + ", point=" + point + ", nickName="
				+ nickName + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
