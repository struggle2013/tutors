package entity;

public class Notice {
	private String id;
	private String noticeName;
	private String info;
	private String noticeTime;
	private String content;
	@Override
	public String toString() {
		return "Notice [id=" + id + ", noticeName=" + noticeName + ", info=" + info + ", noticeTime=" + noticeTime
				+ ", content=" + content + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNoticeName() {
		return noticeName;
	}
	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getNoticeTime() {
		return noticeTime;
	}
	public void setNoticeTime(String noticeTime) {
		this.noticeTime = noticeTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
