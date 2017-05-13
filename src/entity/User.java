package entity;

import java.util.Date;

public class User {
	private String id;
	private String name;
	private String email;
	private String password;
	
	private String sex;
	/*
	 * 职称聘任学科
	 */
	private String titleSubject;
	private String birth;
	/*
	 * 民族
	 */
	private String nation;
	/*
	 * 政治面貌
	 */
	private String face;
	private String telephone;
	private String address;
	/*
	 * 职称
	 */
	private String title;
	/*
	 * 学位
	 */
	private String degree;
	/*
	 * 学历
	 */
	private String eduBackground;
	private String graduatedSchool;
	private String graduatedTime;


	private String graduatedMajor;
	private int isTutor;
	private String pic;
	public User(String id,String name,String password){
		super();
		this.id=id;
		this.name=name;
		this.password=password;
	}

	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", sex=" + sex
				+ ", titleSubject=" + titleSubject + ", birth=" + birth + ", nation=" + nation + ", face=" + face
				+ ", telephone=" + telephone + ", address=" + address + ", title=" + title + ", degree=" + degree
				+ ", eduBackground=" + eduBackground + ", graduatedSchool=" + graduatedSchool + ", graduatedTime="
				+ graduatedTime + ", graduatedMajor=" + graduatedMajor + ", isTutor=" + isTutor + ", pic=" + pic + "]";
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTitleSubject() {
		return titleSubject;
	}

	public void setTitleSubject(String titleSubject) {
		this.titleSubject = titleSubject;
	}

	

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getFace() {
		return face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getEduBackground() {
		return eduBackground;
	}

	public void setEduBackground(String eduBackground) {
		this.eduBackground = eduBackground;
	}

	public String getGraduatedSchool() {
		return graduatedSchool;
	}

	public void setGraduatedSchool(String graduatedSchool) {
		this.graduatedSchool = graduatedSchool;
	}

	

	public String getGraduatedMajor() {
		return graduatedMajor;
	}

	public void setGraduatedMajor(String graduatedMajor) {
		this.graduatedMajor = graduatedMajor;
	}

	public int getIsTutor() {
		return isTutor;
	}

	public void setIsTutor(int isTutor) {
		this.isTutor = isTutor;
	}

	public User(String id, String name, String email, String password, String sex, String titleSubject, String birth,
			String nation, String face, String telephone, String address, String title, String degree,
			String eduBackground, String graduatedSchool, String graduatedTime, String graduatedMajor, int isTutor) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.sex = sex;
		this.titleSubject = titleSubject;
		this.birth = birth;
		this.nation = nation;
		this.face = face;
		this.telephone = telephone;
		this.address = address;
		this.title = title;
		this.degree = degree;
		this.eduBackground = eduBackground;
		this.graduatedSchool = graduatedSchool;
		this.graduatedTime = graduatedTime;
		this.graduatedMajor = graduatedMajor;
		this.isTutor = isTutor;
	}

	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getGraduatedTime() {
		return graduatedTime;
	}


	public void setGraduatedTime(String graduatedTime) {
		this.graduatedTime = graduatedTime;
	}


	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
}
