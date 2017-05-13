package entity;

public class Power {
	private String userId;
	private int technology;
	private int academy;
	private int degree;
	public Power() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Power(String userId, int technology, int academy, int degree, int schoolDegree) {
		super();
		this.userId = userId;
		this.technology = technology;
		this.academy = academy;
		this.degree = degree;
		this.schoolDegree = schoolDegree;
	}
	@Override
	public String toString() {
		return "Power [userId=" + userId + ", technology=" + technology + ", academy=" + academy + ", degree=" + degree
				+ ", schoolDegree=" + schoolDegree + "]";
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTechnology() {
		return technology;
	}
	public void setTechnology(int technology) {
		this.technology = technology;
	}
	public int getAcademy() {
		return academy;
	}
	public void setAcademy(int academy) {
		this.academy = academy;
	}
	public int getDegree() {
		return degree;
	}
	public void setDegree(int degree) {
		this.degree = degree;
	}
	public int getSchoolDegree() {
		return schoolDegree;
	}
	public void setSchoolDegree(int schoolDegree) {
		this.schoolDegree = schoolDegree;
	}
	private int schoolDegree;
	
}
