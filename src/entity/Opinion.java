package entity;

import java.util.Date;

public class Opinion {
	private String kind;//意见类型既
	private String id;//意见的id
	private int agree;//是否同意0不同意，1同意
	private String suggestion;
	private String time;
	private String chargePerson;//审批人的姓名
	private String userId;//被审批人的id
	public Opinion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Opinion(String id) {
		super();
		this.id = id;
	}
	

	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Opinion [kind=" + kind + ", id=" + id + ", agree=" + agree + ", suggestion=" + suggestion + ", time="
				+ time + ", chargePerson=" + chargePerson + ", userId=" + userId + "]";
	}
	public Opinion(String kind, String id, int agree, String suggestion, String time, String chargePerson,
			String userId) {
		super();
		this.kind = kind;
		this.id = id;
		this.agree = agree;
		this.suggestion = suggestion;
		this.time = time;
		this.chargePerson = chargePerson;
		this.userId = userId;
	}
	public String getChargePerson() {
		return chargePerson;
	}
	public void setChargePerson(String chargePerson) {
		this.chargePerson = chargePerson;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
