package entity;

public class Book {
	private String id;
	private String name;
	private String press;// 出版社
	private String pressTime;// 出版时间
	private String editWordNumber;// 编辑字数
	private String signatureOrder;// 本人排名
	private String school;
	private String userId;

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(String id) {
		super();
		this.id = id;
	}

	public Book(String id, String name, String press, String pressTime, String editWordNumber, String signatureOrder,
			String school, String userId) {
		super();
		this.id = id;
		this.name = name;
		this.press = press;
		this.pressTime = pressTime;
		this.editWordNumber = editWordNumber;
		this.signatureOrder = signatureOrder;
		this.school = school;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", press=" + press + ", pressTime=" + pressTime
				+ ", editWordNumber=" + editWordNumber + ", signatureOrder=" + signatureOrder + ", school=" + school
				+ ", userId=" + userId + "]";
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

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getPressTime() {
		return pressTime;
	}

	public void setPressTime(String pressTime) {
		this.pressTime = pressTime;
	}

	public String getEditWordNumber() {
		return editWordNumber;
	}

	public void setEditWordNumber(String editWordNumber) {
		this.editWordNumber = editWordNumber;
	}

	public String getSignatureOrder() {
		return signatureOrder;
	}

	public void setSignatureOrder(String signatureOrder) {
		this.signatureOrder = signatureOrder;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
