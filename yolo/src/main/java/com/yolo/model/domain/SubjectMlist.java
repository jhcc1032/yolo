package com.yolo.model.domain;

public class SubjectMlist {

	private String id;
	private String name;
	private double score;

	public SubjectMlist() {
	}

	public SubjectMlist(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public SubjectMlist(String id, String name, double score) {
		super();
		this.id = id;
		this.name = name;
		this.score = score;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
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
				.append(name).append(", score=").append(score).append("]");
		return builder.toString();
	}

}
