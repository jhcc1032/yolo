package com.yolo.model.domain;

public class SubjectMlist {

	private String id;
	private String name;
	
	public SubjectMlist(){}
	
	public SubjectMlist(String id, String name) {
		super();
		this.id = id;
		this.name = name;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SubjectMlist [id=").append(id).append(", name=")
				.append(name).append("]");
		return builder.toString();
	}
	
	
}
