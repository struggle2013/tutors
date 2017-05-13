package entity;

public class Apply {
	private String id;
	private String userId;
	private String category;
	private String oneSubject, twoSubject,research;
	private String file;
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Apply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Apply(String id){
		super();
		this.id=id;
	}

	
	
	@Override
	public String toString() {
		return "Apply [id=" + id + ", userId=" + userId + ", category=" + category + ", oneSubject=" + oneSubject
				+ ", twoSubject=" + twoSubject + ", research=" + research + ", file=" + file + ", username=" + username
				+ "]";
	}
	public Apply(String id, String userId, String category, String oneSubject, String twoSubject, String research,
			String file, String username) {
		super();
		this.id = id;
		this.userId = userId;
		this.category = category;
		this.oneSubject = oneSubject;
		this.twoSubject = twoSubject;
		this.research = research;
		this.file = file;
		this.username = username;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOneSubject() {
		return oneSubject;
	}
	public void setOneSubject(String oneSubject) {
		this.oneSubject = oneSubject;
	}
	public String getTwoSubject() {
		return twoSubject;
	}
	public void setTwoSubject(String twoSubject) {
		this.twoSubject = twoSubject;
	}
	public String getResearch() {
		return research;
	}
	public void setResearch(String research) {
		this.research = research;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
}
