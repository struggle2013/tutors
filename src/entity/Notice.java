package entity;

public class Notice {
	private String id;
	private String userId;
	private String name;
	private String info;
	private String time;
	private String content;
	private String filename;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "Notice [id=" + id + ", userId=" + userId + ", name=" + name + ", info=" + info + ", time=" + time
				+ ", content=" + content + ", filename=" + filename + "]";
	}
	public Notice(String id, String userId, String name, String info, String time, String content, String filename) {
		super();
		this.id = id;
		this.userId = userId;
		this.name = name;
		this.info = info;
		this.time = time;
		this.content = content;
		this.filename = filename;
	}
	
	public Notice(String userId, String name, String info, String time, String content, String filename) {
		super();
		this.userId = userId;
		this.name = name;
		this.info = info;
		this.time = time;
		this.content = content;
		this.filename = filename;
	}
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
