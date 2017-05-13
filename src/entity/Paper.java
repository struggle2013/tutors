package entity;

import java.util.UUID;

public class Paper {
	private String name;
	private String id;
	private String publication;
	private String publicationTime;//出版时间
	private String retrieval;//检索情况
	private String signatureOrder;//署名次序
	private String school;
	public Paper() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Paper(String id){
		super();
		this.id=id;
	}
	private String userId;
	public Paper(String name, String publication, String publicationTime, String retrieval,
			String signatureOrder, String school, String userId) {
		super();
		this.name = name;
		this.id = UUID.randomUUID().toString();
		this.publication = publication;
		this.publicationTime = publicationTime;
		this.retrieval = retrieval;
		this.signatureOrder = signatureOrder;
		this.school = school;
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Paper [name=" + name + ", id=" + id + ", publication=" + publication + ", publicationTime="
				+ publicationTime + ", retrieval=" + retrieval + ", signatureOrder=" + signatureOrder + ", school="
				+ school + ", userId=" + userId + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPublication() {
		return publication;
	}
	public void setPublication(String publication) {
		this.publication = publication;
	}
	public String getPublicationTime() {
		return publicationTime;
	}
	public void setPublicationTime(String publicationTime) {
		this.publicationTime = publicationTime;
	}
	public String getRetrieval() {
		return retrieval;
	}
	public void setRetrieval(String retrieval) {
		this.retrieval = retrieval;
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
